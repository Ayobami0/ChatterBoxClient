// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.8;
import './errors.sol';

enum ConversationType {
	Group,
	Personal
}

enum Role {
	Creator,
	Admin,
	Regular
}

struct Participant {
	Role role;
	address id;
	bool exist;
}

contract Conversation {
	constructor(string memory _name, ConversationType _conversationType, bool _isPrivate) {
		name = _name;
		conversationType = _conversationType;
		maxParticipants = _conversationType == ConversationType.Personal ? 2 : 100;
		isPrivate = _isPrivate;
		participants[_particpantId++] = Participant(Role.Creator, msg.sender, true);
		currentParticipants++;
		exist = true;
	}

	// Structs
	struct Message {
		uint32 id;
		string content;
		address sender;
		uint timeSent;
		string[] seenBy;
		string attachment;
		bool exist;
	}

	// Variable Defintions
	address creator;
	string name;
	uint public maxParticipants;
	uint public currentParticipants;
	uint32 private _particpantId;
	uint32 private _messageId;
	bool public exist;
	bool public isClosed;
	bool isPrivate;
	ConversationType conversationType;
	mapping(uint32 => Message) private _messages;
	mapping(uint32 => Participant) private participants;
  mapping(address => uint32) private _participantsIndexes;

	// Events
	event MessageSendEvent(Message message);

	function sendMessage(string memory content) external {
		_messages[_messageId] = Message({
			id: _messageId,
			content: content,
			sender: msg.sender,
			timeSent: block.timestamp,
			seenBy: new string[](0),
			attachment: '',
			exist: true
		});

		emit MessageSendEvent(_messages[_messageId]);
		_messageId++;
	}

	function getParticipants() external view returns (Participant[] memory) {
		Participant[] memory p = new Participant[](currentParticipants);
    uint32 counter = 0;
		for (uint32 i = 0; i < _particpantId; i++) {
			if (participants[i].exist) {
				p[counter++] = participants[i];
			}
		}
		return p;
	}

	function addParticipant(address participant) external {
		participants[_participantsIndexes[participant]] = Participant(Role.Regular, participant, true);
    _participantsIndexes[participant] = _particpantId++;
		currentParticipants++;
	}

	function removeParticipant(address participant) external {
		delete participants[_participantsIndexes[participant]];
		delete _participantsIndexes[participant];
		currentParticipants--;
	}

	function getMessage(uint32 messageId) external view returns (Message memory) {
		require(_messages[messageId].exist, NoSuchMessage(messageId));

		return _messages[messageId];
	}

	function getMessages() external view returns (Message[] memory) {
		Message[] memory messages = new Message[](_messageId);
		uint32 c = 0;

		for (uint32 i = 0; i < _messageId; i++) {
			if (_messages[i].exist) {
				messages[c++] = _messages[i];
			}
		}

		return messages;
	}

	function checkParticipant(address participant) external view returns (bool) {
		return participants[_participantsIndexes[participant]].exist;
	}

	function close() external {
		exist = false;
		isClosed = true;
	}

	function setAdmin(address participant) external {
		participants[_participantsIndexes[participant]].role = Role.Admin;
	}

	function unsetAdmin(address participant) external {
		participants[_participantsIndexes[participant]].role = Role.Regular;
	}

	function isAdmin(address participant) external view returns (bool) {
		Role r = participants[_participantsIndexes[participant]].role;
		return r == Role.Admin || r == Role.Creator;
	}
}

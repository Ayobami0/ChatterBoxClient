// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.8;
import "./errors.sol";

enum ConversationType {
    Group,
    Personal
}

contract Conversation {
    constructor(
        string memory _name,
        ConversationType _conversationType,
        bool _isPrivate
    ) {
        name = _name;
        conversationType = _conversationType;
        maxParticipants = _conversationType == ConversationType.Personal
            ? 2
            : 100;
        isPrivate = _isPrivate;
        participants[msg.sender] = true;
        admins[msg.sender] = true;
        creator = msg.sender;
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
    mapping(uint32 => Message) private _messages;
    address creator;
    string name;
    mapping(address => bool) public admins;
    uint public maxParticipants;
    uint public currentParticipants;
    uint32 private _messageId;
    bool public exist;
    bool public isClosed;
    bool isPrivate;
    mapping(address => bool) public participants;
    ConversationType conversationType;

    // Events
    event MessageSendEvent(Message message);

    function sendMessage(string memory content) public {
        _messages[_messageId] = Message({
            id: _messageId,
            content: content,
            sender: msg.sender,
            timeSent: block.timestamp,
            seenBy: new string[](0),
            attachment: "",
            exist: true
        });

        emit MessageSendEvent(_messages[_messageId]);
        _messageId++;
    }

    function addParticipant(address participant) public {
        participants[participant] = true;
        currentParticipants++;
    }

    function removeParticipant(address participant) public {
        participants[participant] = false;
        currentParticipants--;
    }

    function getMessage(uint32 messageId) public view returns (Message memory) {
        require(_messages[messageId].exist, NoSuchMessage(messageId));

        return _messages[messageId];
    }

    function getMessages() public view returns (Message[] memory) {
        Message[] memory messages = new Message[](_messageId);
        uint32 c = 0;

        for (uint32 i = 0; i < _messageId; i++) {
            if (_messages[i].exist) {
                messages[c++] = _messages[i];
            }
        }

        return messages;
    }

    function checkParticipant(address participant) public view returns (bool) {
        return participants[participant];
    }

    function close() public {
        exist = false;
        isClosed = true;
    }

    function setAdmin(address participant) public {
        admins[participant] = true;
    }

    function unsetAdmin(address participant) public {
        admins[participant] = false;
    }

    function isAdmin(address participant) public view returns (bool) {
        return admins[participant];
    }
}

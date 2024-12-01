// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.8;

import './Conversation.sol' as conv;
import './errors.sol';

contract ChatApp {
	uint32 private _conversationID = 0;
	mapping(uint32 => conv.Conversation) conversations;
  mapping(address => uint32[]) userConversations;
  mapping(uint32 => address) users;

	event PaticipantJoinedEvent(uint32 id, address _participant, uint timestamp);
	event PaticipantLeaveEvent(uint32 id, address _participant, uint timestamp);

	function createConveration(
		string memory name,
		conv.ConversationType cType,
		bool isPrivate
	) external returns (bool) {
		conversations[_conversationID] = new conv.Conversation(name, cType, isPrivate);

		_conversationID++;
		return true;
	}

  function getConversations() view external returns (conv.Conversation[] memory) {
    conv.Conversation[] memory convs = new conv.Conversation[](0);
    uint c = 0;

    for (uint32 i = 0; i < _conversationID; i++) {
      conv.Conversation conversation = conversations[i];
      if (!conversation.isClosed() && conversation.exist()) {
        convs[c++] = conversation;
      }
    }
    return convs;
  }

  function getConversations(address user) view public returns (conv.Conversation[] memory) {
    conv.Conversation[] memory convs = new conv.Conversation[](0);
    uint c = 0;
    uint32[] memory userConv = userConversations[user];
    

    for (uint32 i = 0; i < userConv.length; i++) {
      conv.Conversation conversation = conversations[userConv[i]];
      if (!conversation.isClosed() && conversation.exist()) {
        convs[c++] = conversation;
      }
    }
    return convs;
  }

	function joinConversation(uint32 id, address participant) external {
		conv.Conversation c = conversations[id];
		require(c.exist(), ConversationNotExist(id));
		require(
			c.currentParticipants() <= c.maxParticipants(),
			ParticipantLimitReached(c.maxParticipants())
		);
		require(!c.checkParticipant(participant), AddressInConversation(participant));
		require(!c.isClosed(), 'Conversation is closed');

		c.addParticipant(participant);
		emit PaticipantJoinedEvent(id, participant, block.timestamp);
	}

	function leaveConversation(uint32 id, address participant) external {
		conv.Conversation c = conversations[id];
		require(c.exist(), ConversationNotExist(id));
		require(c.checkParticipant(participant), AddressNotInConversation(participant));

		c.removeParticipant(participant);
		emit PaticipantLeaveEvent(id, participant, block.timestamp);
	}

	function deleteConversation(uint32 id) external {
		conv.Conversation c = conversations[id];
		require(c.exist(), ConversationNotExist(id));
		require(c.isAdmin(msg.sender), AddressNotAdmin(msg.sender));

    delete conversations[id];
		c.close();
	}
}

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.8;

import "./Conversation.sol" as conv;
import "./errors.sol";

contract ChatApp {
    uint32 private _conversationID = 0;
    mapping(uint32 => conv.Conversation) public conversations;

    event PaticipantJoined(uint32 id, address _participant, uint timestamp);
    event PaticipantLeave(uint32 id, address _participant, uint timestamp);

    function createConveration(
        string memory name,
        conv.ConversationType cType,
        bool isPrivate
    ) public returns (bool) {
        conversations[_conversationID] = new conv.Conversation(
            name,
            cType,
            isPrivate
        );

        _conversationID++;
        return true;
    }

    function joinConversation(uint32 id, address participant) public {
        conv.Conversation c = conversations[id];
        require(c.exist(), ConversationNotExist(id));
        require(
            c.currentParticipants() <= c.maxParticipants(),
            ParticipantLimitReached(c.maxParticipants())
        );
        require(
            !c.checkParticipant(participant),
            AddressInConversation(participant)
        );
        require(!c.isClosed(), "Conversation is closed");

        c.addParticipant(participant);
    }

    function leaveConversation(uint32 id, address participant) public {
        conv.Conversation c = conversations[id];
        require(c.exist(), ConversationNotExist(id));
        require(
            c.checkParticipant(participant),
            AddressNotInConversation(participant)
        );

        c.removeParticipant(participant);
    }

    function deleteConversation(uint32 id) public {
        conv.Conversation c = conversations[id];
        require(
            c.exist(),
            ConversationNotExist(id)
        );
        require(
            c.isAdmin(msg.sender),
            AddressNotAdmin(msg.sender)
        );

        c.close();
    }

    function editConversation() public returns (bool) {}
}

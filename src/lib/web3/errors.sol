// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.8;

/// @notice Custom error thrown when an address is not a participant in a conversation
/// @dev Triggered when an operation requires the address to be an active participant
/// @param _address The address that is not in the conversation
/// @custom:error Used in methods requiring participant status
error AddressNotInConversation(address _address);
/// @notice Custom error thrown when an address is not the creator of a conversation
/// @dev Raised when an action is attempted by a non-creator address
/// @param _address The address attempting an unauthorized creator-only action
/// @custom:error Used to enforce creator-specific privileges
error AddressNotConversationCreator(address _address);
/// @notice Custom error thrown when an address is already a participant in a conversation
/// @dev Prevents duplicate participant additions
/// @param _address The address that is already in the conversation
/// @custom:error Used to prevent redundant participant additions
error AddressInConversation(address _address);
/// @notice Custom error thrown when an address does not have admin privileges
/// @dev Restricts certain actions to admin-level access
/// @param _address The address lacking admin permissions
/// @custom:error Used to enforce administrative access control
error AddressNotAdmin(address _address);
/// @notice Custom error thrown when attempting to access a non-existent conversation
/// @dev Prevents operations on conversations that have not been created or have been deleted
/// @param _id The conversation ID that does not exist
/// @custom:error Used to validate conversation existence before operations
error ConversationNotExist(uint32 _id);
/// @notice Custom error thrown when attempting to add participants beyond the maximum limit
/// @dev Enforces participant count restrictions based on conversation type
/// @param limit The maximum number of participants allowed
/// @custom:error Used to prevent exceeding conversation participant capacity
error ParticipantLimitReached(uint limit);
/// @notice Custom error thrown when attempting to access a non-existent message
/// @dev This error is raised when trying to retrieve a message with an ID that does not exist in the messages mapping
/// @param id The message ID that was attempted to be accessed but does not exist
/// @custom:error Triggered when a message lookup fails due to non-existent message ID
error NoSuchMessage(uint32 id);
/// @notice Custom error thrown when attempting to access a closed conversation
/// @dev This error is raised when trying to access an already closed conversation
/// @param id The conversation ID that was attempted to be accessed
/// @custom:error Triggered when there is an attempt to access a close conversation
error ConversationClosed(uint32 id);

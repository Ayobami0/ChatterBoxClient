type RoomType = 'CONVERSATION' | 'GROUP';

type Message = {
  id: string,
  roomId: string,
  timeSent: Date,
  content: string,
}

type Room = {
  id: string,
  name: string,
  latestMessage: Message,
  type: RoomType
}


export type { Message, Room };

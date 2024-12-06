type RoomType = 'CONVERSATION' | 'GROUP';

type Message = {
  id: string,
  roomId: string,
  timeSent: Date,
  content: string,
  attachmentUrl?: string
}

type Room = {
  id: string,
  name: string,
  latestMessage?: Message,
  imageUrl?: string,
  type: RoomType
  desc?: string,
}


export type { Message, Room };

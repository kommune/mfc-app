class MessageBoardsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_boards_#{params['message_board_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], message_room_id: data['message_board_id'])
  end
end
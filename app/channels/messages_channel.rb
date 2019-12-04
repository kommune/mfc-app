class MessagesChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "messages_#{params[:message_board_id]}"
  end

end
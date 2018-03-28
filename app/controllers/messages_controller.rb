class MessagesController < ApplicationController
  
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast("messages_#{message_params[:message_board_id]}",
      message: message.body,
      user: message.user.username
      )
    else
      redirect_to user_message_boards_path(current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :message_board_id)
  end

end
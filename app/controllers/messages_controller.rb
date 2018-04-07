class MessagesController < ApplicationController

  before_action :authenticate_user!

  def create
    key = ENV['KEY']
    iv = SecureRandom.random_bytes(12)
    message = Message.new(message_params)
    encrypted_body = Message.encrypt_body(message.body, iv: iv, key: key)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast("messages_#{message_params[:message_board_id]}",
      message: Message.decrypt_body(encrypted_body, iv: iv, key: key),
      user: message.user.name
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

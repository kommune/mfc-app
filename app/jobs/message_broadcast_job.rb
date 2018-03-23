class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "message_boards_#{message.message_board.id}_channel",
                                 message: 'MESSAGE_HTML'
  end

  private

  def render_message(message)
    MessageController.render partial: 'messages/message', locals:{message: message}
  end

end
require 'securerandom'

class MessageBoardsController < ApplicationController

  before_action :authenticate_user!

  def index
    @agency_user = User.where(role: "agency_user")
    message_boards = current_user.message_boards
    @existing_message_boards_users = current_user.existing_message_boards_users
  end

  def create
    @other_user = User.find(params[:other_user])
    @message_board = find_chat(@other_user) || MessageBoard.new(identifier: SecureRandom.hex)
    if !@message_board.persisted?
      @message_board.save
      @message_board.subscriptions.create(user_id: current_user.id)
      @message_board.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_message_board_path(current_user, @message_board, :other_user => @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @message_board = MessageBoard.find_by(id: params[:id])
    @message = Message.new
  end

  private

  def find_chat(second_user)
    message_boards = current_user.message_boards
    message_boards.each do |message_board|
      message_board.subscriptions.each do |s|
        if s.user_id == second_user.id
          return message_board
        end
      end
    end
    nil
  end

  def message_board_params
    params.require(:message_board).permit(:identifier)
  end

end

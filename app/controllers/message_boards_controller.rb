require 'securerandom'

class MessageBoardsController < ApplicationController

  def index
    message_boards = current_user.message_boards
    @existing_message_boards_users = current_user.existing_message_boards_users
  end

  def new
    @message_board = MessageBoard.new
  end

  def create
    @other_user = Agencyuser.find(params[:other_user])
    @message_board = find_chat(@other_user) || MessageBoard.new(identifier: SecureRandom.hex)
    if !message_board.persisted?
      @message_board.save
      @message_board.subscriptions.create(user_id: current_user.id)
      @message_board.subscriptions.create(agencyuser_id: @other_user.id)
    end
    redirect_to message_board_path(current_user, @message_board, :other_user => @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @message_board = MessageBoard.find_by(id: params[:id])
    @message = Message.new
  end

  private

  def find_chat(agency_user)
    message_boards = current_user.message_boards
    message_boards.each do |message_board|
      message_board.subscriptions.each do |s|
        if s.agencyuser_id == agency_user.id
          return message_board
        end
      end
    end
    nil
  end

  def message_board_params
    params.require(:message_board).permit(:title)
  end

end

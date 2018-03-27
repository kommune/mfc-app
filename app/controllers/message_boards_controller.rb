require 'securerandom'

class MessageBoardsController < ApplicationController

  def index
    if current_user
      message_boards = current_user.message_boards
      @existing_message_boards_users = current_user.existing_message_boards_users
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @message_board = MessageBoard.new
  end

  def create
    @agency_user = Agencyuser.find(params[:id])
    @message_board = find_chat(@agency_user) || MessageBoard.new(identifier: SecureRandom.hex)
    if !message_board.persisted?
      @message_board.save
      @message_board.subscriptions.create(user_id: current_user.id)
      @message_board.subscriptions.create(agencyuser_id: @agency_user.id)
    end
    redirect_to message_board_path(current_user, @message_board)
  end

  def show
    @agency_user = Agencyuser.find(params[:id])
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
    params.require(:message_board).permit(:identifier)
  end

end

class MessageBoardsController < ApplicationController

  def index
    @message_boards = MessageBoard.all
  end

  def new
    @message_board = Messageboard.new
  end

  def create
    @message_board = current_user.message_boards.build(message_board_params)
    if @message_board.save
      flash[:success] = 'Message board added!'
      redirect_to message_board_path
    else
      render 'new'
    end
  end

  def show
    @message_board = MessageBoard.includes(:messages).find_by(id: params[:id])
  end

  private

  def message_board_params
    params.require(:chat_room).permit(:title)
  end

end

class MessageBoardsController < ApplicationController

  def index
    @message_boards = MessageBoard.all
  end

  def new
    @message_board = MessageBoard.new
  end

  def create
    @message_board = current_user.message_boards.build(message_board_params)
    if @message_board.save
      flash[:success] = 'Message board added!'
      redirect_to message_boards_path
    else
      render 'new'
    end
  end

  def show
    @message_board = MessageBoard.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def destroy
    @message_board = MessageBoard.includes(:messages).find_by(id: params[:id])
    @messages = Message.find_by(id: params[:id])

    if current_user
      if @message_board.destroy
        redirect_to message_boards_path
      else
        @message.destroy
        redirect_to message_board(@message_board)
      end
    end
  end

  private

  def message_board_params
    params.require(:message_board).permit(:title)
  end

end

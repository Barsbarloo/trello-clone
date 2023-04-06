class BoardUsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @board_user = board.board_users.new
  end

  def create
    @board = Board.new(board_params.merge(user: current_user))

    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def board
    @board ||= Board.find(params[:board_id])
  end
end
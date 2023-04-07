class BoardUsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @board_user = board.board_users.new
  end

  def create
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_ids
    params[:user_ids].map(&:to_i).reject(&:zero?)
  end

  def board
    @board ||= Board.find(params[:board_id])
  end
end
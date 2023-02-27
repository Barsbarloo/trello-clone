module Api
  class ListsController < ApplicationController
    def index
      @lists = board.lists.order(position: :asc)

      render json: ListSerializer.new(@lists).serializable_hash
    end

    private

    def board
      @board ||= Board.find(params[:board_id])
    end
  end
end
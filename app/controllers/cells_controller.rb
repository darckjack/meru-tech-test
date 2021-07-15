class CellsController < ApplicationController
  before_action :set_data, only: [:show, :update]

  # GET /games/1/cells/1/1
  def show
    render json: @game.board[@row][@col]
  end

  # PUT/PATCH /games/1/cells/1/1
  def update
    PlayManager::PlayUpdater.call(@game, @row, @col, @mark)
    render json: @game
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_data
    @game = Game.find(params[:game_id])
    @row = params[:row].to_i
    @col = params[:col].to_i
    @mark = params[:mark]
  end

  def cell_params
    params.permit(:game_id, :row, :col, :mark)
  end
end

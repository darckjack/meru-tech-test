class GamesController < ApplicationController
  before_action :set_game, only: :show

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # GET /games/finished
  def finished
    @games = Game.finished

    render json: @games
  end

  # GET /games/in-progress
  def in_progress
    @games = Game.not_finished

    render json: @games
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.permit(:rows, :cols, :mines)
  end
end

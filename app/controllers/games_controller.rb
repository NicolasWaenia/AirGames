class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    raise
    @game = Game.find(param[:id])
  end

  def update
    raise
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to games_show_path
  end

  def destroy
    raise
  end

  private

  def game_params
    params.require(:game).permit(:name, :number_of_players_min, :number_of_players_max, :category, :price, :user_id)
  end
end

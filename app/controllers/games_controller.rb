class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @games = Game.all
    # Pour filtrer via les catégories
    if params[:category].present?
      @games = @games.where(category: params[:category])
    end

    if params[:query].present?
      @games = @games.search_by_name_and_category(params[:query])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def my_index
    if current_user
      @games = current_user.games
    else
      redirect_to root_path, alert: 'You need to be logged in to view your games.'
    end
  end

  def show
    @game = Game.find(params[:id])
    @booking = Booking.new
    @review = Review.new
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
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :number_of_players_min, :number_of_players_max, :category, :price, :user_id, :photo, :description)
  end
end

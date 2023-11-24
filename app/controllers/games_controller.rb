class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @games = Game.all
    # The `geocoded` scope filters only users with coordinates

    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "marker", locals: {user: user}),
      }
    end
    if params[:query].present?
      @games = Game.search_by_name_and_category(params[:query])
    else
      @games = Game.all
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
    @reviews = @game.reviews
    @average_rating = @reviews.average(:rating)
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

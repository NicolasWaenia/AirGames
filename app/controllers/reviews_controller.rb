class ReviewsController < ApplicationController

  # before_action :find_review, only: [:]

  # def index
  #   @reviews = Review.all
  # end

  # def show
  #   # Utilisation de @review trouvé par le before_action
  #   # Logique pour afficher une review spécifique
  # end

  # def new
  #   @game = Game.find(params[:game_id])
  #   # Logique pour créer une nouvelle review
  # end

  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @review.user = current_user
    @review.game = @game
    # if @review.save
    #   redirect_to game_path(@game), notice: 'Review was successfully created.'
    # else
    #   render "games/show", status: :unprocessable_entity
    # end

    if @review.save
      redirect_to game_path(@game, anchor: "comment")
    else
      render "games/show"
    end
  end

  # def edit
  #   # Utilisation de @review trouvé par le before_action
  #   # Logique pour éditer une review existante
  # end

  # def update
  #   if @review.update(review_params)
  #     redirect_to @review, notice: 'Review was successfully updated.'
  #   else
  #     render :edit
  #   end
  #   # Logique pour mettre à jour une review existante
  # end

  # def destroy
  #   @review.destroy
  #   redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  #   # Logique pour supprimer une review existante
  # end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :game_id)
  end
end

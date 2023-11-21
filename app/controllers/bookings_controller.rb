class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @game = Game.find(params[:game_id])
    @booking.user = current_user
    @booking.status = "En attente"
    @booking.game = @game
    if @booking.save
      redirect_to game_path(@game)
    else
      render "games/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :status, :user_id, :game_id)
  end
end

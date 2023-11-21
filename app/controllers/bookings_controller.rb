class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @game = Game.find(params[:game_id])
    @booking.user = current_user
    @booking.status = "pending"
    @booking.game = @game
    if @booking.save
      redirect_to my_bookings_path
    else
      render "games/show", status: :unprocessable_entity
    end
  end

  def my_index
    if current_user
      @bookings = current_user.bookings
    else
      redirect_to root_path, alert: 'You need to be logged in to view your bookings.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :status, :user_id, :game_id)
  end
end

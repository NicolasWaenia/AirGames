class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @game = Game.find(params[:game_id])
    @booking.user = current_user
    @booking.status = "pending"
    @booking.game = @game
    if @booking.end_at && @booking.start_at
      @booking.total_price = ((@booking.end_at - @booking.start_at)/(60 * 60 * 24) + 1).floor * @booking.game.price
    end
    if @booking.save
      redirect_to my_bookings_path
    else
      @review = Review.new
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to game_path(@booking.game)
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    @booking.save
    redirect_to game_path(@booking.game)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end
end

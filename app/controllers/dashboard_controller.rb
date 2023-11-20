class DashboardController < ApplicationController
  def index
    @games = Game.where(user_id: current_user)
    @bookings = Booking.where(user_id: current_user)
  end
end

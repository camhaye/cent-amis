class DashboardController < ApplicationController
  before_action :authenticate_user!

  def my_friends
    @friends = Friend.where(user_id: current_user.id)
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user)
    @pending_bookings = Booking.joins(:friend).where(friends: { user_id: current_user })
  end

  def my_booked_friends
    @booked_friends = Booking.joins(:friend).where(friends: { user_id: current_user })
  end
end

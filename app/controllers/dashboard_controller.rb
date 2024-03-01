class DashboardController < ApplicationController
  before_action :authenticate_user!

  def my_friends
    @friends = Friend.where(user_id: current_user.id)
  end

  def my_bookings
    @pending_bookings = Booking.where(user_id: current_user, status: "pending")
    @accepted_bookings = Booking.where(user_id: current_user, status: "accepted")
  end

  def my_booked_friends
    @pending_bookings = Booking.joins(:friend).where(friends: { user_id: current_user })
    @booked_friends = Booking.joins(:friend).where(friends: { user_id: current_user })
  end

end

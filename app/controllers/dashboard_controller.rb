class DashboardController < ApplicationController
  before_action :authenticate_user!

  def my_friends
    @friends = Friend.where(user_id: current_user.id)
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  #def validate
    # ajouter booléen
  #end

  def my_booked_friends
    @friends = Friend.where(available: 'false')
  end
end

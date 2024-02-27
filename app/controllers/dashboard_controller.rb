class DashboardController < ApplicationController
  before_action :authenticate_user!

  def my_friends
    @friends = Friend.where(user_id: current_user.id)
  end

  def my_bookings
    @booking = Booking.where(user_id: current_user.id)
  end

  #def validate
    # ajouter booléen

  #end

  def my_booked_friends
    @friend = Friend.where(params[:available == 'false'])
  end

end

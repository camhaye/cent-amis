class DashboardController < ApplicationController

  def my_friends
    @friend = Friend.where(user_id: params_id)
  end

  def my_bookings

  end

  def validate
    # ajouter booléen

  end

  def my_booked_friends

  end

end

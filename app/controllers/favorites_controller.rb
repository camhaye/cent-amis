class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @favoris = Favorite.all.where(user_id: current_user.id)
  end

end

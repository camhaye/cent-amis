class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy, :toggle_favorite]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :toggle_favorite]

  def index
    @friends = Friend.all
    @friends = @friends.filter_by_gender(params[:gender]) if params[:gender].present?
    @friends = @friends.filter_by_city(params[:city]) if params[:city].present?
    if params[:age].present?
      age_range = Range.new(*params[:age].split("..").map(&:to_i))
      @friends = @friends.filter_by_age_range(age_range)
    end

    @markers = @friends.geocoded.map do |friend|
      {
        lat: friend.latitude,
        lng: friend.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {friend: friend})
      }
    end
  end

  def show
    @reviews = @friend.reviews
    @total = Review.total_rating(@reviews)
    @favorite = current_user.favorites.find_by(friend: @friend) if user_signed_in?
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @friend.update(friend_params)
    redirect_to friend_path(@friend)
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

  def toggle_favorite
    @favorite = Favorite.find_by(friend: @friend, user: current_user)
    @user = current_user
    if @favorite
      @favorite.destroy
      redirect_to request.referer, notice: 'Ami.e supprimé.e de la liste des favoris'
    else
      @favorite = Favorite.create(friend: @friend, favorite: true, user: @user)
      redirect_to request.referer, notice: 'Ami.e ajouté.e aux favoris'
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:first_name, :city, :location, :content, :available, :gender, :age, :good_at, :price, :image_url)
  end
end

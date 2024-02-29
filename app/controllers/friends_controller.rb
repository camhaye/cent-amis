class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy, :toggle_favorite]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :toggle_favorite]

  def index
    @friends = Friend.all
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
    @favorite = Favorite.find_by(friend: @friend)
    @user = User.find(current_user.id)
    if @favorite
      @favorite.destroy
      redirect_to friend_path(@friend), notice: 'Unfavorited successfully.'
    else
      @favorite = Favorite.create(friend: @friend, favorite: true, user: @user)
      redirect_to friend_path(@friend), notice: 'Friend favorited'
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

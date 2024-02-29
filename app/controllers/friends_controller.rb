class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

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

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:first_name, :city, :location, :content, :available, :gender, :age, :good_at, :price, :image_url)
  end
end

class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :destroy]

  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(params_friend)
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new, status: :unprocessable_entity
    end


  def set_friend
    @friend = Friend.find(params[:id])
  end

  def params_friend
    params.require(:friend).permit(:name, )
  end
end

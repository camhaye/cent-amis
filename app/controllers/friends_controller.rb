class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @user = User.find(params[:id])
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(params_friend)
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @friend.update(task_params)
    redirect_to friend_path(@task)
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

  private

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end

  def params_friend
    params.require(:friend).permit(:name, )
  end
end

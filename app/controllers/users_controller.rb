class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only: [:edit, :update]

  def top
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if
     @user.update(user_params)
     redirect_to user_path(current_user), notice: "プロフィールを更新しました！"
   else
     render :edit
   end
  end

  def following
    @user  = User.find(params[:id])
    render 'follow'
  end

  def followers
    @user  = User.find(params[:id])
    render 'follower'
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :intoduction)
  end

end

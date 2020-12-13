class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def top
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


  def user_params
    params.require(:user).permit(:name, :profile_image, :intoduction)
  end

end

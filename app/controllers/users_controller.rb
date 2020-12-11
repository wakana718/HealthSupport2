class UsersController < ApplicationController
  def top
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if
     @user.update(user_params)
     redirect_to user_path(current_user), notice: "You have updated successfully."
   else
     render :edit
   end
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :intoduction)
  end

end

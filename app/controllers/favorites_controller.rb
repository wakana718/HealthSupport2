class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Favorite.create(user_id: current_user.id,post_id: params[:post_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    if favorite=Favorite.find_by(user_id: current_user.id,post_id: params[:post_id])
      favorite.delete
    else
      redirect_to root_path
    end
  end

end

class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    @user = User.find(params[:id])
    render 'create.js.erb'
  end

  def unfollow
    current_user.unfollow(params[:id])
    @user = User.find(params[:id])
    render 'destroy.js.erb'
  end
end

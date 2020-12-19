class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :current_user, only: [:edit, :update]
  before_action :check_guest, only: %i[update destroy]

  def top
    # ランキング機能
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))

    @users = User.all
    @post = Post.new
    @posts = Post.all
    if params[:genre_status].present?
     @posts = @posts.get_by_genre_status params[:genre_status]
    end
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
   if @user.update(user_params)
      # 編集に成功した場合
      redirect_to user_path(current_user), notice: "プロフィールを更新しました！"
   else
      # 編集に失敗した場合
      flash.now[:alert] = 'プロフィールを更新できませんでした'
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

  def favorites
    @fav_posts = current_user.fav_posts
  end


 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :intoduction)
  end



  def check_guest
    if current_user.email == 'guest@example.com' || current_user.name == 'guest'
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end

end

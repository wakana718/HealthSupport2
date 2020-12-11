class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  # 投稿データのストロングパラメータ
  private
  def post_params
    params.require(:post).permit(:body, :image, :user_id, :genre_id)
  end
end

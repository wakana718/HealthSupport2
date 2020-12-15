class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path(current_user), notice: "投稿しました！"
  end

  def index
    @posts = Post.all
    if params[:genre_status].present?
     @posts = @posts.get_by_genre_status params[:genre_status]
    end
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user), notice: "正常に削除されました！"
  end

  # 投稿データのストロングパラメータ
  private
  def post_params
    params.require(:post).permit(:body, :image, :user_id, :genre_status)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       # 投稿に成功した場合
      redirect_to user_path(current_user), notice: "投稿しました！"
    else
       # 投稿に失敗した場合
      flash.now[:alert] = '投稿できませんでした'
      render :new
    end
  end

  def index
    @post = Post.new
    @posts = Post.page(params[:page]).reverse_order
    if params[:genre_status].present?
       #byebug
     @posts = @posts.get_by_genre_status params[:genre_status]
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new

    # @users = User.find(@post.likes.pluck(:user_id))

    likes = Like.where(post_id: params[:id])
    @users = User.find(likes.pluck(:user_id))


  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     redirect_to post_path(@post.id), notice: "投稿を更新しました！"
    else
      flash.now[:alert] = '投稿を更新できませんでした'
      render :edit
    end
  end



  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
       # 削除に成功した場合
      redirect_to user_path(current_user), notice: "投稿が削除されました！"
    else
       # 削除に失敗した場合
      flash.now[:alert] = '投稿を削除できませんでした'
      render :show
    end
  end


  private
  def post_params
    params.require(:post).permit(:body, :image, :user_id, :genre_status)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    # comment = Comment.new(comment_params)
    # comment.user_id = current_user.idの2行を1行で↓
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @post = @comment.post
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

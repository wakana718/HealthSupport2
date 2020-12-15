class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    # comment = Comment.new(comment_params)
    # comment.user_id = current_user.idの2行を1行で↓
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
     redirect_to post_path(post)
    else
     redirect_to post_path(post)
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

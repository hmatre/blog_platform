class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @post, notice: 'Comment added successfully'
    else
      redirect_to @post, alert: 'Comment could not be added'
    end
  end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id]) # Only allow user to delete their own comments
    if @comment
      @comment.destroy
      redirect_to @comment.post, notice: "Comment deleted!"
    else
      redirect_to root_path, alert: "Not authorized to delete this comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end


class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = 1
    @comment.concert_id = params[:concert_id]
    @comment.created_at = Time.now
    @comment.updated_at = Time.now
    @comment.save

    redirect_to controller: 'concerts', action: 'show', id: @comment.concert_id
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
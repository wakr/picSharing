class CommentsController < ApplicationController

  #POST /comments
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
      end
    redirect_to :back
  end


  private
  def comment_params
    params.require(:comment).permit(:text, :picture_id)
  end


end

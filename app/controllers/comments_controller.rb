class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:id]).comments.new
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end

class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:id]).comments.new
    render :new
  end

  def new_nested
    parent = Comment.find(params[:id])
    @comment = parent.child_comments.new(post_id: parent.post_id)
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
    params.require(:comment).permit(:post_id, :parent_comment_id, :content)
  end
end

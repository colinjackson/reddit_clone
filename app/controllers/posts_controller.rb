class PostsController < ApplicationController
  before_filter :ensure_signed_in, except: :show
  before_filter :ensure_author_of_post, only: [:edit, :update]

  def new
    @post = Sub.find(params[:id]).posts.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments_by_parent_id = @post.comments_by_parent_id
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, { sub_ids: [] })
  end

  def ensure_author_of_post
    post = Post.find(params[:id])
    if post.nil? || current_user != post.author
      render ({
        text: "YOU'RE TRYING TO MESS UP SOMEONE ELSE'S STUFF",
        status: :forbidden
      })
    end
  end

end

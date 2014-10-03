class SubsController < ApplicationController
  before_filter :ensure_signed_in, except: [:index, :show]
  before_filter :ensure_mod_of_sub, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end


  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_mod_of_sub
    sub = Sub.find(params[:id])
    if sub.nil? || current_user != sub.moderator
      redirect_to :back
    end
  end

end

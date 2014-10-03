class SignInsController < ApplicationController
  before_filter :ensure_signed_out, only: [:new, :create]
  before_filter :ensure_signed_in, only: :destroy

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(credentials_params)
    if user.nil?
      render :new
    else
      sign_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    sign_out!(SignIn.find(params[:id]))
    redirect_to :back
  end


  private

  def credentials_params
    params.require(:user).permit(:email, :password)
  end

end

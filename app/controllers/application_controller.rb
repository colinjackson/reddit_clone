class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_sign_in, :signed_in?

  def sign_in_user!(user)
    sign_in = user.sign_ins.create!
    session[:token] = sign_in.session_token
  end

  private

  def current_user
    return nil if !signed_in?
    current_sign_in.user
  end

  def current_sign_in
    return nil if !session[:token]
    SignIn.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_sign_in
  end

  def sign_out!(sign_in)
    session_token = nil if sign_in == current_sign_in
    current_sign_in.destroy!
  end

end

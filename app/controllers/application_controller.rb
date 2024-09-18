class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :current_user

  def current_user
    @current_user ||=  User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def redirect_if_not_login
    redirect_to new_session_url unless current_user
  end

  def redirect_if_login
    redirect_to cats_url if current_user
  end

  def logout
    session[:session_token] = nil
    @current_user = nil
  end
end

class ApplicationController < ActionController::Base
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
    redirect_to bands_url if current_user
  end

  def render_403_if_try_to_delete_now_own_note
    user = current_user
    note = Note.find_by(id: params[:id])

    unless current_user.admin || user.have_note?(note)
      render plain: "Not authorized", status: 403
    end
  end

  def logout
    session[:session_token] = nil
    @current_user = nil
  end

  def check_admin_authorization
    render plain: "Forbidden action" unless current_user.admin
  end
end

class SessionsController < ApplicationController
  before_action :redirect_if_login, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user
      login(user)
      redirect_to bands_url
    else
      flash[:errors] = "email or password are invalid"
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end

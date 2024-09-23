class UsersController < ApplicationController
  before_action :redirect_if_login, only: [:create, :new]
  before_action :check_admin_authorization, only: [:index]

  def index
    @users = User.all
    render "index"
  end

  def upgrade
    user_id = params[:user_id]
    user = User.find_by(id: user_id)
    user.toggle(:admin)
    user.save
    redirect_to users_url
  end

  def create
    user = User.new(user_params)
    user.activation_token = SecureRandom.urlsafe_base64
    user.activated = false

    if user.save
      activation_mail = UserMailer.with(user: user).activation_mail
      activation_mail.deliver_now
      redirect_to new_session_url
    else
      render json: {"message": user.errors.full_messages}, status: 400
    end
  end

  def activate
    activation_token = params[:activation_token]

    if activation_token
      user = User.find_by(activation_token: activation_token)

      if user
        user.toggle(:activated)
        user.save
      end
      redirect_to new_session_url
    else
      render json: {"message": "User not found"}, status: :not_found
    end
  end

  def new
    render "new"
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

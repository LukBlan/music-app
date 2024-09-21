class UsersController < ApplicationController
  before_action :redirect_if_login, only: [:create, :new]

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to bands_url
    else
      render json: {"message": user.errors.full_messages}, status: 400
    end
  end

  def new
    render "new"
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

class CatsController < ApplicationController
  before_action :redirect_if_not_login, only: [:index]

  def index
    render "index"
  end
end

class BandsController < ApplicationController
  before_action :redirect_if_not_login, only: [:index, :create, :edit, :show, :update, :destroy, :new]

  def index
    @bands = Band.all
    render "index"
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to bands_url
    else
      render json: {"errors": band.errors.full_messages}, status: :unprocessable_content
    end
  end

  def edit
    @id = params[:id]
    render "edit"
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    band = Band.find_by(id: params[:id])
    band.update(band_params)

    redirect_to band_url
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_url
  end

  def new
    render "new"
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end

class AlbumsController < ApplicationController
  def new
    render "new"
  end

  def create
    album = Album.new(album_params)

    if album.save
      render json: album
    else
      render json: album.errors.full_messages, status: :unprocessable_content
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])

    if @album
      @bands = Band.all
      render "edit"
    else
      redirect_to bands_url
    end
  end

  def update
    album = Album.find_by(id: params[:id])
    album.update(album_params)
    redirect_to bands_url
  end

  def destroy
    album = Album.find_by(id: params[:id])
    band_id = album.band_id

    if album
      album.destroy
      redirect_to band_url(band_id)
    else
      redirect_to bands_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:year, :title, :band_id, :record_type)
  end
end

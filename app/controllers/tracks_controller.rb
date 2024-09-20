class TracksController < ApplicationController
  before_action :redirect_if_not_login, only: [:new, :create, :edit, :update, :show, :destroy]
  def new
    @track = Track.new(track_type: "bonus")
    render "new"
  end

  def create
    track = Track.new(track_params)

    if track.save
      render json: track
    else
      render json: {"error": track.errors.full_messages}
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all
    render "edit"
  end

  def update
    track = Track.find_by(id: params[:id])

    if track.update(track_params)
      redirect_to bands_url
    else
      redirect_to bands_url
    end
  end

  def show
    @track = Track.find_by(id: params[:id])

    if @track
      render "show"
    else
      redirect_to bands_url
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    album_id = track.album_id
    track.destroy

    redirect_to album_url(album_id)
  end

  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :track_type, :album_id)
  end
end

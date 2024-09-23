class NotesController < ApplicationController
  before_action :render_403_if_try_to_delete_now_own_note, only: [:destroy]

  def new
    render "new"
  end

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id

    if note.save
      redirect_to track_url(note.track_id)
    else
      redirect_to new_track_note_url(note.track_id)
    end
  end

  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
    redirect_to track_url(note.track_id)
  end

  private
  def note_params
    params.require(:note).permit(:note, :track_id)
  end
end

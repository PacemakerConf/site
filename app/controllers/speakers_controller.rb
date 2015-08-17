class SpeakersController < ApplicationController

  before_action :set_speaker, only: [:show, :edit, :update]
 
  def show
    @sorted_events = @speaker.get_sorted_events
  end

  def new
    @invite = Invitation.find_by(email_hash: params[:hash])
    if @invite.status != 'New'
      @speaker = Speaker.find_by(email: @invite.email)
      redirect_to edit_speaker_path(@speaker, params)
    else
      @speaker = Speaker.new(email: @invite.email)
    end
  end

  def edit
    @invite = Invitation.find_by(email_hash: params[:hash])
  end

  def create
    @speaker = Speaker.new(speaker_params)
    @invite = Invitation.where(email_hash: params['speaker']['email_hash'])[0]
    respond_to do |format|
      if @speaker.save
        @invite.status = 'Registered'
        @invite.save
        format.html { redirect_to controller: 'events', action: 'new', hash: params['speaker']['email_hash'], speaker_id: @speaker.id }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :new }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @invite = Invitation.where(email_hash: params['speaker']['email_hash'])[0]
    respond_to do |format|
      if @speaker.update(speaker_params)
        @invite.status = 'Registered'
        @invite.save
        format.html { redirect_to controller: 'events', action: 'new', hash: params['speaker']['email_hash'], speaker_id: @speaker.id }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :edit }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_speaker
    @speaker = Speaker.find(params[:id])   
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def speaker_params
    params.require(:speaker).permit(:name, :surname, :position, :description, :photo, :email, :facebook, :linkedin, :site, :twitter)
  end

end
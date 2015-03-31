class SpeakersController < ApplicationController

  before_action :set_speaker, only: [:show, :edit, :update]
 
  def show
  end

  def new
    email = Invitation.where(email_hash: params[:hash])[0].email
    @speaker = Speaker.new(email: email)
  end

  def edit
  end

  def create
    @speaker = Speaker.new(speaker_params)
    @invite = Invitation.where(email_hash: params['speaker']['email_hash'])[0]
    respond_to do |format|
      if @speaker.save
        @invite.status = 'Complete'
        @invite.save
        format.html { redirect_to controller: 'events', action: 'new', hash: params["speaker"]["email_hash"], speaker_id: @speaker.id }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { redirect_to controller: 'speakers', action: 'new', hash: params['speaker']['email_hash']}
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
       format.html { redirect_to controller: 'events', action: 'new', hash: params["speaker"]["email_hash"], speaker_id: @speaker.id }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { redirect_to controller: 'speakers', action: 'new', hash: params['speaker']['email_hash']}
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
      params.require(:speaker).permit(:name, :surname, :position, :description, :email, :facebook, :linkedin, :site, :twitter)
    end

end
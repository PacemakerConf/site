class Admin::SpeakersController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /speakers
  # GET /speakers.json
  def index
    @speakers = Speaker.all
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  def invite
    @invite = Invitation.new(conference_id: params[:conference_id])
  end

  def send_invitation
    @invite = Invitation.new(
      email: params[:invitation][:email], 
      conference_id: params[:invitation][:conference_id],
      status: params[:invitation][:status] 
    )
    message = Message.new(content: params[:invitation][:message]).create_if_new
    @invite.message = message
    respond_to do |format|
      if @invite.save && message.valid?
        Invitation.invite_speaker(@invite.email, @invite.email_hash, @invite.message_content)
        format.html { redirect_to admin_speakers_path, notice: 'Invitation was successfully sent.' }
      else
        format.html { render :invite, notice: 'Invitation was not sent.' }
      end
    end
  end

  def list_invites
    @invites = Invitation.all
  end

  # POST /speakers
  # POST /speakers.json
  def create
    authorize! :create, Speaker
    @speaker = Speaker.new(speaker_params)
     
    respond_to do |format|
      if @speaker.save
        format.html { redirect_to admin_speakers_path, notice: 'Speaker was successfully created.' }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :new }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speakers/1
  # PATCH/PUT /speakers/1.json
  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
        format.html { redirect_to admin_speakers_path, notice: 'Speaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @speaker }
      else
        format.html { render :edit }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker.destroy
    respond_to do |format|
      format.html { redirect_to admin_speakers_url, notice: 'Speaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speaker_params
      params.require(:speaker).permit(:name, :surname, :position, :photo, :description, :email, :facebook, :linkedin, :site, :twitter)
    end

end

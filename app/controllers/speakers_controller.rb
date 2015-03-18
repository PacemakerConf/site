class SpeakersController < ApplicationController

  before_action :set_speaker, only: [:show, :edit, :update, :destroy]
 
  def show
  end

  def new
    # authorize! :create, Speaker
    @speaker = Speaker.new
  end

  def create
    # authorize! :create, Speaker
    @speaker = Speaker.new(speaker_params)
    #raise params["speaker"]["email_hash"]e
    
    # invite = something
    # invite.status = 'registred'
    # invite.save!

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to controller: 'events', action: 'new', hash: params["speaker"]["email_hash"]}
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :new}
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
      params.require(:speaker).permit(:name, :surname, :position, :description, :email, :facebook, :linkedin, :site)
    end

end
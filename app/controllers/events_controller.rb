class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :destroy]
 
  def new
    @event = Event.new
  end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :surname, :description, :email, :facebook, :linkedin, :site)
    end

end
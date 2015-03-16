class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    authorize! :create, Event
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        current_user = {'role' => User::SPEAKER}
        format.html { redirect_to admin_events_path, notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
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
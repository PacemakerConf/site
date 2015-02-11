class ConferencesController < ApplicationController

  before_action :set_conference, only: [:schedule, :location, :speakers, :show]

  def location 
    @location = @conference.location
  end

  def speakers
    @speakers = @conference.speakers
  end

  def schedule
    @events = @conference.events
  end

  def index
    @conferences = Conference.all
  end

  def show
    @topic = EventType.where(name: 'topic')
    @lightning = EventType.where(name: 'lightning')
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      
      if(params[:name].to_i.to_s === params[:name].to_s)
        @conference = Conference.find(params[:name])
      else
        input = params[:name].to_s
        border = input.rindex('-').to_i
        name = input.slice(0, border)
        year = input.slice(border+1, 4)
        @conference = Conference.where(name: name).where(year: year)[0]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:name, :year)
    end
end

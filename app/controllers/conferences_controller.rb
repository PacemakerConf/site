class ConferencesController < ApplicationController

  before_action :set_conference, only: [:check_visibility, :schedule, :location, :speakers, :report, :show]
  before_action :check_visibility, only: [:schedule, :location, :speakers, :report, :show]

  def location 
    @location = @conference.location
  end

  def report 
    @report = @conference.report
  end

  def speakers
    speaker_event = EventType.where(speakerEvent: 1)
    @events = @conference.events.where(event_type: speaker_event)
  end

  def schedule
    groupable = EventType.where(groupable: 1)
    @eventsGroupable = @conference.events.where(event_type: groupable).order(:position)
    @eventsSingle = @conference.events.where.not(event_type: groupable).order(:position)
    @events = @conference.events.order(:position)
    @active_button = 'schedule'
  end

  def index
    @conferences = Conference.all
  end

  def show
    topic = EventType.where(name: 'topic')
    lightning = EventType.where(name: 'lightning')
    @topics = @conference.events.where(event_type: topic)
    @lightnings = @conference.events.where(event_type: lightning)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_visibility
      unless can? :read, @conference
        not_found
      end
    end

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
end

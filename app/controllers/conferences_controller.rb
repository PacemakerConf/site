class ConferencesController < ApplicationController

  before_action :set_conference, only: [:check_visibility, :schedule, :location, :speakers, :report, :show]
  before_action :check_visibility

  def location 
    @location = @conference.location
  end

  def report
    @report = @conference.report
  end

  def speakers
    @speakers = @conference.speakers.uniq
  end

  def schedule
    if @conference.group_event then
      groupable = EventType.where(groupable: 1)
      @eventsGroupable = @conference.events.where(event_type: groupable).by_position
      @eventsSingle = @conference.events.where.not(event_type: groupable).by_position     
    else
      @eventsSingle = @conference.events.order(:position)
    end
    @active_button = 'schedule'
    respond_to do |format|
      format.pdf do
        render :pdf    => "schedule",
          :template    => "conferences/schedule.pdf.erb",
          :layout      => "pdf_layout.html"
      end 
      format.html
    end
  end

  def show
    topic = EventType.where(name: 'Topic')
    lightning = EventType.where(name: 'Lightning')
    @news = @conference.news.order(created_at: :desc)
    @topics = @conference.events.where(event_type: topic).by_position
    @lightnings = @conference.events.where(event_type: lightning).by_position
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
        year = Year.where(name: year)[0]
        @conference = Conference.where(name: name).where(year: year)[0]
      end
    end
end

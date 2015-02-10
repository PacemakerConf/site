class Admin::ScheduleController < Admin::ApplicationController
  def index
  	@event = Event.all
  end
end

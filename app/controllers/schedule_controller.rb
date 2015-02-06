class ScheduleController < ApplicationController
  def index
  	@event = Event.all
  end
end

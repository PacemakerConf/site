class Admin::ConferencesController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_conference, only: [:publish, :schedule, :date, :location, :news, :report, :speakers, :show, :edit, :update, :destroy]

  layout 'admin' 
  
  # def initialize
  #   puts self.methods.sort
  # end

  def location 
    @location = @conference.location
  end

  def news
    @news = @conference.news
  end

  def report 
    @report = @conference.report
  end

  def schedule
    groupable = EventType.where(groupable: 1)
    @eventsGroupable = @conference.events.where(event_type: groupable).order(:position)
    @eventsSingle = @conference.events.where.not(event_type: groupable).order(:position)
    @events = @conference.events.order(:position)
    @active_button = 'schedule'
  end

  def publish
    if @conference.update(published: true)
      respond_to do |format|
        format.js {}
      end
    end
  end

  def index
    @conferences = Conference.all.includes(:year, :location, :report, :news)
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)

    respond_to do |format|
      if @conference.save
        format.html { redirect_to admin_conferences_path, notice: 'Conference was successfully created.' }
        format.json { render :show, status: :created, location: @conference }
      else
        format.html { render :new }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to admin_conferences_path, notice: 'Conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference }
      else
        format.html { render :edit }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to admin_conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
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
        year = Year.where(name: year)[0]
        @conference = year.conferences.where(name: name)[0]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:name, :year_id, :date, :registration_deadline, :attenders, :group_event, :video, :photo)
    end
end

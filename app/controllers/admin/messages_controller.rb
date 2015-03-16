class Admin::MessagesController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!
	
	def index
    @messages = Message.all
  end
  
  def switch_to
    
  end
  
  def show
  end
   
  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messages
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messages_params
      
    end
end

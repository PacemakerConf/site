class Admin::MessagesController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!
	
	def index
    @messages = Message.all
  end
  
  def switch_to
    message = Message.find(params[:id])
    new_message = message.dup
    version = Message.set_last_version
    new_message.version = version
    new_message.save
    redirect_to admin_messages_path
  end
end

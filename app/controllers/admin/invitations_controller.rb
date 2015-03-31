class Admin::InvitationsController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!
	
  def index
    @invites = Invitation.all
  end
  
end

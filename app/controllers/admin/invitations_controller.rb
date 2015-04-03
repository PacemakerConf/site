class Admin::InvitationsController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!
	
def index
  @conferences = Conference.all.by_year_date_desc
	  if(params[:conf_id])
	    @conference = Conference.find(params[:conf_id])
	  else
	    @conference = @conferences[0]
	  end
  @invites = @conference.invitations
end
  
end

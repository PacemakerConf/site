class Admin::InvitationsController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!
  before_action :set_invite, only: [:destroy]
	
def index
  @conferences = Conference.all.by_year_date_desc
	  if(params[:conf_id])
	    @conference = Conference.find(params[:conf_id])
	  else
	    @conference = @conferences[0]
	  end
  @invites = @conference.invitations
  @speakers = []
  emails = @invites.pluck(:email)
  emails.each do |email|
  	@speakers.push Speaker.where(email: email)[0]
  end
end

def destroy
  if @invite.status == 'New'
  @invite.destroy
  respond_to do |format|
    format.html { redirect_to admin_invitations_url, notice: 'Invitation was successfully destroyed.' }
    format.json { head :no_content }
      end
  else
    redirect_to admin_invitations_url, notice: 'You can\'t delete invitation, if it\'s status is Registered or Complete!'
  end
end

  private
    def set_invite
      @invite = Invitation.find(params[:id])
    end

end

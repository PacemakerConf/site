class SpeakerRequestController < ActionController::Base
  def send_mail
    @name = params[:name]
    @email = params[:email]
    @comment = params[:comment]
    SpeakerRequestMailer.send_mail(@name, @email, @comment).deliver_now
    flash[:notice] = "Message has been sent."
	# redirect_to root_url, flash: { referral_code: 1234 }
    # redirect_to 'Conference.last_conference_route'
  end
end
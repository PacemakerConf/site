class SpeakerRequest < ActionController::Base
  def send_mail
    name = params[:name]
    email = params[:email]
    message = params[:message]
    SpeakerRequest.send_mail(:name, :email, :message).deliver_now
    flash[:notice] = "Message has been sent."
  end
class SpeakerRequest < ActionController::Base
  def send_mail
    data = params[:letter]
    name = params[:name]
    email = params[:email]
    body = params[:comments]
    SpeakerRequest.send data
    SpeakerRequest.speaker_email(name, email, body).deliver
    notice: 'Message sent'
  # flash[:notice] = "Message has been sent."
  end
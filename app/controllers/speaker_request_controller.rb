class SpeakerRequestController < ActionController::Base
  def send_mail
    @name = params[:name]
    @email = params[:email]
    @comment = params[:comment]
    SpeakerRequestMailer.send_mail(@name, @email, @comment).deliver_now
  end
end
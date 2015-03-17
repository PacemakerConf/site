class SpeakerRequest < ApplicationController
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

UserMailer.newsletter(@user, @posts).method(:deliver).source_location
=> ["gems/mail-2.5.4/lib/mail/message.rb", 229]
 



class SpeakerRequest < ActionController::Base
def show
# ...
tags = view_context.generate_tags(@post)
email_link = view_context.mail_to(@user.email)
# ...
end
end 

<% speaker_request(@user).deliver %> 
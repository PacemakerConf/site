ActionMailer::Base.smtp_settings = {
    :address => "smtp.mandrillapp.com",
    :port => "587",
    :domain => "http://pacemakerconf.herokuapp.com",
    :user_name => "sysstemtest@gmail.com",
    :password => "qxbmmL4vpBgpV8740v0Rgg",
    :authentication => "plain",
    :enable_starttls_auto => true
}

ActionMailer::Base.smtp_settings = {
    :address => "smtp.mandrillapp.com",
    :port => "587",
    :domain => "http://localhost:3000",
    :user_name => "sysstemtest@gmail.com",
    :password => "qxbmmL4vpBgpV8740v0Rgg",
    :authentication => "plain",
    :enable_starttls_auto => true
}

FactoryGirl.define do
  factory :message do |f|
  	f.content "Hello, click on $${link_invitation}"
  	f.version 1
  end

end

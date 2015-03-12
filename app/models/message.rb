class Message < ActiveRecord::Base

	has_many :invitation

	# validates :content, inclusion: { in: %w(%$${link_invitation}),
 #   message: "%{value} is not a valid size" }

end

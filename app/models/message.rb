class Message < ActiveRecord::Base
	TOKEN = '$${link_invitation}' 
	TOKEN_REGEXP = /\$\$\{\w+\}/

	has_many :invitation

    delegate :content, to: :message, prefix: true
  validates_associated :message

	validates :content, format: { with: TOKEN_REGEXP,
    message: "%{value} should includes token #{TOKEN}" }

  def create_if_new
  	message = nil
    unless message = Message.where(content: content).first
      version = Message.pluck(:version).sort[-1]
      version += 1
      message = Message.create(content: content, version: version)
    end
    message
  end	
end

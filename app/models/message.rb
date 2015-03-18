class Message < ActiveRecord::Base
	TOKEN = '$${link_invitation}' 
	TOKEN_REGEXP = /\$\$\{link_invitation\}/
  #default_scope order('created_at DESC')
	
  has_many :invitation

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

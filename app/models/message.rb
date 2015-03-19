class Message < ActiveRecord::Base
	TOKEN = '$${link_invitation}' 
	TOKEN_REGEXP = /\$\$\{link_invitation\}/
	
  has_many :invitation
	
  validate :content_message_presence

  def content_message_presence
    unless self.content =~ TOKEN_REGEXP
      self.errors.add(:content, 
        "of this message must contain token #{TOKEN}")
    end
  end

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

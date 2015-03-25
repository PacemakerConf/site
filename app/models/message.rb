class Message < ActiveRecord::Base
	TOKEN = '$${link_invitation}' 
	TOKEN_REGEXP = /\$\$\{link_invitation\}/
	
  has_many :invitation
  validate :content_message_presence
  default_scope { order(:version => :asc) }

  def content_message_presence
    unless self.content =~ TOKEN_REGEXP
      self.errors.add(:content, 
        "of this message must contain token #{TOKEN}")
    end
  end

  def create_if_new
    message = nil
    unless message = Message.where(content: content).first
      version = Message.set_last_version
      message = Message.create(content: content, version: version)
    end
    message
  end 
 
  def self.set_last_version
    version = Message.pluck(:version).sort[-1]
    version += 1
  end
end

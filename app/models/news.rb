class News < ActiveRecord::Base
	belongs_to :conference
	validates :title, presence: true
end

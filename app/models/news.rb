class News < ActiveRecord::Base
	belongs_to :conference
	validates :title, presence: true

	default_scope { order(id: :asc) }
end

class Report < ActiveRecord::Base
	belongs_to :conference

	validates :title, presence: true
	validates :responsable, presence: true

	default_scope { order(id: :asc) }

	def short_report
		title.truncate(18)
	end
end

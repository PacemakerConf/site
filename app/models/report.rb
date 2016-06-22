class Report < ActiveRecord::Base
	belongs_to :conference
	validates :responsable, :title, presence: true

	def short_report
		title.truncate(18)
	end
end

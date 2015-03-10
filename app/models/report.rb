class Report < ActiveRecord::Base
	belongs_to :conference
	def short_report
		title.truncate(18)
	end
end

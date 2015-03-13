class Report < ActiveRecord::Base
	belongs_to :conference


	validates :title, presence: true
	validates :description, presence: true

	def short_report
		title.truncate(18)
	end

end

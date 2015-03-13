class Report < ActiveRecord::Base
	belongs_to :conference
<<<<<<< HEAD

	validates :title, presence: true
	validates :description, presence: true
=======
	def short_report
		title.truncate(18)
	end
>>>>>>> kirdan
end

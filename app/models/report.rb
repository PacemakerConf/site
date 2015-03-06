class Report < ActiveRecord::Base
	belongs_to :conference

	validate :title, presence: true
	validate :description, presence: true
end

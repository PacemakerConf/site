class StrictValidation 

	@@enabled = true

	def self.toggle
		@@enabled = !@@enabled
	end

	def self.enabled?
		@@enabled
	end

end

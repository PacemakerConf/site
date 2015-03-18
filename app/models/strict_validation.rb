class StrictValidation 

	@@enabled = false

	def self.enabled?
		@@enabled
	end

	def self.toggle
		@@enabled = !@@enabled
	end

	def self.enabled
		@@enabled = true
	end

	def self.disable
		@@enabled = false
	end

end

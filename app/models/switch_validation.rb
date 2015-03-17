class SwitchValidation 

	@@enabled = false

	def self.toggle
		@@enabled = !@@enabled
	end

	def self.enabled?
		@@enabled
	end

end

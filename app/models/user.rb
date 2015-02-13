class User
	ROLES = ['Admin', 'Speaker', 'Guest']
	ADMIN = ROLES[0]
	SPEAKER = ROLES[1]
	GUEST = ROLES[2]
	attr_accessor :role

	def initialize(args)
		@role = args[:role]
	end	
end
class Flag

	GREY_DARK = 'GREYdark.png'
	GREY_LIGHT = 'GREYlight.png'
	RED_LIGHT = 'REDlight.png'
	GREEN_LIGHT = 'GREENlight.png'
	BLUE_LIGHT = 'BLUElight.png'
	
	attr_accessor :display, :image_path

	def initialize(args)
		@display = args['display'] || ''
		@image_path = args['image_path'] || ''
	end	
end
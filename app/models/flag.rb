class Flag

	GREY_DARK = 'GREYdark.png'
	GREY_LIGHT = 'GREYlight.png'
	GREY = 'GREY.png'
	RED_LIGHT = 'REDlight.png'
	RED = 'RED.png'
	GREEN_LIGHT = 'GREENlight.png'
	GREEN = 'GREEN.png'
	BLUE_LIGHT = 'BLUElight.png'
	BLUE = 'BLUE.png'
	
	attr_accessor :display, :image_path

	def initialize(args)
		@display = args['display'] || ''
		@image_path = args['image_path'] || ''
	end	
end
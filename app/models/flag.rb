class Flag

	GREY_DARK = 'GREYdark.png'
	GREY_LIGHT = 'GREYlight.png'
	GREY = 'greyflag.png'
	RED_LIGHT = 'REDlight.png'
	RED = 'redflag.png'
	GREEN_LIGHT = 'GREENlight.png'
	GREEN = 'greenflag.png'
	BLUE_LIGHT = 'BLUElight.png'
	BLUE = 'blueflag.png'
	
	attr_accessor :display, :image_path

	def initialize(args)
		@display = args['display'] || ''
		@image_path = args['image_path'] || ''
	end	
end
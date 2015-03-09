module ConferencesHelper
	def get_active_button
		buttons_order = ['show', 'speakers', 'schedule', 'location', 'report']
		index = buttons_order.index(params[:action])
		buttons_class = ['','','','','']
		buttons_class[index] = 'active'
		buttons_class
	end
end

module ConferencesHelper

	def scheduleColor(color)
		go = color.to_s
		tr = 0
		cl = []
		endString = ""
		for i in 1..3
			cl[i] = (go[i*2 - 1].to_s + go[i*2].to_s).to_i(16);
		end

		if (cl[1] < 40) && (cl[2] < 40) && (cl[3] < 40)
			endString = "#FFFFFF"
		elsif  (cl[1] < 200) && (cl[2] < 200) && (cl[3] < 200)
			endString = go + "; color: #FFFFFF"
		else
			endString = go
		end			

		return endString
	end

	def get_active_button
		buttons_order = ['show', 'speakers', 'schedule', 'location', 'report']
		index = buttons_order.index(params[:action])
		buttons_class = ['','','','','']
		buttons_class[index] = 'active'
		buttons_class
	end
end

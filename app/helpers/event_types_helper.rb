module EventTypesHelper
	GLYPHS = %w(list fire leaf music user asterisk plus minus cloud envelope pencil glass search heart 
		star star-empty th th-large th-list ok remove cog trash home file time road download 
		download-alt upload inbox repeat refresh lock qrcode barcode tag tags bookmark picture 
		map-marker move play stop plus-sign minus-sign remove-sign ok-sign question-sign info-sign 
		remove-circle ok-circle ban-circle gift eye-open calendar random comment magnet hdd bell 
		bullhorn)
	require 'json'

	def classImage(imageNumber)
		return "-#{GLYPHS[imageNumber.to_i]}"
	end

	def takeGLYPHS()
		return GLYPHS
	end

	def speakerEventCheck(check)
		if check == 1  then
			return '-ok'			
		end
	end

	def durationMake(hour, minute)
		return hour.to_i + minute.to_i
	end

	def durationReturn(duration)
		if (duration.hour.to_i > 0) then
			return duration.hour.to_s + 'hr ' + duration.min.to_s + 'min'
		else
			return duration.min.to_s + 'min'
		end
	end
end

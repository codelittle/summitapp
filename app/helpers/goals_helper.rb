module GoalsHelper
	def check(day)
		if @goal.frequency
			day.in?(@goal.frequency)
		else
			true
		end
	end
end

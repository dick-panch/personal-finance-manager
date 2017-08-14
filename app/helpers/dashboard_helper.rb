module DashboardHelper
	def compare_with_previous(current, previous)
		difference = current - previous
		return (difference * 100 / current).to_f.round(2)
	end
end

module DashboardHelper
	def compare_with_previous(current, previous)
		difference = current - previous
		return (difference * 100 / current).to_f.round(2)
	end

	def chart_colors(number)
		current = ['#D6DBDF', '#AEB6BF', '#85929E', '#5D6D7E', '#34495E', '#2E4053', '#1B2631', '#1B2631']
		current += current[0..6].reverse
		return current[0..number]
	end

	def category_type_label(label)
		case label
		when 'income'
			return 'primary'
		when 'expense'
			return 'danger'
		when 'investment'
			return 'default'
		end
	end
end

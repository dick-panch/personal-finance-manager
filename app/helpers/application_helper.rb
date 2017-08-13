module ApplicationHelper
	def money_format(amount, currency=nil)
		currency = '$' if currency.nil?
		"#{currency} #{amount}"
	end
end

module ApplicationHelper
	def money_format(amount=nil, currency=nil)\
		amount = 0.0 unless amount.present?
		currency = '₹' if currency.nil?
		"#{currency} #{amount}"
	end
end

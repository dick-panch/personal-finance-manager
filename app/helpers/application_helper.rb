include ActionView::Helpers::NumberHelper
module ApplicationHelper
	def money_format(amount=nil, currency=nil)\
		amount = 0.0 unless amount.present?
		currency = '₹' if currency.nil?
		if amount.negative?
			return "#{currency}(#{number_with_delimiter(amount,delimiter_pattern: /(\d+?)(?=(\d\d)+(\d)(?!\d))/ )})"
		else
			return "#{currency}#{number_with_delimiter(amount,delimiter_pattern: /(\d+?)(?=(\d\d)+(\d)(?!\d))/ )}"
		end
	end
end

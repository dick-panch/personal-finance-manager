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

  def display_error_messages(errors, fields=[])
    error_message = []
    fields.each do |field|
      name = field.to_s.split(".").last
      errors.messages[field].each { |error| error_message << "#{name.to_s.humanize} #{error}" } if errors.messages[field]
    end
    if error_message.size > 1
      (error_message.empty?)? '' : "#{error_message.first}"
    else
      (error_message.empty?)? '' : "#{error_message.join(', ')}"
    end
  end

end

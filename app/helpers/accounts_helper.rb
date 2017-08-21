module AccountsHelper
	def rupee_sign(text='')
		if text.present?
			"#{text} ( <i class='fa fa-inr' aria-hidden='true'></i> )".html_safe
		else
			"<i class='fa fa-inr' aria-hidden='true'></i>".html_safe
		end		
	end

	def total_expenses_or_income(data=nil)
		data.present? ? data.values.flatten.map{|t| t.amount}.sum : 0.0
	end

	def display_profit_and_loss_amount(incomes=0, expenses=0)
		total_income 		= total_expenses_or_income(incomes)
		total_expenses 	= total_expenses_or_income(expenses)
		diff 						= profit_or_loss_amount(total_income, total_expenses)
		return diff.positive? ? diff.round(2) : "(#{diff.round(2)})"
	end

	def profit_or_loss_amount(income=0, expenses=0)
		return (income - expenses).round(1)
	end

	def display_header_for_profit_and_loss_statement(params)
		case params[:period_type].to_s
		when 'monthly'
			return "For the month of #{Date::MONTHNAMES[params[:month].to_i]} #{params[:year]}"
		when 'yearly'
			return "For the year #{params[:year]}"
		when 'quarterly'
			return "For the #{params[:quarter].to_i.ordinalize} Quarter of #{params[:year]}"
		when 'custom'
			return "For the date of #{params[:daterange]}"
		else
		end		
	end
end

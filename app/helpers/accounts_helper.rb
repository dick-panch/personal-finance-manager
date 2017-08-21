module AccountsHelper
	def rupee_sign(text='')
		if text.present?
			"#{text} ( <i class='fa fa-inr' aria-hidden='true'></i> )".html_safe
		else
			"<i class='fa fa-inr' aria-hidden='true'></i>".html_safe
		end		
	end

	def total_income(incomes=nil)
		incomes.present? ? incomes.map{|t| t.amount}.sum : 0.0
	end

	def total_expenses(expenses=nil)
		expenses.present? ? expenses.values.flatten.map{|t| t.amount}.sum : 0.0
	end

	def display_profit_and_loss_amount(incomes=0, expenses=0)
		total_income = total_income(incomes)
		total_expenses = total_expenses(expenses)
		diff = profit_or_loss_amount(total_income, total_expenses)
		return diff.positive? ? diff.round(2) : "(#{diff.round(2)})"
	end

	def profit_or_loss_amount(income=0, expenses=0)
		return (income - expenses).round(1)
	end
end

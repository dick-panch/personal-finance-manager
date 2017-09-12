module BudgetsHelper
	def budget_amount_or_percent_detail(budget, user)		
		if budget.amount > 0
			"₹#{budget.category_total_amount } / ₹#{budget.amount}"
		elsif budget.percent_of_income > 0
			total_income = total_income(user, budget)
			bpoi 		= (total_income*budget.percent_of_income/100).to_f.round(1)
			pending = (budget.category_total_amount*100/bpoi).to_f.round(1) rescue 0.0
			"₹#{budget.category_total_amount} / ₹#{bpoi}"
		else
			"0 / 0"
		end
	end

	def budget_percent_graph(budget, user)
		if budget.amount > 0
			amt = (budget.category_total_amount * 100 / budget.amount).to_i
			return [amt, 100 - amt]
		elsif budget.percent_of_income > 0
			total_income = total_income(user, budget)
			bpoi 		= (total_income*budget.percent_of_income/100).to_f.round(1).to_i
			pending = (budget.category_total_amount*100/bpoi).to_f.round(1).to_i rescue 0.0
			return [pending, 100 - pending]			
		else
			return [0, 100 - 0]
		end
	end

	def total_income(user, budget)
		user.transactions.incomes.where("month = ? and year = ?", budget.month, budget.year).map{|t| t.amount}.sum.to_f.round(1)
	end
end

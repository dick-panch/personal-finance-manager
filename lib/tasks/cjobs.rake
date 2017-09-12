namespace :cjobs do
  desc "EMI Expenses or income"
  task repeat_income_and_expenses: :environment do  ## rake cjobs:repeat_income_and_expenses
  	User.all.each do |user|
  		if user.transactions.present?
  			# Finding transactions that are is_repeat true.
  			# This is automatically create transaction in the system so user do not need to add again
  			transactions = user.transactions.where("transaction_date = ? AND is_repeat = ?", (Date.today - 1.month).to_date, 1)
  			if transactions.present?
  				transactions.each do |transaction|
  					new_transaction = transaction.dup
  					new_transaction.transaction_date = Time.zone.now.to_date
  					new_transaction.save
  				end
  			end
  		end
  	end
	end

  desc 'CREATE BUDGET FOR NEW MONTH'
  task create_budget_for_current_month: :environment do ## rake cjobs:create_budget_for_current_month
    User.all.each do |user|
      categories = Category.where('user_id IS NULL or user_id = ?', user.id).order('name ASC')
      categories.each do |category|
        
        budget = category.budgets.find_by(user_id: user.id, month: Date.today.month, year: Date.today.year)

        # Create budget for current month
        category.budgets.find_or_create_by({
          user_id: user.id,
          month: Date.today.month,
          year: Date.today.year          
        })

        if budget.present?
          # Create budget for next month
          if Date.today == Date.today.end_of_month
            category.budgets.find_or_create_by({
              user_id: user.id,
              month: Date.today.next_month.month,
              year: Date.today.next_month.year,
              recursive: budget.recursive,
              amount: budget.recursive? ? budget.amount : 0.0,
              percent_of_income: budget.recursive? ? budget.percent_of_income : 0.0
            })
          end
        end
      end
    end
  end

end
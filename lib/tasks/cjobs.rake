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
end
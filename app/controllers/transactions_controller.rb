## Transactions Controller
class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_user_id_to_gon

	expose :transactions, ->{ current_user.transactions.search(params).order('transaction_date DESC') }
	expose :transaction, find_by: :slug
	expose :income_categories, -> { find_categories(2) }
	expose :expense_categories, -> { find_categories(1) }
	expose :investment_categories, -> { find_categories(3) }
	expose :type, -> { find_transaction_type }

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Transactions', :transactions_url, title: 'Back to the transactions'

	def create
		transaction = current_user.transactions.build(transaction_params)
		if transaction.save
			redirect_to transactions_url, notice: 'Successfully created your transaction'
		else
			render :new
		end
	end

	def update
		if transaction.update(transaction_params)
			redirect_to transactions_url, notice: 'Successfully updated your transaction'
		else
			render :edit
		end
	end

	def destroy
		transaction.destroy
		redirect_to transactions_url, notice: 'Successfully deleted your transaction'
	end

	def monthly_expenses
		add_breadcrumb 'Monthly Expenses'
	end

	def monthly_incomes
		add_breadcrumb 'Monthly Incomes'
	end

	def monthly_investments
		add_breadcrumb 'Monthly Investments'
	end

	def yearly_expenses
		add_breadcrumb 'Yearly Expenses'
		yearly_income_expense_investment(1, params[:year])
	end

	def yearly_incomes
		add_breadcrumb 'Yearly Incomes'
		yearly_income_expense_investment(2, params[:year])
	end

	def yearly_investments
		add_breadcrumb 'Yearly Investments'
		yearly_income_expense_investment(3, params[:year])
	end

	def import
		result = Transaction.import(params[:transaction]['file'], current_user)
		redirect_to dashboard_url, flash: result
	end

	private

	def set_current_user_id_to_gon
		gon.current_user_id = current_user.id
	end

	def transaction_params
		params.require(:transaction).permit(:description, :is_received, :transaction_date, :amount, :is_paid, :is_favorite, :category_id, :payment_type_id, :is_repeat, :transaction_type_id, :user_id, :attachment)
	end

	def find_transaction_type
		type = params[:type].present? ? params[:type].downcase : ''
		if type == 'income' || transaction.type_id == 2
			return 'income'
		elsif type == 'expense' || transaction.type_id == 1
			return 'expense'
		else
			return 'investment'
		end
	end

	def find_categories(type_id)
		Category.where('(user_id IS NULL and category_type_id = ?) or (user_id = ? and category_type_id = ?)', type_id, current_user.id, type_id)
	end

	def yearly_income_expense_investment(id, year)
		report = YearlyExpensesAndIncomes.new(current_user, id, year)
		report.exec
    report.send('get_instance_variable'.to_sym).each do |_k, _v|
      instance_variable_set("@#{_k}", _v)
    end
	end
end

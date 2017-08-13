class TransactionsController < ApplicationController
	before_action :authenticate_user!

	expose :transactions, ->{ current_user.transactions.search(params) }
	expose :transaction, find_by: :slug
	expose :income_categories, -> { Category.where('(user_id IS NULL and category_type_id = ?) or user_id = ?', 2, current_user.id) }
	expose :expense_categories, -> { Category.where('(user_id IS NULL and category_type_id = ?) or user_id = ?', 1, current_user.id) }
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

	private

	def transaction_params
		params.require(:transaction).permit(:description, :is_received, :transaction_date, :amount, :is_paid, :is_favorite, :category_id, :payment_type_id, :is_repeat, :transaction_type_id, :user_id)
	end

	def find_transaction_type		
		if params[:type].present? && params[:type].downcase == 'income' || transaction.transaction_type_id == 2
			return 'income'
		else
			return 'expense'
		end
	end
end

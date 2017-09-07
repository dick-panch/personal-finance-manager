class CalendarsController < ApplicationController
	before_action :authenticate_user!

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Calendar', :calendars_url, title: 'Back to the calendar'

	def fetchAllTransactions
		transactions = current_user.transactions
		render json: transactions, each_serializer: TransactionSerializer
	end
end

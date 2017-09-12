class BudgetsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_budget, only: [:edit, :update]

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Budgets', :budgets_url	

	def index
		report = BudgetService.new(current_user, params)
		report.exec
    report.send('get_instance_variable'.to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end
	end

	def edit		
		respond_to do |format|
			format.html{ redirect_to budgets_url, flash: {error: 'Invalid Route !'}}
			format.js
		end
	end

	def update
		@budget.update(budget_params)
		respond_to do |format|
			format.html{ redirect_to budgets_url, flash: {notice: 'Successfully update your budget. '}}
			format.js
		end
	end

	private

	def budget_params
		params.require(:budget).permit(:amount, :percent_of_income, :recursive)
	end

	def find_budget
		@budget = current_user.budgets.find_by(id: params[:id])
	end
end

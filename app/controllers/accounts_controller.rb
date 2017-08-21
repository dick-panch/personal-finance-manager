class AccountsController < ApplicationController
	before_action :authenticate_user!
	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Accounts', :profit_and_loss_accounts_url

	def profit_and_loss
		add_breadcrumb 'Profit and Loss'
		params[:period_type] = 'monthly'		
		@profit_and_loss = ProfitAndLossAccount.new(current_user, params)
		@profit_and_loss.exec
    @profit_and_loss.send("get_instance_variable_for_#{params[:period_type].downcase}".to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end				
	end

	def balance_sheet
		add_breadcrumb 'Balance Sheet'
	end
end

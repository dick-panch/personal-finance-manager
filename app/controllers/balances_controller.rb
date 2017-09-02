class BalancesController < ApplicationController
	before_action :authenticate_user!

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Balances', :balances_url

	def index
		params[:year] = Date.today.year unless params[:year].present?
		report = BalanceReport.new(current_user, params[:year])
		report.exec
    report.send('get_instance_variable'.to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end
	end

end

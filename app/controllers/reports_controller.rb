class ReportsController < ApplicationController
	before_action :authenticate_user!

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'	
	add_breadcrumb 'Reports', :reports_url, title: 'Back to the reports page'

	def index
		report = ReportService.new(current_user)
		report.exec
    report.send('get_instance_variable'.to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end

    logger.warn("===@incomes====#{@incomes.inspect}===================")

    gon.incomes = @incomes.values
    gon.expenses = @expenses.values
		logger.warn("===@expenses====#{@expenses.inspect}===================")    
	end

end

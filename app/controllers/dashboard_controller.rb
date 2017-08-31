class DashboardController < ApplicationController
	before_action :authenticate_user!
	include DashboardHelper
	def index
		report = DashboardReport.new(current_user)
		report.exec
    report.send('get_instance_variable'.to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end

    gon.expenses_categories_list = @category_expenses_for_current_month.map{|t| t['category']}
    gon.percent_of_expenses_categories = @category_expenses_for_current_month.map{|t| t['percent']}
    
    gon.background_colors = chart_colors(@category_expenses_for_current_month.length)

    gon.incomes_categories_list = @category_incomes_for_current_month.map{|t| t['category']}
    gon.percent_of_incomes_categories = @category_incomes_for_current_month.map{|t| t['percent']}

    gon.investments_categories_list = @category_investment_for_current_month.present? ? @category_investment_for_current_month.map{|t| t['category']} : {}
    gon.percent_of_investment_categories = @category_investment_for_current_month.present? ? @category_investment_for_current_month.map{|t| t['percent']} : {}
	end
end
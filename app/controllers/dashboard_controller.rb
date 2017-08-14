class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		report = DashboardReport.new(current_user)
		report.exec
    report.send('get_instance_variable'.to_sym).each do |k, v|
      instance_variable_set("@#{k}", v)
    end		
	end
end
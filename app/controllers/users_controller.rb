## Users Controller
class UsersController < ApplicationController
	before_action :authenticate_user!	

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	
	def edit
		add_breadcrumb 'Setting'
	end

	def update
		if current_user.update(user_params)
			redirect_to dashboard_url, notice: 'Successfully updated your setting.'
		else
			render :edit
		end		
	end

	private

	def user_params
		params.require(:user).permit(setting_attributes: [:financial_year])
	end
end

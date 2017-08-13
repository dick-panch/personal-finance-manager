class AdminController < ApplicationController
	before_action :admin_authority
	before_action :authenticate_user!

	private

	def admin_authority
		unless current_user.is_admin?
			redirect_to dashboard_path, flash: {info: 'You are not authorize person to access this.'}
		end
	end
end

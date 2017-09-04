## Welcome Controller
class WelcomeController < ApplicationController
	layout 'welcome'
	
	def index
		@user = User.new
	end
	
end

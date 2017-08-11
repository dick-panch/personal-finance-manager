class Api::UsersController < ApplicationController
	def existUsername		
		user = User.exists?(username: params[:user][:username])		
  	render json: !user
	end

	def existEmail
		user = User.exists?(email: params[:user][:email])
  	render json: !user		
	end

	def notExistEmail
		user = User.exists?(email: params[:user][:email])
  	render json: user		
	end

end

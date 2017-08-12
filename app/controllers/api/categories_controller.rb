class Api::CategoriesController < ApplicationController
	def existCategory
		if current_user.is_admin?
			category = Category.exists?(name: params[:category][:name])
		else
			category = current_user.categories.exists?(name: params[:category][:name])
			if !category
				category = Category.exists?(name: params[:category][:name])
			end
		end
  	render json: !category
	end
end

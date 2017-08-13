class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :unauthorize_access, only: [:edit, :update, :destroy, :show]

	expose :categories, ->{ Category.where('user_id IS NULL or user_id = ?', current_user.id) }
	expose :category, find_by: :slug

	add_breadcrumb 'Home', :dashboard_url, title: 'Back to Dashboard Page'
	add_breadcrumb 'Categories', :categories_url, title: 'Back to the categories'

	def create
		category = current_user.categories.build(category_params)
		if category.save
			redirect_to categories_url, notice: 'Successfully created category'
		else
			render :new
		end
	end

	def update
		if category.update(category_params)
			redirect_to categories_url, notice: 'Successfully updated category'
		else
			render :edit
		end
	end

	def destroy
		category.destroy
		redirect_to categories_url, notice: 'Successfully destroyed category'
	end

	private

	def category_params
		params.require(:category).permit(:name, :user_id, :category_type_id)
	end

	def unauthorize_access
		if !category.user_id?
			redirect_to categories_url, flash: {info: 'Require admin access to perform this action !'}
		end
	end
end

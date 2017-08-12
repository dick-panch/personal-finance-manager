class Admin::CategoriesController < AdminController
	expose :categories, ->{ Category.where('user_id IS NULL') }
	expose :category, find_by: :slug

	add_breadcrumb 'Home', :dashboard_path, title: 'Back to Dashboard Page'
	add_breadcrumb 'Categories', :admin_categories_url, title: 'Back to the categories'

	def create
		if category.save
			redirect_to admin_categories_path, notice: 'Successfully created category'
		else
			render :new
		end
	end

	def update
		if category.update(category_params)
			redirect_to admin_categories_path, notice: 'Successfully updated category'
		else
			render :edit
		end
	end

	def destroy
		category.destroy
		redirect_to admin_categories_path, notice: 'Successfully destroyed category'
	end

	private

	def category_params
		params.require(:category).permit(:name, :user_id, :category_type_id)
	end
end

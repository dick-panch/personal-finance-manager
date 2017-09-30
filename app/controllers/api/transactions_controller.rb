class Api::TransactionsController < ApplicationController
	def get_transaction_description
		user = User.find_by(id: params[:id])
		if user
			transactions = user.transactions.where('description LIKE (?)', "%#{params[:q]}%").select('description').map(&:description).uniq.to_json
		else
			transactions = []
		end
		render json: transactions, status: 200
	end
end

module TransactionsHelper
	def list_period_type
		[
			['Monthly', 'monthly'],
      ['Quarterly', 'quarterly'],
      ['Yearly', 'yearly'],
      ['Custom', 'custom']
   	]
	end
end

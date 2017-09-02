module TransactionsHelper
	def list_period_type
		[
			['Monthly', 'monthly'],
      ['Quarterly', 'quarterly'],
      ['Yearly', 'yearly'],
      ['Custom', 'custom']
   	]
	end

	def list_month
		[
	    [Date::MONTHNAMES[1], 1],
	    [Date::MONTHNAMES[2], 2],
	    [Date::MONTHNAMES[3], 3],
	    [Date::MONTHNAMES[4], 4],
	    [Date::MONTHNAMES[5], 5],
	    [Date::MONTHNAMES[6], 6],
	    [Date::MONTHNAMES[7], 7],
	    [Date::MONTHNAMES[8], 8],
	    [Date::MONTHNAMES[9], 9],
	    [Date::MONTHNAMES[10], 10],
	    [Date::MONTHNAMES[11], 11],
	    [Date::MONTHNAMES[12], 12],
	  ]
	end

	def list_quarter
		[
      ['1st Quater', 1],
      ['2nd Quater', 2],
      ['3rd Quater', 3],
      ['4th Quater', 4]
    ]
	end

end

$('.datepicker').datepicker({
  todayBtn: "linked",
  keyboardNavigation: false,
  forceParse: false,
  calendarWeeks: true,
  autoclose: true,
  format: 'dd/mm/yyyy'
});

$('.chosen-select').chosen({width: "100%"});

// Validation
$("#new_transaction").validate({
	rules: {
		'transaction[description]': {
			required: true
		},		
		'transaction[transaction_date]': {
			required: true,			
		},
		'transaction[amount]': {
			required: true,
			number: true			
		}	
	},
	messages: {
		'transaction[description]': {
			required: "can't be blank"
		},
		'transaction[transaction_date]': {
			required: "can't be blank",
		},
		'transaction[amount]': {
			required: "can't be blank",			
		}
	}	
})
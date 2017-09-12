// For Loader
$('#budget_amount').on('keypress, change, keyup', function() {
	$("#budget_percent_of_income").val('0.0')
})

$('#budget_percent_of_income').on('keypress, change, keyup', function() {
	$("#budget_amount").val('0.0')
})	

$(".budget-popup-form").validate({
	rules: {
		'budget[amount]': {
			number: true
		},		
		'budget[percent_of_income]': {
			number: true,			
		}	
	}	
})

$('.i-checks').iCheck({
  checkboxClass: 'icheckbox_square-green',
  radioClass: 'iradio_square-green',
});

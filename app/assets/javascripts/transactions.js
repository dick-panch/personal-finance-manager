$('.datepicker').datepicker({
  todayBtn: "linked",
  keyboardNavigation: false,
  forceParse: false,
  calendarWeeks: true,
  autoclose: true,
  format: 'dd/mm/yyyy'
});

$('.chosen-select').chosen({
	no_results_text: 'No results matched',
  width: '100%'
});

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

// List Transaction with Previous Month or year
$("#date_month").change(function(event){
	var month = $(this).val();
	var year = $("#date_year").val();
	window.location.href = '/transactions?month='+month+'&year='+year
})
$("#date_year").change(function(event){
	var year = $(this).val();
	var month = $("#date_month").val();
	window.location.href = '/transactions?year='+year+'&month='+month
})

$("#type_id").change(function(event){
	var year = $("#date_year").val();
	var month = $("#date_month").val();
	var type_id = $(this).val();
	window.location.href = '/transactions?year='+year+'&month='+month+'&type_id='+type_id
})

// For Loader
$(document).ready(function() {
	$('.loader-display').on('click', function() {
		$('.loader-overlay').addClass('in').show();
		$('.loader-shell').css('height', '100vh');
	})

	$('.loader-display-change').on('change', function() {
		$('.loader-overlay').addClass('in').show();
		$('.loader-shell').css('height', '100vh');
	})

});
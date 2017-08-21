$("#profit_and_loss_statement_period_type").change(function(event){
	period_type = $(this).val();
	switch (period_type){
		case 'monthly':
			$(".profit-and-loss-statement-month").removeClass('hide');
			$(".profit-and-loss-statement-quarter").addClass('hide');
			$(".profit-and-loss-statement-daterange").addClass('hide');
			$(".profit-and-loss-statement-year").removeClass('hide');
			break;
		case 'yearly':
			$(".profit-and-loss-statement-month").addClass('hide');
			$(".profit-and-loss-statement-quarter").addClass('hide');
			$(".profit-and-loss-statement-daterange").addClass('hide');
			$(".profit-and-loss-statement-year").removeClass('hide');
			break;
		case 'quarterly':
			$(".profit-and-loss-statement-month").addClass('hide');
			$(".profit-and-loss-statement-quarter").removeClass('hide');
			$(".profit-and-loss-statement-daterange").addClass('hide');
			$(".profit-and-loss-statement-year").removeClass('hide');			
			break;
		case 'custom':
			$(".profit-and-loss-statement-month").addClass('hide');
			$(".profit-and-loss-statement-quarter").addClass('hide');
			$(".profit-and-loss-statement-daterange").removeClass('hide');
			$(".profit-and-loss-statement-year").addClass('hide');			
			break;
		default:
			$(".profit-and-loss-statement-month").removeClass('hide');
			$(".profit-and-loss-statement-quarter").addClass('hide');
			$(".profit-and-loss-statement-daterange").addClass('hide');
			$(".profit-and-loss-statement-year").removeClass('hide');			
	}
	event.preventDefault();
});

$(function() {
	var start = moment().subtract(29, 'days');
  var end = moment();

  $('input[name="daterange"]').daterangepicker({
  	format: 'DD/MM/YYYY',
  	startDate: start,
    endDate: end,
		locale: {
      format: 'DD/MM/YYYY'
    },    
    ranges: {
     'Today': [moment(), moment()],
     'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
     'Last 7 Days': [moment().subtract(6, 'days'), moment()],
     'Last 30 Days': [moment().subtract(29, 'days'), moment()],
     'This Month': [moment().startOf('month'), moment().endOf('month')],
     'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
    }
  });
});


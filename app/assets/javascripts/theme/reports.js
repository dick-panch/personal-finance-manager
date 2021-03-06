function monthly_pending_balance(){
  var barData = {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [{
      label: "My Savings",
      backgroundColor: 'rgba(26,179,148,0.5)',
      borderColor: "rgba(26,179,148,0.7)",
      pointBackgroundColor: "rgba(26,179,148,1)",
      pointBorderColor: "#fff",
      data: gon.my_balances
    }]
  };

  var barOptions = {
    responsive: true,
    legend: false,
    scales: {
      yAxes: [{
        ticks: {
          callback: function(label, index, labels) {
            return label/1000+'k';
          }
        },
        scaleLabel: {
          display: true,
          labelString: '1k = 1000 (₹)'
        }
      }]
    },    
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return dataset.label + ' ₹' + currentValue;
        }
      }
    }
  };

  var ctx2 = document.getElementById("monthly_pending_balance").getContext("2d");
  new Chart(ctx2, {type: 'bar', data: barData, options:barOptions});  
}
function income_expense_bar_chart(){
  var barData = {
	  labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
  	datasets: [{
    	label: "Income",
      backgroundColor: "rgba(26,179,148,0.5)",
      borderColor: "rgba(26,179,148,0.7)",
      pointBackgroundColor: "rgba(26,179,148,0.9)",
    	data: gon.incomes
  	},
  	{
    	label: "Expense",
      backgroundColor: "rgba(237, 85, 101, 0.5)",
      borderColor: "rgba(237, 85, 101, 0.7)",
      pointBackgroundColor: "rgba(237, 85, 101, 0.9)",
      pointBorderColor: "#fff",
    	data: gon.expenses
  	},{
      label: "Investment",
      backgroundColor: "rgba(220,220,220,0.5)",
      borderColor: "rgba(220,220,220,0.7)",
      pointBackgroundColor: "rgba(220,220,220,0.9)",
      pointBorderColor: "#fff",
      data: gon.investments
    }]
	};

	var barOptions = {
  	responsive: true,
    scales: {
      yAxes: [{
        ticks: {
          callback: function(label, index, labels) {
            return label/1000+'k';
          }
        },
        scaleLabel: {
          display: true,
          labelString: '1k = 1000 (₹)'
        }
      }]
    },    
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return dataset.label + ' ₹' + currentValue;
        }
      }
    }
	};

	var ctx2 = document.getElementById("income_expense_bar_chart").getContext("2d");
	new Chart(ctx2, {type: 'bar', data: barData, options:barOptions});
}
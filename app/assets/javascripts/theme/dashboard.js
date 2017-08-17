function monthly_income_expense_graph(income_data, expense_data){
  var lineData = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
    datasets: [
      {
        label: "Expense",
        backgroundColor: "rgba(26,179,148,0.5)",
        borderColor: "rgba(26,179,148,0.7)",
        pointBackgroundColor: "rgba(26,179,148,1)",
        pointBorderColor: "#fff",
        data: expense_data
      },
      {
        label: "Income",
        backgroundColor: "rgba(220,220,220,0.5)",
        borderColor: "rgba(220,220,220,1)",
        pointBackgroundColor: "rgba(220,220,220,1)",
        pointBorderColor: "#fff",
        data: income_data
      }
    ]
  };
  var lineOptions = { 
    responsive: true,
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return dataset.label + ' ₹ ' + currentValue;
        }
      }
    }          

  };
  var ctx = document.getElementById("monthlyIncomeExpenseChart").getContext("2d");
  new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});
}

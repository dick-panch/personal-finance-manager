function monthly_income_expense_graph(income_data, expense_data, investment_data){
  var lineData = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
    datasets: [
      {
        label: "Income",
        backgroundColor: "rgba(26,179,148,0.1)",
        borderColor: "rgba(26,179,148,0.3)",
        pointBackgroundColor: "rgba(26,179,148,0.5)",
        pointBorderColor: "#fff",
        data: income_data
      },
      {
        label: "Expense",
        backgroundColor: "rgba(237, 85, 101, 0.3)",
        borderColor: "rgba(237, 85, 101, 0.7)",
        pointBackgroundColor: "rgba(237, 85, 101, 0.9)",
        pointBorderColor: "#fff",
        data: expense_data
      },
      {
        label: "Investment",
        backgroundColor: "rgba(220,220,220,0.5)",
        borderColor: "rgba(220,220,220,0.7)",
        pointBackgroundColor: "rgba(220,220,220,0.9)",
        pointBorderColor: "#fff",
        data: investment_data
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

function categorize_monthly_investments_chart(){
  var doughnutData = {
    labels: gon.investments_categories_list,
    datasets: [{
      data: gon.percent_of_investment_categories,
      backgroundColor: gon.background_colors
    }],                
  } ;
  var doughnutOptions = {
    responsive: true,
    legend: false,
    animation: {
        animateScale: true,
        animateRotate: true
    },
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return label + ' ' + currentValue + '%';
        }
      }
    }          

  };
  var ctx4 = document.getElementById("categorize_monthly_investments_chart").getContext("2d");
  ctx4.canvas.width = 100;              
  new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});  
}

function categorize_monthly_expenses_chart(){
  var doughnutData = {
    labels: gon.expenses_categories_list,
    datasets: [{
      data: gon.percent_of_expenses_categories,
      backgroundColor: gon.background_colors
    }],                
  } ;
  var doughnutOptions = {
    responsive: true,
    legend: false,
    animation: {
        animateScale: true,
        animateRotate: true
    },
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return label + ' ' + currentValue + '%';
        }
      }
    }          

  };
  var ctx4 = document.getElementById("categorize_monthly_expenses_chart").getContext("2d");
  ctx4.canvas.width = 100;              
  new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});  
}

function categorize_monthly_incomes_chart(){
  var doughnutData = {
    labels: gon.incomes_categories_list,
    datasets: [{
      data: gon.percent_of_incomes_categories,
      backgroundColor: gon.background_colors
    }],                
  } ;
  var doughnutOptions = {
    responsive: true,
    legend: false,
    animation: {
        animateScale: true,
        animateRotate: true
    },
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {          
          var dataset = data.datasets[tooltipItem.datasetIndex];
          var currentValue = dataset.data[tooltipItem.index];
          var label = data.labels[tooltipItem.index]
          return label + ' ' + currentValue + '%';
        }
      }
    }          

  };
  var ctx4 = document.getElementById("categorize_monthly_incomes_chart").getContext("2d");
  ctx4.canvas.width = 100;              
  new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});  
}
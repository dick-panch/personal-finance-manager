$(document).ready(function() {
  var lineData = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
    datasets: [
      {
        label: "Example dataset",
        backgroundColor: "rgba(26,179,148,0.5)",
        borderColor: "rgba(26,179,148,0.7)",
        pointBackgroundColor: "rgba(26,179,148,1)",
        pointBorderColor: "#fff",
        data: [2800, 4800, 4000, 1900, 8600, 2700, 9000, 4000, 1900, 8600, 2700, 9000]
      },
      {
        label: "Example dataset",
        backgroundColor: "rgba(220,220,220,0.5)",
        borderColor: "rgba(220,220,220,1)",
        pointBackgroundColor: "rgba(220,220,220,1)",
        pointBorderColor: "#fff",
        data: [6500, 5900, 8000, 8100, 5600, 5500, 4000, 8000, 8100, 5600, 5500, 4000]
      }
    ]
  };
  var lineOptions = {
    responsive: true
  };

  var ctx = document.getElementById("lineChart2").getContext("2d");
  new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});

});


$(document).ready(function() {
  var data1 = [
    [0,4],[1,8],[2,5],[3,10],[4,4],[5,16],[6,5],[7,11],[8,6],[9,11],[10,30],[11,10],[12,13],[13,4],[14,3],[15,3],[16,6]
  ];
  var data2 = [
    [0,1],[1,0],[2,2],[3,0],[4,1],[5,3],[6,1],[7,5],[8,2],[9,3],[10,2],[11,1],[12,0],[13,2],[14,8],[15,0],[16,0]
  ];
  $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
    data1, data2
  ],
  {
    series: {
      lines: {
        show: false,
        fill: true
      },
      splines: {
        show: true,
        tension: 0.4,
        lineWidth: 1,
        fill: 0.4
      },
      points: {
        radius: 0,
        show: true
      },
      shadowSize: 2
    },
    grid: {
      hoverable: true,
      clickable: true,
      tickColor: "#d5d5d5",
      borderWidth: 1,
      color: '#d5d5d5'
    },
    colors: ["#1ab394", "#1C84C6"],
    xaxis:{},
    yaxis: {
      ticks: 4
    },
    tooltip: true
  });
  
  var doughnutData = {
    labels: ["App","Software","Laptop" ],
    datasets: [{
      data: [300,50,100],
      backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
    }]
  };

  var doughnutOptions = {
    responsive: false,
    legend: {
      display: false
    }
  };

  var ctx4 = document.getElementById("doughnutChart")
  if(ctx4 != undefined){
    var ctx4 = ctx4.getContext("2d");
    new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});
  }
  
  var doughnutData = {
    labels: ["App","Software","Laptop" ],
    datasets: [{
      data: [70,27,85],
      backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
    }]
  };

  var doughnutOptions = {
    responsive: false,
    legend: {
      display: false
    }
  };

  var ctx4 = document.getElementById("doughnutChart2")
  if(ctx4 != undefined){
    var ctx4 = ctx4.getContext("2d");
    new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});
  }
});

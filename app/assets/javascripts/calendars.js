$(document).ready(function(){
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: ''
    },
    editable: false,
    droppable: false,
    events: {
      url: 'http://wallet-management.herokuapp.com/calendar/fetch-all-transactions.json'
    },
    eventRender: function(event, element) {
      var title = '₹' + event.amount + ' - ' + event.title
      element.attr('title', title);
    }

  });
});

// FOr Data Table
$(document).ready(function(){
  $('.dataTables').DataTable({
    pageLength: 25,
    responsive: true,
    dom: '<"html5buttons"B>lTfgitp',
    columnDefs: [ {
      "targets": 'no-sort',
      "orderable": false,
    }],    
    buttons: [
      {extend: 'copy'},
      {
        extend: 'csv',
        exportOptions: {
          columns: "thead th:not(.noExport)"
        }
      },
      {
        extend: 'excel', 
        title: 'PersonalFinanceManager',
        exportOptions: {
          columns: "thead th:not(.noExport)"
        }        
      },
      {
        extend: 'pdf', 
        title: 'PersonalFinanceManager',
        exportOptions: {
          columns: "thead th:not(.noExport)"
        }
      },
      {extend: 'print',
        customize: function (win){
          $(win.document.body).addClass('white-bg');
          $(win.document.body).css('font-size', '10px');
          $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
        }
      }
    ]
  });
});

// For Checkbox
$(document).ready(function () {
  $('.i-checks').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
  });
});


// Form Validation
$("#new_category").validate({
  rules: {
    'category[name]': {
      required: true,
      minlength: 2,      
      remote: {
        type: 'get',
        url: '/existCategory',        
        dataType: 'json'
      }       
    }
  },
  messages: {
    'category[name]': {
      required: "Please enter a category name",
      minlength: "Your category name must consist of at least 2 characters",
      remote: "Category already exist"
    }
  }  
})
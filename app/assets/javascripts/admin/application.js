// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require admin/jquery-3.3.1
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require admin/popper.min
//= require admin/bootstrap.min
//= require admin/bootstrap-switch
//= require admin/bootstrap-notify
//= require admin/light-bootstrap-dashboard
//= require admin/demo
//= require cable
//= require admin/notifications.coffee
//= require admin/bootstrap-datepicker
//= require admin/nouislider.min
//= require admin/jquery.dataTables.min
//= require admin/dataTables.bootstrap4.min
//= require admin/jquery.multicheck
//= require admin/datatable-checkbox-init
//= require admin/statistic
//= require toastr

$(document).ready(function() {
   initDataTable();
   initDataTable1();
   initDataTable2();
} );

function initDataTable(){
  $('#category-table').DataTable({
   "order": []
  });
}

function initDataTable1(){
  $('#zero_config').DataTable()
}

function initDataTable2(){
  $('#table-orders').DataTable()
}

$(document).ready(function() {
  $('#category-table').DataTable();
} );

$(document).ready(function() {
  $('#zero_config').DataTable()
} );
$(document).ready(function() {
  $('#table-orders').DataTable();
} );

$(document).on("change", ".sel", function(e){
  var $self = $(this);
  var previous = $(this).data('value');
  var status = $(this).val();
  var r = confirm("Confirm!!");
  if (r == true) {
    $.ajax({
      url: $(this).closest("div").closest("form").attr("action"),
      method: "PATCH",
      dataType: "json",
      data: {status: status},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
        $self.val(previous);
      },
      success: function (response) {
        console.log(response);
        toastr['info']('Success!');
        $self.attr("data-value", e.target.value);
      }
    });
  } else {
    toastr['warning']('Oops! Order NOT change');
    $(this).val(previous);
  }
});

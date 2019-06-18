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
//= require admin/bootstrap-datepicker
//= require admin/nouislider.min
//= require admin/jquery.dataTables.min
//= require admin/dataTables.bootstrap4.min
//= require admin/jquery.multicheck
//= require admin/datatable-checkbox-init
//= require toastr
$(document).ready(function() {
    $('#category-table').DataTable();
} );
$(document).ready(function() {
  $('#zero_config').DataTable();
} );

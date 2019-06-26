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
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require modernizr-2.8.3.min
//= require jquery-1.12.0.min
//= require popper
//= require bootstrap.min
//= require imagesloaded.pkgd.min
//= require isotope.pkgd.min
//= require ajax-mail
//= require owl.carousel.min
//= require plugins
//= require modernizr.min
//= require activestorage
//= require bootstrap-sprockets
//= require cable
//= require ./channels/notifications_user.coffee
//= require cart
//= require cart_modal
//= require main
//= require toastr
$(document).ready(function()
{
  $("#notification").click(function(event)
  {
    event.stopPropagation();
    $("#notificationContainer").fadeToggle(300);
    $("#notification_count").fadeOut("fast");
  });

$(document).ready(function(){
  $('#show-password-field').click(function(){
      $('#change-password').toggle(500);
  });
});

  $(document).on("click", function()
  {
    $("#notificationContainer").hide();
  });

});

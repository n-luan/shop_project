$(document).on('turbolinks:load', function() {
  $('.submit-cart').on('click', function(e) {
    e.preventDefault();
    $(this).next("input[type='submit']").trigger('click');
  })
});

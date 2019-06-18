$(document).on('click',".submit-cart-modal" ,function(e) {
  e.preventDefault();
  $(this).next("input[type='submit']").trigger('click');
});

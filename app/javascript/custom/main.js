var popString = '';
popString =
  popString +
  "<a href='#' class='btn btn-primary' id ='checkout'>Checkout</a> <a href='#' class='btn btn-primary' id ='clearCart'>Clear Cart</a>";

document.getElementById('example').setAttribute('data-bs-content', popString);

$(document).ready(function () {
  $('[data-bs-toggle="popover"]').popover('show');
});

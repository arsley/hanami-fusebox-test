function add() {
  $('#home').after('<p>Hello FuseBox with jQuery!</p>');
}

$('.btn').on('click', add);

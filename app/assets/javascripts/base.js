$(window).scroll(function() {
  var y = $(window).scrollTop();
  if (y > 250) {
    $("#header").addClass('--not-top fixed-top');
  } else {
    $("#header").removeClass('--not-top fixed-top');
  }
});

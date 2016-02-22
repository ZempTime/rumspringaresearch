$(document).ready(function() {
  function setHeight() {
    windowHeight = $(window).innerHeight();
    $('#content').css('min-height', windowHeight);
  };
  setHeight();

  $(window).resize(function() {
    setHeight();
  });
});

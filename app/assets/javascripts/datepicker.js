$(document).ready(function() {
  console.log("working?")
  $('.daterange').daterangepicker(
    {
    locale: {
      format: 'DD-MM-YYYY'
    },
  });
});

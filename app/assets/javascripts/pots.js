
$(document).on('ready', function() {
  $(".js-pot--friends-picker").imagepicker();

  $('#map').on('click', '.js-pot--select-location', function(e){
    e.preventDefault();
    var locationId = $(this).data('location-id');
    var locationName = $(this).data('location-name');
    $("#pot_location_id").val(locationId);
    $('.js-pot--selected-location').html(locationName);
  });
});

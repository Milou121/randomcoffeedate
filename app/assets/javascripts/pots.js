
$(document).on('ready', function() {
  $(".js-pot--friends-picker").imagepicker();

  $('#toggleAll').on('click',function(){
// click event listener
    if($(this).attr('aria-pressed')=='false'){
    //checks if toggled on or off, any other property can be used
        $('.image-picker').find($('option')).prop("selected", "selected");
        //looks for the image picker option list and sets everything to selected
        $('.image-picker').data('picker').sync_picker_with_select();
        //now triggers the sync function to reinitialise all of the selected images.
    }else{
               //does the exact opposite of above.
        $('.image-picker').find($('option')).prop("selected", false);
        $('.image-picker').data('picker').sync_picker_with_select();
    }
  })


  $('#map').on('click', '.js-pot--select-location', function(e){
    e.preventDefault();

    var locationId = $(this).data('location-id');
    var locationName = $(this).data('location-name');
    $("#pot_location_id").val(locationId);
    $('.js-pot--selected-location').html(locationName);
  });
});




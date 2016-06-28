
$(document).on('ready', function() {
  $(".js-pot--friends-picker").imagepicker({
    selected: function (options) {
      $(".thumbnail.selected img").attr("src", "http://unsplash.it/500/500")
    }
  });


  $('#toggleAll').on('click',function(){
    // click event listener
    $('.thumbnail').addClass("selected");

    if($(this).attr('aria-pressed')=='false'){
      console.log("pressed");

      //checks if toggled on or off, any other property can be used
      $(".js-pot--friends-picker").find($('option')).prop("selected", "selected");
      //looks for the image picker option list and sets everything to selected
      $(".js-pot--friends-picker").data('picker').sync_picker_with_select();
      //now triggers the sync function to reinitialise all of the selected images.
    } else {
      console.log("else");
      //does the exact opposite of above.
      $(".js-pot--friends-picker").find($('option')).prop("selected", false);
      $(".js-pot--friends-picker").data('picker').sync_picker_with_select();
    }
  });

  $('#map').on('click', '.js-pot--select-location', function(e){
    e.preventDefault();

    var locationId = $(this).data('location-id');
    var locationName = $(this).data('location-name');
    $("#pot_location_id").val(locationId);
    $('.js-pot--selected-location').html(locationName);
  });
});



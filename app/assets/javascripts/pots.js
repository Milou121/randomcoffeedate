
$(document).on('ready', function() {
  $(".js-pot--friends-picker").imagepicker();

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

  $(".js-pot--friends-picker").imagepicker({
    selected: function (options) {
      var faceHTML = options.node[0].innerHTML.split('src="')
      // These return Cloudinary URL of correct face & bean
      var faceSRC = faceHTML[1].slice(0, -8)
      var beanSRC =  "http://res.cloudinary.com/dvj9whqch/image/upload/v1467032314/beanbw_i6lu5e.png"
      console.log('options dog', options)

      // returns an array of all images with class thumbnail (all friends)
      // problem: can't grab correct friend img to set SRC back
      // we have the bean SRC and correct face SRC
      // trying to find a way to identify which div should be updated with face SRC
      var image = $(".thumbnail img")
      console.log('peking duck', image)
      if(image.attr('src').indexOf('bean') != -1){
        console.log('god no beans please', $(".thumbnail.selected img"))
        // need to select the one that was clicked on

        // we select the correct image by finding the correct
        // element in the 'select' then using the index to replace
        // the corresponding image
        $(".thumbnail.selected img").attr("src", faceSRC)
      } else {
        console.log('bean me baby',$(".thumbnail img") )
        // need to select the one that was clicked on
        $(".thumbnail.selected img").attr("src", beanSRC)
      }
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



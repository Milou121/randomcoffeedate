$(document).ready(function(){
  loopThing()
  function loopThing() {
    var box1 = $("#box1"),
    box2 = $("#box2"),
    box3 = $("#box3"),
    kick = $("#kick_jump"),
    kickDropDownAnimationDelay = 1500,
    shuffleSpeed = 600,
    nuberOfShuffels = 5,
    z = 0;

    var ans = Math.floor(Math.random() * 3) + 1;


    var kickInitialPosition = 0;
    //Show the character fist
    kick.show();
    // Show the message "Starting the game"

    // Update the initial position based on the answer
    kickInitialPosition = 115 + ((ans - 1) * 280);

    // Move kick Under the relative box based on answer
    kick.css({
      left: kickInitialPosition + "px"
    });

    // Droping kick from the top into the box.
    kick.animate({
      top: "300px"
    }, {
      duration: kickDropDownAnimationDelay,
      specialEasing: {
        top: 'easeOutBounce'
      },
      complete: function() {
        kick.html("<img src='http://res.cloudinary.com/dvj9whqch/image/upload/v1466598929/bean_fbh78s.png' alt='' />");
        kick.animate({
          top: "370px"
        }, {
          duration: 500,
          specialEasing: {
            top: 'easeInQuint'
          },
          complete: function() {


            // Close all the three boxes in a regular interval.
            box1.delay(500).queue(function(n) {
              $(this).html("<img src=http://res.cloudinary.com/dvj9whqch/image/upload/v1466599404/cupdown_oimzdf.png alt='' />");
              if(ans == 1) kick.hide();
              n();
            });
            box2.delay(1000).queue(function(n) {
              $(this).html("<img src='http://res.cloudinary.com/dvj9whqch/image/upload/v1466599404/cupdown_oimzdf.png' alt='' />");
              if(ans == 2) kick.hide();
              n();
            });
            box3.delay(1500).queue(function(n) {
              $(this).html("<img src='http://res.cloudinary.com/dvj9whqch/image/upload/v1466599404/cupdown_oimzdf.png' alt='' />");
              if(ans == 3) kick.hide();


              var box1_left = box1.position().left,
              box2_left = box2.position().left,
              box3_left = box3.position().left,
              box_top = box3.position().top;

              box1.css({
                position: "absolute",
                top: box_top + "px",
                left: box1_left + "px"
              });

              box2.css({
                position: "absolute",
                top: box_top + "px",
                left: box2_left + "px"
              });

              box3.css({
                position: "absolute",
                top: box_top + "px",
                left: box3_left + "px"
              });

              shuffle = function(o) { //v1.0
                for(var j, x, i = o.length; i; j = parseInt(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
                  return o;
              };

              var interval = setInterval(function() {



                var array = shuffle([1, 2, 3]);

                $("#box" + array[0]).animate({
                  left: $("#box" + array[1]).position().left + "px"
                }, {
                  duration: shuffleSpeed / 2,
                  specialEasing: {
                    left: 'easeInQuint'
                  }
                });

                $("#box" + array[1]).animate({
                  left: $("#box" + array[0]).position().left + "px"
                }, {
                  duration: shuffleSpeed / 2,
                  specialEasing: {
                    left: 'easeInQuint'
                  }
                });


              }, shuffleSpeed);
              $("#box1").html('<img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');
              $("#box1").append(' <img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');

              $("#box2").html('<img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');
              $("#box2").append(' <img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');

              $("#box3").html('<img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');
              $("#box3").append(' <img src="http://res.cloudinary.com/dvj9whqch/image/upload/v1466603046/cupwha_yk6jgx.png" alt="">');

              setTimeout(function() {
                nuberOfShuffels * shuffleSpeed});
              n();
            });
          }
        });
      }
    });
  }
});

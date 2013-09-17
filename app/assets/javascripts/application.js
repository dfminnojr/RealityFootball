// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require angular
//= require angular-resource
//= require jquery_ujs
//= require app
//= require_tree ./angular

$(document).ready(function(){
  var timeout 
    var last_quarter = 0;
    timeout = setTimeout(postSomething, 5000);

  // $('.engine').click(function(){
  //   var last_quarter = 0;
  //   timeout = setTimeout(postSomething, 5000);
    
  // });

  // $('.stop_engine').click(function(){
  //   clearTimeout(timeout);
  //   console.log('stopped');
  // });

  function postSomething(){
    // var quarter;
    // var teams = [];
    // $.ajax({
    //     type: "GET",
    //     url: "/boxscore.xml",
    //     dataType: "xml",
    //     success: function(xml) {
    //       $(xml).find('game').each(function(){
    //         quarter = $(this).attr("quarter");
    //         status = $(this).attr("status");
    //       })
    //       console.log("Success!");
    //       if(quarter == 1 && quarter > last_quarter){

    //         $('.live_quarterly_question1').show();
    //         last_quarter = quarter;
    //       }

    //       if(quarter == 2 && quarter > last_quarter){

    //         $('.live_quarterly_question2').show();
    //         last_quarter = quarter;
    //       }


    //       if(quarter == 3 && quarter > last_quarter){

    //         $('.live_quarterly_question3').show();
    //         last_quarter = quarter;
    //       }
          

    //       if(quarter == 4 && quarter > last_quarter){
    //         last_quarter = 5;
    //         $('.live_quarterly_question4').show();
            
    //       }
          
          
    //     }
    // });
    // setTimeout(hideQuestion, 60000);
    // setTimeout(postSomething, 27000);
  }

  function hideQuestion(){
    $('.live_quarterly_question').hide();
  }



  $( "#accordion" ).accordion({ collapsible: true, header: "h5", active: false  });
  $( "#accordion_two" ).accordion({ collapsible: true, header: "h5", active: false  });

  $('#two').click(function(){
    $('#two').css('opacity', '1', 'box-shadow', '0px 1px 4px grey');
     $('#one').css('opacity', '0.5', 'box-shadow', '0px 0px 0px grey');
    $('#user_active_wagers').hide();
    $('#user_completed_wagers').show();
  });

  $('#one').click(function(){
    $('#one').css('opacity', '1', 'box-shadow', '0px 1px 4px grey');
    $('#two').css('opacity', '0.5', 'box-shadow', '0px 0px 0px grey');
    $('#user_completed_wagers').hide();
    $('#user_active_wagers').show();
  });

  $('#camera_icon').click(function(){
    $('#pic_upload').toggle(1);
  });


  $('.pre_game_divider').click(function(){
    $('#pre-game_bet').slideToggle("slow");
    $('#wager_warning').toggle("fast");
  });




  var user_points = $('.current_user_points').text();

  $( ".slider" ).slider({
    animate: "fast",
    min: 1,
    max: user_points,
    slide: function(event, ui) {

      var id = $(this).attr("id");
      $('input#wager_point_amount').val(ui.value);
      $("div.wager_amount" + id).html(ui.value);
    }
  });

  $('.wager_message').click(function(){
    $(this).fadeOut('fast');
  });




})


// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= require simpleWeather
//= require filterrific/filterrific-jquery
//= require_tree .

/**
 * jQuery.NumPad
 *
 * Copyright (c) 2015 Andrej Kabachnik
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Project home:
 * https://github.com/kabachello/jQuery.NumPad
 *
 * Version: 1.4
 *
 */


function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
     '<li class="footer-clock w nav-item"> '+ h +':'+ m +' CST</li>';
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}


  $.simpleWeather({
    location: 'Kansas City, MO', // Can be zipcode, latitude longitude, or city name
    id: '',
    unit: 'f',
    success: function(weather) {
        html = '<li class="modal-row-forecast w nav-item" data-toggle="modal" data-target=".forecastModal"> '+weather.temp+'&deg;'+weather.units.temp+' <img src='+weather.thumbnail+'> '+weather.city+' | '+weather.region+ '</li>';

      $("#weather").html(html);
    },
    error: function(error) {
      $("#weather").html('<p>'+error+'</p>');
    }
  });
  
  $(document).ready(function() {
  $.simpleWeather({
    woeid: '2357536', //2357536
    location: 'Kansas City, MO',
    unit: 'f',
    success: function(weather) {
      html = '<h5>Ten Day Forecast</h5>';
      html += '<ul class="nav"><li class="nav-item m-b-2">'+weather.city+', '+weather.region+'</li>';
      
      for(var i=0;i<weather.forecast.length;i++) {
        html += '<div id="accordion" role="tablist" aria-multiselectable="true"><div class="panel panel-default"><div class="panel-heading" role="tab" id="headingTwo"><h6 class="panel-title"><a class="color forecast-w btn btn-primary collapsed" data-toggle="collapse" data-parent="#accordion" href="#weather'+[i]+'" aria-expanded="false" aria-controls="weather'+[i]+'">'+weather.forecast[i].day+', '+weather.forecast[i].date+'</a></h6></div><div id="weather'+[i]+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo"><div class="container-fluid forecast-con-fix"><div class="col-md-12 forecast-col-fix"><div class="col-sm-3" style="margin-top: .5rem;">High: '+weather.forecast[i].high+'&deg; '+weather.units.temp+'</div><div class="col-sm-6"><img src='+weather.forecast[i].thumbnail+'> '+weather.forecast[i].text+'</div><div class="col-sm-3" style="margin-top: .5rem;">Low: '+weather.forecast[i].low+'&deg; '+weather.units.temp+'</div></div></div></div></div></div>';
      }
  
      $("#forecast").html(html);
    },
    error: function(error) {
      $("#forecast").html('<p>'+error+'</p>');
    }
  });
});

function toggleFullScreen() {
  if ((document.fullScreenElement && document.fullScreenElement !== null) ||    
   (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if (document.documentElement.requestFullScreen) {  
      document.documentElement.requestFullScreen();  
    } else if (document.documentElement.mozRequestFullScreen) {  
      document.documentElement.mozRequestFullScreen();  
    } else if (document.documentElement.webkitRequestFullScreen) {  
      document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);  
    }  
  } else {  
    if (document.cancelFullScreen) {  
      document.cancelFullScreen();  
    } else if (document.mozCancelFullScreen) {  
      document.mozCancelFullScreen();  
    } else if (document.webkitCancelFullScreen) {  
      document.webkitCancelFullScreen();  
    }  
  }  
}

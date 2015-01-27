// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts
//= require_tree .

// LARGE MAP: ALL GUIDES INDEX BACKGROUND
$(document).ready(function() {
  $.ajax({
    url: 'guides.json',
    type: 'GET',
    dataType: 'text',
    success: function(data){
      console.log('LOOK AT ME!')
      console.log(data)

      geojson = $.parseJSON(data)
      console.log(geojson)
      L.mapbox.accessToken = 'pk.eyJ1IjoiamFtYXppbmciLCJhIjoiWm5QaUdZZyJ9.A91w3rJWJ3XWcuyz7kW8GA';
      var map = L.mapbox.map('map', 'jamazing.l26m1gnb').setView([40, -74.50], 9);
      map.featureLayer.setGeoJSON(geojson)
    }
  });
})


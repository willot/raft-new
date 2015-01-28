// LARGE MAP: ALL GUIDE INDEX BACKGROUND

// HOMEPAGE
$(document).ready(function() {
  $.ajax({
    url: 'guides.json',
    type: 'GET',
    dataType: 'text',
    success: function(data){
      geojson = $.parseJSON(data)
      L.mapbox.accessToken = 'pk.eyJ1IjoiamFtYXppbmciLCJhIjoiWm5QaUdZZyJ9.A91w3rJWJ3XWcuyz7kW8GA';
      var map = L.mapbox.map('map', 'jamazing.l26m1gnb', {maxBounds: [[30.0,-85.0],[50.0,-65.0]], maxZoom: 50, minZoom: 3}).setView([40, -74.50], 9);
      map.featureLayer.setGeoJSON(geojson)
    }
  });
})


// TRIP SHOW PAGE
$(document).ready(function() {
  $.ajax({
    url: 'guides.json',
    type: 'GET',
    dataType: 'text',
    success: function(data){
      geojson = $.parseJSON(data)
      L.mapbox.accessToken = 'pk.eyJ1IjoiamFtYXppbmciLCJhIjoiWm5QaUdZZyJ9.A91w3rJWJ3XWcuyz7kW8GA';
      var map = L.mapbox.map('tripmap', 'jamazing.l2jlo2pp', {maxBounds: [[30.0,-85.0],[50.0,-65.0]], maxZoom: 50, minZoom: 3}).setView([40, -74.50], 9);
      map.featureLayer.setGeoJSON(geojson)
    }
  });
})

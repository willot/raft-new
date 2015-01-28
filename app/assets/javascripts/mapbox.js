// LARGE MAP: ALL GUIDE INDEX BACKGROUND

$(document).ready(function() {
  $.ajax({
    url: 'guides.json',
    type: 'GET',
    dataType: 'text',
    success: function(data){
      geojson = $.parseJSON(data)
      console.log(geojson)
      L.mapbox.accessToken = 'pk.eyJ1IjoiamFtYXppbmciLCJhIjoiWm5QaUdZZyJ9.A91w3rJWJ3XWcuyz7kW8GA';
      // var bounds = L.latLngBounds(L.latLng(13.902, 59.9928), L.latLng(26.6325, 54.3534));
      var map = L.mapbox.map('map', 'jamazing.l26m1gnb', {maxBounds: [[30.0,-85.0],[50.0,-65.0]], maxZoom: 50, minZoom: 3}).setView([40, -74.50], 9);
      map.featureLayer.setGeoJSON(geojson)
    }
  });
})


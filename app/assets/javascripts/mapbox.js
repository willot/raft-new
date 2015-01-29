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
      window.map = L.mapbox.map('map', 'jamazing.l26m1gnb', {maxBounds: [[20.0, 0.0]], maxZoom: 2, minZoom: 2}).setView([20.0, 0], 2);
      window.map.featureLayer.setGeoJSON(geojson);
    }
  });
})

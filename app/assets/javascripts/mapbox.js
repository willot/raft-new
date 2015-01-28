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
      var map = L.mapbox.map('map', 'jamazing.l26m1gnb').setView([40, 50.50], 2);
      map.featureLayer.setGeoJSON(geojson)
    }
  });
})


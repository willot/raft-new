// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TRIP SHOW PAGE
$(document).ready(function() {
  var showMap = function(data) {
    L.mapbox.accessToken = 'pk.eyJ1IjoiamFtYXppbmciLCJhIjoiWm5QaUdZZyJ9.A91w3rJWJ3XWcuyz7kW8GA';
    var map = L.mapbox.map('tripmap', 'jamazing.l2jlo2pp', {zoomControl: false}).setView([40, -74.50], 2);

    map.dragging.disable();
    map.touchZoom.disable();
    map.doubleClickZoom.disable();
    map.scrollWheelZoom.disable();

    if (map.tap) { map.tap.disable(); }

    map.featureLayer.on('ready', function(e) {
      var line = data;

      var polyline_options = {color: '#000'};
      var polyline = L.polyline(line, polyline_options).addTo(map);
    });
  };
  showMap(window.coords);
});

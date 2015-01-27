$(document).ready(function() {
  # initialize the map on the 'map' div
  # with the given map ID, center, and zoom
  map = L.mapbox.map('map', 'your-map-id').setView([45.52086, -122.679523], 14)


  # get JSON object
  # on success, parse it and
  # hand it over to MapBox for mapping
  $.ajax
    dataType: 'text'
});

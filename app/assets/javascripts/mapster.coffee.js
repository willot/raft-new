$(document).ready ->

  // initialize the map on the 'map' div
  // with the given map ID, center, and zoom
  map = L.mapbox.map('map', 'jamazing.l26m1gnb').setView([45.52086, -122.679523], 14)

  //  get JSON object
  //  on success, parse it and
  //  hand it over to MapBox for mapping
  $.ajax
    dataType: 'text'
    url: 'guides/index.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geosjon)

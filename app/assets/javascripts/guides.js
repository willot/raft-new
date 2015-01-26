// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// (function(window, google) {

//   //map options
//   var options = {
//     center: {
//       lat: 41.8369,
//       lng: 87.6847
//     },
//     zoom: 10
//   }
//   element = document.getElementById('map-canvas'),
//   //map
//   map = new google.maps.Map(element, options);
// }(window, google));


function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
      'callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $("#current-city-text-field").autocomplete({
    source: $("#current-city-text-field").data('autocomplete-path')
  });
});

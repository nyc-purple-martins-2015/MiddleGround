
$(document).on("click", "#getGeolocation", function(){
  getLocation();
});
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
       $("#getGeolocation").html("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
  printAddress(position.coords.latitude, position.coords.longitude);
    // $("#getGeolocation").html("Latitude: " + position.coords.latitude +
    // "<br>Longitude: " + position.coords.longitude);
}


function printAddress(latitude, longitude) {
    // set up the Geocoder object
    var geocoder = new google.maps.Geocoder();
    // turn coordinates into an object
    var yourLocation = new google.maps.LatLng(latitude, longitude);

    // find out info about our location
    geocoder.geocode({ 'latLng': yourLocation }, function (results, status) {
    if(status == google.maps.GeocoderStatus.OK) {
      if(results[0]) {
        $("#getGeolocation").fadeOut(function() {
          $(this).html(results[0].formatted_address).fadeIn();
        });
      } else {
        error('Google did not return any results.');
      }
    } else {
      error("Reverse Geocoding failed due to: " + status);
    }
  });
}
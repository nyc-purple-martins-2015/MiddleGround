
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
}


function printAddress(latitude, longitude) {
    var geocoder = new google.maps.Geocoder();
    var yourLocation = new google.maps.LatLng(latitude, longitude);

    geocoder.geocode({ 'latLng': yourLocation }, function (results, status) {
    if(status == google.maps.GeocoderStatus.OK) {
      if(results[0]) {
        $("#getGeolocation").fadeOut(function() {
          $(this).html(results[0].formatted_address).fadeIn();
        });
      } else {
         $("#getGeolocation").html("Latitude: " + latitude.toFixed(2) +
       "<br>Longitude: " + longitude.toFixed(2));
      }
    } else {
       $("#getGeolocation").html("Latitude: " + latitude.toFixed(2) +
       "<br>Longitude: " + longitude.toFixed(2));
    }
  });
}
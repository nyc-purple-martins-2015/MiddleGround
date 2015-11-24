function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
       $("#geoLocation").append("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
      debugger
    $("#geoLocation").append("Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude);
}

$(document).on("click", "#getGeolocation", function(){
  getLocation();
});
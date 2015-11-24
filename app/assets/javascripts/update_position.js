function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
       $("#getGeolocation").html("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
    $("#getGeolocation").html("Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude);
}
$(document).on("click", "#getGeolocation", function(){
  getLocation();
});
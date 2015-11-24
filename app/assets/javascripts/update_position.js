function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
       $("#getGeolocation").replaceWith("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
    $("#getGeolocation").replaceWith("Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude);
}
$(document).on("click", "#getGeolocation", function(){
  getLocation();
});
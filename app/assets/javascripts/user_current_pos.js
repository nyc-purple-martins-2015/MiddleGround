$(document).ready(function(){

  $(window).load(function(){
  function initialize() {
    var mapCanvas = document.getElementById('map');
    var map = new google.maps.Map(mapCanvas);
  }
  function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
}

  });
});

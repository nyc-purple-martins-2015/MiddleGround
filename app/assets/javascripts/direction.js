var DirectionMap =  function(position,domMap){
  this.position = position;
  this.map = new google.maps.Map(document.getElementById('map-image'),{center: position, zoom: 14});
};

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  var selectedMode = document.getElementById('mode').value;
  var originCoords = $(".origin").data();
  var destCoords = $(".destination").data();
  var end = new google.maps.LatLng({lat: destCoords.destinationLat, lng: destCoords.destinationLng});
  var start = new google.maps.LatLng({lat: originCoords.originLat, lng: originCoords.originLng});
  directionsService.route({
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode[selectedMode]
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

/ * 
You might want to be careful with an "on-change" event handler - they can
 end up firing many times.
Using the "blur" event - i.e. focus lost - is sometimes preferable.
*/
document.addEventListener('DOMContentLoaded', function(){
  $("#mode").change(function(event){
    var domMap = $('map-image');
    var coords = $(".origin").data();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsService = new google.maps.DirectionsService();
    var map = new DirectionMap(new google.maps.LatLng({lat: coords.originLat, lng: coords.originLng}), domMap);
    var direction = $("#right-panel");
    direction.html("");
    directionsDisplay.setPanel(direction[0]);
    directionsDisplay.setMap(map.map);
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  });
});



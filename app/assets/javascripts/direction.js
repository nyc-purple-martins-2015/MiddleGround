var DirectionMap =  function(position,domMap){
  this.position = position;
  this.map = new google.maps.Map(document.getElementById('map-image'),{center: position, zoom: 14});
};

DirectionMap.prototype.createMarker = function(inputPos, label){
  return new google.maps.Marker({position: inputPos, map: this.map, title: label})
};
DirectionMap.prototype.getDirections = function(){
  var destination = $(".destination").attr("data-destination");
  var originLat = $(".destination").attr("data-origin-lat");
  var originLong = $(".destination").attr("data-origin-long");
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  var end = new google.maps.LatLng({lat: 40.7127, lng: -74.005});
  var start = new google.maps.LatLng({lat: 40.7117, lng: -74.005});
  directionsService.route({
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.WALKING
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

// var control = document.getElementById('floating-panel');
//   control.style.display = 'block';
//   map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

document.addEventListener('DOMContentLoaded',function(){
  var domMap = $('map-image');
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var directionsService = new google.maps.DirectionsService;
  var map = new DirectionMap(new google.maps.LatLng({lat: 40.7117, lng: -74.005}), domMap);
  directionsDisplay.setMap(map.map);
  // map.createMarker(inputPosition, 'Direction Map');
  // map.createMarker(currentPosition, 'Direction Map');
  calculateAndDisplayRoute(directionsService, directionsDisplay);


})




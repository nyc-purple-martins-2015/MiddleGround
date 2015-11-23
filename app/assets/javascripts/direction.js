var DirectionMap =  function(position,domMap){
  this.position = position;
  this.map = new google.maps.Map(document.getElementById('map-image'),{center: position, zoom: 14});
};

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  var selectedMode = document.getElementById('mode').value;
  var end = new google.maps.LatLng({lat: 40.7127, lng: -74.005});
  var start = new google.maps.LatLng({lat: 40.7117, lng: -74.005});
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

// var control = document.getElementById('floating-panel');
//   control.style.display = 'block';
//   map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

document.addEventListener('DOMContentLoaded', function(){
  $("#mode").change(function(event){

    var domMap = $('map-image');
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var directionsService = new google.maps.DirectionsService;
    var map = new DirectionMap(new google.maps.LatLng({lat: 40.7117, lng: -74.005}), domMap);
    directionsDisplay.setMap(map.map);
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  })
})




function initMap() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success);
  } else {
    error('Geo Location is not supported');
  }
}


function success(position) {
     var lat = position.coords.latitude;
     var long = -position.coords.longitude;

}

var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  var options = {
    zoom: 15,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: {
      style: google.maps.NavigationControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_container"), options);

  var marker = new google.maps.Marker({
      position: coords,
      map: map,
      title:"You are here!"
  });



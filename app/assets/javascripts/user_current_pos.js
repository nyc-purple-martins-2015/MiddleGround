$(document).ready(function(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success);
    } else {
      error('Geo Location is not supported');
    }
  function success(position) {
    var mapcanvas = document.createElement('div');
      mapcanvas.id = 'map_container';
      mapcanvas.style.height = '200px';
      mapcanvas.style.width = '300px';
      document.querySelector('article').appendChild(mapcanvas);
      lat = position.coords.latitude;
      lng = position.coords.longitude;

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
  }
  $("#new-activity-form-container").on('submit', function(event){
    event.preventDefault();
    var latitude = lat;
    var longitude = lng;
    var myLocation = new google.maps.LatLng({lat: latitude, lng: longitude});
    var friendLocation = new google.maps.LatLng({lat: 40.661789, lng: -73.959723});
    var midpoint = google.maps.geometry.spherical.interpolate(myLocation, friendLocation, 0.5);
    var activity = $(this).find($("#activity")).val();
    var postRoute =$(this).children().attr("action");
    var newActivityRequest = $.ajax({
      method: 'post',
      url: postRoute,
      data: {
        midlat: midpoint.lat().toFixed(4),
        midlong: midpoint.lng().toFixed(4),
        activity: activity
      },
      datatype: 'json'
    });
    newActivityRequest.done(function(newActivityHTML){
      console.log(newActivityHTML);
    });
    }
  );
});

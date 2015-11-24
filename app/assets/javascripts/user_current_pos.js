$(document).ready(function(){
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success);
  } else {
    error('Geo Location is not supported');
  }
  function success(position) {
    if ($("#user-location").length > 0){
      var mapcanvas = document.createElement('div');
      mapcanvas.id = 'map_container';
      mapcanvas.style.height = '200px';
      mapcanvas.style.width = '300px';
      document.querySelector('article').appendChild(mapcanvas);}
      lat = position.coords.latitude;
      lng = position.coords.longitude;
      $("#lat").val(lat);
      $("#long").val(lng);
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
      var friend = $(this).find('select#user').children().data()
      var myLocation = new google.maps.LatLng({lat: lat, lng: lng});
      var friendLocation = new google.maps.LatLng({lat: parseFloat(friend.lat), lng: parseFloat(friend.long)});
      var midpoint = google.maps.geometry.spherical.interpolate(myLocation, friendLocation, 0.5);
      var activity = $("#activity").val();
      var postRoute =$('form').attr("action");
      var newActivityRequest = $.ajax({
        method: 'post',
        url: postRoute,
        data: {
          midlat: midpoint.lat().toFixed(4),
          midlong: midpoint.lng().toFixed(4),
          activity: activity,
          friend: friend.id
        },
        datatype: 'json'
      });
      newActivityRequest.done(function(newActivityHTML){
        $(".page-container").html(newActivityHTML);
      });
      newActivityRequest.fail(function(response){
        $(".error-message").empty();
        $(".error-message").html("I'm sorry, there were no activities that match your criteria. Please try again");
      });
    });
});

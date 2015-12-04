/*
  When you have time, you should split the success function into component 
  functions so that success "tells a story" - it's almost unreadable as it is now
*/
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
      mapcanvas.style.height = '400px';
      mapcanvas.style.width = '500px';
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
      var bounds = new google.maps.LatLngBounds();
      var marker = new google.maps.Marker({
        position: coords,
        icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
        map: map,
        animation: google.maps.Animation.DROP,
        title:"You are here!"
      });
      if (marker !== 'undefined'){
        bounds.extend(marker.position);
      };
      var friend = $('#user-location').data();
      var friendLocation = new google.maps.LatLng({lat: parseFloat(friend.friendLat), lng: parseFloat(friend.friendLong)});
      var friendMarker = new google.maps.Marker({
        position: friendLocation,
        icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
        map: map,
        animation: google.maps.Animation.DROP,
        title: "Your friend is here!"
      });
      if (friendMarker !== 'undefined'){
        bounds.extend(friendMarker.position);
      };
        var destination = $('article.destination').data();
        var destLocation = new google.maps.LatLng({lat: parseFloat(destination.destinationLat), lng: parseFloat(destination.destinationLong)});
        var meeting = new google.maps.Marker({
          position: destLocation,
          animation: google.maps.Animation.DROP,
          map: map,
          title: "Your destination is here!"
        });
        if (meeting !== 'undefined'){
          bounds.extend(meeting.position);
        };
        map.fitBounds(bounds);
        }
        $(".page-container").on('submit', "#new-activity-form-container", function(event){
            event.preventDefault();
            var friend = $(this).find('select#user :selected').data();
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
              navigator.geolocation.getCurrentPosition(success);
            });
            newActivityRequest.fail(function(response){
              $(".error-message").empty();
              $(".error-message").html("I'm sorry, there were no activities that match your criteria. Please try again");
            });
          });
});

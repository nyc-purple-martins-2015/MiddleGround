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
    var friendLat = $(this).find('#user').children().attr('data-lat');
    var friendLong = $(this).find('#user').children().attr('data-long');
    var friendId = $(this).find('#user').children().val();
    var latitude = lat;
    var longitude = lng;
    debugger
    var myLocation = new google.maps.LatLng({lat: latitude, lng: longitude});
    var friendLocation = new google.maps.LatLng({lat: parseFloat(friendLat), lng: parseFloat(friendLong)});
    var midpoint = google.maps.geometry.spherical.interpolate(myLocation, friendLocation, 0.5);
    var activity = $(this).find($("#activity")).val();
    var postRoute =$(this).children().attr("action");
    debugger
    var newActivityRequest = $.ajax({
      method: 'post',
      url: postRoute,
      data: {
        midlat: midpoint.lat().toFixed(4),
        midlong: midpoint.lng().toFixed(4),
        activity: activity,
        friend: friendId
      },
      datatype: 'json'
    });
    newActivityRequest.done(function(newActivityHTML){
      $(".page-container").replaceWith(newActivityHTML);
    });
    }
  );
});

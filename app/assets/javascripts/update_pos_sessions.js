      $(document).ready(function() {

        var lat = document.getElementById("lat");
        var lng = document.getElementById("long");

        function getLocation() {
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
          } else {
            latitude.innerHTML = "Geolocation is not supported by this browser.";
          }
        }
        function showPosition(position) {
          lat.value = position.coords.latitude;
          lng.value = position.coords.longitude;
        }
        $('#location_session').on('click',function(){
          var pos = getLocation();
          showPosition(pos);
      })
      });
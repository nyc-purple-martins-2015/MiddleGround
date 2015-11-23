var DirectionMap =  function(position,domMap){
  this.position = position;
  debugger
  this.map = new google.maps.Map(document.getElementById('map-image'),{center: position, zoom: 14});
};

DirectionMap.prototype.createMarker = function(inputPos, label){
  return new google.maps.Marker({position: inputPos, map: this.map, title: label})
};

document.addEventListener('DOMContentLoaded',function(){
  var domMap = $('map-image');
  var inputPosition = {lat: 40.7127, lng: -74.005}; //yelps sample location
  var map = new DirectionMap(inputPosition, domMap);
  map.createMarker(inputPosition, 'Direction Map');




})





function initialize(location) {
  console.log(location);
  var myLatLng = {lat: -25.363, lng: 131.044};

  var currentLocation = new google.maps.LatLng(location.coords.latitude,location.coords.longitude);
  var mapOptions = {
    center: currentLocation,
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map-index"), mapOptions);
  var marker = new google.maps.Marker({
    position: currentLocation,
    map: map
  });

  var marker2 = new google.maps.Marker({
    position: myLatLng,
    map: map
  });

}

$(document).ready(function() {

  navigator.geolocation.getCurrentPosition(initialize);
  
});
var map;

function initialize(location) {
  console.log(location);
  var currentLocation = new google.maps.LatLng(location.coords.latitude,location.coords.longitude);
  var mapOptions = {
    center: currentLocation,
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  var marker = new google.maps.Marker({
    position: currentLocation,
    map: map
  });

}

$(document).ready(function() {
  console.log("fishie")

  navigator.geolocation.getCurrentPosition(initialize);
  
});


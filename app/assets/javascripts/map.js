function initialize(location) {

  var bounds = new google.maps.LatLngBounds();

  var currentLocation = new google.maps.LatLng(location.coords.latitude,location.coords.longitude);
  var mapOptions = {
    center: currentLocation,
    zoom: 0,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map-index"), mapOptions);

  $.ajax({
    type:"GET",
    url:"https://" + window.location.host+ "/get_coordinates",
    dataType:"json",
    success: function(data){
      var markers = data;
      for( i = 0; i < markers.length; i++ ) {
        var lat = markers[i][0];
        var long = markers[i][1];
        var latLong = new google.maps.LatLng(lat,long);
        var marker = new google.maps.Marker({
          position: latLong,
          map: map
        });
        bounds.extend(latLong);
        map.fitBounds(bounds);
      }
    }
  });
}

$(document).ready(function() {

  navigator.geolocation.getCurrentPosition(initialize);
  
});

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
    url:"http://" + window.location.host+ "/get_coordinates",
    dataType:"json",
    success: function(data){
      var markers = data;
      for( i = 0; i < markers.length; i++ ) {
        var title = markers[i][0];
        var location = markers[i][1];
        var lat = markers[i][2];
        var long = markers[i][3];
        var trip_id = markers[i][4];
        var latLong = new google.maps.LatLng(lat,long);
        var marker = new google.maps.Marker({
          position: latLong,
          map: map
        });
        bounds.extend(latLong);
        map.fitBounds(bounds);

        var content =  '<a href="/trips/' + trip_id + '">' + title + '</a><br/>' + location
        var infowindow = new google.maps.InfoWindow()
        google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
            return function() {
               infowindow.setContent(content);
               infowindow.open(map,marker);
            };
        })(marker,content,infowindow)); 

      }
    }
  });
}

$(document).ready(function() {

  navigator.geolocation.getCurrentPosition(initialize);
  
});

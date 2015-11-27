$(document).ready(function() {

	initialize();


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function initialize(){
        var latLon = {lat: 37.470246, lng: -121.912577};

        var map = new google.maps.Map(document.getElementById('map'), {
          center: latLon,
          zoom: 8
        });

        var geocoder = new google.maps.Geocoder();

        for (var i = 0; i < hospitals.length; i++)
          // geocoder.geocode( { 'location': '440 Tonopah Drive, Fremont, CA 94539'}, function(results, status) {
          geocoder.geocode( { (hospitals['location'][i]);}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              map.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
              });
            } else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
      }

 }

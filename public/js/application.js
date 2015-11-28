$(document).ready(function() {

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them



  initialize();


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function initialize(){
        var latLon = {lat: 37.470246, lng: -121.912577};

        var map = new google.maps.Map(document.getElementById('map'), {
          center: latLon,
          zoom: 11
        });

        var geocoder0 = new google.maps.Geocoder();
        geocoder0.geocode( { 'address': '37.657535, -122.437658'}, function(results, status) {
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

        var geocoder1 = new google.maps.Geocoder();
        geocoder1.geocode( { 'address': '37.773859, -122.454498'}, function(results, status) {
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

        var geocoder2 = new google.maps.Geocoder();
        geocoder2.geocode( { 'address': '37.782741, -122.443564'}, function(results, status) {
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

        var geocoder3 = new google.maps.Geocoder();
        geocoder3.geocode( { 'address': '37.769114, -122.434706'}, function(results, status) {
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
        var geocoder4 = new google.maps.Geocoder();
        geocoder4.geocode( { 'address': '37.756171, -122.406608'}, function(results, status) {
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
        var geocoder5 = new google.maps.Geocoder();
        geocoder5.geocode( { 'address': '37.791188, -122.43096'}, function(results, status) {
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
        var geocoder6 = new google.maps.Geocoder();
        geocoder6.geocode( { 'address': '37.789561, -122.417112'}, function(results, status) {
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
        var geocoder7 = new google.maps.Geocoder();
        geocoder7.geocode( { 'address': '37.74755, -122.458778'}, function(results, status) {
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


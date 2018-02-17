jQuery(document).ready(function($) {
	//ajax call for carlist filter
	$('.car-select').on('change', function() {
		var filter = $(this).val();
		var field = $(this).attr('name');
		if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
				//console.log(this.responseText);
				//insert response into accordion element
                document.getElementById("accordion").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","filter_cars.php?q=" + filter + "&f=" + field, true);
        xmlhttp.send();
	});

	//Map for Office List Page
	function initMap() {
      	'use strict';
		var myCenter = new google.maps.LatLng(48.2089816, 16.3732133),
		    mapCanvas = document.getElementById("officeMap"),
		    mapOptions = {center: myCenter, zoom: 13},
		    map = new google.maps.Map(mapCanvas, mapOptions);

	  	var locations = markers;
	  	var marker, i;
	  	var infowindow = new google.maps.InfoWindow();
	  	var image = {
	  		url: "img/officemarker.png",
	  		scaledSize: new google.maps.Size(30, 30), // scaled size
	  	};
	    for (i = 0; i < locations.length; i++) {  
	      marker = new google.maps.Marker({
	        position: new google.maps.LatLng(locations[i][0], locations[i][1]),
	        map: map,
	        icon: image
	      });

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locations[i][2]);
	          infowindow.open(map, marker);
	          map.setZoom(16);
	    	  map.setCenter(marker.getPosition());
	        }
	      })(marker, i));
	    }
	}
	//initialize office map only on office page
	if( $('#officeMap').length > 0) {
		google.maps.event.addDomListener(window, "load", initMap);
    }

});
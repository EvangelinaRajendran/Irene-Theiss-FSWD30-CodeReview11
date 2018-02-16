jQuery(document).ready(function($) {
	console.log("ready");
	$('#select-offices').on('change', function() {
		var filter = $(this).val();
		var field = $(this).attr('name');
		//console.log(field);
		if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
                document.getElementById("accordion").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","filter_cars.php?q=" + filter + "&f=" + field, true);
        xmlhttp.send();
	});
});
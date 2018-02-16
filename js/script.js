jQuery(document).ready(function($) {
	console.log("ready");
	$('#select-offices').on('change', function() {
		var filter = $(this).val();
		var field = $(this).attr('name');
		console.log(field);

		if (filter === "All") {
			return;
		} else {
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
	                //document.getElementById("txtHint").innerHTML = this.responseText;
	            }
	        };
	        xmlhttp.open("GET","aj_test.php?q=" + filter + "&f=" + field, true);
	        xmlhttp.send();
		}
	});
});
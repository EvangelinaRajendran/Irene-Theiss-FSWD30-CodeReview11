<?php //session_start();?>
<?php include "lib/includes.php";?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" user-scalable="no">
	<title><?php if(isset($pagename)) {echo $pagename;} else {echo "Car Rental";};?></title>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Kanit:300,300i,400,400i,600,600i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="css/normalize.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php include "nav.php";?>
<?php //session_start();?>
<?php require_once "lib/db_config.php";?>
<?php include_once "lib/Office.php";
	  include_once "lib/OfficeList.php";
	  include_once "lib/Car.php";
	  include_once "lib/CarList.php";
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><?php if(isset($pagename)) {echo $pagename;} else {echo "Car Rental";};?></title>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link rel="stylesheet" href="css/normalize.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php include "nav.php";?>
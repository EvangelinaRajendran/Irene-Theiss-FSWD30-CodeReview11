<?php	
include "partials/header.php";
// echo $_GET['q'];
// echo $_GET['f'];
$filter = $_GET['q'];
$field = $_GET['f'];
$cars = new CarList();
$cars->carList = $cars->getCars($field , $filter);
echo $cars->displayCars();
?>

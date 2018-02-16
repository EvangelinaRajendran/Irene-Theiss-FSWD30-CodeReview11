<?php 
$pagename = "Cars";
include "partials/header.php";
//get car list
$cars = new CarList();
$cars->carList = $cars->getCars();
//var_dump($cars->carList);
//get office list
$offices = new OfficeList();
$offices->officeList = $offices->getOffices();
?>
<div class="container pad-cont">
	<div class="row">
		<div class="col-md-2 hidden-xs"></div>
  		<div class="col-lg-8 col-md-8 col-sm-12 car-container">
  			<div class="filter">
		  		<form >
		  			<select name="office_name" id="select-offices" class="car-select">
		  				<option value="All">All</option>
		  				<?php foreach ($offices->officeList as $value): ?>
		  					<option value="<?php echo $value->officeName;?>"><?php echo $value->officeName;?></option>
		  				<?php endforeach ?>
		  			</select>
		  		</form>
		  		
		  	</div>
  			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
  				<?php echo $cars->displayCars();?>
  			</div>
  		</div><!--/content column -->
  		<div class="col-md-2 hidden-xs"></div>
	</div><!--/.row -->
</div><!--/.container -->

<?php include "partials/footer.php";?>

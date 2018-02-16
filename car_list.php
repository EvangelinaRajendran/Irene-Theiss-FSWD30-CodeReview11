<?php 
$pagename = "Cars";
include "partials/header.php";


//get car list
$cars = new CarList();
if (!empty($_GET['q'])) {
	$filter = $_GET['q'];
	var_dump($filter);
}
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
		  			<select name="office_name" id="select-offices">
		  				<option value="All">All</option>
		  				<?php foreach ($offices->officeList as $value): ?>
		  					<option value="<?php echo $value->officeName;?>"><?php echo $value->officeName;?></option>
		  				<?php endforeach ?>
		  			</select>
		  		</form>
		  	</div>
  			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
  				<?php foreach ($cars->carList as $value): ?>
					<div class="panel panel-default">
					   	<div class="panel-heading">
				   			<h4 class="panel-title">
					        	<?php echo $value->brand . " | " . $value->cartype;?>
					        		<?php if ($value->office !== null): ?>
					        			<label class="label label-info">Available</label>
					        		<?php else: ?>
					        			<label class="label label-warning">On the road</label>
					        		<?php endif ?>
					        		<label class="label label-primary pull-right"><?php echo $value->pricePerDay . " €/Day";?></label>
					        	<a href="#" class="" data-toggle="collapse" data-target="#collapsible-<?php echo $value->id;?>" data-parent="#myAccordion"> More
					        		<span class=""><i class="fas fa-caret-down"></i></span>
						        </a>
						   	</h4>
					   	</div>
				        <div id="collapsible-<?php echo $value->id;?>" class="collapse">
				        	<div class="panel-body">
				        		<div class="col-xs-6">
				        			<span class="badge"><?php echo $value->ps . " PS";?></span>
					        		<span class="badge"><?php echo $value->circuit;?></span>
					        		<span class="badge"><i class="far fa-snowflake"></i><?php echo $value->aircondition;?></span>
					        		<span class="badge"><?php echo $value->numSeats . " | " . $value->numDoors;?></span>
				        		</div>
				        		<div class="col-xs-6">
				        			<?php echo $value->office;?><br>
				        			<?php echo $value->coordinates;?><br>
				        		</div>
				        	</div>
				        </div>
				   </div>
				<?php endforeach ?>
  			</div>
  		</div><!--/content column -->
  		<div class="col-md-2 hidden-xs"></div>
	</div><!--/.row -->
</div><!--/.container -->

<?php include "partials/footer.php";?>

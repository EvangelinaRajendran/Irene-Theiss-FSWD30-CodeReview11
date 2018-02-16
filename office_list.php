<?php 
$pagename = "Offices";
include "partials/header.php";
//get office list
$offices = new OfficeList();
$offices->officeList = $offices->getOffices();
?>

<div class="container pad-cont">
	<div class="row">
		<div class="col-md-2 hidden-xs"></div>
  		<div class="col-lg-8 col-md-8 col-sm-12">
  			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
  				<?php foreach ($offices->officeList as $value): ?>
					<div class="panel panel-default">
					   	<div class="panel-heading">
				   			<h4 class="panel-title">
						   		<a href="#" class="" data-toggle="collapse" data-target="#collapsible-<?php echo $value->id;?>" data-parent="#myAccordion">
						        	<?php echo $value->officeName;?>
						        	<label class="label label-info"> 
						        		<i class="fas fa-car"></i>
						        		<span class="badge"><?php echo $value->carcount;?></span>
						        	</label>
						        	<span class="pull-right"><i class="fas fa-caret-down"></i></span>
						        </a>
						   	</h4>
					   	</div>
				        <div id="collapsible-<?php echo $value->id;?>" class="collapse">
				        	<div class="panel-body">
				        		<p>
					        		<?php echo $value->address;?><br>
					        		<?php echo $value->district;?>
					        	</p>
				            	<p><i class="far fa-envelope"></i><?php echo $value->email;?></p>
				            	<p><i class="fas fa-phone"></i><?php echo $value->phone;?></p>
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


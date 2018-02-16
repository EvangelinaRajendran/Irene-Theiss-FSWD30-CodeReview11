<?php
class CarList {
	public $carList = array();

	public function getCars($field = null, $filter = null) {
		$connection = openConnection();
		$sql = "SELECT * FROM getCarsWithLocation";
		if ($filter !== null && $filter !== "All") {
			$sql .= " WHERE $field = ?";
		} 
		if($stmt = $connection->prepare($sql)){
			if ($filter !== null && $filter !== "All") {
				 $stmt->bind_param("s", $param_name);
            	// Set parameters
            	$param_name = $filter;
			}
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                /// Store result
                $stmt->store_result();
                if($stmt->num_rows > 0){ 
                	//printf ($stmt->num_rows);
                	// Bind result variables
                    $stmt->bind_result($retid, $retlicense, $retage, $retps, $retcircuit, $retaircondition, $retnumSeats, $retnumDoors, $retcartype, $retbrand, $retpricePerDay, $retoffice, $retcoordinates);
                	 while ($stmt->fetch()) {
				        //printf ("%s \n", $retid);
				        array_push($this->carList, new Car($retid, $retlicense, $retage, $retps, $retcircuit, $retaircondition, $retnumSeats, $retnumDoors, $retcartype, $retbrand, $retpricePerDay, $retoffice, $retcoordinates) );
				    }
				    $stmt->close();
				    $connection->close();
            	} else {
            		$stmt->close();
				    $connection->close();
				    return false;
            	}
        	} 
    	}
    	return $this->carList;
	}

	public function displayCars() {
		ob_start();
		foreach ($this->carList as $value) {
		?>
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
		<?php }
		$content = ob_get_contents();
		ob_get_clean();
		return $content;
	}
}
?>
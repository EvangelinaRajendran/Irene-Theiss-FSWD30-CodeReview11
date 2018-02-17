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
	   			<?php if ($value->office !== null): ?>
        			<label class="label label-info">Available at <?php echo $value->office;?></label>
        		<?php else: ?>
        			<label class="label label-warning">On the road</label>
        		<?php endif ?>
	   			<h4 class="panel-title">
		        	<?php echo $value->brand . " | " . $value->cartype;?>
			   	</h4>
        		<label class="label label-primary pull-right"><?php echo number_format($value->pricePerDay, 2) . " € |";?><sup> day</sup></label>
	        	<span class="btn btn-primary" data-toggle="collapse" data-target="#collapsible-<?php echo $value->id;?>" data-parent="#accordion"> More Information
		        </span>
		   	</div>
	        <div id="collapsible-<?php echo $value->id;?>" class="collapse">
	        	<div class="panel-body">
	        		<div class="col-xs-12 car-features">
	        			<span class="badge"><?php echo $value->ps . " PS";?></span>
		        		<span class="badge"><?php echo $value->circuit;?></span>
		        		<?php if ($value->aircondition == "true"): ?>
		        			<span class="badge"><i class="far fa-snowflake"></i> Air Condition</span>
		        		<?php endif ?>
		        		<span class="badge"><?php echo $value->numSeats;?></span>
		        		<span class="badge"><?php echo $value->numDoors;?></span>
	        		</div>
	        		<div class="col-xs-12 no-pad">
	        			<p>Google Map doesn't work after filtering list via ajax - can't figure out how to fix this ... help ... </p>
	        			<div class="map-container" id="map-<?php echo $value->id;?>">
	        			</div>
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
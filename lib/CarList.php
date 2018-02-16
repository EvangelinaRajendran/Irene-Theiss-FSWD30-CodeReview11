<?php
class CarList {
	public $carList = array();

	public function getCars($field = null, $filter = null) {
		$connection = openConnection();
		$sql = "SELECT * FROM getCarsWithLocation";
		if ($filter !== null) {
			$sql .= " WHERE $field = ?";
		} 
		if($stmt = $connection->prepare($sql)){
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
}
?>
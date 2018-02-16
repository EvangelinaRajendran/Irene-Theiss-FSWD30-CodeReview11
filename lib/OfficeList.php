<?php 

class OfficeList {
	public $officeList = array();

	public function getOffices () {
		$connection = openConnection();
		$sql = "SELECT * FROM getCarCountAndOffices";
		if($stmt = $connection->prepare($sql)){
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                /// Store result
                $stmt->store_result();
                if($stmt->num_rows > 0){ 
                	// Bind result variables
                    $stmt->bind_result($retid, $retOfficeName, $retEmail, $retPhone, $retAddress, $retDistrict, 
                    	$retCoord, $retcount);
                	 while ($stmt->fetch()) {
				        //printf ("%s \n", $retOfficeName);
				        array_push($this->officeList, Office::createOfficeWithParam($retid, $retOfficeName, $retEmail, $retPhone, $retAddress, $retDistrict, $retCoord, $retcount) );
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
    	return $this->officeList;
    }
}
?>
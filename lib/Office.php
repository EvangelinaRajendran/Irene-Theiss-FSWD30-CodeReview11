<?php 

class Office {
	public $id;
	public $officeName;
	public $email;
	public $phone;
	public $address;
	public $district;
	public $coordinates;
	public $carcount;

	//constructor
	function __construct() {
        
    }

    static function createOfficeWithParam($id, $officeName, $email, $phone, 
    	$address, $district, $coordinates, $carcount) {
    	$instance = new self();
    	$instance->id = $id;
    	$instance->officeName = $officeName;
    	$instance->email = $email;
    	$instance->phone = $phone;
    	$instance->address = $address;
    	$instance->district = $district;
    	$instance->coordinates = $instance->getLongLat($coordinates);
    	$instance->carcount = $carcount;
    	return $instance;
    }

    public function getLongLat($coordinates) {
        $temp = substr($coordinates,6,-1);
        $temp = explode(" ", $temp);
        array_push($temp, $this->officeName);
        return $temp;
    }

}
?>
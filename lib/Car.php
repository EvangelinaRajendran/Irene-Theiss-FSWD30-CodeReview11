<?php 
class Car {
	public $id;
	public $license;
	public $age;
	public $ps;
	public $circuit;
	public $aircondition;
	public $numSeats;
	public $numDoors;
	public $cartype;
	public $brand;
	public $pricePerDay;
	public $office;
	public $coordinates;

	//constructor
	function __construct($id, $license, $age, $ps, $circuit, $aircondition, $numSeats,
						$numDoors, $cartype, $brand, $pricePerDay, $office, $coordinates) {
		$this->id = $id;
		$this->license = $license;
		$this->age = $age;
		$this->ps = $ps;
		$this->circuit = $circuit;
		$this->aircondition = $aircondition;
		$this->numSeats = $numSeats;
		$this->numDoors = $numDoors;
		$this->cartype = $cartype;
		$this->brand = $brand;
		$this->pricePerDay = $pricePerDay;
		$this->office = $office;
		$this->coordinates = $this->getLongLat($coordinates);
    }

    public function getLongLat($coordinates) {
        $temp = substr($coordinates,6,-1);
        return explode(" ", $temp);
    }

}
?>
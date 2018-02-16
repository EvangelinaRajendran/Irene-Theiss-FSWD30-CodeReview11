-- list of offices
-- CREATE VIEW getOffices AS
-- SELECT branch_office.id, office_name, email, CONCAT('+43 ', phone_nr) AS phone, 
				-- CONCAT(street, ' ', street_nr) AS Address, CONCAT(district, ' Wien') AS city, AsText(coord) AS Coordinates
-- FROM branch_office
	-- LEFT JOIN location ON branch_office.fk_location_id = location.id
-- ORDER BY city;

-- SELECT * FROM getOffices;

-- cars with location
CREATE VIEW getCarsWithLocation AS
SELECT car.id, license_nr, EXTRACT(YEAR FROM CURDATE()) - prod_year AS Age, ps, circuit,
				air_condition, num_seats, num_doors, 
				 car_type, brandname, price_per_day, office_name, AsText(coord) AS Coordinates
FROM car
	LEFT JOIN location ON car.fk_location_id = location.id
    LEFT JOIN branch_office ON location.id = branch_office.fk_location_id
	JOIN model ON car.fk_model_id = model.id
    JOIN brand ON car.fk_brand_id = brand.id
ORDER BY car.id;

-- SELECT * FROM getCarsWithLocation WHERE office_name IS NULL;

-- number of available cars at offices
CREATE VIEW getCarCountAndOffices AS
SELECT branch_office.id, office_name, email, CONCAT('+43 ', phone_nr) AS phone, 
				CONCAT(street, ' ', street_nr) AS Address, 
				CONCAT(district, ' Wien') AS disctrict, AsText(coord) AS Coordinates,
                COUNT(license_nr) AS carcount
FROM branch_office
	LEFT JOIN location ON branch_office.fk_location_id = location.id
	LEFT JOIN  car ON location.id = car.fk_location_id
GROUP BY office_name
ORDER BY district;

-- SELECT * FROM getCarCountAndOffices;
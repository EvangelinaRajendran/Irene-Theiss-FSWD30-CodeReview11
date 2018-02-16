USE cr11_irene_theiss_php_car_rental;

INSERT INTO location (coord)
VALUES
(GeomFromText('POINT(48.2029692 16.389822)')), -- 1
(GeomFromText('POINT(48.202273 16.3712304)')),-- 2
(GeomFromText('POINT(48.2187719 16.3206389)')), -- 3
(GeomFromText('POINT(48.2168139 16.3240224)')), -- 4
(GeomFromText('POINT(48.1804802 16.3442428)')), -- 5
(GeomFromText('POINT(48.1909917 16.3252192)')),-- 6
(GeomFromText('POINT(48.201156 16.3544352)'));-- 7

INSERT INTO branch_office (office_name, email, phone_nr, street, street_nr, district, fk_location_id)
VALUES 
('Office Wien 3', 'carrental_v3@carrental.com', '699/129867', 'Landstraßer Haupstraße', '44' , '1030', 1), -- 1
('Office Wien 1', 'carrental_v1@carrental.com', '699/1298312', 'Kärntner Ring', '7' , '1010', 2), -- 2
('Office Wien 16', 'carrental_gv16@carrental.com', '699/986512', 'Wattgasse', '56' , '1160', 3), -- 3
('Office Wien 7', 'carrental_gv7@carrental.com', '699/999763', 'Lindengasse', '5' , '1070', 7); -- 4

INSERT INTO customer (username, pwd, email, salutation, firstname, lastname, birthdate,
						phone_nr, drivers_license_nr)
VALUES 
('testuser1', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy1@gmx.at', 'Ms', 'Maria', 'Muster', '1970-12-13', '650/676767', '12341234B'), -- 1
 ('testuser2', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy2@gmx.at', 'Mr', 'Herbert', 'Herbst', '1966-04-09',  '676/8654', '43214321A'), -- 2
 ('testuser3', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy3@gmx.at', 'Mrs', 'Ludmilla', 'Lodenmantel', '1993-10-31', '676/098707',  '98769876C'); -- 3

INSERT INTO brand (brandname) VALUES ('VW'); -- 1
INSERT INTO brand (brandname) VALUES ('Opel'); -- 2
INSERT INTO brand (brandname) VALUES ('BMW'); -- 3
INSERT INTO brand (brandname) VALUES ('Tesla'); -- 4

INSERT INTO model (car_type) VALUES ('Limousine'); -- 1
INSERT INTO model (car_type) VALUES ('Kombi'); -- 2
INSERT INTO model (car_type) VALUES ('SUV'); -- 3
INSERT INTO model (car_type) VALUES ('Minibus'); -- 4

INSERT INTO car (license_nr, kilometer_status, ps, circuit, prod_year, air_condition, 
						num_seats, num_doors, price_per_day, fk_model_id ,fk_brand_id, fk_location_id )
VALUES 
('W1234', 12000, 100, 'hand', '2000',  'false', 5, 5, 85.7, 1, 1, 4), -- 1
 ('W4321', 45000, 110, 'automatic', '2010', 'true', 4, 3, 99.7, 2, 2, 5),  -- 2
 ('W9807', 8000, 130, 'hand', '2012',  'true', 5, 5, 105.7, 3, 3, 6), -- 3
 ('W9807', 14000, 100, 'automatic', '2014', 'false', 5, 5, 99.8, 4, 1, 1), -- 4
 ('W7765', 25000, 200, 'automatic', '2015',  'true', 5, 3, 110.8, 1, 3, 2),  -- 5
 ('W2243', 11000, 230, 'hand', '2016', 'true', 5, 5, 210.9, 1, 4, 2), -- 6
('WH765', 7000, 200, 'hand', '2012', 'false', 5, 3, 75.9, 2, 1, 2), -- 7
('WB7Z2', 3700, 180, 'hand', '2002', 'true', 5, 5, 85.9, 3, 4, 1), -- 8
('W54RE', 30000, 140, 'automatic', '2005', 'true', 5, 3, 88.9, 4, 3, 3), -- 9
('W9IG6', 75000, 160, 'hand', '2007', 'true', 5, 5, 99.9, 2, 1, 3),-- 10
('W89ZU', 98200, 180, 'hand', '2011', 'true', 5, 5, 105.9, 3, 2, 7), -- 11
('W44ES', 12700, 120, 'hand', '2009', 'false', 5, 3, 103.9, 4, 3, 7); -- 12

INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date)
VALUES (1, 1, 3, 3, '2018-01-21', '2018-01-22', '09:00', '12:00', NULL); -- 1
INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date)
VALUES (2, 2, 1, 2, '2018-02-02', '2018-02-06', '10:00', '13:00', NULL); -- 2
INSERT INTO reservation (fk_customer_id, fk_car_id, fk_pickup_office_id, fk_return_office_id, pickup_date, return_date, 
						pickup_time, return_time, cancel_date)
VALUES (3, 3, 2, 3, '2018-04-02', '2018-02-07', '08:00', '10:00', NULL); -- 3







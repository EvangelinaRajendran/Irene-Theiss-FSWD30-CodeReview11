DROP DATABASE IF EXISTS cr11_irene_theiss_php_car_rental;

CREATE DATABASE IF NOT EXISTS cr11_irene_theiss_php_car_rental DEFAULT CHARACTER SET utf8;

USE cr11_irene_theiss_php_car_rental;

-- create tables
CREATE TABLE IF NOT EXISTS customer (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    username NVARCHAR(50) NOT NULL UNIQUE,
    pwd NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    salutation ENUM('Ms', 'Mr', 'Mrs'),
    firstname NVARCHAR(55) NOT NULL,
    lastname NVARCHAR(55) NOT NULL,
    birthdate DATE NOT NULL,
	phone_nr NVARCHAR(55),
    drivers_license_nr NVARCHAR(20) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS branch_office (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    office_name NVARCHAR(20) NOT NULL,
    email NVARCHAR(100) NOT NULL,
	phone_nr NVARCHAR(20) NOT NULL,
	street NVARCHAR(100),
    street_nr NVARCHAR(6),
    district NVARCHAR(4),
    fk_location_id INT unsigned NOT NULL,
    CONSTRAINT pk_branch_office PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS reservation (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    fk_customer_id INT unsigned NOT NULL,
    fk_car_id INT unsigned NOT NULL,
    fk_pickup_office_id INT unsigned NOT NULL,
    fk_return_office_id INT unsigned NOT NULL,
    pickup_date DATE NOT NULL,
    return_date DATE NOT NULL,
    pickup_time TIME NOT NULL,
    return_time TIME NOT NULL,
    cancel_date DATE ,
    CONSTRAINT pk_reservation PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS car (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    license_nr NVARCHAR(20) NOT NULL,
    kilometer_status INT unsigned NOT NULL,
    ps INT unsigned NOT NULL,
	circuit ENUM('hand', 'automatic') DEFAULT 'hand',
    prod_year YEAR(4) NOT NULL,
    air_condition ENUM('true', 'false') DEFAULT 'false',
    num_seats TINYINT(10) NOT NULL,
    num_doors TINYINT(5) NOT NULL,
    price_per_day DOUBLE NOT NULL,
    fk_model_id INT unsigned NOT NULL,
	fk_brand_id INT unsigned NOT NULL,
    fk_location_id INT unsigned,
	CONSTRAINT pk_car PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS model (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    car_type NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_model PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS brand (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    brandname NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_brand PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS location (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	coord GEOMETRY NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_location PRIMARY KEY(id)
);

-- create foreign keys
ALTER TABLE reservation
ADD CONSTRAINT fk_reservation_customer
FOREIGN KEY ( fk_customer_id) REFERENCES customer (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation_car
FOREIGN KEY ( fk_car_id) REFERENCES car (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation__branch_office_pickup
FOREIGN KEY ( fk_pickup_office_id) REFERENCES branch_office (id);

ALTER TABLE reservation
ADD CONSTRAINT fk_reservation__branch_office_return
FOREIGN KEY ( fk_return_office_id) REFERENCES branch_office (id);

ALTER TABLE car
ADD CONSTRAINT fk_car_model
FOREIGN KEY ( fk_model_id) REFERENCES model (id);

ALTER TABLE car
ADD CONSTRAINT fk_car_brand
FOREIGN KEY ( fk_brand_id) REFERENCES brand (id);

ALTER TABLE car
ADD CONSTRAINT fk_car_location
FOREIGN KEY ( fk_location_id) REFERENCES location (id);

ALTER TABLE branch_office
ADD CONSTRAINT fk_branch_office__location
FOREIGN KEY ( fk_location_id) REFERENCES location (id);


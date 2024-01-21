use car_services;
DELIMITER //
CREATE PROCEDURE login_user (IN p_username VARCHAR(50), IN p_password VARCHAR(50))
BEGIN
DECLARE v_password VARCHAR(50);
SELECT password INTO v_password FROM login WHERE username = p_username;
IF v_password = p_password THEN
SELECT "Login Successful" as result;
ELSE
SELECT "Please check the username or the password" as result;
END IF;
END //
DELIMITER ;
CALL login_user('DavidLee', 'password123');

DELIMITER //
CREATE PROCEDURE 
create_car(IN p_car_id INT, IN p_customer_id INT, IN p_color VARCHAR(20), IN p_model VARCHAR(50), IN p_fuel_type VARCHAR(20), IN p_mileage INT, IN p_power INT, IN p_car_number VARCHAR(20))
BEGIN
INSERT INTO car (car_id,customer_id, color, model, fuel_type, mileage, powerc, car_number) VALUES (p_car_id,p_customer_id, p_color, p_model, p_fuel_type, p_mileage, p_power, p_car_number);
END//
DELIMITER ;
CALL create_car('21', '17','yellow','m3','petrol','35','15','4569');

DELIMITER //
CREATE PROCEDURE `get_cars_by_customer` (
IN customer_name_in VARCHAR(255))
BEGIN
DECLARE v_customer_id INT;
SELECT customer_id INTO v_customer_id
FROM customer
WHERE customer_name = customer_name_in;
SELECT * FROM car
WHERE customer_id = v_customer_id;
END//
DELIMITER ;

call get_cars_by_customer('David lee');
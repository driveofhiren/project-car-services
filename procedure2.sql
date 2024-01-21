use car_services;
DELIMITER //
CREATE PROCEDURE 
create_car(IN p_car_id INT, IN p_customer_id INT, IN p_color VARCHAR(20), IN p_model VARCHAR(50), IN p_fuel_type VARCHAR(20), IN p_mileage INT, IN p_power INT, IN p_car_number VARCHAR(20))
BEGIN
INSERT INTO car (car_id,customer_id, color, model, fuel_type, mileage, powerc, car_number) VALUES (p_car_id,p_customer_id, p_color, p_model, p_fuel_type, p_mileage, p_power, p_car_number);
END//
DELIMITER ;

CALL create_car('25', '17','red','m3','petrol','2500','1500','GPRS4569');

select * from car
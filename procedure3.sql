use car_services;
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
call get_cars_by_customer('sara');
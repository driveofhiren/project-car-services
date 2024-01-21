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

CALL login_user('David Lee', 'password123');
CALL login_user('sarah', 'password123');
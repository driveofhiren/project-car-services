use car_services;

-- Query 1 
select * from appointment where app_status='scheduled';
select * from appointment where app_status='completed';
select * from appointment where app_status='cancelled';

-- Query 2
select avg(powerc) from car;
select car_id,color,model,powerc,mileage from car where powerc>(select avg(powerc) from car) ;

-- Query 3

SELECT c.customer_id, c.customer_name, ca.color, ca.model, ca.fuel_type, ca.mileage, ca.powerc, ca.car_number
FROM customer c
JOIN car ca ON c.customer_id = ca.customer_id;


use car_services;

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `app_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_employee` varchar(255) DEFAULT NULL,
  `app_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `customera_fk` (`customer_id`),
  CONSTRAINT `customera_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `fuel_type` varchar(255) DEFAULT NULL,
  `mileage` float DEFAULT NULL,
  `powerc` varchar(255) DEFAULT NULL,
  `car_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_mobile` varchar(255) DEFAULT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_username` varchar(255) DEFAULT NULL,
  `recovery_email` varchar(255) DEFAULT NULL,
  `recovery_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `recovery_email` varchar(255) DEFAULT NULL,
  `recovery_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `id` (`id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id`) REFERENCES `owner` (`owner_id`),
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `owner_username` varchar(255) DEFAULT NULL,
  `owner_password` varchar(255) NOT NULL,
  `recovery_email` varchar(255) DEFAULT NULL,
  `recovery_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_customer_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_bill` float DEFAULT NULL,
  `payment_description` varchar(255) DEFAULT NULL,
  `recovery_email` varchar(255) DEFAULT NULL,
  `recovery_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_customer_id` (`payment_customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `service_fees` float DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `customer_fk` (`customer_id`),
  CONSTRAINT `customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `appointment` (`app_id`, `customer_id`, `app_time`, `app_employee`, `app_status`) VALUES
(1, 7, '2023-04-18 05:43:06', 'John Doe', 'Scheduled'),
(2, 16, '2023-04-18 05:43:12', 'Jane Smith', 'Completed'),
(3, 3, '2023-04-18 05:43:19', 'Bob Johnson', 'Cancelled'),
(4, 14, '2023-04-18 05:43:24', 'Sara Lee', 'Scheduled'),
(5, 15, '2023-04-18 05:43:32', 'David Green', 'Scheduled'),
(6, 3, '2023-04-18 05:43:39', 'Emily Brown', 'Completed'),
(7, 13, '2023-04-18 05:47:10', 'Tom Jones', 'Scheduled'),
(8, 17, '2023-04-18 05:47:18', 'Lucy Chen', 'Scheduled'),
(9, 4, '2023-04-18 05:47:28', 'Mike Wang', 'Completed'),
(10, 14, '2023-04-18 05:47:35', 'Karen Kim', 'Scheduled'),
(11, 8, '2023-04-18 05:47:41', 'Alex Lee', 'Scheduled'),
(12, 9, '2023-04-18 05:47:48', 'Olivia Davis', 'Scheduled'),
(13, 10, '2023-04-18 05:47:54', 'Daniel Lee', 'Scheduled'),
(14, 13, '2023-04-18 05:48:02', 'Amy Wu', 'Completed'),
(15, 15, '2023-04-18 05:48:09', 'Steven Chen', 'Scheduled'),
(16, 16, '2023-04-18 05:48:15', 'Grace Kim', 'Scheduled'),
(17, 14, '2023-04-18 05:48:29', 'Timothy Lee', 'Cancelled'),
(18, 15, '2023-04-18 05:48:36', 'Linda Kim', 'Scheduled'),
(19, 17, '2023-04-18 05:48:45', 'Brian Johnson', 'Scheduled'),
(20, 4, '2023-04-18 05:48:52', 'Jessica Lee', 'Scheduled');



INSERT INTO `car` (`car_id`, `customer_id`, `color`, `model`, `fuel_type`, `mileage`, `powerc`, `car_number`) VALUES
(1, 1, 'Red', 'Civic', 'Petrol', 10000, '1500', 'ABCD1234'),
(2, 2, 'Black', 'Corolla', 'Diesel', 20000, '1200', 'PQRS5678'),
(3, 3, 'White', 'City', 'Petrol', 15000, '1200', 'WXYZ4321'),
(4, 4, 'Blue', 'Vitz', 'Petrol', 8000, '1000', 'MNOP9876'),
(5, 5, 'Silver', 'Altis', 'Petrol', 25000, '1800', 'EFGH5678'),
(6, 6, 'Grey', 'Swift', 'Petrol', 12000, '1200', 'IJKL3456'),
(7, 7, 'Black', 'Figo', 'Diesel', 18000, '1500', 'QRST4567'),
(8, 8, 'Red', 'i10', 'Petrol', 9000, '1100', 'VWXY2345'),
(9, 9, 'White', 'Nano', 'Petrol', 5000, '800', 'FGHI7890'),
(10, 10, 'Silver', 'Indica', 'Diesel', 14000, '1200', 'BCDE3456'),
(11, 11, 'Blue', 'Etios', 'Petrol', 17000, '1500', 'LMNO1234'),
(12, 12, 'Black', 'Santro', 'Petrol', 11000, '1000', 'PQRS6789'),
(13, 13, 'White', 'Innova', 'Diesel', 30000, '2500', 'WXYZ9012'),
(14, 14, 'Red', 'Baleno', 'Petrol', 20000, '1400', 'ABCD5678'),
(15, 15, 'Grey', 'Dzire', 'Diesel', 24000, '1300', 'EFGH2345'),
(16, 16, 'Silver', 'Celerio', 'Petrol', 6000, '1000', 'IJKL9012'),
(17, 17, 'Black', 'Ritz', 'Petrol', 13000, '1200', 'MNOP3456'),
(21, 17, 'yellow', 'm3', 'petrol', 35, '15', '4569');

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_mobile`, `customer_password`, `customer_address`, `customer_username`, `recovery_email`, `recovery_phone`) VALUES
(1, 'John Doe', '555-1234', 'password1', '123 Main St', 'johndoe', 'johndoe@example.com', '555-5678'),
(2, 'Jane Doe', '555-5678', 'password2', '456 Elm St', 'janedoe', 'janedoe@example.com', '555-1234'),
(3, 'Bob Smith', '555-9012', 'password3', '789 Oak St', 'bobsmith', 'bobsmith@example.com', '555-3456'),
(4, 'Alice Johnson', '555-2345', 'password4', '321 Pine St', 'alicejohnson', 'alicejohnson@example.com', '555-6789'),
(5, 'Mike Brown', '555-6789', 'password5', '654 Maple St', 'mikebrown', 'mikebrown@example.com', '555-9012'),
(6, 'Sara Lee', '555-3456', 'password6', '987 Cedar St', 'saralee', 'saralee@example.com', '555-2345'),
(7, 'David Lee', '555-7890', 'password7', '654 Walnut St', 'davidlee', 'davidlee@example.com', '555-0123'),
(8, 'Emily Chen', '555-0123', 'password8', '321 Birch St', 'emilychen', 'emilychen@example.com', '555-8901'),
(9, 'James Kim', '555-4567', 'password9', '789 Spruce St', 'jameskim', 'jameskim@example.com', '555-2345'),
(10, 'Jessica Park', '555-8901', 'password10', '987 Elm St', 'jessicapark', 'jessicapark@example.com', '555-4567'),
(11, 'Ryan Nguyen', '555-2345', 'password11', '456 Oak St', 'ryannguyen', 'ryannguyen@example.com', '555-6789'),
(12, 'Rachel Lee', '555-6789', 'password12', '654 Maple St', 'rachellee', 'rachellee@example.com', '555-9012'),
(13, 'Peter Kim', '555-3456', 'password13', '789 Cedar St', 'peterkim', 'peterkim@example.com', '555-2345'),
(14, 'Amy Lee', '555-7890', 'password14', '654 Walnut St', 'amylee', 'amylee@example.com', '555-0123'),
(15, 'Ethan Park', '555-0123', 'password15', '321 Birch St', 'ethanpark', 'ethanpark@example.com', '555-8901'),
(16, 'Sophie Kim', '555-4567', 'password16', '789 Spruce St', 'sophiekim', 'sophiekim@example.com', '555-2345'),
(17, 'Jason Lee', '555-8901', 'password17', '987 Elm St', 'jasonlee', 'jasonlee@example.com', '555-4567');

INSERT INTO `login` (`username`, `password`, `id`, `recovery_email`, `recovery_phone`) VALUES
('alicejohnson', 'password123', 4, 'jimmy_fallon@gmail.com', '1234567890'),
('amylee', 'password123', 14, 'creed_bratton@gmail.com', '1234567890'),
('bobsmith', 'password123', 3, 'tom_smith@gmail.com', '1234567890'),
('David Lee', 'password123', 6, 'jim_david@gmail.com', '1234567890'),
('emilychen', 'password123', 8, 'pam_beesly@gmail.com', '1234567890'),
('ethanpark', 'password123', 15, 'kevin_malone@gmail.com', '1234567890'),
('jameskim', 'password123', 9, 'dwight_schrute@gmail.com', '1234567890'),
('janedoe', 'password123', 2, 'jane_doe@gmail.com', '1234567890'),
('jasonlee', 'password123', 17, 'angela_martin@gmail.com', '1234567890'),
('jessicapark', 'password123', 10, 'michael_scott@gmail.com', '1234567890'),
('johndoe', 'password123', 1, 'john_doe@gmail.com', '1234567890'),
('mikebrown', 'password123', 5, 'conan_obrien@gmail.com', '1234567890'),
('peterkim', 'password123', 13, 'ryan_howard@gmail.com', '1234567890'),
('rachellee', 'password123', 12, 'toby_flenderson@gmail.com', '1234567890'),
('ryannguyen', 'password123', 11, 'andy_bernard@gmail.com', '1234567890'),
('saralee', 'password123', 7, 'jim_halpert@gmail.com', '1234567890'),
('sophiekim', 'password123', 16, 'oscar_martinez@gmail.com', '1234567890');


INSERT INTO `owner` (`owner_id`, `owner_name`, `address`, `contact_no`, `owner_username`, `owner_password`, `recovery_email`, `recovery_phone`) VALUES
(1, 'John Smith', '123 Main St, Anytown USA', '555-1234', 'johnsmith', 'password123', 'johnsmith@gmail.com', '555-4321'),
(2, 'Jane Doe', '456 Elm St, Anytown USA', '555-5678', 'janedoe', 'password456', 'janedoe@yahoo.com', '555-8765'),
(3, 'Bob Johnson', '789 Oak St, Anytown USA', '555-9012', 'bobjohnson', 'password789', 'bobjohnson@hotmail.com', '555-2109'),
(4, 'Mary Jones', '101 Maple St, Anytown USA', '555-3456', 'maryjones', 'password101', 'maryjones@gmail.com', '555-6543'),
(5, 'Samuel Lee', '222 Pine St, Anytown USA', '555-7890', 'samuelle', 'password222', 'samuelle@gmail.com', '555-0987'),
(6, 'Karen Kim', '333 Cedar St, Anytown USA', '555-1234', 'karenkim', 'password333', 'karenkim@gmail.com', '555-4321'),
(7, 'David Brown', '444 Walnut St, Anytown USA', '555-5678', 'davidbrown', 'password444', 'davidbrown@yahoo.com', '555-8765'),
(8, 'Amy Chen', '555 Maple St, Anytown USA', '555-9012', 'amychen', 'password555', 'amychen@hotmail.com', '555-2109'),
(9, 'Steven Chang', '666 Oak St, Anytown USA', '555-3456', 'stevenchang', 'password666', 'stevenchang@gmail.com', '555-6543'),
(10, 'Lucy Liu', '777 Pine St, Anytown USA', '555-7890', 'lucyliu', 'password777', 'lucyliu@gmail.com', '555-0987'),
(11, 'Michael Rodriguez', '888 Cedar St, Anytown USA', '555-1234', 'michaelrodriguez', 'password888', 'michaelrodriguez@gmail.com', '555-4321'),
(12, 'Maria Hernandez', '999 Walnut St, Anytown USA', '555-5678', 'mariahernandez', 'password999', 'mariahernandez@yahoo.com', '555-8765'),
(13, 'James Smith', '1234 Main St, Anytown USA', '555-9012', 'jamessmith', 'password1234', 'jamessmith@hotmail.com', '555-2109'),
(14, 'Emily Johnson', '5678 Elm St, Anytown USA', '555-3456', 'emilyjohnson', 'password5678', 'emilyjohnson@gmail.com', '555-6543'),
(15, 'Charles Davis', '9012 Oak St, Anytown USA', '555-7890', 'charlesdavis', 'password9012', 'charlesdavis@gmail.com', '555-0987'),
(16, 'Jennifer Lee', '3456 Pine St, Anytown USA', '555-1234', 'jenniferlee', 'password3456', 'jenniferlee@gmail.com', '555-4321'),
(17, 'Jessica Kim', '7890 Cedar St, Anytown USA', '555-5678', 'jessicakim', 'password7890', 'jessicakim@yahoo.com', '555-8765');

INSERT INTO `payment` (`payment_id`, `payment_customer_id`, `payment_date`, `payment_bill`, `payment_description`, `recovery_email`, `recovery_phone`) VALUES
(1, 2, '2022-03-01', 1200, 'Car service', 'customer1@gmail.com', '+1234567890'),
(2, 1, '2022-03-02', 500, 'Oil change', 'customer2@gmail.com', '+2345678901'),
(3, 3, '2022-03-03', 800, 'Tire replacement', 'customer3@gmail.com', '+3456789012'),
(4, 4, '2022-03-04', 1500, 'Engine repair', 'customer4@gmail.com', '+4567890123'),
(5, 5, '2022-03-05', 2000, 'Transmission replacement', 'customer5@gmail.com', '+5678901234'),
(6, 6, '2022-03-06', 700, 'Battery replacement', 'customer6@gmail.com', '+6789012345'),
(7, 7, '2022-03-07', 900, 'Car wash and detailing', 'customer7@gmail.com', '+7890123456'),
(8, 8, '2022-03-08', 1200, 'Car service', 'customer8@gmail.com', '+8901234567'),
(9, 9, '2022-03-09', 1000, 'Brake repair', 'customer9@gmail.com', '+9012345678'),
(10, 10, '2022-03-10', 1500, 'Engine tuning', 'customer10@gmail.com', '+0123456789'),
(11, 2, '2022-03-11', 500, 'Oil change', 'customer1@gmail.com', '+1234567890'),
(12, 1, '2022-03-12', 800, 'Tire rotation', 'customer2@gmail.com', '+2345678901'),
(13, 3, '2022-03-13', 1200, 'Car service', 'customer3@gmail.com', '+3456789012'),
(14, 4, '2022-03-14', 1800, 'Transmission repair', 'customer4@gmail.com', '+4567890123'),
(15, 5, '2022-03-15', 1000, 'Brake pad replacement', 'customer5@gmail.com', '+5678901234'),
(16, 6, '2022-03-16', 600, 'Oil change', 'customer6@gmail.com', '+6789012345'),
(17, 7, '2022-03-17', 700, 'Battery replacement', 'customer7@gmail.com', '+7890123456'),
(18, 8, '2022-03-18', 1500, 'Engine repair', 'customer8@gmail.com', '+8901234567'),
(19, 9, '2022-03-19', 800, 'Tire replacement', 'customer9@gmail.com', '+9012345678'),
(20, 10, '2022-03-20', 1200, 'Car service', 'customer10@gmail.com', '+0123456789');

INSERT INTO `service` (`service_id`, `customer_id`, `service_name`, `service_type`, `service_fees`) VALUES
(1, 4, 'Oil Change', 'Maintenance', 50),
(2, 14, 'Brake Service', 'Maintenance', 100),
(3, 3, 'Tire Rotation', 'Maintenance', 40),
(4, 7, 'Battery Replacement', 'Repair', 200),
(5, 8, 'Engine Tune-Up', 'Maintenance', 150),
(6, 15, 'Transmission Fluid Change', 'Maintenance', 100),
(7, 9, 'Wheel Alignment', 'Maintenance', 80),
(8, 2, 'Air Conditioning Service', 'Maintenance', 120),
(9, 17, 'Suspension Repair', 'Repair', 300),
(10, 10, 'Exhaust System Repair', 'Repair', 250),
(11, 1, 'Radiator Flush', 'Maintenance', 80),
(12, 5, 'Fuel System Cleaning', 'Maintenance', 90),
(13, 13, 'Spark Plug Replacement', 'Maintenance', 70),
(14, 12, 'Timing Belt Replacement', 'Repair', 400),
(15, 11, 'Head Gasket Replacement', 'Repair', 600),
(16, 6, 'Coolant System Service', 'Maintenance', 100),
(17, 16, 'Power Steering Fluid Service', 'Maintenance', 70),
(18, 1, 'Ignition System Repair', 'Repair', 200),
(19, 16, 'Catalytic Converter Replacement', 'Repair', 500),
(20, 12, 'Wheel Bearing Replacement', 'Repair', 350);
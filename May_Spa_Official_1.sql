CREATE TABLE `Customers` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100),
  `email` varchar(100),
  `phone_number` varchar(20),
  `address` varchar(255),
  `gender` ENUM ('Male', 'Female', 'Others'),
  `dob` date,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `Accounts` (
  `customer_id` int PRIMARY KEY,
  `username` varchar(50),
  `password` varchar(50),
  `OTP` varchar(6),
  `OTP_expired` datetime,
  `access_token` varchar(255),
  `created_at` datetime,
  `updated_at` datetime,
);

CREATE TABLE `Admins` (
  `username` varchar(50) PRIMARY KEY,
  `password` varchar(50),
  `OTP` varchar(6),
  `OTP_expired` datetime,
  `access_token` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `SpaStaff` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100),
  `gender` ENUM ('Male', 'Female', 'Others'),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `Services` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `price` float(10),
  `isDisplayed` boolean,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `Jobs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `staff_id` int,
  `services_id` int
);

CREATE TABLE `Schedules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `staff_id` int,
  `service_id` int,
  `start_time` datetime,
  `end_time` datetime,
  `cus_qty` int,
  `cus_qty_booked` int,
  `is_booked` boolean,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `Feedback` (
  `id` int PRIMARY KEY,
  `booking_id` int,
  `content` varchar(255),
  `created_at` datetime
);

CREATE TABLE `Bookings` (
  `id` int PRIMARY KEY,
  `customer_id` int,
  `schedule_id` int,
  `booking_date` datetime,
  `is_payed` boolean,
  `payment_method` ENUM ('cash', 'ATM card'),
  `payed_date` datetime
);

ALTER TABLE `Accounts` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`id`);

ALTER TABLE `Bookings` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`);

ALTER TABLE `Schedules` ADD FOREIGN KEY (`staff_id`) REFERENCES `SpaStaff` (`id`);

ALTER TABLE `Bookings` ADD FOREIGN KEY (`schedule_id`) REFERENCES `Schedules` (`id`);

ALTER TABLE `Schedules` ADD FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`);

ALTER TABLE `SpaStaff` ADD FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`staff_id`) REFERENCES `SpaStaff` (`id`);

ALTER TABLE `Schedules` ADD FOREIGN KEY (`staff_id`, `service_id`) REFERENCES `Jobs` (`staff_id`, `service_id`)

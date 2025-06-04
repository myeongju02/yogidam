CREATE TABLE `users` (
  `id` varchar(25) PRIMARY KEY,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(25) NOT NULL,
  `point` int,
  `email` varchar(100) UNIQUE NOT NULL,
  `birth` date NOT NULL,
  `profile` varchar(255),
  `profiletitle` varchar(25),
  `role` VARCHAR(50) NOT NULL
);

CREATE TABLE `plans` (
  `plan_id` varchar(25) PRIMARY KEY,
  `user_id` varchar(25) NOT NULL,
  `title` varchar(100) NOT NULL,
  `start_date` date,
  `end_date` date,
  `created_at` datetime,
  `memo` text
);

CREATE TABLE `attractions` (
  `attraction_id` varchar(50) PRIMARY KEY,
  `title` varchar(200) NOT NULL,
  `addr1` varchar(255),
  `addr2` varchar(255),
  `areacode` varchar(20),
  `booktour` varchar(10),
  `cat1` varchar(20),
  `cat2` varchar(20),
  `cat3` varchar(20),
  `contenttypeid` varchar(20),
  `createdtime` varchar(30),
  `firstimage` varchar(255),
  `firstimage2` varchar(255),
  `cpyrhtDivCd` varchar(20),
  `mapx` varchar(50),
  `mapy` varchar(50),
  `mlevel` varchar(10),
  `modifiedtime` varchar(30),
  `sigungucode` varchar(20),
  `tel` varchar(50)
);

CREATE TABLE `plan_attractions` (
  `plan_attraction_id` varchar(25) PRIMARY KEY,
  `plan_id` varchar(25) NOT NULL,
  `attraction_id` varchar(25) NOT NULL,
  `visit_date` date,
  `visit_order` int,
  `memo` text
);

CREATE TABLE `missions` (
  `mission_id` varchar(25) PRIMARY KEY,
  `attraction_id` varchar(25) NOT NULL,
  `type` varchar(25),
  `description` varchar(255),
  `value` varchar(25)
);

CREATE TABLE `user_missions` (
  `user_mission_id` varchar(25) PRIMARY KEY,
  `user_id` varchar(25) NOT NULL,
  `mission_id` varchar(25) NOT NULL,
  `attraction_id` varchar(25) NOT NULL,
  `status` varchar(25),
  `proof` varchar(255),
  `completed` datetime
);

CREATE TABLE `rewards` (
  `reward_id` varchar(25) PRIMARY KEY,
  `user_id` varchar(25) NOT NULL,
  `type` varchar(50),
  `value` varchar(25),
  `acquired` datetime
);

ALTER TABLE `plans` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `plan_attractions` ADD FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`);

ALTER TABLE `plan_attractions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

ALTER TABLE `missions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

ALTER TABLE `user_missions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_missions` ADD FOREIGN KEY (`mission_id`) REFERENCES `missions` (`mission_id`);

ALTER TABLE `user_missions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

ALTER TABLE `rewards` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

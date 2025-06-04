USE yogidam;

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
  `plan_id` varchar(40) PRIMARY KEY,
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
  `plan_attraction_id` varchar(40) PRIMARY KEY,
  `plan_id` varchar(40) NOT NULL,
  `attraction_id` varchar(40) NOT NULL,
  `visit_date` date,
  `visit_order` int,
  `memo` text
);
ALTER TABLE plan_attractions ADD COLUMN image_url VARCHAR(1025);

-- 챌린지 종류
CREATE TABLE `missions` (
  `mission_id` varchar(25) PRIMARY KEY, -- 나만의 감성 사진 등
  -- `attraction_id` varchar(25) NOT NULL, 
	`type` INT, -- 챌린지 번호(user_mission join용)
  `description` varchar(255), -- 해당 챌린지에 대한 설명
  `value` INT -- 해당 챌린지 완료 시, 얻는 포인트 값
);

-- 챌린지 별 세부내용(진척도 등..)
-- 스탬프 챌린지
CREATE TABLE `stamp_missions` (
  `user_mission_id`INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- 순서
  `user_id` varchar(25) NOT NULL, -- 회원 아이디
  `type` INT NOT NULL, -- missions의 type
  `place` varchar(25) NOT NULL,
  `content` varchar(25) NOT NULL,
  `proof` varchar(1024), -- 사진 url
  `completed` datetime -- 완료 일시
);

CREATE TABLE `rewards` (
  `reward_id` varchar(25) PRIMARY KEY,
  `user_id` varchar(25) NOT NULL,
  `type` varchar(50),
  `value` varchar(25),
  `acquired` datetime
);


CREATE TABLE `board` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NOT NULL,
  `author` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NOT NULL,
`category` VARCHAR(100),
	`images` TEXT,
	`files` TEXT
);

CREATE TABLE `board_comment` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `board_id` INT NOT NULL,
    `author` VARCHAR(50) NOT NULL,
    `content` TEXT NOT NULL,
    `parent_id` INT DEFAULT NULL,   
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`board_id`) REFERENCES `board`(`id`) ON DELETE CASCADE
);
ALTER TABLE `board_comment`
  ADD CONSTRAINT `fk_parent_comment`
  FOREIGN KEY (`parent_id`) REFERENCES `board_comment`(`id`) ON DELETE CASCADE;



ALTER TABLE `plans` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `plan_attractions` ADD FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`);

ALTER TABLE `plan_attractions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

ALTER TABLE `missions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

-- ALTER TABLE `user_missions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

-- ALTER TABLE `user_missions` ADD FOREIGN KEY (`mission_id`) REFERENCES `missions` (`mission_id`);

-- ALTER TABLE `user_missions` ADD FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`);

ALTER TABLE `rewards` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

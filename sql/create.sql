grant all privileges on speakit.* to speakit@localhost identified by 'atamishi';

CREATE SCHEMA IF NOT EXISTS `speakit`;
USE `speakit` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tweet`
-- -----------------------------------------------------
DROP TABLE `speakit`.`user`;
CREATE  TABLE IF NOT EXISTS `speakit`.`user` (
  `user_id` VARCHAR(10) NOT NULL ,
  `password` TEXT NULL ,
  `mail` VARCHAR(200) NOT NULL unique,
  `active` integer default 1,
  `create_at` timestamp,
   PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

DROP TABLE `speakit`.`mailauth`;
CREATE  TABLE IF NOT EXISTS `speakit`.`mailauth` (
  `mail` VARCHAR(200) NOT NULL,
  `key` CHAR(32) NOT NULL unique,
  `create_at` timestamp)
ENGINE = InnoDB;




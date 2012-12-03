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
  `key` CHAR(32) NOT NULL unique,
  `active` integer ,
  `create_at` DATETIME NULL ,
   PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

insert into speakit.user values('test','test','test@hogehoge.com','123456789012345678901234567890',0,current_date);



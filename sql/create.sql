grant all privileges on speakit.* to speakit@localhost identified by 'atamishi';

CREATE SCHEMA IF NOT EXISTS `speakit`;
USE `speakit` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tweet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `speakit`.`user` (
  `user_id` VARCHAR(10) NOT NULL ,
  `password` TEXT NULL ,
  `mail` TEXT NULL ,
  `create_at` DATETIME NULL ,
   PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

insert into speakit.user values('test','test','test@hogehoge.com',current_date);



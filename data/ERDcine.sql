-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Cine` ;

-- -----------------------------------------------------
-- Table `Cine`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`actors` (
  `actor_id` BIGINT NOT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `full_names` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cine`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`category` (
  `category_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cine`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`language` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cine`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`film` (
  `film_id` BIGINT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `language_id` BIGINT NULL DEFAULT NULL,
  `original_language_id` DOUBLE NULL DEFAULT NULL,
  `rental_duration` BIGINT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` BIGINT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `languageFK_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `languageFK`
    FOREIGN KEY (`language_id`)
    REFERENCES `Cine`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cine`.`filmactor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`filmactor` (
  `actor_id` BIGINT NULL DEFAULT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  INDEX `actorFK_idx` (`actor_id` ASC) VISIBLE,
  INDEX `filmFK_idx` (`film_id` ASC) VISIBLE,
  INDEX `categoryFK_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `actorFK`
    FOREIGN KEY (`actor_id`)
    REFERENCES `Cine`.`actors` (`actor_id`),
  CONSTRAINT `categoryFK`
    FOREIGN KEY (`category_id`)
    REFERENCES `Cine`.`category` (`category_id`),
  CONSTRAINT `filmFK`
    FOREIGN KEY (`film_id`)
    REFERENCES `Cine`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cine`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`inventory` (
  `inventory_id` BIGINT NOT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `store_id` BIGINT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `inventoryFK_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `inventoryFK`
    FOREIGN KEY (`film_id`)
    REFERENCES `Cine`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
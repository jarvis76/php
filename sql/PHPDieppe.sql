-- MySQL Script generated by MySQL Workbench
-- Thu Apr  5 15:31:09 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PHPDieppe` DEFAULT CHARACTER SET utf8 ;
USE `PHPDieppe` ;

-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ROLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ROLES` (
  `ID_ROLE` INT NOT NULL AUTO_INCREMENT,
  `ROLLABEL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_ROLE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_USERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_USERS` (
  `ID_USERS` INT NOT NULL AUTO_INCREMENT,
  `USENAME` VARCHAR(45) NOT NULL,
  `USEFIRSTNAME` VARCHAR(80) NULL,
  `USEMAIL` VARCHAR(160) NOT NULL,
  `USEPASSWORD` CHAR(40) NOT NULL,
  `ID_ROLE` INT NOT NULL,
  PRIMARY KEY (`ID_USERS`, `ID_ROLE`),
  INDEX `fk_T_USERS_T_ROLES_idx` (`ID_ROLE` ASC),
  CONSTRAINT `fk_T_USERS_T_ROLES`
    FOREIGN KEY (`ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_ROLES` (`ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ARTICLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ARTICLES` (
  `ID_ARTICLES` INT NOT NULL AUTO_INCREMENT,
  `ARTTITLE` VARCHAR(200) NOT NULL,
  `ARTCHAPO` VARCHAR(200) NULL,
  `ARTCONTENT` TEXT NOT NULL,
  `ARTDATETIME` DATETIME NULL,
  `T_USERS_ID_USERS` INT NOT NULL,
  `T_USERS_ID_ROLE` INT NOT NULL,
  PRIMARY KEY (`ID_ARTICLES`, `T_USERS_ID_USERS`, `T_USERS_ID_ROLE`),
  INDEX `fk_T_ARTICLES_T_USERS1_idx` (`T_USERS_ID_USERS` ASC, `T_USERS_ID_ROLE` ASC),
  CONSTRAINT `fk_T_ARTICLES_T_USERS1`
    FOREIGN KEY (`T_USERS_ID_USERS` , `T_USERS_ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_USERS` (`ID_USERS` , `ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_CATEGORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_CATEGORIES` (
  `ID_CATEGORIES` INT NOT NULL AUTO_INCREMENT,
  `CATLABEL` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ARTICLES_has_T_CATEGORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ARTICLES_has_T_CATEGORIES` (
  `T_ARTICLES_ID_ARTICLES` INT NOT NULL,
  `T_ARTICLES_T_USERS_ID_USERS` INT NOT NULL,
  `T_ARTICLES_T_USERS_ID_ROLE` INT NOT NULL,
  `T_CATEGORIES_ID_CATEGORIES` INT NOT NULL,
  PRIMARY KEY (`T_ARTICLES_ID_ARTICLES`, `T_ARTICLES_T_USERS_ID_USERS`, `T_ARTICLES_T_USERS_ID_ROLE`, `T_CATEGORIES_ID_CATEGORIES`),
  INDEX `fk_T_ARTICLES_has_T_CATEGORIES_T_CATEGORIES1_idx` (`T_CATEGORIES_ID_CATEGORIES` ASC),
  INDEX `fk_T_ARTICLES_has_T_CATEGORIES_T_ARTICLES1_idx` (`T_ARTICLES_ID_ARTICLES` ASC, `T_ARTICLES_T_USERS_ID_USERS` ASC, `T_ARTICLES_T_USERS_ID_ROLE` ASC),
  CONSTRAINT `fk_T_ARTICLES_has_T_CATEGORIES_T_ARTICLES1`
    FOREIGN KEY (`T_ARTICLES_ID_ARTICLES` , `T_ARTICLES_T_USERS_ID_USERS` , `T_ARTICLES_T_USERS_ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_ARTICLES` (`ID_ARTICLES` , `T_USERS_ID_USERS` , `T_USERS_ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_ARTICLES_has_T_CATEGORIES_T_CATEGORIES1`
    FOREIGN KEY (`T_CATEGORIES_ID_CATEGORIES`)
    REFERENCES `PHPDieppe`.`T_CATEGORIES` (`ID_CATEGORIES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

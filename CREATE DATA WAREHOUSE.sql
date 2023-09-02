-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema data_warehouse
-- -----------------------------------------------------
-- star schema data warehouse for Buisness Intelligence

-- -----------------------------------------------------
-- Schema data_warehouse
--
-- star schema data warehouse for Buisness Intelligence
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data_warehouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `data_warehouse` ;

-- -----------------------------------------------------
-- Table `data_warehouse`.`dim_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_warehouse`.`dim_product` (
  `PK_productId` INT NOT NULL AUTO_INCREMENT,
  `stockCode` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL DEFAULT 'No Description',
  `supplier` INT NOT NULL,
  `unitPrice` DECIMAL(10,2) NOT NULL COMMENT 'Price of item per unit\n',
  `effectiveDate` DATE NOT NULL,
  `isCurrent` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`PK_productId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_warehouse`.`dim_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_warehouse`.`dim_time` (
  `PK_timeSurrogate` INT NOT NULL AUTO_INCREMENT COMMENT 'surrogate key to link to transaction\n',
  `year` INT NOT NULL,
  `month` VARCHAR(3) NOT NULL,
  `day` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`PK_timeSurrogate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_warehouse`.`dim_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_warehouse`.`dim_customer` (
  `PK_customerSurrogate` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT(3) NOT NULL,
  `gender` VARCHAR(7) NOT NULL,
  `past_3_years_bike_related_purchases` INT NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `jobTitle` VARCHAR(45) NOT NULL,
  `jobIndustry` VARCHAR(45) NOT NULL,
  `wealthSegment` VARCHAR(45) NOT NULL,
  `ownsCar` VARCHAR(3) NOT NULL,
  `tenure` TINYINT(2) NOT NULL DEFAULT 0,
  `customerId` INT(8) NOT NULL,
  `effectiveDate` DATE NOT NULL,
  `isCurrent` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`PK_customerSurrogate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_warehouse`.`dim_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_warehouse`.`dim_country` (
  `PK_countryId` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`PK_countryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_warehouse`.`fact_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_warehouse`.`fact_transaction` (
  `transactionId` INT NOT NULL AUTO_INCREMENT,
  `invoiceNo` VARCHAR(7) NOT NULL,
  `quantity` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `FK_customerSurrogate` INT NOT NULL,
  `FK_timeSurrogate` INT NOT NULL COMMENT 'when the transaction occured\n',
  `FK_productId` INT NOT NULL,
  `FK_countryId` INT NOT NULL,
  INDEX `FK_product_idx` (`FK_productId` ASC) VISIBLE,
  INDEX `FK_time_idx` (`FK_timeSurrogate` ASC) VISIBLE,
  PRIMARY KEY (`transactionId`),
  INDEX `FK_country_idx` (`FK_countryId` ASC) VISIBLE,
  INDEX `FK_customer_idx` (`FK_customerSurrogate` ASC) VISIBLE,
  CONSTRAINT `FK_product`
    FOREIGN KEY (`FK_productId`)
    REFERENCES `data_warehouse`.`dim_product` (`PK_productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_time`
    FOREIGN KEY (`FK_timeSurrogate`)
    REFERENCES `data_warehouse`.`dim_time` (`PK_timeSurrogate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_customer`
    FOREIGN KEY (`FK_customerSurrogate`)
    REFERENCES `data_warehouse`.`dim_customer` (`PK_customerSurrogate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_country`
    FOREIGN KEY (`FK_countryId`)
    REFERENCES `data_warehouse`.`dim_country` (`PK_countryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
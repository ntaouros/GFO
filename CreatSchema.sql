SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema GFO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GFO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GFO` DEFAULT CHARACTER SET utf8 ;
USE `GFO` ;

-- -----------------------------------------------------
-- Table `GFO`.`Goal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Goal` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Goal` (
  `Goalid` INT NOT NULL,
  `Description` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`Goalid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Client` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Client` (
  `Username` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `Firstname` VARCHAR(20) NOT NULL,
  `Lastname` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Mobile` VARCHAR(13) NOT NULL,
  `Weight` float(1) NOT NULL,
  `Height` float(1) NOT NULL,
  `Feedback` VARCHAR(45) NULL,
  `Goal_Goalid` INT NOT NULL,
  PRIMARY KEY (`Username`),
  INDEX `fk_Client_Goal1_idx` (`Goal_Goalid` ASC),
  CONSTRAINT `fk_Client_Goal1`
    FOREIGN KEY (`Goal_Goalid`)
    REFERENCES `GFO`.`Goal` (`Goalid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Visit` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Visit` (
  `visitDate` DATETIME NOT NULL,
  `Client_Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`visitDate`, `Client_Username`),
  INDEX `fk_Visit_Client_idx` (`Client_Username` ASC),
  CONSTRAINT `fk_Visit_Client`
    FOREIGN KEY (`Client_Username`)
    REFERENCES `GFO`.`Client` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Employee` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Employee` (
  `Username` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Firstname` VARCHAR(45) NOT NULL,
  `Lastname` VARCHAR(45) NOT NULL,
  `Mobile` VARCHAR(13) NOT NULL,
  `Start_Shift` TIME NOT NULL,
  `End_Shift` TIME NOT NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Product` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Product` (
  `Productid` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Price` float(2) NOT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Productid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Purchase` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Purchase` (
  `Purchaseid` INT NOT NULL,
  `PuchaseDate` DATETIME NOT NULL,
  `Client_Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Purchaseid`),
  INDEX `fk_Purchase_Client1_idx` (`Client_Username` ASC),
  CONSTRAINT `fk_Purchase_Client1`
    FOREIGN KEY (`Client_Username`)
    REFERENCES `GFO`.`Client` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Exercise` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Exercise` (
  `Exerciseid` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Calories` INT NOT NULL,
  PRIMARY KEY (`Exerciseid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Client_Exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Client_Exercise` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Client_Exercise` (
  `Client_Username` VARCHAR(20) NOT NULL,
  `Exercise_Exerciseid` INT NOT NULL,
  `Sets` INT NOT NULL,
  `Reps` INT NOT NULL,
  `Weight` DOUBLE ,
  `Duration` DOUBLE ,
  `ExerciseDate` DATETIME NOT NULL,
  PRIMARY KEY (`Client_Username`, `Exercise_Exerciseid`, `ExerciseDate`),
  INDEX `fk_Client_has_Exercise_Exercise1_idx` (`Exercise_Exerciseid` ASC),
  INDEX `fk_Client_has_Exercise_Client1_idx` (`Client_Username` ASC),
  CONSTRAINT `fk_Client_has_Exercise_Client1`
    FOREIGN KEY (`Client_Username`)
    REFERENCES `GFO`.`Client` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_has_Exercise_Exercise1`
    FOREIGN KEY (`Exercise_Exerciseid`)
    REFERENCES `GFO`.`Exercise` (`Exerciseid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Purchase_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Purchase_Product` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Purchase_Product` (
  `Purchase_Purchaseid` INT NOT NULL,
  `Product_Productid` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`Purchase_Purchaseid`, `Product_Productid`),
  INDEX `fk_Purchase_has_Product_Product1_idx` (`Product_Productid` ASC),
  INDEX `fk_Purchase_has_Product_Purchase1_idx` (`Purchase_Purchaseid` ASC),
  CONSTRAINT `fk_Purchase_has_Product_Purchase1`
    FOREIGN KEY (`Purchase_Purchaseid`)
    REFERENCES `GFO`.`Purchase` (`Purchaseid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_has_Product_Product1`
    FOREIGN KEY (`Product_Productid`)
    REFERENCES `GFO`.`Product` (`Productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Rate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Rate` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Rate` (
  `Client_Username` VARCHAR(20) NOT NULL,
  `Product_Productid` INT NOT NULL,
  `Rate` INT NOT NULL,
  `Comment` VARCHAR(100) NULL,
  PRIMARY KEY (`Client_Username`, `Product_Productid`),
  INDEX `fk_Client_has_Product_Product1_idx` (`Product_Productid` ASC),
  INDEX `fk_Client_has_Product_Client1_idx` (`Client_Username` ASC),
  CONSTRAINT `fk_Client_has_Product_Client1`
    FOREIGN KEY (`Client_Username`)
    REFERENCES `GFO`.`Client` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_has_Product_Product1`
    FOREIGN KEY (`Product_Productid`)
    REFERENCES `GFO`.`Product` (`Productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Plan` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Plan` (
  `PlanId` INT NOT NULL,
  `PlanName` VARCHAR(45) NULL,
  `Employee_Username` VARCHAR(20) NOT NULL,
  `Goal_Goalid` INT NOT NULL,
  PRIMARY KEY (`PlanId`, `Goal_Goalid`),
  INDEX `fk_Plan_Employee1_idx` (`Employee_Username` ASC),
  INDEX `fk_Plan_Goal1_idx` (`Goal_Goalid` ASC),
  CONSTRAINT `fk_Plan_Employee1`
    FOREIGN KEY (`Employee_Username`)
    REFERENCES `GFO`.`Employee` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plan_Goal1`
    FOREIGN KEY (`Goal_Goalid`)
    REFERENCES `GFO`.`Goal` (`Goalid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Part` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Part` (
  `PartId` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Plan_PlanId` INT NOT NULL,
  `Ex_Rest` INT NOT NULL,
  PRIMARY KEY (`PartId`),
  INDEX `fk_Part_Plan1_idx` (`Plan_PlanId` ASC),
  CONSTRAINT `fk_Part_Plan1`
    FOREIGN KEY (`Plan_PlanId`)
    REFERENCES `GFO`.`Plan` (`PlanId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GFO`.`Exercise_Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Exercise_Part` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Exercise_Part` (
  `Exercise_Exerciseid` INT NOT NULL,
  `Part_PartId` INT NOT NULL,
  `Set_Rest` INT NOT NULL,
  `Sets` INT NOT NULL,
  `Reps` INT NOT NULL,
  `Weight` float(2) NULL,
  `Duration` INT NULL,
  PRIMARY KEY (`Exercise_Exerciseid`, `Part_PartId`),
  INDEX `fk_Exercise_has_Part_Part1_idx` (`Part_PartId` ASC),
  INDEX `fk_Exercise_has_Part_Exercise1_idx` (`Exercise_Exerciseid` ASC),
  CONSTRAINT `fk_Exercise_has_Part_Exercise1`
    FOREIGN KEY (`Exercise_Exerciseid`)
    REFERENCES `GFO`.`Exercise` (`Exerciseid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exercise_has_Part_Part1`
    FOREIGN KEY (`Part_PartId`)
    REFERENCES `GFO`.`Part` (`PartId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `GFO`.`Measure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GFO`.`Measure` ;

CREATE TABLE IF NOT EXISTS `GFO`.`Measure` (
  `measure_date` DATETIME NOT NULL,
  `weight` float(1) NOT NULL,
  `fat_percentage` float(1) NOT NULL,
  `Client_Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`measure_date`, `Client_Username`),
  INDEX `fk_Measure_Client1_idx` (`Client_Username` ASC),
  CONSTRAINT `fk_Measure_Client1`
    FOREIGN KEY (`Client_Username`)
    REFERENCES `GFO`.`Client` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Fri Nov  8 10:53:06 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dev
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dev
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dev` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `dev` ;

-- -----------------------------------------------------
-- Table `dev`.`Professors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Professors` ;

CREATE TABLE IF NOT EXISTS `dev`.`Professors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(15) NOT NULL,
  `researchInterests` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`OfficeHours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`OfficeHours` ;

CREATE TABLE IF NOT EXISTS `dev`.`OfficeHours` (
  `Professors_id` INT NOT NULL,
  `ohroom` VARCHAR(45) NOT NULL,
  `ohday` VARCHAR(45) NOT NULL,
  `ohtime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Professors_id`),
  INDEX `fk_OfficeHours_Professors_idx` (`Professors_id` ASC),
  CONSTRAINT `fk_OfficeHours_Professors`
    FOREIGN KEY (`Professors_id`)
    REFERENCES `dev`.`Professors` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Courses` ;

CREATE TABLE IF NOT EXISTS `dev`.`Courses` (
  `dept` VARCHAR(5) NOT NULL,
  `courseNum` INT NOT NULL,
  `termsOffered` SET('F', 'W', 'SP', 'SU') NOT NULL,
  `units` TINYINT NOT NULL,
  `courseName` VARCHAR(255) NOT NULL,
  `prerequisite` TEXT NOT NULL,
  `concurrent` VARCHAR(45) NOT NULL,
  `corequisite` VARCHAR(45) NOT NULL,
  `recommended` VARCHAR(45) NOT NULL,
  `crossListedAs` VARCHAR(45) NOT NULL,
  `shortNames` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dept`, `courseNum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`PolyRatings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`PolyRatings` ;

CREATE TABLE IF NOT EXISTS `dev`.`PolyRatings` (
  `id` INT NOT NULL,
  `avgRating` REAL NOT NULL,
  `numRatings` INT NOT NULL,
  `Professors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PolyRatings_Professors1_idx` (`Professors_id` ASC),
  CONSTRAINT `fk_PolyRatings_Professors1`
    FOREIGN KEY (`Professors_id`)
    REFERENCES `dev`.`Professors` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`Clubs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Clubs` ;

CREATE TABLE IF NOT EXISTS `dev`.`Clubs` (
  `idClubs` INT NOT NULL AUTO_INCREMENT,
  `types` VARCHAR(255) NOT NULL,
  `desc` TEXT NOT NULL,
  `contactEmail` VARCHAR(45) NOT NULL,
  `contactEmail2` VARCHAR(45) NOT NULL,
  `contactPerson` VARCHAR(45) NOT NULL,
  `contactPhone` VARCHAR(15) NOT NULL,
  `box` VARCHAR(45) NOT NULL,
  `advisorId` INT NOT NULL,
  `affiliation` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idClubs`),
  INDEX `fk_Clubs_Professors1_idx` (`advisorId` ASC),
  CONSTRAINT `fk_Clubs_Professors1`
    FOREIGN KEY (`advisorId`)
    REFERENCES `dev`.`Professors` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`QuestionAnswerFormats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`QuestionAnswerFormats` ;

CREATE TABLE IF NOT EXISTS `dev`.`QuestionAnswerFormats` (
  `idQuestionFormats` INT NOT NULL,
  `questionFormat` VARCHAR(255) NULL,
  `answerFormat` VARCHAR(255) NULL,
  PRIMARY KEY (`idQuestionFormats`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`Corequisites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Corequisites` ;

CREATE TABLE IF NOT EXISTS `dev`.`Corequisites` (
  `courseId` INT NOT NULL,
  `coreqCourse` INT NULL,
  PRIMARY KEY (`courseId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`ShortNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`ShortNames` ;

CREATE TABLE IF NOT EXISTS `dev`.`ShortNames` (
  `courseId` INT NOT NULL,
  `shortName` INT NULL,
  PRIMARY KEY (`courseId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`Prerequisites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Prerequisites` ;

CREATE TABLE IF NOT EXISTS `dev`.`Prerequisites` (
  `courseId` INT NOT NULL,
  `prereqCourse` INT NULL,
  PRIMARY KEY (`courseId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev`.`Corrections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dev`.`Corrections` ;

CREATE TABLE IF NOT EXISTS `dev`.`Corrections` (
  `correctionId` INT NOT NULL,
  `text` VARCHAR(45) NULL,
  PRIMARY KEY (`correctionId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dev`.`Professors`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`Professors` (`id`, `firstName`, `lastName`, `phoneNumber`, `researchInterests`, `email`) VALUES (1, 'Foaad', 'Khosmood', '805-756-2911', 'Artificial Intelligence, Data Mining, Games and Interactive Entertainment, Internet of Things, Natural Language Processing, Systems, Web Engineering', 'foaad@calpoly.edu');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`OfficeHours`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`OfficeHours` (`Professors_id`, `ohroom`, `ohday`, `ohtime`) VALUES (1, '14-213', 'NA', 'NA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`Courses`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`Courses` (`dept`, `courseNum`, `termsOffered`, `units`, `courseName`, `prerequisite`, `concurrent`, `corequisite`, `recommended`, `crossListedAs`, `shortNames`) VALUES ('CPE', 357, 'F,W,SP', 4, 'CPE 357. Systems Programming.', 'CSC/CPE 102 and CSC/CPE 103 with a grade of C- or better or consent of instructor, or CSC/CPE 202 and CSC/CPE 203 with a grade of C- or better or consent of instructor; and CSC 225 or CPE/EE 229 or CPE/EE 233.', 'NA', 'NA', 'NA', 'CSC 357', '357');
INSERT INTO `dev`.`Courses` (`dept`, `courseNum`, `termsOffered`, `units`, `courseName`, `prerequisite`, `concurrent`, `corequisite`, `recommended`, `crossListedAs`, `shortNames`) VALUES ('CSC', 357, 'F,W,SP', 4, 'CSC 357. Systems Programming.', 'CSC/CPE 102 and CSC/CPE 103 with a grade of C- or better or consent of instructor, or CSC/CPE 202 and CSC/CPE 203 with a grade of C- or better or consent of instructor; and CSC 225 or CPE/EE 229 or CPE/EE 233.', 'NA', 'NA', 'NA', 'CPE 357', '357');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`PolyRatings`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`PolyRatings` (`id`, `avgRating`, `numRatings`, `Professors_id`) VALUES (1, 2.53, 15, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`Clubs`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`Clubs` (`idClubs`, `types`, `desc`, `contactEmail`, `contactEmail2`, `contactPerson`, `contactPhone`, `box`, `advisorId`, `affiliation`) VALUES (1, 'Professional', 'To promote the academic and professional success of historically underrepresented minorities in tech, with an emphasis on students who identify as Black, Latinx, or Native American at Cal Poly.', 'sibssa@calpoly.edu', 'pres.colorcoded@gmail.com', 'Simon Ibssa', '8057562911', '195', 1, 'NA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`QuestionAnswerFormats`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`QuestionAnswerFormats` (`idQuestionFormats`, `questionFormat`, `answerFormat`) VALUES (1, 'where is {professor} office?', '{professor} office is at {building_name} {bld}-{rm}');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dev`.`Corrections`
-- -----------------------------------------------------
START TRANSACTION;
USE `dev`;
INSERT INTO `dev`.`Corrections` (`correctionId`, `text`) VALUES (1, 'Actually, the sky is blue not green.');

COMMIT;


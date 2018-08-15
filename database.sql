-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema takt_v2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema takt_v2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `takt_v2` DEFAULT CHARACTER SET utf8 ;
USE `takt_v2` ;

-- -----------------------------------------------------
-- Table `takt_v2`.`heartbeatstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`heartbeatstatus` (
  `idHeartBeatStatus` INT(11) NOT NULL AUTO_INCREMENT,
  `nameHeartBeatStatus` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idHeartBeatStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`macroproccess`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`macroproccess` (
  `idmacroProccess` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idmacroProccess`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontract` (
  `idMicroContract` INT(11) NOT NULL AUTO_INCREMENT,
  `idMacroProccess` INT(11) NOT NULL,
  `workDescription` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idMicroContract`),
  INDEX `workPackageFkProjectId_idx` (`idMacroProccess` ASC),
  CONSTRAINT `microContractFKidMacroProccess`
    FOREIGN KEY (`idMacroProccess`)
    REFERENCES `takt_v2`.`macroproccess` (`idmacroProccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontractinstancestate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontractinstancestate` (
  `idMicroContractInstanceState` INT(11) NOT NULL AUTO_INCREMENT,
  `microContractInstanceStateName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idMicroContractInstanceState`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`macroproccessinstance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`macroproccessinstance` (
  `idmacroProccessInst` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `idmacroProccess` INT(11) NOT NULL,
  `start_planned` VARCHAR(45) NOT NULL,
  `start_real` VARCHAR(45) NULL,
  `finish_planned` VARCHAR(45) NOT NULL,
  `finish_real` VARCHAR(45) NULL,
  INDEX `fk_macroproccessinstance_macroproccess1_idx` (`idmacroProccess` ASC),
  PRIMARY KEY (`idmacroProccessInst`),
  CONSTRAINT `fk_macroproccessinstance_macroproccess1`
    FOREIGN KEY (`idmacroProccess`)
    REFERENCES `takt_v2`.`macroproccess` (`idmacroProccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontractinstance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontractinstance` (
  `idMicroContractInstance` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContract` INT(11) NOT NULL,
  `idMicroContractInstanceState` INT(11) NOT NULL,
  `iidmacroProccessInst` INT(11) NOT NULL,
  PRIMARY KEY (`idMicroContractInstance`),
  INDEX `workPackageInstFKidWorkPackage_idx` (`idMicroContract` ASC),
  INDEX `workPackageInstFKidWorkPackageInstState_idx` (`idMicroContractInstanceState` ASC),
  INDEX `fk_microcontractinstance_macroproccessinstance1_idx` (`iidmacroProccessInst` ASC),
  CONSTRAINT `microContractInstFKidMicroContract`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt_v2`.`microcontract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `microContractInstFKidMicroContractInstState`
    FOREIGN KEY (`idMicroContractInstanceState`)
    REFERENCES `takt_v2`.`microcontractinstancestate` (`idMicroContractInstanceState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractinstance_macroproccessinstance1`
    FOREIGN KEY (`iidmacroProccessInst`)
    REFERENCES `takt_v2`.`macroproccessinstance` (`idmacroProccessInst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`transactionlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`transactionlog` (
  `idTransaction` INT(11) NOT NULL AUTO_INCREMENT,
  `tumDateTime` VARCHAR(45) NOT NULL,
  `tahDateTime` VARCHAR(45) NOT NULL,
  `idHeartBeatStatus` INT(11) NOT NULL,
  `idMicroContractInstanceOrigin` INT(11) NOT NULL,
  `idMicroContractInstanceDestiny` INT(11) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  INDEX `fk_transactionlog_heartbeatstatus1_idx` (`idHeartBeatStatus` ASC),
  INDEX `fk_transactionlog_microcontractinstance1_idx` (`idMicroContractInstanceOrigin` ASC),
  INDEX `fk_transactionlog_microcontractinstance2_idx` (`idMicroContractInstanceDestiny` ASC),
  CONSTRAINT `fk_transactionlog_heartbeatstatus1`
    FOREIGN KEY (`idHeartBeatStatus`)
    REFERENCES `takt_v2`.`heartbeatstatus` (`idHeartBeatStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactionlog_microcontractinstance1`
    FOREIGN KEY (`idMicroContractInstanceOrigin`)
    REFERENCES `takt_v2`.`microcontractinstance` (`idMicroContractInstance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactionlog_microcontractinstance2`
    FOREIGN KEY (`idMicroContractInstanceDestiny`)
    REFERENCES `takt_v2`.`microcontractinstance` (`idMicroContractInstance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`item` (
  `idItem` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idItem`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`user` (
  `usercode` INT(11) NOT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`usercode`));


-- -----------------------------------------------------
-- Table `takt_v2`.`stakeholder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`stakeholder` (
  `idStakeholder` INT(11) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `usercode` INT(11) NOT NULL,
  PRIMARY KEY (`idStakeholder`),
  INDEX `fk_stakeholder_user1_idx` (`usercode` ASC),
  CONSTRAINT `fk_stakeholder_user1`
    FOREIGN KEY (`usercode`)
    REFERENCES `takt_v2`.`user` (`usercode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt_v2`.`itemType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`itemType` (
  `idItemType` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idItemType`));


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontractconfiguration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontractconfiguration` (
  `idConfiguration` INT(11) NOT NULL AUTO_INCREMENT,
  `qtdItem` INT(11) NOT NULL DEFAULT 0,
  `idMicroContract` INT(11) NOT NULL,
  `idItem` INT(11) NOT NULL,
  `IdItemType` INT(11) NOT NULL,
  PRIMARY KEY (`idConfiguration`),
  INDEX `fk_inputConfiguration_microcontract1_idx` (`idMicroContract` ASC),
  INDEX `fk_microcontractconfiguration_item1_idx` (`idItem` ASC),
  INDEX `fk_microcontractconfiguration_itemType1_idx` (`IdItemType` ASC),
  CONSTRAINT `fk_inputConfiguration_microcontract1`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt_v2`.`microcontract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractconfiguration_item1`
    FOREIGN KEY (`idItem`)
    REFERENCES `takt_v2`.`item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractconfiguration_itemType1`
    FOREIGN KEY (`IdItemType`)
    REFERENCES `takt_v2`.`itemType` (`idItemType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `takt_v2`.`typemicrocontractrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`typemicrocontractrelation` (
  `idTypeRelation` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTypeRelation`));


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontractrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontractrelation` (
  `idMicroContractRelation` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContract` INT(11) NOT NULL,
  `idMicroContractRelated` INT(11) NOT NULL,
  `idTypeRelation` INT(11) NOT NULL,
  INDEX `fk_microcontractrelation_microcontract1_idx` (`idMicroContract` ASC),
  INDEX `fk_microcontractrelation_microcontract2_idx` (`idMicroContractRelated` ASC),
  PRIMARY KEY (`idMicroContractRelation`),
  INDEX `fk_microcontractrelation_typemicrocontractrelation1_idx` (`idTypeRelation` ASC),
  CONSTRAINT `fk_microcontractrelation_microcontract1`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt_v2`.`microcontract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractrelation_microcontract2`
    FOREIGN KEY (`idMicroContractRelated`)
    REFERENCES `takt_v2`.`microcontract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractrelation_typemicrocontractrelation1`
    FOREIGN KEY (`idTypeRelation`)
    REFERENCES `takt_v2`.`typemicrocontractrelation` (`idTypeRelation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `takt_v2`.`itemrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`itemrelation` (
  `itemRelationId` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContractRelation` INT(11) NOT NULL,
  `item_idItem` INT(11) NOT NULL,
  `itemType_idItemType` INT(11) NOT NULL,
  PRIMARY KEY (`itemRelationId`),
  INDEX `fk_itemrelation_microcontractrelation1_idx` (`idMicroContractRelation` ASC),
  INDEX `fk_itemrelation_item1_idx` (`item_idItem` ASC),
  INDEX `fk_itemrelation_itemType1_idx` (`itemType_idItemType` ASC),
  CONSTRAINT `fk_itemrelation_microcontractrelation1`
    FOREIGN KEY (`idMicroContractRelation`)
    REFERENCES `takt_v2`.`microcontractrelation` (`idMicroContractRelation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemrelation_item1`
    FOREIGN KEY (`item_idItem`)
    REFERENCES `takt_v2`.`item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemrelation_itemType1`
    FOREIGN KEY (`itemType_idItemType`)
    REFERENCES `takt_v2`.`itemType` (`idItemType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `takt_v2`.`microcontractxstakeholder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt_v2`.`microcontractxstakeholder` (
  `idmicrostakeholder` INT(11) NOT NULL AUTO_INCREMENT,
  `microcontract_idMicroContract` INT(11) NOT NULL,
  `stakeholder_idStakeholder` INT(11) NOT NULL,
  PRIMARY KEY (`idmicrostakeholder`),
  INDEX `fk_microcontractxstakeholder_microcontract1_idx` (`microcontract_idMicroContract` ASC),
  INDEX `fk_microcontractxstakeholder_stakeholder1_idx` (`stakeholder_idStakeholder` ASC),
  CONSTRAINT `fk_microcontractxstakeholder_microcontract1`
    FOREIGN KEY (`microcontract_idMicroContract`)
    REFERENCES `takt_v2`.`microcontract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractxstakeholder_stakeholder1`
    FOREIGN KEY (`stakeholder_idStakeholder`)
    REFERENCES `takt_v2`.`stakeholder` (`idStakeholder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

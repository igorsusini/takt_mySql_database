-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema takt
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema takt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `takt` DEFAULT CHARACTER SET utf8 ;
USE `takt` ;

-- -----------------------------------------------------
-- Table `takt`.`heartbeatstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`heartbeatstatus` (
  `idHeartBeatStatus` INT(11) NOT NULL AUTO_INCREMENT,
  `nameHeartBeatStatus` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idHeartBeatStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`item` (
  `idItem` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idItem`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`item_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`item_type` (
  `idItemType` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idItemType`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`phase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`phase` (
  `idPhase` INT(11) NOT NULL AUTO_INCREMENT,
  `idMacroProccess` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idPhase`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`micro_contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`micro_contract` (
  `idMicroContract` INT(11) NOT NULL AUTO_INCREMENT,
  `idPhase` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`idMicroContract`),
  INDEX `fk_idPhase_idx` (`idPhase` ASC),
  CONSTRAINT `fk_idPhase`
    FOREIGN KEY (`idPhase`)
    REFERENCES `takt`.`phase` (`idPhase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`typemicrocontractrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`typemicrocontractrelation` (
  `idTypeRelation` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTypeRelation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`microcontractrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`microcontractrelation` (
  `idMicroContractRelation` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContract` INT(11) NOT NULL,
  `idMicroContractRelated` INT(11) NOT NULL,
  `idTypeRelation` INT(11) NOT NULL,
  PRIMARY KEY (`idMicroContractRelation`),
  INDEX `fk_microcontractrelation_microcontract1_idx` (`idMicroContract` ASC),
  INDEX `fk_microcontractrelation_microcontract2_idx` (`idMicroContractRelated` ASC),
  INDEX `fk_microcontractrelation_typemicrocontractrelation1_idx` (`idTypeRelation` ASC),
  CONSTRAINT `fk_microcontractrelation_microcontract1`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt`.`micro_contract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractrelation_microcontract2`
    FOREIGN KEY (`idMicroContractRelated`)
    REFERENCES `takt`.`micro_contract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractrelation_typemicrocontractrelation1`
    FOREIGN KEY (`idTypeRelation`)
    REFERENCES `takt`.`typemicrocontractrelation` (`idTypeRelation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`itemrelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`itemrelation` (
  `itemRelationId` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContractRelation` INT(11) NOT NULL,
  `item_idItem` INT(11) NOT NULL,
  `itemType_idItemType` INT(11) NOT NULL,
  PRIMARY KEY (`itemRelationId`),
  INDEX `fk_itemrelation_microcontractrelation1_idx` (`idMicroContractRelation` ASC),
  INDEX `fk_itemrelation_item1_idx` (`item_idItem` ASC),
  INDEX `fk_itemrelation_itemType1_idx` (`itemType_idItemType` ASC),
  CONSTRAINT `fk_itemrelation_item1`
    FOREIGN KEY (`item_idItem`)
    REFERENCES `takt`.`item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemrelation_itemType1`
    FOREIGN KEY (`itemType_idItemType`)
    REFERENCES `takt`.`item_type` (`idItemType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemrelation_microcontractrelation1`
    FOREIGN KEY (`idMicroContractRelation`)
    REFERENCES `takt`.`microcontractrelation` (`idMicroContractRelation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`macro_proccess`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`macro_proccess` (
  `idMacroProccess` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idMacroProccess`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`macroproccessinstance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`macroproccessinstance` (
  `idmacroProccessInst` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `idmacroProccess` INT(11) NOT NULL,
  `start_planned` VARCHAR(45) NOT NULL,
  `start_real` VARCHAR(45) NULL DEFAULT NULL,
  `finish_planned` VARCHAR(45) NOT NULL,
  `finish_real` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idmacroProccessInst`),
  INDEX `fk_macroproccessinstance_macroproccess1_idx` (`idmacroProccess` ASC),
  CONSTRAINT `fk_macroproccessinstance_macroproccess1`
    FOREIGN KEY (`idmacroProccess`)
    REFERENCES `takt`.`macro_proccess` (`idMacroProccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`micro_contract_configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`micro_contract_configuration` (
  `idConfiguration` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContract` INT(11) NOT NULL,
  `idItem` INT(11) NOT NULL,
  `qtdItem` INT(11) NOT NULL,
  `IdItemType` INT(11) NOT NULL,
  PRIMARY KEY (`idConfiguration`),
  INDEX `fk_inputConfiguration_microcontract1_idx` (`idMicroContract` ASC),
  INDEX `fk_microcontractconfiguration_item1_idx` (`idItem` ASC),
  INDEX `fk_microcontractconfiguration_itemType1_idx` (`IdItemType` ASC),
  CONSTRAINT `fk_inputConfiguration_microcontract1`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt`.`micro_contract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractconfiguration_item1`
    FOREIGN KEY (`idItem`)
    REFERENCES `takt`.`item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_microcontractconfiguration_itemType1`
    FOREIGN KEY (`IdItemType`)
    REFERENCES `takt`.`item_type` (`idItemType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 137
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`microcontractinstancestate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`microcontractinstancestate` (
  `idMicroContractInstanceState` INT(11) NOT NULL AUTO_INCREMENT,
  `microContractInstanceStateName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idMicroContractInstanceState`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`microcontract_instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`microcontract_instance` (
  `idMicroContractInstance` INT(11) NOT NULL AUTO_INCREMENT,
  `idMicroContract` INT(11) NOT NULL,
  `idMicroContractInstanceState` INT(11) NOT NULL,
  `iidmacroProccessInst` INT(11) NOT NULL,
  PRIMARY KEY (`idMicroContractInstance`),
  INDEX `workPackageInstFKidWorkPackage_idx` (`idMicroContract` ASC),
  INDEX `workPackageInstFKidWorkPackageInstState_idx` (`idMicroContractInstanceState` ASC),
  INDEX `fk_microcontractinstance_macroproccessinstance1_idx` (`iidmacroProccessInst` ASC),
  CONSTRAINT `fk_microcontractinstance_macroproccessinstance1`
    FOREIGN KEY (`iidmacroProccessInst`)
    REFERENCES `takt`.`macroproccessinstance` (`idmacroProccessInst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `microContractInstFKidMicroContract`
    FOREIGN KEY (`idMicroContract`)
    REFERENCES `takt`.`micro_contract` (`idMicroContract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `microContractInstFKidMicroContractInstState`
    FOREIGN KEY (`idMicroContractInstanceState`)
    REFERENCES `takt`.`microcontractinstancestate` (`idMicroContractInstanceState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`role` (
  `idRole` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`user` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`stakeholder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`stakeholder` (
  `idStakeholder` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `IdUser` INT(11) NOT NULL,
  `idRole` INT(11) NOT NULL,
  PRIMARY KEY (`idStakeholder`),
  UNIQUE INDEX `IdUser_UNIQUE` (`IdUser` ASC),
  INDEX `fk_stakeholder_user1_idx` (`IdUser` ASC),
  INDEX `fk_idRole_idx` (`idRole` ASC),
  CONSTRAINT `fk_idRole`
    FOREIGN KEY (`idRole`)
    REFERENCES `takt`.`role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stakeholder_user1`
    FOREIGN KEY (`IdUser`)
    REFERENCES `takt`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`microinst_stakeholder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`microinst_stakeholder` (
  `idMicroStakeholder` INT(11) NOT NULL AUTO_INCREMENT,
  `idStakeholder` INT(11) NOT NULL,
  `idMicroContractInstance` INT(11) NOT NULL,
  PRIMARY KEY (`idMicroStakeholder`),
  INDEX `fk_microcontractxstakeholder_stakeholder1_idx` (`idStakeholder` ASC),
  INDEX `fk_idMicroContractInstance_idx` (`idMicroContractInstance` ASC),
  CONSTRAINT `fk_idStakeholder`
    FOREIGN KEY (`idStakeholder`)
    REFERENCES `takt`.`stakeholder` (`idStakeholder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `takt`.`transactionlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `takt`.`transactionlog` (
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
    REFERENCES `takt`.`heartbeatstatus` (`idHeartBeatStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactionlog_microcontractinstance1`
    FOREIGN KEY (`idMicroContractInstanceOrigin`)
    REFERENCES `takt`.`microcontract_instance` (`idMicroContractInstance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactionlog_microcontractinstance2`
    FOREIGN KEY (`idMicroContractInstanceDestiny`)
    REFERENCES `takt`.`microcontract_instance` (`idMicroContractInstance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

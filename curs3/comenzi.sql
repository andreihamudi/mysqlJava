CREATE SCHEMA `facultate` DEFAULT CHARACTER SET utf8 ;

use facultate;
CREATE TABLE IF NOT EXISTS `studenti` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numar_matricol` varchar(45) DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `cnp` int(13) unsigned DEFAULT NULL,
  `data_nasterii` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnp_UNIQUE` (`cnp`),
  UNIQUE KEY `numar_matricol_UNIQUE` (`numar_matricol`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `profesori` (
  `cod_profesor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NULL,
  `adresa` TEXT(200) NULL DEFAULT NULL,
  `cnp` CHAR(13) NOT NULL,
  `data_nasterii` DATE NULL,
  `grad_didactic` ENUM('I', 'II', 'III') DEFAULT NULL,
  PRIMARY KEY (`cod_profesor`),
  UNIQUE INDEX `cnp_UNIQUE` (`cnp` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE profesori ADD CHECK (grad_didiactic  in ('I','II','III'));

ALTER TABLE `facultate`.`profesori`
CHANGE COLUMN `cod_profesor` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE `facultate`.`profesori`
ADD COLUMN `cod_profesor` VARCHAR(10) NOT NULL AFTER `id`,
ADD UNIQUE INDEX `cod_profesor_UNIQUE` (`cod_profesor` ASC) ;
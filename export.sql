— —-
— Globals
— —-

— SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
— SET FOREIGN_KEY_CHECKS=0;

— —-
— Table 'personal_data_employees'
—
— —-

DROP TABLE IF EXISTS `personal_data_employees`;

CREATE TABLE `personal_data_employees` (
`id_employee` MEDIUMINT(5) NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`second_name` VARCHAR(50) NOT NULL,
`father_name` VARCHAR(50) NULL DEFAULT NULL,
`login` VARCHAR(50) NOT NULL,
`pASSword` VARCHAR(50) NOT NULL,
`id_role` TINYINT(2) NOT NULL,
`id_position` TINYINT(3) NOT NULL,
PRIMARY KEY (`id_employee`)
);

— —-
— Table 'role_employees'
—
— —-

DROP TABLE IF EXISTS `role_employees`;

CREATE TABLE `role_employees` (
`id_role` TINYINT(2) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id_role`)
);

— —-
— Table 'images'
—
— —-

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
`id_employee` MEDIUMINT(5) NOT NULL,
`type` VARCHAR(25) NOT NULL,
`image` BLOB NOT NULL,
`size` VARCHAR(25) NOT NULL,
PRIMARY KEY (`id_employee`)
);

— —-
— Table 'products'
—
— —-

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
`article` MEDIUMINT(7) NOT NULL,
`name` VARCHAR(100) NOT NULL,
`id_brand` MEDIUMINT(6) NOT NULL,
`cost_price` DECIMAL(10,2) NOT NULL,
`result_price` DECIMAL(10,2) NOT NULL,
PRIMARY KEY (`article`)
);

— —-
— Table 'brands'
—
— —-

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
`id_brand` MEDIUMINT(6) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`country_manufacturer` VARCHAR(25) NOT NULL,
PRIMARY KEY (`id_brand`)
);

— —-
— Table 'positions'
—
— —-

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
`id_position` TINYINT(3) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_position`)
);

— —-
— Table 'sendings'
—
— —-

DROP TABLE IF EXISTS `sendings`;

CREATE TABLE `sendings` (
`id_sending` MEDIUMINT(7) NOT NULL AUTO_INCREMENT,
`author` MEDIUMINT(5) NOT NULL,
`date_of_start` DATE NOT NULL,
`id_pr_manager` MEDIUMINT(5) NULL DEFAULT NULL,
`id_tag_send` TINYINT(2) NOT NULL,
`id_influencer` INT(7) NOT NULL,
PRIMARY KEY (`id_sending`)
);

— —-
— Table 'tages'
—
— —-

DROP TABLE IF EXISTS `tages`;

CREATE TABLE `tages` (
`id_tag_sand` TINYINT(2) NOT NULL AUTO_INCREMENT,
`name_tag_send` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_tag_sand`)
);

— —-
— Table 'influencers'
—
— —-

DROP TABLE IF EXISTS `influencers`;

CREATE TABLE `influencers` (
`id_influencer` INT(7) NOT NULL AUTO_INCREMENT,
`nick_name` VARCHAR(100) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`family_name` VARCHAR(50) NOT NULL,
`father_name` VARCHAR(50) NOT NULL,
`email` VARCHAR(100) NULL DEFAULT NULL,
`telephone` VARCHAR(15) NULL DEFAULT NULL,
`id_method_communications` TINYINT(2) NOT NULL,
PRIMARY KEY (`id_influencer`)
);

— —-
— Table 'methods_communications'
—
— —-

DROP TABLE IF EXISTS `methods_communications`;

CREATE TABLE `methods_communications` (
`id_method_communications` TINYINT(2) NOT NULL AUTO_INCREMENT,
`name_method` VARCHAR(20) NOT NULL,
PRIMARY KEY (`id_method_communications`)
);

— —-
— Foreign Keys
— —-

ALTER TABLE `personal_data_employees` ADD FOREIGN KEY (id_role) REFERENCES `role_employees` (`id_role`);
ALTER TABLE `personal_data_employees` ADD FOREIGN KEY (id_position) REFERENCES `positions` (`id_position`);
ALTER TABLE `images` ADD FOREIGN KEY (id_employee) REFERENCES `personal_data_employees` (`id_employee`);
ALTER TABLE `products` ADD FOREIGN KEY (id_brand) REFERENCES `brands` (`id_brand`);
ALTER TABLE `sendings` ADD FOREIGN KEY (author) REFERENCES `personal_data_employees` (`id_employee`);
ALTER TABLE `sendings` ADD FOREIGN KEY (id_pr_manager) REFERENCES `personal_data_employees` (`id_employee`);
ALTER TABLE `sendings` ADD FOREIGN KEY (id_tag_send) REFERENCES `tages` (`id_tag_sand`);
ALTER TABLE `sendings` ADD
 
FOREIGN KEY (id_influencer) REFERENCES `influencers` (`id_influencer`);
ALTER TABLE `influencers` ADD FOREIGN KEY (id_method_communications) REFERENCES `methods_communications` (`id_method_communications`);

— —-
— Table Properties
— —-

— ALTER TABLE `personal_data_employees` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `role_employees` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `images` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `brands` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `positions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `sendings` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `tages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `influencers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
— ALTER TABLE `methods_communications` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

— —-
— Test Data
— —-

— INSERT INTO `personal_data_employees` (`id_employee`,`first_name`,`second_name`,`father_name`,`login`,`pASSword`,`id_role`,`id_position`) VALUES
— ('','','','','','','','');
— INSERT INTO `role_employees` (`id_role`,`name`) VALUES
— ('','');
— INSERT INTO `images` (`id_employee`,`type`,`image`,`size`) VALUES
— ('','','','');
— INSERT INTO `products` (`article`,`name`,`id_brand`,`cost_price`,`result_price`) VALUES
— ('','','','','');
— INSERT INTO `brands` (`id_brand`,`name`,`country_manufacturer`) VALUES
— ('','','');
— INSERT INTO `positions` (`id_position`,`name`) VALUES
— ('','');
— INSERT INTO `sendings` (`id_sending`,`author`,`date_of_start`,`id_pr_manager`,`id_tag_send`,`id_influencer`) VALUES
— ('','','','','','');
— INSERT INTO `tages` (`id_tag_sand`,`name_tag_send`) VALUES
— ('','');
— INSERT INTO `influencers` (`id_influencer`,`nick_name`,`name`,`family_name`,`father_name`,`email`,`telephone`,`id_method_communications`) VALUES
— ('','','','','','','','');
— INSERT INTO `methods_communications` (`id_method_communications`,`name_method`) VALUES
— ('','');
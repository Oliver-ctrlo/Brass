-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Wed Jun 10 21:47:53 2015
-- 
;
SET foreign_key_checks=0;
--
-- Table: `comment`
--
CREATE TABLE `comment` (
  `id` integer NOT NULL auto_increment,
  `author` integer NOT NULL,
  `issue` integer NOT NULL,
  `datetime` datetime NULL,
  `text` text NULL,
  INDEX `comment_idx_author` (`author`),
  INDEX (`id`),
  PRIMARY KEY (`id`),
  CONSTRAINT `comment_fk_author` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_fk_id` FOREIGN KEY (`id`) REFERENCES `issue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
--
-- Table: `issue`
--
CREATE TABLE `issue` (
  `id` integer NOT NULL auto_increment,
  `title` text NULL,
  `description` text NULL,
  `type` integer NULL,
  `priority` integer NULL,
  `author` integer NULL,
  `owner` integer NULL,
  `reference` varchar(128) NULL,
  `project` integer NULL,
  INDEX `issue_idx_author` (`author`),
  INDEX `issue_idx_owner` (`owner`),
  INDEX `issue_idx_priority` (`priority`),
  INDEX `issue_idx_project` (`project`),
  INDEX `issue_idx_type` (`type`),
  PRIMARY KEY (`id`),
  CONSTRAINT `issue_fk_author` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_fk_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_fk_priority` FOREIGN KEY (`priority`) REFERENCES `priority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_fk_project` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_fk_type` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
--
-- Table: `issue_status`
--
CREATE TABLE `issue_status` (
  `id` integer NOT NULL auto_increment,
  `issue` integer NOT NULL,
  `status` integer NOT NULL,
  `datetime` datetime NULL,
  INDEX `issue_status_idx_issue` (`issue`),
  INDEX `issue_status_idx_status` (`status`),
  PRIMARY KEY (`id`),
  CONSTRAINT `issue_status_fk_issue` FOREIGN KEY (`issue`) REFERENCES `issue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `issue_status_fk_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
--
-- Table: `permission`
--
CREATE TABLE `permission` (
  `id` integer NOT NULL auto_increment,
  `name` varchar(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `priority`
--
CREATE TABLE `priority` (
  `id` integer NOT NULL auto_increment,
  `name` varchar(128) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `project`
--
CREATE TABLE `project` (
  `id` integer NOT NULL auto_increment,
  `name` varchar(128) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `status`
--
CREATE TABLE `status` (
  `id` integer NOT NULL auto_increment,
  `name` varchar(128) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `type`
--
CREATE TABLE `type` (
  `id` integer NOT NULL auto_increment,
  `name` varchar(128) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `user`
--
CREATE TABLE `user` (
  `id` integer NOT NULL auto_increment,
  `username` varchar(128) NOT NULL,
  `firstname` varchar(128) NULL,
  `surname` varchar(128) NULL,
  `email` varchar(128) NULL,
  `deleted` datetime NULL,
  `pwchanged` datetime NULL,
  `pwresetcode` char(32) NULL,
  `lastlogin` datetime NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
--
-- Table: `user_permission`
--
CREATE TABLE `user_permission` (
  `id` integer NOT NULL auto_increment,
  `user` integer NULL,
  `permission` integer NULL,
  INDEX `user_permission_idx_permission` (`permission`),
  INDEX `user_permission_idx_user` (`user`),
  PRIMARY KEY (`id`),
  CONSTRAINT `user_permission_fk_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_permission_fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
SET foreign_key_checks=1;
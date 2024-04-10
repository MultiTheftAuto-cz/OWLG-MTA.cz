-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.28-MariaDB-1~stretch - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.4.0.5186
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(30) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `registerdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` mediumtext,
  `admin` float NOT NULL DEFAULT '0',
  `supporter` float NOT NULL DEFAULT '0',
  `vct` float NOT NULL DEFAULT '0',
  `mapper` float NOT NULL DEFAULT '0',
  `scripter` float NOT NULL DEFAULT '0',
  `fmt` float NOT NULL DEFAULT '0',
  `credits` int(11) NOT NULL DEFAULT '0',
  `referrer` int(11) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `forumid` int(11) DEFAULT NULL,
  `require_password_change` tinyint(1) NOT NULL DEFAULT '0',
  `ucp_lastlogin` datetime(6) DEFAULT NULL,
  `punishpoints` int(11) NOT NULL DEFAULT '0',
  `punishdate` datetime DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_username_5a6e02bd_uniq` (`username`),
  UNIQUE KEY `forumid_UNIQUE` (`forumid`),
  UNIQUE KEY `email` (`email`),
  KEY `account_admin` (`admin`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.account_loa
CREATE TABLE IF NOT EXISTS `account_loa` (
  `loa_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `from` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to` datetime NOT NULL,
  `reason` text NOT NULL,
  `effective` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`loa_id`),
  KEY `account_link_idx` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mta_serial` varchar(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `reason` mediumtext NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `until` datetime DEFAULT NULL,
  `threadid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Handle serial bans instead of using MTA built-in / Maxime';

-- Data exporting was unselected.
-- Dumping structure for table core.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table core.google_authenticator
CREATE TABLE IF NOT EXISTS `google_authenticator` (
  `secret` varchar(16) NOT NULL,
  `userid` int(11) NOT NULL,
  `recovery_code` varchar(19) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`secret`),
  UNIQUE KEY `secret_UNIQUE` (`secret`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Authenticator Integration By Maxime';

-- Data exporting was unselected.
-- Dumping structure for table core.paypal_ipn
CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_8e113603` (`txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(50) NOT NULL,
  `payer_email` varchar(75) NOT NULL,
  `mc_gross` float(9,2) NOT NULL,
  `donor` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `donated_for` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `txn_id` (`txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.tc_comments
CREATE TABLE IF NOT EXISTS `tc_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` int(11) NOT NULL,
  `comment` text CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `internal` tinyint(1) NOT NULL DEFAULT '0',
  `tcid` int(11) NOT NULL,
  `system_message` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tcid_idx` (`tcid`),
  KEY `comment_poster` (`poster`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table core.tc_subscribers
CREATE TABLE IF NOT EXISTS `tc_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriber_ticket` (`ticket_id`),
  KEY `subscriber_account` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table core.tc_tickets
CREATE TABLE IF NOT EXISTS `tc_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `assign_to` int(11) DEFAULT NULL,
  `subscribers` varchar(500) DEFAULT ',',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_creator` (`creator`),
  KEY `ticket_assignee` (`assign_to`),
  KEY `ticket_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Dumping structure for table mta.account_details
CREATE TABLE IF NOT EXISTS `account_details` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastlogin` datetime DEFAULT NULL,
  `warn_style` int(1) NOT NULL DEFAULT '1',
  `hiddenadmin` tinyint(3) unsigned DEFAULT '0',
  `adminjail` tinyint(3) unsigned DEFAULT '0',
  `adminjail_time` int(11) DEFAULT NULL,
  `adminjail_by` text,
  `adminjail_reason` text,
  `muted` tinyint(3) unsigned DEFAULT '0',
  `globalooc` tinyint(3) unsigned DEFAULT '1',
  `friendsmessage` varchar(255) NOT NULL DEFAULT 'Hi!',
  `adminjail_permanent` tinyint(3) unsigned DEFAULT '0',
  `adminreports` int(11) DEFAULT '0',
  `warns` tinyint(3) unsigned DEFAULT '0',
  `chatbubbles` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `adminnote` text,
  `appstate` tinyint(1) DEFAULT '0',
  `appdatetime` datetime DEFAULT NULL,
  `appreason` longtext,
  `help` int(1) NOT NULL DEFAULT '1',
  `adblocked` int(1) NOT NULL DEFAULT '0',
  `newsblocked` int(1) DEFAULT '0',
  `mtaserial` text,
  `d_addiction` text,
  `loginhash` varchar(64) DEFAULT NULL,
  `transfers` int(11) DEFAULT '0',
  `monitored` varchar(255) NOT NULL DEFAULT '',
  `autopark` int(1) NOT NULL DEFAULT '1',
  `forceUpdate` smallint(1) NOT NULL DEFAULT '0',
  `anotes` text,
  `oldAdminRank` int(11) DEFAULT '0',
  `suspensionTime` bigint(20) DEFAULT NULL,
  `car_license` int(1) NOT NULL DEFAULT '0',
  `adminreports_saved` int(3) DEFAULT '0',
  `cpa_earned` double DEFAULT '0',
  `electionsvoted` int(11) NOT NULL DEFAULT '0',
  `serial_whitelist_cap` int(2) NOT NULL DEFAULT '2',
  `max_characters` int(10) unsigned NOT NULL DEFAULT '30',
  `remember_token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.account_settings
CREATE TABLE IF NOT EXISTS `account_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`,`name`),
  KEY `id_idx` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.adminhistory
CREATE TABLE IF NOT EXISTS `adminhistory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL,
  `user_char` int(11) DEFAULT '0',
  `admin` int(10) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` tinyint(3) NOT NULL DEFAULT '6',
  `duration` int(10) NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminhistory_user_ea155d8a_uniq` (`user`),
  KEY `adminhistory_user_char_c1d4310b_uniq` (`user_char`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.admin_teleports
CREATE TABLE IF NOT EXISTS `admin_teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_value` text NOT NULL COMMENT '/gotoplace #v',
  `location_description` text,
  `location_creator` int(10) NOT NULL COMMENT 'User ID',
  `posX` float(10,6) NOT NULL DEFAULT '0.000000',
  `posY` float(10,6) NOT NULL DEFAULT '0.000000',
  `posZ` float(10,6) NOT NULL DEFAULT '0.000000',
  `rot` float(10,6) NOT NULL DEFAULT '0.000000' COMMENT 'rotation',
  `int` int(6) NOT NULL DEFAULT '0' COMMENT 'interior',
  `dim` int(6) NOT NULL DEFAULT '0' COMMENT 'dimension',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAMEUNI` (`location_value`(100))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='/tps manager';

-- Data exporting was unselected.
-- Dumping structure for table mta.advertisements
CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `advertisement` varchar(200) NOT NULL,
  `start` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `faction` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `vehicle_auctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starting_bid` int(11) NOT NULL,
  `minimum_increase` int(11) NOT NULL,
  `current_bid` int(11) NULL,
  `current_bidder_id` int(11) NULL COMMENT 'Character ID of current bidder.',
  `buyout` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_faction` int(11) NULL COMMENT 'Filled in when the vehicle belongs to a faction.',
  awaiting_key_pickup BOOL NOT NULL DEFAULT FALSE COMMENT 'When the auction is completed, but the buyer has not picked up the car yet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- Index the advertisement column so we can search by this in the main advertisement window.
ALTER TABLE `vehicle_auctions` ADD INDEX `vehicle_auctions_advertisement_id_index` (`advertisement_id`);

-- We will search periodically for auctions that can be completed, hitting this index.
ALTER TABLE `vehicle_auctions` ADD INDEX `vehicle_auctions_expiry_awaiting_key_pickup_index` (`expiry`, `awaiting_key_pickup`);

-- Dumping structure for table mta.apb
CREATE TABLE IF NOT EXISTS `apb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.applications
CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant` int(11) NOT NULL DEFAULT '0',
  `dateposted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datereviewed` datetime DEFAULT NULL,
  `reviewer` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `question1` varchar(500) DEFAULT NULL,
  `question2` varchar(500) DEFAULT NULL,
  `question3` varchar(500) DEFAULT NULL,
  `question4` varchar(500) DEFAULT NULL,
  `answer1` varchar(500) DEFAULT NULL,
  `answer2` varchar(500) DEFAULT NULL,
  `answer3` varchar(500) DEFAULT NULL,
  `answer4` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.applications_questions
CREATE TABLE IF NOT EXISTS `applications_questions` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `question` text,
  `answer1` text,
  `answer2` text,
  `answer3` text,
  `key` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` int(8) NOT NULL DEFAULT '0',
  `updatedBy` int(8) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.atms
CREATE TABLE IF NOT EXISTS `atms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `rotation` decimal(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `deposit` tinyint(3) unsigned DEFAULT '0',
  `limit` int(10) unsigned DEFAULT '5000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.atm_cards
CREATE TABLE IF NOT EXISTS `atm_cards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_owner` int(11) DEFAULT NULL,
  `card_number` text,
  `card_pin` varchar(4) NOT NULL DEFAULT '0000',
  `card_locked` tinyint(1) NOT NULL DEFAULT '0',
  `card_type` tinyint(1) NOT NULL DEFAULT '1',
  `limit_type` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_id_UNIQUE` (`card_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `book` text,
  `readOnly` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='This is used for the book system. // Chaos';

-- Data exporting was unselected.
-- Dumping structure for table mta.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(255) DEFAULT NULL,
  `account` int(11) DEFAULT '0',
  `x` float DEFAULT '1169.73',
  `y` float DEFAULT '-1413.91',
  `z` float DEFAULT '13.48',
  `rotation` float DEFAULT '359.388',
  `interior_id` int(5) DEFAULT '0',
  `dimension_id` int(5) DEFAULT '0',
  `health` float DEFAULT '100',
  `armor` float DEFAULT '0',
  `skin` int(3) DEFAULT '264',
  `money` bigint(20) DEFAULT '500',
  `gender` int(1) DEFAULT '0',
  `cuffed` int(11) DEFAULT '0',
  `duty` int(3) DEFAULT '0',
  `fightstyle` int(2) DEFAULT '4',
  `pdjail` int(1) DEFAULT '0',
  `pdjail_time` int(11) DEFAULT '0',
  `cked` int(1) DEFAULT '0',
  `lastarea` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT '18',
  `skincolor` int(1) DEFAULT '0',
  `weight` int(3) DEFAULT '180',
  `height` int(3) DEFAULT '180',
  `description` text,
  `deaths` int(11) DEFAULT '0',
  `faction_leader` int(1) DEFAULT '0',
  `fingerprint` varchar(255) DEFAULT NULL,
  `casualskin` int(3) DEFAULT '0',
  `bankmoney` bigint(20) DEFAULT '1000',
  `car_license` int(1) DEFAULT '0',
  `bike_license` int(1) DEFAULT '0',
  `pilot_license` int(1) DEFAULT '0',
  `fish_license` int(1) DEFAULT '0',
  `boat_license` int(1) DEFAULT '0',
  `gun_license` int(1) DEFAULT '0',
  `gun2_license` int(1) DEFAULT '0',
  `tag` int(3) DEFAULT '1',
  `hoursplayed` int(11) DEFAULT '0',
  `pdjail_station` int(1) DEFAULT '0',
  `timeinserver` int(2) DEFAULT '0',
  `restrainedobj` int(11) DEFAULT '0',
  `restrainedby` int(11) DEFAULT '0',
  `dutyskin` int(3) DEFAULT '-1',
  `fish` int(10) unsigned NOT NULL DEFAULT '0',
  `blindfold` tinyint(4) NOT NULL DEFAULT '0',
  `lang1` tinyint(2) DEFAULT '1',
  `lang1skill` tinyint(3) DEFAULT '100',
  `lang2` tinyint(2) DEFAULT '0',
  `lang2skill` tinyint(3) DEFAULT '0',
  `lang3` tinyint(2) DEFAULT '0',
  `lang3skill` tinyint(3) DEFAULT '0',
  `currlang` tinyint(1) DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `election_candidate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `election_canvote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `election_votedfor` int(10) unsigned NOT NULL DEFAULT '0',
  `marriedto` int(10) unsigned NOT NULL DEFAULT '0',
  `photos` int(10) unsigned NOT NULL DEFAULT '0',
  `maxvehicles` int(4) unsigned NOT NULL DEFAULT '5',
  `ck_info` varchar(500) DEFAULT NULL,
  `alcohollevel` float NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `recovery` int(1) DEFAULT '0',
  `recoverytime` bigint(20) DEFAULT NULL,
  `walkingstyle` int(3) NOT NULL DEFAULT '0',
  `job` int(3) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '1',
  `month` tinyint(2) NOT NULL DEFAULT '1',
  `maxinteriors` int(4) NOT NULL DEFAULT '10',
  `clothingid` int(10) unsigned DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `max_clothes` int(10) unsigned NOT NULL DEFAULT '3',
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.characters_faction
CREATE TABLE IF NOT EXISTS `characters_faction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `faction_rank` int(11) NOT NULL,
  `faction_leader` int(11) NOT NULL,
  `faction_phone` int(11) DEFAULT NULL,
  `faction_perks` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `faction_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `faction_id` int(11) DEFAULT NULL,
  `name` text,
  `permissions` text NULL,
  `isDefault` int(11) NOT NULL DEFAULT '0',
  `isLeader` int(11) NOT NULL DEFAULT '0',
  `wage` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- Data exporting was unselected.
-- Dumping structure for table mta.character_settings
CREATE TABLE IF NOT EXISTS `character_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.clothing
CREATE TABLE IF NOT EXISTS `clothing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skin` int(11) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'A set of clean clothes.',
  `price` int(11) unsigned NOT NULL DEFAULT '50',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator_char` int(10) NOT NULL DEFAULT '0',
  `for_sale_until` datetime DEFAULT NULL,
  `distribution` int(1) unsigned NOT NULL DEFAULT '0',
  `manufactured_date` datetime DEFAULT NULL,
  `sold` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.commands
CREATE TABLE IF NOT EXISTS `commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text,
  `hotkey` text,
  `explanation` text,
  `permission` int(3) NOT NULL DEFAULT '0',
  `category` int(2) NOT NULL DEFAULT '1',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Saves all info about all kinds of supported commands and con';

-- Data exporting was unselected.
-- Dumping structure for table mta.dancers
CREATE TABLE IF NOT EXISTS `dancers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `skin` smallint(5) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `interior` int(10) unsigned NOT NULL,
  `dimension` int(10) unsigned NOT NULL,
  `offset` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.dog_users
CREATE TABLE IF NOT EXISTS `dog_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(45) NOT NULL,
  `attack` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.donators
CREATE TABLE IF NOT EXISTS `donators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `charID` int(11) NOT NULL DEFAULT '-1',
  `perkID` int(4) NOT NULL,
  `perkValue` varchar(10) NOT NULL DEFAULT '1',
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.don_purchases
CREATE TABLE IF NOT EXISTS `don_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `cost` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.duty_allowed
CREATE TABLE IF NOT EXISTS `duty_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `itemValue` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Used for an admin allow list.';

-- Data exporting was unselected.
-- Dumping structure for table mta.duty_custom
CREATE TABLE IF NOT EXISTS `duty_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `skins` text NOT NULL,
  `locations` text NOT NULL,
  `items` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Used for custom duties.';

-- Data exporting was unselected.
-- Dumping structure for table mta.duty_locations
CREATE TABLE IF NOT EXISTS `duty_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `dimension` int(11) DEFAULT '0',
  `interior` int(11) DEFAULT '0',
  `vehicleid` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Used for custom duty locations.';

-- Data exporting was unselected.
-- Dumping structure for table mta.elections
CREATE TABLE IF NOT EXISTS `elections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `electionsname` varchar(45) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elections_UNIQUE` (`electionsname`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.elevators
CREATE TABLE IF NOT EXISTS `elevators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `tpx` decimal(10,6) DEFAULT '0.000000',
  `tpy` decimal(10,6) DEFAULT '0.000000',
  `tpz` decimal(10,6) DEFAULT '0.000000',
  `dimensionwithin` int(5) DEFAULT '0',
  `interiorwithin` int(5) DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `car` tinyint(3) unsigned DEFAULT '0',
  `disabled` tinyint(3) unsigned DEFAULT '0',
  `rot` decimal(10,6) DEFAULT '0.000000',
  `tprot` decimal(10,6) DEFAULT '0.000000',
  `oneway` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.emailaccounts
CREATE TABLE IF NOT EXISTS `emailaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text,
  `password` text,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `sender` text,
  `receiver` text,
  `subject` text,
  `message` text,
  `inbox` int(1) NOT NULL DEFAULT '0',
  `outbox` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.faa_registry
CREATE TABLE IF NOT EXISTS `faa_registry` (
  `codeid` int(11) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `notes` longtext,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`codeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.factions
CREATE TABLE IF NOT EXISTS `factions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `bankbalance` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rank_order` text default null,
  `motd` text,
  `note` text,
  `fnote` text,
  `phone` varchar(20) DEFAULT NULL,
  `max_interiors` int(11) unsigned NOT NULL DEFAULT '20',
  `max_vehicles` int(11) unsigned NOT NULL DEFAULT '40',
  `free_custom_ints` tinyint(1) unsigned DEFAULT '0',
  `free_custom_skins` tinyint(1) unsigned DEFAULT '0',
  `before_tax_value` int(6) NOT NULL DEFAULT '0',
  `before_wage_charge` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_by` int(11) DEFAULT NULL,
  `file` mediumblob NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `dateline` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `connected_interior` int(11) DEFAULT NULL COMMENT 'The purpose of this field is to auto delete file record on interior delete.',
  `avatar_for_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `connected_interior_UNIQUE` (`connected_interior`),
  UNIQUE KEY `avatar_for_account_UNIQUE` (`avatar_for_account`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Store file up to 21MB per record / By Maxime / Consult with him if you''re unsure of something.';

-- Data exporting was unselected.
-- Dumping structure for table mta.force_apps
CREATE TABLE IF NOT EXISTS `force_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) DEFAULT NULL,
  `forceapp_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Save forceapped players information to keep them from resubm';

-- Data exporting was unselected.
-- Dumping structure for table mta.friends
CREATE TABLE IF NOT EXISTS `friends` (
  `account_id` int(10) unsigned NOT NULL,
  `friend_account_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`friend_account_id`),
  UNIQUE KEY `friends_account_id_friend_account_id_unique` (`account_id`,`friend_account_id`),
  KEY `friends_friend_account_id_accounts_foreign` (`friend_account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.fuelpeds
CREATE TABLE IF NOT EXISTS `fuelpeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT '0',
  `dimension` int(11) NOT NULL DEFAULT '0',
  `skin` int(3) DEFAULT '50',
  `name` varchar(50) NOT NULL,
  `deletedBy` int(11) DEFAULT '0',
  `shop_link` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.gates
CREATE TABLE IF NOT EXISTS `gates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectID` int(11) NOT NULL,
  `startX` float NOT NULL,
  `startY` float NOT NULL,
  `startZ` float NOT NULL,
  `startRX` float NOT NULL,
  `startRY` float NOT NULL,
  `startRZ` float NOT NULL,
  `endX` float NOT NULL,
  `endY` float NOT NULL,
  `endZ` float NOT NULL,
  `endRX` float NOT NULL,
  `endRY` float NOT NULL,
  `endRZ` float NOT NULL,
  `gateType` tinyint(3) unsigned NOT NULL,
  `autocloseTime` int(4) NOT NULL,
  `movementTime` int(4) NOT NULL,
  `objectDimension` int(11) NOT NULL,
  `objectInterior` int(11) NOT NULL,
  `gateSecurityParameters` text,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adminNote` varchar(300) NOT NULL DEFAULT '',
  `triggerDistance` float DEFAULT NULL,
  `triggerDistanceVehicle` float DEFAULT NULL,
  `sound` varchar(50) DEFAULT 'metalgate',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.health_diagnose
CREATE TABLE IF NOT EXISTS `health_diagnose` (
  `uniqueID` int(11) DEFAULT NULL,
  `int_diagnose` varchar(255) DEFAULT NULL,
  `ext_diagnose` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.insurance_data
CREATE TABLE IF NOT EXISTS `insurance_data` (
  `policyid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(45) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `protection` varchar(45) NOT NULL,
  `deductible` int(11) NOT NULL,
  `date` date NOT NULL,
  `claims` float NOT NULL,
  `cashout` float NOT NULL,
  `premium` int(11) NOT NULL,
  `insurancefaction` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`policyid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.insurance_factions
CREATE TABLE IF NOT EXISTS `insurance_factions` (
  `factionID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gen_maxi` float NOT NULL DEFAULT '0.005',
  `news` text,
  `subscription` text,
  PRIMARY KEY (`factionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.interiors
CREATE TABLE IF NOT EXISTS `interiors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `type` int(1) DEFAULT '0',
  `owner` int(11) DEFAULT '-1',
  `locked` int(1) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `name` text,
  `interior` int(5) DEFAULT '0',
  `interiorx` float DEFAULT '0',
  `interiory` float DEFAULT '0',
  `interiorz` float DEFAULT '0',
  `dimensionwithin` int(5) DEFAULT '0',
  `interiorwithin` int(5) DEFAULT '0',
  `angle` float DEFAULT '0',
  `angleexit` float DEFAULT '0',
  `supplies` text,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `disabled` tinyint(3) unsigned DEFAULT '0',
  `lastused` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` varchar(45) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(45) DEFAULT NULL,
  `isLightOn` tinyint(4) NOT NULL DEFAULT '0',
  `keypad_lock` int(11) DEFAULT NULL,
  `keypad_lock_pw` varchar(32) DEFAULT NULL,
  `keypad_lock_auto` tinyint(1) DEFAULT NULL,
  `faction` int(11) DEFAULT '0',
  `protected_until` datetime DEFAULT NULL,
  `furniture` int(1) NOT NULL DEFAULT '1',
  `interior_id` int(11) DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT '0',
  `settings` text,
  `address` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.interior_business
CREATE TABLE IF NOT EXISTS `interior_business` (
  `intID` int(11) NOT NULL,
  `businessNote` varchar(101) NOT NULL DEFAULT 'Welcome to our business!',
  PRIMARY KEY (`intID`),
  UNIQUE KEY `intID_UNIQUE` (`intID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves info about businesses - Maxime';

-- Data exporting was unselected.
-- Dumping structure for table mta.interior_logs
CREATE TABLE IF NOT EXISTS `interior_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `intID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_interior` (`intID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on interiors - Monitored by Interio';

-- Data exporting was unselected.
-- Dumping structure for table mta.interior_notes
CREATE TABLE IF NOT EXISTS `interior_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.interior_textures
CREATE TABLE IF NOT EXISTS `interior_textures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interior` int(11) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rotation` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.ippc_airlines
CREATE TABLE IF NOT EXISTS `ippc_airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.ippc_airline_pilots
CREATE TABLE IF NOT EXISTS `ippc_airline_pilots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `leader` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.ippc_flights
CREATE TABLE IF NOT EXISTS `ippc_flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callsign` varchar(50) NOT NULL,
  `adep` varchar(50) NOT NULL,
  `ades` varchar(50) NOT NULL,
  `etd` datetime NOT NULL,
  `eta` datetime DEFAULT NULL,
  `vin` int(11) NOT NULL,
  `pilot1` int(11) DEFAULT NULL,
  `pilot2` int(11) DEFAULT NULL,
  `remarks` text,
  `airline` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tickets` tinyint(1) NOT NULL,
  `seats1` int(3) DEFAULT NULL,
  `seats2` int(3) DEFAULT NULL,
  `seats3` int(3) DEFAULT NULL,
  `price1` int(3) DEFAULT NULL,
  `price2` int(3) DEFAULT NULL,
  `price3` int(3) DEFAULT NULL,
  `submitter` int(11) NOT NULL,
  `submitted` datetime NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.items
CREATE TABLE IF NOT EXISTS `items` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `itemID` int(10) NOT NULL,
  `itemValue` varchar(255) NOT NULL,
  `protected` int(100) NOT NULL DEFAULT '0',
  `metadata` text COMMENT 'additional data for the item that can be edited per individual item, JSON',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.jailed
CREATE TABLE IF NOT EXISTS `jailed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) NOT NULL,
  `charactername` text NOT NULL,
  `jail_time` bigint(12) NOT NULL,
  `jail_time_online` int(10) NOT NULL DEFAULT '0',
  `convictionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text NOT NULL,
  `charges` text NOT NULL,
  `cell` text NOT NULL,
  `fine` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `jobID` int(11) NOT NULL DEFAULT '0',
  `jobCharID` int(11) NOT NULL DEFAULT '-1',
  `jobLevel` int(11) NOT NULL DEFAULT '1',
  `jobProgress` int(11) NOT NULL DEFAULT '0',
  `jobTruckingRuns` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Saves job info, skill level and progress - Maxime';

-- Data exporting was unselected.
-- Dumping structure for table mta.jobs_trucker_orders
CREATE TABLE IF NOT EXISTS `jobs_trucker_orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderX` float NOT NULL DEFAULT '0',
  `orderY` float NOT NULL DEFAULT '0',
  `orderZ` float NOT NULL DEFAULT '0',
  `orderName` text NOT NULL,
  `orderInterior` int(11) NOT NULL DEFAULT '0',
  `orderSupplies` text,
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Saves info about customer orders to create markers for truck';

-- Data exporting was unselected.
-- Dumping structure for table mta.leo_impound_lot
CREATE TABLE IF NOT EXISTS `leo_impound_lot` (
  `lane` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `int` float NOT NULL,
  `dim` float NOT NULL,
  `faction` int(11) NOT NULL,
  `veh` int(11) NOT NULL DEFAULT '0',
  `fine` int(11) NOT NULL DEFAULT '0',
  `release_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lane`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.lifts
CREATE TABLE IF NOT EXISTS `lifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.lift_floors
CREATE TABLE IF NOT EXISTS `lift_floors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lift` int(11) NOT NULL,
  `x` float(10,6) DEFAULT '0.000000',
  `y` float(10,6) DEFAULT '0.000000',
  `z` float(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `floor` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.lottery
CREATE TABLE IF NOT EXISTS `lottery` (
  `characterid` int(255) NOT NULL,
  `ticketnumber` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.maps
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `preview` text NOT NULL,
  `purposes` text NOT NULL,
  `used_by` text NOT NULL,
  `reasons` text NOT NULL,
  `approved` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `uploader` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'exterior',
  `upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewer` int(10) unsigned DEFAULT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.maps_objects
CREATE TABLE IF NOT EXISTS `maps_objects` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL,
  `id` text,
  `interior` int(11) NOT NULL,
  `dimension` int(11) DEFAULT NULL,
  `collisions` tinyint(1) DEFAULT NULL,
  `breakable` tinyint(1) DEFAULT NULL,
  `radius` double unsigned DEFAULT NULL,
  `model` int(10) unsigned NOT NULL,
  `lodModel` int(10) unsigned DEFAULT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  `posZ` double NOT NULL,
  `rotX` double NOT NULL,
  `rotY` double NOT NULL,
  `rotZ` double NOT NULL,
  `doublesided` tinyint(1) unsigned DEFAULT NULL,
  `scale` double unsigned DEFAULT NULL,
  `alpha` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `index_UNIQUE` (`index`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_apb
CREATE TABLE IF NOT EXISTS `mdc_apb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_involved` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `organization` varchar(10) NOT NULL DEFAULT 'LSPD',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_calls
CREATE TABLE IF NOT EXISTS `mdc_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_crimes
CREATE TABLE IF NOT EXISTS `mdc_crimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_criminals
CREATE TABLE IF NOT EXISTS `mdc_criminals` (
  `character` int(11) NOT NULL,
  `dob` varchar(10) NOT NULL DEFAULT 'mm/dd/yyyy',
  `ethnicity` varchar(50) NOT NULL DEFAULT 'Unknown',
  `phone` varchar(10) NOT NULL DEFAULT 'Unknown',
  `occupation` varchar(50) NOT NULL DEFAULT 'Unknown',
  `address` varchar(50) NOT NULL DEFAULT 'Unknown',
  `photo` int(11) NOT NULL DEFAULT '-1',
  `details` varchar(255) DEFAULT 'None.',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `wanted` int(11) NOT NULL DEFAULT '0',
  `wanted_by` int(11) NOT NULL DEFAULT '0',
  `wanted_details` varchar(255) DEFAULT NULL,
  `pilot_details` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`character`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_faa_events
CREATE TABLE IF NOT EXISTS `mdc_faa_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` varchar(100) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_faa_licenses
CREATE TABLE IF NOT EXISTS `mdc_faa_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `license` int(2) NOT NULL,
  `value` int(4) DEFAULT NULL,
  `officer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_groups
CREATE TABLE IF NOT EXISTS `mdc_groups` (
  `faction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `haveMdcInAllVehicles` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeeWarrants` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeeCalls` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canAddAPB` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeeVehicles` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeeProperties` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeeLicenses` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canSeePilotStuff` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `impound_can_see` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settingUsernameFormat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `faction_id_UNIQUE` (`faction_id`),
  KEY `idx_idx` (`faction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='User group''s permissions based on factions.';

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_impounds
CREATE TABLE IF NOT EXISTS `mdc_impounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veh` int(11) NOT NULL,
  `content` text,
  `reporter` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_users
CREATE TABLE IF NOT EXISTS `mdc_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charid` int(11) unsigned NOT NULL,
  `level` int(11) unsigned NOT NULL,
  `organization` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mdc_dmv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vehicle` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  UNIQUE KEY `entryid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- Data exporting was unselected.
-- Dumping structure for table mta.mdc_users_old
CREATE TABLE IF NOT EXISTS `mdc_users_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `level` int(11) NOT NULL,
  `organization` varchar(30) NOT NULL DEFAULT 'LSPD',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(45) DEFAULT NULL,
  `migration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`resource`,`migration`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.mobile_payments
CREATE TABLE IF NOT EXISTS `mobile_payments` (
  `payment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_phone` varchar(45) NOT NULL,
  `operator` varchar(45) DEFAULT 'N/A',
  `country` varchar(45) DEFAULT 'N/A',
  `game_coin` int(11) unsigned NOT NULL DEFAULT '0',
  `account` int(11) unsigned NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `cost` double NOT NULL DEFAULT '0',
  `revenue` double NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_id_UNIQUE` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.motds
CREATE TABLE IF NOT EXISTS `motds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `content` text NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` datetime DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `dismissable` tinyint(1) NOT NULL DEFAULT '1',
  `audiences` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.motd_read
CREATE TABLE IF NOT EXISTS `motd_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motdid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Note down everyone that read and dismissed the motd.';

-- Data exporting was unselected.
-- Dumping structure for table mta.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'other',
  PRIMARY KEY (`id`),
  KEY `notification_user` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(6) NOT NULL DEFAULT '0',
  `posX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `solid` int(1) NOT NULL DEFAULT '1',
  `doublesided` int(1) NOT NULL DEFAULT '0',
  `scale` float(12,7) DEFAULT NULL,
  `breakable` int(1) NOT NULL DEFAULT '0',
  `alpha` int(11) NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.online_sessions
CREATE TABLE IF NOT EXISTS `online_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff` int(10) unsigned NOT NULL,
  `minutes_online` int(10) unsigned NOT NULL DEFAULT '0',
  `minutes_duty` int(10) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.paynspray
CREATE TABLE IF NOT EXISTS `paynspray` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.pd_tickets
CREATE TABLE IF NOT EXISTS `pd_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehid` int(11) NOT NULL,
  `reason` text NOT NULL,
  `amount` int(11) NOT NULL,
  `issuer` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.peds
CREATE TABLE IF NOT EXISTS `peds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `behaviour` int(3) DEFAULT '1',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `skin` int(1) DEFAULT NULL,
  `money` bigint(20) NOT NULL DEFAULT '0',
  `gender` int(1) DEFAULT NULL,
  `stats` text,
  `description` text,
  `owner_type` int(1) NOT NULL DEFAULT '0',
  `owner` int(11) DEFAULT NULL,
  `animation` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT '0',
  `nametag` tinyint(1) NOT NULL DEFAULT '1',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.phones
CREATE TABLE IF NOT EXISTS `phones` (
  `phonenumber` int(9) NOT NULL,
  `turnedon` smallint(1) NOT NULL DEFAULT '1',
  `secretnumber` smallint(1) NOT NULL DEFAULT '0',
  `phonebook` varchar(40) NOT NULL DEFAULT '0',
  `ringtone` smallint(1) NOT NULL DEFAULT '3',
  `contact_limit` int(5) NOT NULL DEFAULT '50',
  `boughtby` int(11) NOT NULL DEFAULT '-1',
  `bought_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sms_tone` smallint(1) NOT NULL DEFAULT '7',
  `keypress_tone` smallint(1) NOT NULL DEFAULT '1',
  `tone_volume` smallint(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`phonenumber`),
  UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(50) NOT NULL,
  `entryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryNumber` varchar(50) NOT NULL,
  `entryEmail` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryFavorited` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.phone_history
CREATE TABLE IF NOT EXISTS `phone_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table mta.phone_sms
CREATE TABLE IF NOT EXISTS `phone_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table mta.pilot_notams
CREATE TABLE IF NOT EXISTS `pilot_notams` (
  `id` int(11) NOT NULL,
  `information` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.publicphones
CREATE TABLE IF NOT EXISTS `publicphones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `dimension` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.radio_stations
CREATE TABLE IF NOT EXISTS `radio_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` text,
  `source` text,
  `owner` int(11) NOT NULL DEFAULT '0',
  `register_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Dynamic radio stations.';

-- Data exporting was unselected.
-- Dumping structure for table mta.ramps
CREATE TABLE IF NOT EXISTS `ramps` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `position` text,
  `interior` int(2) DEFAULT NULL,
  `dimension` int(2) DEFAULT NULL,
  `rotation` int(5) DEFAULT NULL,
  `creator` text,
  `liftposition` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '1',
  `handler` int(11) NOT NULL,
  `reporter` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mta.restricted_freqs
CREATE TABLE IF NOT EXISTS `restricted_freqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` text,
  `limitedto` int(5) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.sapt_destinations
CREATE TABLE IF NOT EXISTS `sapt_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `destinationID` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.sapt_locations
CREATE TABLE IF NOT EXISTS `sapt_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` int(11) NOT NULL,
  `stopID` int(11) NOT NULL,
  `name` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.sapt_routes
CREATE TABLE IF NOT EXISTS `sapt_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `destination` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.serial_whitelist
CREATE TABLE IF NOT EXISTS `serial_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `serial` varchar(32) NOT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `serial_whitelist_userid_4b8e2882_uniq` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.sfia_pilots
CREATE TABLE IF NOT EXISTS `sfia_pilots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `shoptype` tinyint(4) DEFAULT '0',
  `rotationz` float NOT NULL DEFAULT '0',
  `skin` varchar(50) DEFAULT NULL,
  `sPendingWage` int(11) NOT NULL DEFAULT '0',
  `sIncome` bigint(20) NOT NULL DEFAULT '0',
  `sCapacity` int(11) NOT NULL DEFAULT '10',
  `sSales` varchar(5000) NOT NULL DEFAULT '',
  `pedName` varchar(255) DEFAULT NULL,
  `faction_belong` int(11) NOT NULL DEFAULT '0',
  `faction_access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.shop_contacts_info
CREATE TABLE IF NOT EXISTS `shop_contacts_info` (
  `npcID` int(11) NOT NULL,
  `sOwner` varchar(255) DEFAULT NULL,
  `sPhone` varchar(255) DEFAULT NULL,
  `sEmail` varchar(255) DEFAULT NULL,
  `sForum` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`npcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves data about business''s owners in shop system - MAXIME';

-- Data exporting was unselected.
-- Dumping structure for table mta.shop_products
CREATE TABLE IF NOT EXISTS `shop_products` (
  `npcID` int(11) DEFAULT NULL,
  `pItemID` int(11) DEFAULT NULL,
  `pItemValue` varchar(500) DEFAULT NULL,
  `pDesc` varchar(500) DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `pQuantity` int(11) NOT NULL DEFAULT '1',
  `pSetQuantity` int(11) NOT NULL DEFAULT '1',
  `pRestockInterval` int(11) DEFAULT '0',
  `pRestockedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pID`),
  UNIQUE KEY `pID_UNIQUE` (`pID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Saves on-sale products from players, business system by Maxi';

-- Data exporting was unselected.
-- Dumping structure for table mta.speedcams
CREATE TABLE IF NOT EXISTS `speedcams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(11,7) NOT NULL DEFAULT '0.0000000',
  `y` float(11,7) NOT NULL DEFAULT '0.0000000',
  `z` float(11,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(3) NOT NULL DEFAULT '0' COMMENT 'Stores the location of the pernament speedcams',
  `dimension` int(5) NOT NULL DEFAULT '0',
  `maxspeed` int(4) NOT NULL DEFAULT '120',
  `radius` int(4) NOT NULL DEFAULT '2',
  `enabled` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.speedingviolations
CREATE TABLE IF NOT EXISTS `speedingviolations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `speed` int(5) NOT NULL,
  `area` varchar(50) NOT NULL,
  `personVisible` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.staff_changelogs
CREATE TABLE IF NOT EXISTS `staff_changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `from_rank` int(11) NOT NULL,
  `to_rank` int(11) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Maxime 2015.01.08';

-- Data exporting was unselected.
-- Dumping structure for table mta.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT NULL,
  `y` decimal(10,6) DEFAULT NULL,
  `z` decimal(10,6) DEFAULT NULL,
  `interior` int(5) DEFAULT NULL,
  `dimension` int(5) DEFAULT NULL,
  `rx` decimal(10,6) DEFAULT NULL,
  `ry` decimal(10,6) DEFAULT NULL,
  `rz` decimal(10,6) DEFAULT NULL,
  `modelid` int(5) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.tempinteriors
CREATE TABLE IF NOT EXISTS `tempinteriors` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `interior` int(5) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `amount_paid` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table mta.tempobjects
CREATE TABLE IF NOT EXISTS `tempobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(6) NOT NULL DEFAULT '0',
  `posX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `solid` int(1) NOT NULL DEFAULT '1',
  `doublesided` int(1) NOT NULL DEFAULT '0',
  `scale` float(12,7) NOT NULL DEFAULT '1.0000000',
  `breakable` int(1) NOT NULL DEFAULT '0',
  `alpha` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`),
  KEY `dimension` (`dimension`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.textures_animated
CREATE TABLE IF NOT EXISTS `textures_animated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `frames` text NOT NULL,
  `speed` int(4) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.towstats
CREATE TABLE IF NOT EXISTS `towstats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character` int(11) NOT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(8) DEFAULT NULL COMMENT 'vehicle plate at the time of towing, if any',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date of towing',
  PRIMARY KEY (`id`),
  KEY `character_idx` (`character`),
  KEY `vehicle_idx` (`vehicle`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Detailed information for TTR leaders who towed what and when';

-- Data exporting was unselected.
-- Dumping structure for table mta.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(3) DEFAULT '0',
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `rotx` decimal(10,6) DEFAULT '0.000000',
  `roty` decimal(10,6) DEFAULT '0.000000',
  `rotz` decimal(10,6) DEFAULT '0.000000',
  `currx` decimal(10,6) DEFAULT '0.000000',
  `curry` decimal(10,6) DEFAULT '0.000000',
  `currz` decimal(10,6) DEFAULT '0.000000',
  `currrx` decimal(10,6) DEFAULT '0.000000',
  `currry` decimal(10,6) DEFAULT '0.000000',
  `currrz` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `fuel` int(3) DEFAULT '100',
  `engine` int(1) DEFAULT '0',
  `locked` int(1) DEFAULT '0',
  `lights` int(1) DEFAULT '0',
  `sirens` int(1) DEFAULT '0',
  `paintjob` int(11) DEFAULT '0',
  `hp` float DEFAULT '1000',
  `color1` varchar(50) DEFAULT '0',
  `color2` varchar(50) DEFAULT '0',
  `color3` varchar(50) DEFAULT NULL,
  `color4` varchar(50) DEFAULT NULL,
  `plate` text,
  `faction` int(11) DEFAULT '-1',
  `owner` int(11) DEFAULT '-1',
  `job` int(11) DEFAULT '-1',
  `tintedwindows` int(1) DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `currdimension` int(5) DEFAULT '0',
  `currinterior` int(5) DEFAULT '0',
  `enginebroke` int(1) DEFAULT '0',
  `items` text,
  `itemvalues` text,
  `Impounded` int(3) DEFAULT '0',
  `handbrake` int(1) DEFAULT '0',
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `upgrades` varchar(150) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]',
  `wheelStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0 ] ]',
  `panelStates` varchar(40) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]',
  `doorStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0, 0, 0 ] ]',
  `odometer` int(15) DEFAULT '0',
  `headlights` varchar(30) DEFAULT '[ [ 255, 255, 255 ] ]',
  `variant1` int(3) DEFAULT NULL,
  `variant2` int(3) DEFAULT NULL,
  `descriptionadmin` varchar(300) NULL,
  `description1` varchar(300) NOT NULL DEFAULT '',
  `description2` varchar(300) NOT NULL DEFAULT '',
  `description3` varchar(300) NOT NULL DEFAULT '',
  `description4` varchar(300) NOT NULL DEFAULT '',
  `description5` varchar(300) NOT NULL DEFAULT '',
  `suspensionLowerLimit` float DEFAULT NULL,
  `driveType` char(5) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `chopped` tinyint(4) NOT NULL DEFAULT '0',
  `stolen` tinyint(4) NOT NULL DEFAULT '0',
  `lastUsed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `trackingdevice` varchar(255) DEFAULT NULL,
  `registered` int(2) NOT NULL DEFAULT '1',
  `show_plate` int(2) NOT NULL DEFAULT '1',
  `show_vin` int(2) NOT NULL DEFAULT '1',
  `paintjob_url` varchar(255) DEFAULT NULL,
  `vehicle_shop_id` int(11) DEFAULT NULL,
  `bulletproof` tinyint(4) NOT NULL DEFAULT '0',
  `textures` varchar(300) NOT NULL DEFAULT '[ [ ] ]',
  `business` int(11) NOT NULL DEFAULT '-1',
  `protected_until` datetime DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT '0',
  `settings` varchar(500) DEFAULT NULL,
  `hotwired` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.vehicles_custom
CREATE TABLE IF NOT EXISTS `vehicles_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `doortype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.vehicles_shop
CREATE TABLE IF NOT EXISTS `vehicles_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehmtamodel` int(11) DEFAULT '0',
  `vehbrand` varchar(255) DEFAULT NULL,
  `vehmodel` varchar(500) DEFAULT NULL,
  `vehyear` int(11) DEFAULT '2014',
  `vehprice` int(11) DEFAULT '0',
  `vehtax` int(11) DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(500) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '1000',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `spawnto` tinyint(2) NOT NULL DEFAULT '0',
  `doortype` tinyint(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `spawn_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.vehicle_logs
CREATE TABLE IF NOT EXISTS `vehicle_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vehID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_vehicle` (`vehID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on vehicles - Monitored by Vehicle ';

-- Data exporting was unselected.
-- Dumping structure for table mta.vehicle_notes
CREATE TABLE IF NOT EXISTS `vehicle_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.wiretransfers
CREATE TABLE IF NOT EXISTS `wiretransfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT '0',
  `to` int(11) DEFAULT '0',
  `amount` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL,
  `from_card` varchar(45) DEFAULT NULL,
  `to_card` varchar(45) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.worlditems
CREATE TABLE IF NOT EXISTS `worlditems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT '0',
  `itemvalue` text,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `creationdate` datetime DEFAULT NULL,
  `rx` float DEFAULT '0',
  `ry` float DEFAULT '0',
  `rz` float DEFAULT '0',
  `creator` int(10) unsigned DEFAULT '0',
  `protected` int(100) NOT NULL DEFAULT '0',
  `perm_use` int(2) NOT NULL DEFAULT '1',
  `perm_move` int(2) NOT NULL DEFAULT '1',
  `perm_pickup` int(2) NOT NULL DEFAULT '1',
  `perm_use_data` text,
  `perm_move_data` text,
  `perm_pickup_data` text,
  `useExactValues` int(1) NOT NULL DEFAULT '0',
  `metadata` text COMMENT 'additional data for the item that can be edited per individual item, JSON',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table mta.worlditems_data
CREATE TABLE IF NOT EXISTS `worlditems_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xitem_idx` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Dumping structure for table mta.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table mta.settings: 7 rows
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `name`, `value`) VALUES
	(1, 'tax', '5'),
	(2, 'incometax', '10'),
	(5, 'pdcodes', 'Radio Codes:\r\n10-1: Roll Call, all units respond to said location.\r\n10-2: Arrived on scene.\r\n10-3: Negative / No\r\n10-4: Acknowledgement / Affirmative / Yes\r\n10-5: Repeat last transmission\r\n10-6: Stand-by\r\n10-7: Unavailable for calls\r\n10-8: Available for calls\r\n10-9: Suspect Lost (Usually followed by a 10-17)\r\n10-10: Activity update along with giving your current position\r\n10-12: Backup Required (Specify situation and location)\r\n10-13: Requesting Speciality unit(specify: To SAM, EDWARD, HENRY, TOM, X-RAY, Towtruck, DFT) \r\n10-14: Requesting Medical Unit\r\n10-17: Requesting description on the suspect\r\n10-18: Requesting MDC check (on First-name Last-name)\r\n10-19: Response to MDC (On a 10-18)\r\n10-20: Requesting Location\r\n10-22: Disregard last transmission\r\n10-30: Starting Patrol/Resuming patrol after Code 7\r\n10-31: Returning to Station\r\n10-33: Officer in distress (Use when not able to use backup COMMS i.e; "Lincoln 1 to COMMS, Going 10-33 for a meal break.")\r\n10-50: Car accident\r\n10-55: Traffic Stop\r\n10-56: Speed Trap\n10-57 Victor: Vehicle pursuit.\r\n10-57 Foxtrot: Foot pursuit.\r\n10-66: Felony Stop\r\n10-88 Suspicious Person(s)\r\n10-99: Assignment complete (State condition and at what call)\r\n\r\n11-98: Emergency at Office\r\n11-99: Officer Down\n\r\n\r\nStatus-codes:\r\nStatus 1: Starting tour of Duty.\r\nStatus 2: Ending tour of Duty.\r\n\r\nIdentity Codes:\r\nIC-1: White\r\nIC-2: Black\r\nIC-3: Latino or Mexican\r\nIC-4: Middle-Eastern\r\nIC-5: Asian\r\nIC-6: Unknown ethnicity.\r\n\r\n\r\nSituation codes:\r\nCode 0: Absolute emergency. Drop everything you have and respond.\nCode 1: Non-emergency. If you\"re doing something, deal with it first. Respond without lights or sirens.\r\nCode 2: Non-emergency. If you\"re doing something, drop it and respond. Respond with lights only.\r\nCode 3: There is an emergency. Respond with lights and sirens.\r\nCode 4: No assistance required, situation under control.\r\nCode 5: All units stay out of <location>.\r\nCode 6: Out of car at <location>.\r\nCode 7: Break, specify if available for calls or not.\r\n\r\n\r\nCriminal Codes:\r\n148: Resisting Arrest \r\n187: Homicide\r\n192: Manslaughter\r\n207: Kidnapping\r\n211: Robbery\r\n240: Assault\r\n242: Battery\r\n245: Assault W/Deadly Weapon\r\n417: Brandishing a weapon\r\n459: Burglary\r\n487: Grand Theft (Exceeding $400)\r\n487: Petty Theft\r\n602: Trespass/Fraud\n\n\nSECTOR ASSIGNMENTS\r\n01 - CENTRAL BUREAU;\r\n02 - NORTH-WEST BUREAU;\r\n03 - DETECTIVE BUREAU;\r\n04 - SPECIAL OPERATIONS DIVISION;\r\n05 - SUPERVISOR - SUPERVISORY STAFF;\r\n06 - SUPERVISOR - COMMAND STAFF;\r\n07- SUPERVISOR - EXECUTIVE STAFF;\n\n\nUNIT TYPES\r\nADAM (A): Partnered patrol unit;\r\nAIR: Helicopter unit;\r\nBOY (B): Bicycle patrol unit;\r\nCHARLIE (C): Crime Suppression Unit;\nDAVID (D): Special Weapons and Tactics;\r\nFRANK (F): Footbeat patrol unit;\r\nGEORGE (G): Partnered detective unit.\r\nHENRY (H): Single detective unit;\r\nLINCOLN (L): Single deputy patrol unit;\r\nMARINE: Boat patrol unit;\r\nMARY (M): Motorcycle patrol unit;\r\nPETER (P): Partnered "LINCOLN" units;\r\nTOM (T): Marked Traffic Unit;\r\nUNION (U): Unmarked Traffic Unit;\r\nWILLIAM (W): High-Speed Interception Unit;\n\n\nPhonetics:\r\nA: Adam\r\nB: Boy\r\nC: Charlie\r\nD: David\r\nE: Edward\r\nF: Frank\r\nG: George\r\nH: Henry\r\nI: Ida\r\nJ: John\r\nK: King\r\nL: Lincoln\r\nM: Mary\r\nN: Nora\r\nO: Ocean\r\nP: Paul\r\nQ: Queen\r\nR: Robert\r\nS: Sam\r\nT: Tom\r\nU: Union\r\nV: Victor\r\nW: William\r\nX: X-Ray\r\nY: Young\r\nZ: Zebra\r\n\r\nSlang:\r\nAPB: All points bulletin\r\nBOLO: Be on look out\r\nCOMMS: Communications\r\nDOA: Dead on arrival \r\nDOB: Date of birth\r\nDWI: Driving while intoxicated \r\nETA: Estimative Time of Arrival\r\nGOV: Government of Los Santos\r\nGSW: Gun shot wound\r\nHQ: Headquarters \r\nHzM: HazMat\r\nKIA: Killed in Action\r\nLSFD: Los Santos Fire Department\r\nLSIA: Los Santos International Airport\r\nLSPD: Los Santos Police Department\r\nMHD: Mental Health Division\r\nMVA: Motor-Vehicle Accident \r\nNiner: 9-1-1 call\r\nOCI: Office of Criminal Intelligence\r\nRO: registered owner\r\nSAR: Search and Rescue\r\nTC: Traffic Collision\r\n5150: Possible mental case (IE: a troll, a person refusing to RP, a noob.)\n'),
	(6, 'pdprocedures', 'It\"s lonely here or content is out of date. \n\nPlease refresh..\n'),
	(7, 'welfare', '200'),
	(8, 'lottery', '0'),
	(9, 'lotteryNumber', '13');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
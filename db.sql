CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `status` varchar(50) DEFAULT 'active',
  `outing` decimal(15,2) DEFAULT '0.00',
  `api_key` varchar(100) DEFAULT NULL,
  `referal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payme_id` varchar(100) DEFAULT NULL,
  `start` text,
  `kabinet` text,
  `referal` varchar(50) DEFAULT '0',
  `orders` text,
  `bonus` varchar(50) DEFAULT '0',
  `ref_status` varchar(10) DEFAULT 'on',
  PRIMARY KEY (`id`)
);
INSERT INTO `settings` (`id`, `referal`, `bonus`) VALUES (1, '100', '10');

CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_url` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `api_order` varchar(100) DEFAULT NULL,
  `provider` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`order_id`)
);

CREATE TABLE IF NOT EXISTS `myorder` (
  `order_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `retail` decimal(15,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `service` varchar(100) DEFAULT NULL,
  `order_create` datetime DEFAULT NULL,
  `last_check` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
);

CREATE TABLE IF NOT EXISTS `categorys` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` varchar(50) DEFAULT 'ON',
  PRIMARY KEY (`category_id`)
);

CREATE TABLE IF NOT EXISTS `cates` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`)
);

CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_status` varchar(20) DEFAULT 'on',
  `service_price` decimal(15,2) DEFAULT '0.00',
  `service_edit` varchar(10) DEFAULT 'true',
  `category_id` int(11) NOT NULL,
  `service_api` varchar(100) DEFAULT NULL,
  `api_service` int(11) DEFAULT NULL,
  `api_currency` varchar(10) DEFAULT 'UZS',
  `service_type` varchar(50) DEFAULT 'Default',
  `api_detail` text,
  `service_name` text,
  `service_desc` text,
  `service_min` int(11) DEFAULT 0,
  `service_max` int(11) DEFAULT 0,
  PRIMARY KEY (`service_id`)
);

CREATE TABLE IF NOT EXISTS `send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step` varchar(50) DEFAULT NULL,
  `time1` varchar(10) DEFAULT NULL,
  `time2` varchar(10) DEFAULT NULL,
  `time3` varchar(10) DEFAULT NULL,
  `time4` varchar(10) DEFAULT NULL,
  `time5` varchar(10) DEFAULT NULL,
  `start_id` int(11) DEFAULT 0,
  `stop_id` int(11) DEFAULT 0,
  `admin_id` bigint(20) DEFAULT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  `reply_markup` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `percent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percent` varchar(10) DEFAULT '20',
  PRIMARY KEY (`id`)
);
INSERT INTO `percent` (`id`, `percent`) VALUES (1, '30');

CREATE TABLE IF NOT EXISTS `mybots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `admin` bigint(20) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
);


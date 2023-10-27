CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON krampoline.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

USE `krampoline`;

DROP TABLE IF EXISTS `sample_data`;
CREATE TABLE `sample_data` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `detail` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO sample_data (`id`,`detail`) VALUES ('1', 'Hello DKOS!');

CREATE TABLE `user_tb`
(
    `id`         BIGINT AUTO_INCREMENT NOT NULL,
    `dtype`      VARCHAR(31)           NULL,
    `email`      VARCHAR(100)          NOT NULL,
    `password`   VARCHAR(256)          NOT NULL,
    `username`   VARCHAR(45)           NOT NULL,
    `grade`      VARCHAR(255)          NOT NULL,
    `upgrade_at` datetime              NULL,
    `is_active`  BIT(1)                NULL,
    `created_at` datetime              NOT NULL,
    CONSTRAINT `pk_user_tb` PRIMARY KEY (`id`)
);

ALTER TABLE `user_tb`
    ADD CONSTRAINT `uc_user_tb_email` UNIQUE (`email`);

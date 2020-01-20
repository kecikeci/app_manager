/*
 Navicat Premium Data Transfer

 Source Server         : m.sql.ximiyun.cn
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : m.sql.ximiyun.cn:3306
 Source Schema         : app_manager

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 20/01/2020 10:46:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_app
-- ----------------------------
DROP TABLE IF EXISTS `tb_app`;
CREATE TABLE `tb_app`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bundleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `short_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currentid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKko0p9ketftfcpem2ilctnqsdi`(`platform`, `bundleid`) USING BTREE,
  UNIQUE INDEX `UK_kee8w6a6l62c8wnfhecpdhl7a`(`short_code`) USING BTREE,
  INDEX `FK5gjh0wr7yd0scvqsgjh2u5b7`(`currentid`) USING BTREE,
  CONSTRAINT `FK5gjh0wr7yd0scvqsgjh2u5b7` FOREIGN KEY (`currentid`) REFERENCES `tb_package` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_app
-- ----------------------------
INSERT INTO `tb_app` VALUES ('402804816d01dc7e016d01dcf3d30000', 'com.efun.jxqy.tw', 1567694314346, '剑侠情缘</br>ddddd剑侠归来', '剑侠情缘', 'android', 'SmZA', '402804816d01dc7e016d01dcf3dc0001');

-- ----------------------------
-- Table structure for tb_package
-- ----------------------------
DROP TABLE IF EXISTS `tb_package`;
CREATE TABLE `tb_package`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `build_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bundleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `min_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provision_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7gwn5l5wkgc0kl6jqwscyev3c`(`app_id`) USING BTREE,
  INDEX `FKaw5kjsu6mdv50urlycamio87b`(`provision_id`) USING BTREE,
  CONSTRAINT `FK7gwn5l5wkgc0kl6jqwscyev3c` FOREIGN KEY (`app_id`) REFERENCES `tb_app` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKaw5kjsu6mdv50urlycamio87b` FOREIGN KEY (`provision_id`) REFERENCES `tb_provision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_package
-- ----------------------------
INSERT INTO `tb_package` VALUES ('402804816d01dc7e016d01dcf3dc0001', '1100002', 'com.efun.jxqy.tw', 1567694314346, 'android.apk', '14', '剑侠情缘', 'android', 1748793439, '1.11.2', '402804816d01dc7e016d01dcf3d30000', NULL);

-- ----------------------------
-- Table structure for tb_provision
-- ----------------------------
DROP TABLE IF EXISTS `tb_provision`;
CREATE TABLE `tb_provision`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `device_count` int(11) NOT NULL,
  `devices` mediumblob NULL,
  `expiration_date` datetime(0) NULL DEFAULT NULL,
  `is_enterprise` bit(1) NOT NULL,
  `teamid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `team_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_web_hook
-- ----------------------------
DROP TABLE IF EXISTS `tb_web_hook`;
CREATE TABLE `tb_web_hook`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKm4vc6n6ewbotvkyablntrsbx6`(`app_id`) USING BTREE,
  CONSTRAINT `FKm4vc6n6ewbotvkyablntrsbx6` FOREIGN KEY (`app_id`) REFERENCES `tb_app` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

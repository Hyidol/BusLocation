/*
 Navicat Premium Data Transfer

 Source Server         : LocalMySql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : sb_gps_sys_test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 15/04/2019 03:03:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_department
-- ----------------------------
DROP TABLE IF EXISTS `b_department`;
CREATE TABLE `b_department`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加索引unique_',
  `UPLEVEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENTID` int(11) NULL DEFAULT NULL,
  `LEAF` tinyint(1) NULL DEFAULT NULL COMMENT '1-叶子  0-树枝',
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `index_code`(`CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of b_department
-- ----------------------------
INSERT INTO `b_department` VALUES (1, '开发小组', 'ky_0000', '无', 0, 0, NULL, NULL, NULL, NULL, '2019-04-12 14:19:38', 'DevGro', '2019-04-12 14:19:38', NULL, 1);

-- ----------------------------
-- Table structure for file_attach
-- ----------------------------
DROP TABLE IF EXISTS `file_attach`;
CREATE TABLE `file_attach`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `FILENAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILEPATH` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EXT` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILETYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NOTE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for p_notice
-- ----------------------------
DROP TABLE IF EXISTS `p_notice`;
CREATE TABLE `p_notice`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SYS_ID` int(11) NOT NULL,
  `PN_TOPIC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PN_CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PN_TYPE` int(11) NULL DEFAULT NULL COMMENT '\r\n0-新闻 1-公告 2-供需发布  3-活动发布 4-法律服务 5-政策法规 6-资料下载',
  `PN_STATE` int(11) NULL DEFAULT 0 COMMENT '0-草稿\r\n            1-待审核\r\n            2-已发布',
  `PN_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_12`(`SYS_ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`SYS_ID`) REFERENCES `sys_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '0-新闻\r\n1-公告\r\n\r\n4-法律服务\r\n                             -&#&; InnoDB free: 10240 kB; ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for p_notice_attach
-- ----------------------------
DROP TABLE IF EXISTS `p_notice_attach`;
CREATE TABLE `p_notice_attach`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `P_N_ID` int(11) NOT NULL,
  `FIL_ID` int(11) NOT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_13`(`P_N_ID`) USING BTREE,
  INDEX `FK_Relationship_14`(`FIL_ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`P_N_ID`) REFERENCES `p_notice` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`FIL_ID`) REFERENCES `file_attach` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`P_N_ID`) REFER `tt1/p_notice`(`ID`); (`FIL_ID`) REFER `' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_bus
-- ----------------------------
DROP TABLE IF EXISTS `sb_bus`;
CREATE TABLE `sb_bus`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SBB_SEAT_NUM` int(11) NULL DEFAULT NULL,
  `SBB_BUS_TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBB_PLATE_NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBB_DRIVER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBB_DRIVER_TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sb_bus
-- ----------------------------
INSERT INTO `sb_bus` VALUES (1, 56, '大客车', '浙A8K420', '王师傅', '13736892513', NULL, NULL, NULL, NULL, '2019-04-14 14:03:19', NULL, '2019-04-14 13:58:49', NULL, 1);
INSERT INTO `sb_bus` VALUES (2, 56, '大客车', '浙A8k431', '李师傅', '13083966561', NULL, NULL, NULL, NULL, '2019-04-14 14:03:19', NULL, '2019-04-14 14:02:50', NULL, 1);
INSERT INTO `sb_bus` VALUES (3, 48, '中客车', '浙A8L412', '赵师傅', '18058711516', NULL, NULL, NULL, NULL, '2019-04-14 14:03:20', NULL, '2019-04-14 14:02:50', NULL, 1);
INSERT INTO `sb_bus` VALUES (4, 56, '大客车', '浙A8K423', '刘师傅', '15397058050', NULL, NULL, NULL, NULL, '2019-04-14 14:03:20', NULL, '2019-04-14 14:02:50', NULL, 1);
INSERT INTO `sb_bus` VALUES (5, 36, '中客车', '浙A8k432', '刘师傅', '13083966561', NULL, NULL, NULL, NULL, '2019-04-14 14:03:22', NULL, '2019-04-14 14:02:50', NULL, 1);

-- ----------------------------
-- Table structure for sb_bus_route
-- ----------------------------
DROP TABLE IF EXISTS `sb_bus_route`;
CREATE TABLE `sb_bus_route`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SB__ID` int(11) NOT NULL,
  `SB__ID2` int(11) NOT NULL,
  `SBBR_WEEK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBBR_START_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBBR_END_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_6`(`SB__ID`) USING BTREE,
  INDEX `FK_Relationship_7`(`SB__ID2`) USING BTREE,
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`SB__ID`) REFERENCES `sb_bus` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`SB__ID2`) REFERENCES `sb_route` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SB__ID`) REFER `tt1/sb_bus`(`ID`); (`SB__ID2`) REFER `t' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sb_bus_route
-- ----------------------------
INSERT INTO `sb_bus_route` VALUES (1, 1, 2, '星期一', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 21:58:17', 'system', '2019-04-14 21:55:36', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (2, 1, 2, '星期二', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 21:57:54', 'system', '2019-04-14 21:57:54', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (3, 1, 2, '星期三', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 21:58:15', 'system', '2019-04-14 21:58:15', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (4, 1, 2, '星期四', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 21:58:52', 'system', '2019-04-14 21:58:52', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (5, 1, 2, '星期五', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 21:59:36', 'system', '2019-04-14 21:59:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (6, 2, 5, '星期一', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:00:03', 'system', '2019-04-14 22:00:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (7, 2, 5, '星期二', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:00:42', 'system', '2019-04-14 22:00:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (8, 2, 5, '星期三', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:00:45', 'system', '2019-04-14 22:00:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (9, 2, 5, '星期四', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:00:47', 'system', '2019-04-14 22:00:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (10, 2, 5, '星期五', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:02:37', 'system', '2019-04-14 22:00:03', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (11, 3, 3, '星期一', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:02:35', 'system', '2019-04-14 22:02:35', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (12, 3, 3, '星期二', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:03:16', 'system', '2019-04-14 22:02:35', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (13, 3, 3, '星期三', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:03:19', 'system', '2019-04-14 22:02:35', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (14, 3, 3, '星期四', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:03:21', 'system', '2019-04-14 22:02:35', 'system', 1);
INSERT INTO `sb_bus_route` VALUES (15, 3, 3, '星期五', '6:00 AM', '8:00 AM', NULL, NULL, NULL, NULL, '2019-04-14 22:03:23', 'system', '2019-04-14 22:02:35', 'system', 1);

-- ----------------------------
-- Table structure for sb_busposition
-- ----------------------------
DROP TABLE IF EXISTS `sb_busposition`;
CREATE TABLE `sb_busposition`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SB__ID` int(11) NOT NULL,
  `SBP_RECODE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `SBP_LONGITUDE` double NULL DEFAULT NULL,
  `SBP_LATITUDE` double NULL DEFAULT NULL,
  `SBP_VELOCITY` double NULL DEFAULT NULL,
  `SBP_DIRECTION` double NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_10`(`SB__ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`SB__ID`) REFERENCES `sb_bus` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SB__ID`) REFER `tt1/sb_bus`(`ID`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sb_busposition
-- ----------------------------
INSERT INTO `sb_busposition` VALUES (1, 1, '2019-04-15 01:57:02', 104.038748, 30.641821, 65.25, 60.4, NULL, NULL, NULL, NULL, '2019-04-14 14:13:44', 'system', '2019-04-14 14:13:44', 'system', 1);
INSERT INTO `sb_busposition` VALUES (2, 1, '2019-04-15 01:57:22', 104.041, 30.642, 66.44, 90.5, NULL, NULL, NULL, NULL, '2019-04-14 14:44:06', 'system', '2019-04-14 14:44:06', 'system', 1);
INSERT INTO `sb_busposition` VALUES (3, 1, '2019-04-15 02:36:13', 104.045, 30.644, 76.45, 30.5, NULL, NULL, NULL, NULL, '2019-04-14 14:45:11', 'system', '2019-04-14 14:45:11', 'system', 1);
INSERT INTO `sb_busposition` VALUES (4, 1, '2019-04-15 02:36:34', 104.047, 30.647, 77.32, 55.7, NULL, NULL, NULL, NULL, '2019-04-14 14:51:48', 'system', '2019-04-14 14:51:48', 'system', 1);
INSERT INTO `sb_busposition` VALUES (5, 1, '2019-04-15 02:34:37', 104.047789, 30.648128, 79.23, 60.59, NULL, NULL, NULL, NULL, '2019-04-15 01:57:49', NULL, '2019-04-15 01:57:49', NULL, 1);
INSERT INTO `sb_busposition` VALUES (6, 1, '2019-04-15 02:34:38', 104.051, 30.65, 55.24, 75.14, NULL, NULL, NULL, NULL, '2019-04-15 02:00:51', NULL, '2019-04-15 02:00:51', NULL, 1);
INSERT INTO `sb_busposition` VALUES (7, 1, '2019-04-15 02:34:38', 104.055, 30.652, 64.12, 55.12, NULL, NULL, NULL, NULL, '2019-04-15 02:01:17', NULL, '2019-04-15 02:01:17', NULL, 1);
INSERT INTO `sb_busposition` VALUES (8, 1, '2019-04-15 02:34:39', 104.059, 30.653, 75.14, 13.24, NULL, NULL, NULL, NULL, '2019-04-15 02:01:35', NULL, '2019-04-15 02:01:35', NULL, 1);
INSERT INTO `sb_busposition` VALUES (9, 1, '2019-04-15 02:34:39', 104.063959, 30.655336, 44.17, 45.12, NULL, NULL, NULL, NULL, '2019-04-15 02:02:02', NULL, '2019-04-15 02:02:02', NULL, 1);
INSERT INTO `sb_busposition` VALUES (10, 1, '2019-04-15 02:34:40', 104.064, 30.657, 11.42, 12.75, NULL, NULL, NULL, NULL, '2019-04-15 02:02:25', NULL, '2019-04-15 02:02:25', NULL, 1);
INSERT INTO `sb_busposition` VALUES (11, 1, '2019-04-15 02:34:40', 104.065, 30.658, 0, 71.01, NULL, NULL, NULL, NULL, '2019-04-15 02:02:44', NULL, '2019-04-15 02:02:44', NULL, 1);
INSERT INTO `sb_busposition` VALUES (12, 3, '2019-04-15 02:35:28', 105.038748, 31.641821, 52.14, 89.15, NULL, NULL, NULL, NULL, '2019-04-15 02:04:21', NULL, '2019-04-15 02:04:21', NULL, 1);
INSERT INTO `sb_busposition` VALUES (13, 3, '2019-04-15 02:34:41', 105.041, 31.642, 12.04, 156.21, NULL, NULL, NULL, NULL, '2019-04-15 02:04:50', NULL, '2019-04-15 02:04:50', NULL, 1);
INSERT INTO `sb_busposition` VALUES (14, 3, '2019-04-15 02:34:42', 105.045, 31.644, 45.04, 123.12, NULL, NULL, NULL, NULL, '2019-04-15 02:05:07', NULL, '2019-04-15 02:05:07', NULL, 1);
INSERT INTO `sb_busposition` VALUES (15, 3, '2019-04-15 02:34:43', 105.047, 31.647, 35.12, 76.04, NULL, NULL, NULL, NULL, '2019-04-15 02:05:27', NULL, '2019-04-15 02:05:27', NULL, 1);
INSERT INTO `sb_busposition` VALUES (16, 3, '2019-04-15 02:34:43', 105.047789, 31.648128, 51.14, 57.21, NULL, NULL, NULL, NULL, '2019-04-15 02:05:48', NULL, '2019-04-15 02:05:48', NULL, 1);
INSERT INTO `sb_busposition` VALUES (17, 3, '2019-04-15 02:34:43', 105.051, 31.65, 44.14, 78.14, NULL, NULL, NULL, NULL, '2019-04-15 02:05:55', NULL, '2019-04-15 02:05:55', NULL, 1);
INSERT INTO `sb_busposition` VALUES (18, 3, '2019-04-15 02:34:44', 105.055, 31.652, 71.95, 11.82, NULL, NULL, NULL, NULL, '2019-04-15 02:06:24', NULL, '2019-04-15 02:06:24', NULL, 1);
INSERT INTO `sb_busposition` VALUES (19, 3, '2019-04-15 02:34:45', 105.059, 31.653, 45.14, 88.12, NULL, NULL, NULL, NULL, '2019-04-15 02:06:39', NULL, '2019-04-15 02:06:39', NULL, 1);
INSERT INTO `sb_busposition` VALUES (20, 3, '2019-04-15 02:34:46', 105.063959, 31.655336, 45.123, 95.45, NULL, NULL, NULL, NULL, '2019-04-15 02:06:56', NULL, '2019-04-15 02:06:56', NULL, 1);
INSERT INTO `sb_busposition` VALUES (21, 3, '2019-04-15 02:34:46', 105.064, 31.657, 79.04, 9.14, NULL, NULL, NULL, NULL, '2019-04-15 02:07:13', NULL, '2019-04-15 02:07:13', NULL, 1);
INSERT INTO `sb_busposition` VALUES (22, 3, '2019-04-15 02:34:48', 105.065, 31.658, 14.01, 11.58, NULL, NULL, NULL, NULL, '2019-04-15 02:07:29', NULL, '2019-04-15 02:07:29', NULL, 1);

-- ----------------------------
-- Table structure for sb_busposition_his
-- ----------------------------
DROP TABLE IF EXISTS `sb_busposition_his`;
CREATE TABLE `sb_busposition_his`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SB__ID` int(11) NOT NULL,
  `SBP_RECODE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `SBP_LONGITUDE` float NULL DEFAULT NULL,
  `SBP_LATITUDE` float NULL DEFAULT NULL,
  `SBP_VELOCITY` float NULL DEFAULT NULL,
  `SBP_DIRECTION` float NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_11`(`SB__ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`SB__ID`) REFERENCES `sb_bus` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SB__ID`) REFER `tt1/sb_bus`(`ID`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `sb_role_authority`;
CREATE TABLE `sb_role_authority`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SYS_ID` int(11) NOT NULL,
  `SYS_ID2` int(11) NOT NULL,
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_21`(`SYS_ID`) USING BTREE,
  INDEX `FK_Relationship_22`(`SYS_ID2`) USING BTREE,
  CONSTRAINT `FK_Relationship_21` FOREIGN KEY (`SYS_ID`) REFERENCES `sys_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`SYS_ID2`) REFERENCES `sys_authority` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SYS_ID`) REFER `tt1/sys_role`(`ID`); (`SYS_ID2`) REFER ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_route
-- ----------------------------
DROP TABLE IF EXISTS `sb_route`;
CREATE TABLE `sb_route`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SBR_ROUTENAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBR_START_STATION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBR_END_STATION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBR_DEPART_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBR_DESC` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sb_route
-- ----------------------------
INSERT INTO `sb_route` VALUES (1, '下沙一号线', '德信早城', '上虞', '6:00 AM', '下沙一号线，下午四点原路返回', NULL, NULL, NULL, NULL, '2019-04-14 21:30:54', 'system', '2019-04-14 21:30:54', 'system', 1);
INSERT INTO `sb_route` VALUES (2, '下沙二号线', '金沙学府', '上虞', '6:00 AM', '下沙2号线，下午四点和一号线并一起返回', NULL, NULL, NULL, NULL, '2019-04-14 21:32:06', 'system', '2019-04-14 21:31:23', 'system', 1);
INSERT INTO `sb_route` VALUES (3, '余杭一号线', '余杭', '上虞', '6:00 AM', '余杭车站为第一站，下午四点原路返回', NULL, NULL, NULL, NULL, '2019-04-14 21:32:41', 'system', '2019-04-14 21:32:41', 'system', 1);
INSERT INTO `sb_route` VALUES (4, '余杭二号线', '闲湖城', '上虞', '6:00 AM', '下午四点原路返回', NULL, NULL, NULL, NULL, '2019-04-14 21:34:58', 'system', '2019-04-14 21:32:46', 'system', 1);
INSERT INTO `sb_route` VALUES (5, '余杭三号线', '工会干校', '上虞', '6:00 AM', '下午四点原路返回', NULL, NULL, NULL, NULL, '2019-04-14 21:35:39', 'system', '2019-04-14 21:35:06', 'system', 1);
INSERT INTO `sb_route` VALUES (6, '余杭四号线', '雅仕苑', '上虞', '6:00 AM', '下午四点原路返回', NULL, NULL, NULL, NULL, '2019-04-14 21:35:59', 'system', '2019-04-14 21:35:20', 'system', 1);

-- ----------------------------
-- Table structure for sb_route_station
-- ----------------------------
DROP TABLE IF EXISTS `sb_route_station`;
CREATE TABLE `sb_route_station`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SB__ID` int(11) NOT NULL,
  `SB__ID2` int(11) NOT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_8`(`SB__ID2`) USING BTREE,
  INDEX `FK_Relationship_9`(`SB__ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`SB__ID2`) REFERENCES `sb_route` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`SB__ID`) REFERENCES `sb_station` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SB__ID2`) REFER `tt1/sb_route`(`ID`); (`SB__ID`) REFER ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_station
-- ----------------------------
DROP TABLE IF EXISTS `sb_station`;
CREATE TABLE `sb_station`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SBS_STATION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBS_LONGITUDE` float NULL DEFAULT NULL,
  `SBS_LATITUDE` float NULL DEFAULT NULL,
  `SBS_DEPART_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SBS_DESC` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_user_bus
-- ----------------------------
DROP TABLE IF EXISTS `sb_user_bus`;
CREATE TABLE `sb_user_bus`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SB__ID` int(11) NOT NULL,
  `SYS_ID` int(11) NOT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_16`(`SYS_ID`) USING BTREE,
  INDEX `FK_Relationship_17`(`SB__ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`SYS_ID`) REFERENCES `sys_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_17` FOREIGN KEY (`SB__ID`) REFERENCES `sb_route` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SYS_ID`) REFER `tt1/sys_user`(`ID`); (`SB__ID`) REFER `' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sb_user_role`;
CREATE TABLE `sb_user_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SYS_ID` int(11) NOT NULL COMMENT '外键，来自于系统角色表的id',
  `SYS_ID2` int(11) NOT NULL COMMENT '外键，来自于系统用户表的id',
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Relationship_15`(`SYS_ID2`) USING BTREE,
  INDEX `FK_Relationship_18`(`SYS_ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`SYS_ID2`) REFERENCES `sys_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`SYS_ID`) REFERENCES `sys_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`SYS_ID2`) REFER `tt1/sys_user`(`ID`); (`SYS_ID`) REFER ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `SA_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SA_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SA_DISPLAY_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表,分组,细化到每个动作上' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置自动自增_',
  `SL_USER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_DEPARTMENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_OPERATOR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_MODULE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_MAC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SL_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置自动递增_',
  `SP_TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SP_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SP_REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SP_VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SP_DEFAULT_VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用于存放系统参数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置自动递增_',
  `SR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SR_MANAGE` tinyint(1) NULL DEFAULT NULL COMMENT '0-否\r\n            1-是',
  `SR_LEVEL` int(11) NULL DEFAULT NULL COMMENT '0-管理员\r\n            1-经销商\r\n            2-个人',
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统拥有的各类角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, 1, '', NULL, NULL, NULL, '2019-04-12 14:03:45', 'DevGro', '2019-04-12 14:03:45', NULL, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '设定自增_',
  `B_D_ID` int(11) NOT NULL,
  `LOGIN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一、不为空、自动生成',
  `WORKID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REAL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SALT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACCOUNT_DATE` date NULL DEFAULT NULL,
  `LAST_PSD_DATE` date NULL DEFAULT NULL,
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `REMARK3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CREATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `CREATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATED_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UPDATED_BY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Valid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `Index_LOGIN_NAME`(`LOGIN_NAME`) USING BTREE,
  INDEX `FK_Relationship_19`(`B_D_ID`) USING BTREE,
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`B_D_ID`) REFERENCES `b_department` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 10240 kB; (`B_D_ID`) REFER `tt1/b_department`(`ID`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '20190412', 'admin', 'admin', NULL, '310853215677120102', '853215640', '123456789@163.com', '2019-04-12', '2019-04-12', NULL, NULL, NULL, NULL, '2019-04-12 14:24:06', 'DevGro', '2019-04-12 14:24:00', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
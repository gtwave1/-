/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : databaseweb

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 18/12/2018 10:10:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '比赛id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '比赛名称',
  `detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '比赛简介',
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '报名时间',
  `stop` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '报名截止时间',
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '比赛结束时间',
  `statu` tinyint(2) NOT NULL DEFAULT 0 COMMENT '比赛状态：0为报名期；1为审核期；2为决赛期；3为结束期',
  `kind` tinyint(2) NOT NULL DEFAULT 0 COMMENT '比赛分组：0为不分组；1为大一/大二大三组',
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '比赛详细文档',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', '科技月月评', '巴拉巴拉巴拉', '2018-12-01', '2018-12-31', '2018-12-17', 0, 1, '/temp/证券投资学.docx');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `yuanxi` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `major` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `class1` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `qqNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `statu` tinyint(20) NOT NULL DEFAULT 0 COMMENT '未报名，状态为0\r\n报名成功，未交项目，状态为1\r\n报名成功，项目提交，待评委审核，状态为2\r\n报名成功，项目提交，评委审核完毕，等待结果公式状态为3\r\n比赛结果，状态4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('周次田', '20162312', '男', '软件学院', '软件工程', '软件1610班', '13269219270', '2692892782', 'huan9yun@163.com', 'e10adc3949ba59abbe56e057f20f883e', 2);
INSERT INTO `person` VALUES ('黄强', '20162313', '男', '软件学院', '软件工程', '软件1610班', '18166043457', '1506340373', '1506340373@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2);
INSERT INTO `person` VALUES ('章天成', '20162314', '男', '软件学院', '软件工程', '软件1610班', '13870438857', '1506340373', 'huan9yun@163.com', 'e10adc3949ba59abbe56e057f20f883e', 2);
INSERT INTO `person` VALUES ('倪裕禄', '20162315', '男', '软件学院', '软件工程', '软件1610班', '18166043457', '1506340373', '1506340373@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2);
INSERT INTO `person` VALUES ('张宗洋', '20162316', '男', '软件学院', '软件工程', '软件1610班', '18166043457', '1506340373', '1506340373@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2);
INSERT INTO `person` VALUES ('叶坚', '20171922', '男', '软件学院', '软件工程', '软件1708', '123456', '123456', '321@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 3);
INSERT INTO `person` VALUES ('赵嘉', 'admin1', '女', '软件学院', '软件工程', '软件1711', '123456', '123456', '839440069@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `person` VALUES ('郭涛', 'zeroPoint1', '女', '软件学院', '软件工程', '软件1708', '15979837593', '123456', '1010@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `video` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `word` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `synopsis` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tid` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('20171922', '/temp/20171922_oceans.mp4', '/temp/20171922_山竹宣传.docx', '叶坚', 'sad', '/temp/20171922_2.zip', '36090118E33C4BCA9AA2B17E2D3DD7CD');
INSERT INTO `project` VALUES ('FDC79D1EE1934B66930BFF63610254A5', '/temp/20162313/20162313_EC128DCC17E84E539BE9B34A330E1616.mp4', '/temp/20162313/20162313_55F8D3836EFB478786756016E6E63621.docx', '大创网', '习近平强调，今年是中国改革开放40周年。40年改革开放，书写了中国发展的壮丽篇章，中国和世界的关系进一步密切。中国将继续全面深化改革、全面扩大开放，坚持贯彻新发展理念，深入推进供给侧结构性改革，统筹推进稳增长、促改革、调结构、惠民生、防风险工作，推动中国经济高质量发展，为世界提供更多合作机遇。', '/temp/20162313/20162313_DD57C8E63CF6436DBD211EB344D34C7D.rar', '6AAE88C20FB747B19370A105E4F9D1AB');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '团队主键',
  `fid` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '项目第一作者、团队负责人',
  `sid` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目第二作者',
  `tid` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目第三作者',
  `foid` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目第四作者',
  `fiid` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目第五作者',
  `date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '团队报名参赛时间',
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '团队项目id',
  `gid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '比赛id',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '比赛结果，为0表示未参赛；为1表示一等奖；2表示二等奖；3表示三等奖；4表示鼓励奖；为5表示未获奖',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '参赛类别',
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '参赛组别',
  `score` tinyint(255) NULL DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`, `tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('36090118E33C4BCA9AA2B17E2D3DD7CD', '20171922', '', '', '', '', '2018-12-17 10:54:56', '20171922', '1', '0', '项目开发', '大二/大三组', 100);
INSERT INTO `team` VALUES ('6AAE88C20FB747B19370A105E4F9D1AB', '20162313', '20162312', '20162314', '20162315', '20162316', '2018-12-17 16:28:47', 'FDC79D1EE1934B66930BFF63610254A5', '1', '0', '项目开发', '大二/大三组', 0);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat MySQL Data Transfer

 Source Server         : 本地mysql-教学用
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : companydb

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 03/04/2020 13:43:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buildDate` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '腾讯科技', '广东省深圳市腾讯大厦', '2009-07-10');
INSERT INTO `company` VALUES (2, '渡一教育', '黑龙江哈尔滨', '2004-02-10');
INSERT INTO `company` VALUES (3, '蚂蚁金服', '中国杭州市西湖区西溪路556号蚂蚁Z空间', '2010-04-04');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyId` int(0) NOT NULL,
  `builDate` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `companyId`(`companyId`) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '销售部', 1, '2009-07-30');
INSERT INTO `department` VALUES (2, '开发部', 1, '2009-07-30');
INSERT INTO `department` VALUES (3, '采购部', 1, '2009-07-30');
INSERT INTO `department` VALUES (4, '市场部', 1, '2009-11-10');
INSERT INTO `department` VALUES (5, '监管部', 1, '2011-01-30');
INSERT INTO `department` VALUES (6, '财务部', 1, '2009-08-15');
INSERT INTO `department` VALUES (7, '市场部', 2, '2004-03-11');
INSERT INTO `department` VALUES (8, '教学部', 2, '2004-02-26');
INSERT INTO `department` VALUES (9, '教职部', 2, '2004-03-20');
INSERT INTO `department` VALUES (10, '财务部', 2, '2004-04-27');
INSERT INTO `department` VALUES (11, '网络部', 3, '2010-04-11');
INSERT INTO `department` VALUES (12, '财务部', 3, '2010-04-11');
INSERT INTO `department` VALUES (13, '宣传部', 3, '2010-05-05');
INSERT INTO `department` VALUES (14, '培训部', 3, '2011-07-01');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ismale` tinyint(0) NOT NULL,
  `joinDate` date NOT NULL,
  `salary` decimal(10, 2) NOT NULL,
  `deptId` int(0) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_deptId_department`(`deptId`) USING BTREE,
  CONSTRAINT `FK_deptId_department` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 701 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张云', '天府三街', 1, '2005-04-06', 19413.45, 5, '1991-12-14');
INSERT INTO `employee` VALUES (2, '涂萌紫', '人民北路', 0, '2008-06-02', 14684.16, 5, '1994-07-14');
INSERT INTO `employee` VALUES (3, '李留梅', '天府一街', 0, '2010-06-08', 10581.12, 11, '1997-03-22');
INSERT INTO `employee` VALUES (4, '张芷君', '青羊宫', 0, '1997-03-07', 15953.99, 13, '1992-09-05');
INSERT INTO `employee` VALUES (5, '肖悦', '三圣乡', 0, '2004-10-16', 15750.72, 11, '1995-01-26');
INSERT INTO `employee` VALUES (6, '袁紫', '天府一街', 0, '2000-06-04', 6208.43, 2, '1992-05-03');
INSERT INTO `employee` VALUES (7, '袁云', '春熙路', 1, '2007-04-07', 8278.83, 13, '1993-07-20');
INSERT INTO `employee` VALUES (8, '刘水', '电子科大成华校区', 0, '2002-11-11', 10364.91, 2, '1998-11-02');
INSERT INTO `employee` VALUES (9, '李乾', '成华区SM广场', 1, '2005-05-07', 18591.68, 8, '1997-02-19');
INSERT INTO `employee` VALUES (10, '涂贺', NULL, 1, '2015-05-03', 5052.77, 8, '1998-02-08');
INSERT INTO `employee` VALUES (11, '李可君', '昭觉寺', 0, '2003-07-08', 3896.96, 1, '2000-11-20');
INSERT INTO `employee` VALUES (12, '花留梅', '浣花溪公寓', 0, '1997-05-09', 5179.47, 7, '1996-01-15');
INSERT INTO `employee` VALUES (13, '周长刚', '浣花溪公寓', 1, '2000-09-17', 6065.81, 8, '1993-01-05');
INSERT INTO `employee` VALUES (14, '徐千靖', '电子科大成华校区', 1, '2016-02-09', 11070.54, 1, '1997-11-17');
INSERT INTO `employee` VALUES (15, '胡留瑶', NULL, 0, '2007-09-09', 13133.76, 2, '1990-08-26');
INSERT INTO `employee` VALUES (16, '周长时', '春熙路', 1, '2009-04-15', 16694.69, 9, '1996-04-22');
INSERT INTO `employee` VALUES (17, '周芷若', '人民北路', 0, '2003-06-12', 4885.10, 8, '1998-08-23');
INSERT INTO `employee` VALUES (18, '徐敏水', '电子科大成华校区', 0, '1997-02-19', 4311.56, 1, '1990-09-21');
INSERT INTO `employee` VALUES (19, '刘冶刚', '春熙路', 1, '2010-08-06', 4770.96, 6, '1992-01-15');
INSERT INTO `employee` VALUES (20, '周留蓝', '太阳公馆', 0, '2009-11-13', 5939.01, 6, '1993-04-17');
INSERT INTO `employee` VALUES (21, '徐梅', '太阳公馆', 0, '2016-02-17', 11368.74, 11, '1999-08-20');
INSERT INTO `employee` VALUES (22, '肖梅', '太阳公馆', 0, '2015-06-16', 8179.44, 4, '1993-09-18');
INSERT INTO `employee` VALUES (23, '张敏水', '人民南路', 0, '2001-04-15', 5720.35, 4, '1998-01-02');
INSERT INTO `employee` VALUES (24, '李午靖', '成华区SM广场', 1, '1999-12-17', 15116.29, 5, '1990-02-12');
INSERT INTO `employee` VALUES (25, '涂午乾', '三圣乡', 1, '1996-11-11', 15790.89, 13, '1996-12-26');
INSERT INTO `employee` VALUES (26, '周瑶', '成华区SM广场', 0, '2006-02-10', 16710.39, 8, '1995-11-21');
INSERT INTO `employee` VALUES (27, '袁悦', '人民中路', 0, '2010-05-12', 10740.30, 8, '1990-03-28');
INSERT INTO `employee` VALUES (28, '袁芷蓝', '建设路', 0, '1999-01-07', 6020.93, 6, '1990-03-29');
INSERT INTO `employee` VALUES (29, '周君', '成华区SM广场', 0, '2014-05-15', 19333.50, 9, '1993-09-17');
INSERT INTO `employee` VALUES (30, '李福威', '青羊宫', 1, '2004-04-06', 15379.80, 1, '1997-11-07');
INSERT INTO `employee` VALUES (31, '张中浩', '科华南路', 1, '1996-11-12', 9225.94, 14, '1995-11-26');
INSERT INTO `employee` VALUES (32, '花萌蓝', NULL, 0, '2001-02-20', 10626.47, 12, '1997-10-28');
INSERT INTO `employee` VALUES (33, '廖谦', '天府三街', 1, '2001-09-15', 3753.62, 14, '1993-11-13');
INSERT INTO `employee` VALUES (34, '张浩', '建设路', 1, '2013-09-04', 11226.02, 4, '1994-12-09');
INSERT INTO `employee` VALUES (35, '徐若蓝', '天府三街', 0, '2006-01-13', 18488.56, 7, '1998-10-17');
INSERT INTO `employee` VALUES (36, '张三达', '人民中路', 1, '2012-07-12', 18747.02, 12, '1996-02-02');
INSERT INTO `employee` VALUES (37, '李蓝', '建设路', 0, '2013-05-09', 3218.15, 11, '1998-08-24');
INSERT INTO `employee` VALUES (38, '刘伟', '成渝立交', 1, '1996-07-09', 19841.43, 2, '1992-09-29');
INSERT INTO `employee` VALUES (39, '徐福贺', '太阳公馆', 1, '1997-10-20', 6155.97, 6, '1998-10-24');
INSERT INTO `employee` VALUES (40, '张敏华', '青羊宫', 0, '2015-01-14', 5123.45, 10, '1997-11-08');
INSERT INTO `employee` VALUES (41, '袁萌蓝', '科华南路', 0, '2002-01-10', 14707.07, 5, '1998-02-10');
INSERT INTO `employee` VALUES (42, '周午达', '青羊宫', 1, '2012-07-07', 5571.52, 2, '1992-01-18');
INSERT INTO `employee` VALUES (43, '袁芷华', '红瓦寺', 0, '2012-05-05', 12973.38, 1, '2000-12-26');
INSERT INTO `employee` VALUES (44, '周君', '春熙路', 0, '2007-04-08', 7694.68, 14, '1995-10-17');
INSERT INTO `employee` VALUES (45, '胡悦', '成渝立交', 0, '2010-02-20', 10158.82, 8, '1994-05-21');
INSERT INTO `employee` VALUES (46, '涂萌紫', '春熙路', 0, '2013-07-15', 6407.85, 13, '1994-10-24');
INSERT INTO `employee` VALUES (47, '袁贺', '青羊宫', 1, '1996-08-13', 14631.54, 9, '1998-03-20');
INSERT INTO `employee` VALUES (48, '肖冶乾', '三圣乡', 1, '2016-01-11', 7546.34, 1, '1999-04-27');
INSERT INTO `employee` VALUES (49, '李留梅', '电子科大成华校区', 0, '1997-06-08', 18298.34, 13, '1997-10-29');
INSERT INTO `employee` VALUES (50, '周云', '天府三街', 1, '2011-02-09', 13818.15, 3, '1993-11-11');
INSERT INTO `employee` VALUES (51, '肖华', '红瓦寺', 0, '2002-06-04', 16238.91, 7, '1991-09-28');
INSERT INTO `employee` VALUES (52, '廖若紫', '三圣乡', 0, '2016-01-08', 3321.84, 3, '1998-10-25');
INSERT INTO `employee` VALUES (53, '花三军', '昭觉寺', 1, '2012-05-20', 6341.99, 8, '1997-02-11');
INSERT INTO `employee` VALUES (54, '张可若', '浣花溪公寓', 0, '2008-04-04', 16664.11, 10, '1996-08-15');
INSERT INTO `employee` VALUES (55, '袁明浩', '青羊宫', 1, '2008-03-14', 16576.51, 4, '1997-10-01');
INSERT INTO `employee` VALUES (56, '刘浩', '太阳公馆', 1, '2004-01-19', 16936.00, 10, '1997-05-26');
INSERT INTO `employee` VALUES (57, '袁威', '春熙路', 1, '2006-07-19', 10093.31, 10, '1992-07-03');
INSERT INTO `employee` VALUES (58, '涂萌悦', '人民北路', 0, '2009-07-20', 19506.81, 8, '1998-06-05');
INSERT INTO `employee` VALUES (59, '肖贺', '天府二街', 1, '2001-04-19', 7958.26, 13, '1993-01-10');
INSERT INTO `employee` VALUES (60, '花刚', '人民南路', 1, '2005-06-18', 19533.96, 10, '1994-04-29');
INSERT INTO `employee` VALUES (61, '廖达', '建设路', 1, '2012-08-08', 7957.40, 5, '1991-10-16');
INSERT INTO `employee` VALUES (62, '徐科时', '浣花溪公寓', 1, '2008-04-11', 6223.75, 3, '1993-11-19');
INSERT INTO `employee` VALUES (63, '张谦', '成渝立交', 1, '2001-09-21', 4245.97, 5, '1994-03-25');
INSERT INTO `employee` VALUES (64, '袁瑶', '成华区SM广场', 0, '2011-05-02', 17967.89, 8, '1996-05-07');
INSERT INTO `employee` VALUES (65, '花冶刚', '电子科大成华校区', 1, '2007-08-05', 10777.88, 9, '2000-01-15');
INSERT INTO `employee` VALUES (66, '李福越', '浣花溪公寓', 1, '2013-08-20', 8612.07, 11, '1992-09-22');
INSERT INTO `employee` VALUES (67, '花梅', NULL, 0, '1997-09-10', 12989.70, 3, '1996-11-13');
INSERT INTO `employee` VALUES (68, '涂若君', '人民南路', 0, '2004-06-18', 13199.71, 3, '1997-01-02');
INSERT INTO `employee` VALUES (69, '张悦', '青羊宫', 0, '2014-08-04', 18074.66, 12, '1992-01-09');
INSERT INTO `employee` VALUES (70, '袁留若', '人民北路', 0, '2014-05-18', 8184.42, 12, '1995-10-07');
INSERT INTO `employee` VALUES (71, '廖冶达', '人民南路', 1, '2010-05-14', 8132.94, 11, '1999-09-28');
INSERT INTO `employee` VALUES (72, '刘明万', '红瓦寺', 1, '2006-08-06', 7732.23, 7, '1995-10-09');
INSERT INTO `employee` VALUES (73, '徐刚', '电子科大成华校区', 1, '2001-02-14', 7314.24, 7, '1992-03-10');
INSERT INTO `employee` VALUES (74, '涂万', '昭觉寺', 1, '2004-12-03', 3740.27, 2, '1990-03-28');
INSERT INTO `employee` VALUES (75, '廖福越', '昭觉寺', 1, '2011-05-16', 15276.62, 3, '1990-06-03');
INSERT INTO `employee` VALUES (76, '涂冶刚', '电子科大成华校区', 1, '2004-03-18', 19343.17, 10, '1991-06-20');
INSERT INTO `employee` VALUES (77, '袁钟越', '青羊宫', 1, '2008-02-19', 9991.22, 12, '1991-08-26');
INSERT INTO `employee` VALUES (78, '花敏瑶', '人民中路', 0, '2012-02-16', 4205.54, 7, '1994-04-09');
INSERT INTO `employee` VALUES (79, '廖敏水', '昭觉寺', 0, '2000-02-09', 15597.20, 4, '1995-11-24');
INSERT INTO `employee` VALUES (80, '花福云', '成渝立交', 1, '1999-08-05', 15808.42, 5, '1994-06-03');
INSERT INTO `employee` VALUES (81, '周可华', '成渝立交', 0, '2016-05-13', 17121.12, 5, '1991-07-06');
INSERT INTO `employee` VALUES (82, '张达', '人民中路', 1, '1998-12-17', 11038.34, 2, '1993-01-12');
INSERT INTO `employee` VALUES (83, '花留紫', '天府二街', 0, '2014-08-19', 18385.08, 14, '1998-10-18');
INSERT INTO `employee` VALUES (84, '花伟', '青羊宫', 1, '1999-03-02', 19179.55, 10, '1997-06-05');
INSERT INTO `employee` VALUES (85, '花萌君', '建设路', 0, '2011-10-16', 6393.95, 2, '1995-11-04');
INSERT INTO `employee` VALUES (86, '肖中贺', '人民南路', 1, '2002-04-14', 6236.96, 2, '1999-01-15');
INSERT INTO `employee` VALUES (87, '廖千刚', '春熙路', 1, '2010-10-13', 18997.34, 8, '1994-07-11');
INSERT INTO `employee` VALUES (88, '廖悦', '昭觉寺', 0, '2012-06-14', 17047.86, 13, '1992-02-25');
INSERT INTO `employee` VALUES (89, '刘敏华', '浣花溪公寓', 0, '1998-01-17', 11114.60, 5, '1999-08-23');
INSERT INTO `employee` VALUES (90, '胡蓝', '天府一街', 0, '2008-07-15', 16896.80, 4, '2000-07-24');
INSERT INTO `employee` VALUES (91, '刘敏君', '天府一街', 0, '2008-10-13', 7630.64, 11, '1994-09-11');
INSERT INTO `employee` VALUES (92, '胡水', '昭觉寺', 0, '2000-04-18', 17670.39, 1, '1995-08-20');
INSERT INTO `employee` VALUES (93, '李达', '人民南路', 1, '2004-10-02', 16721.50, 9, '1994-03-19');
INSERT INTO `employee` VALUES (94, '花芷君', '人民北路', 0, '2001-04-09', 4883.47, 2, '1996-03-01');
INSERT INTO `employee` VALUES (95, '袁可君', '成华区SM广场', 0, '2014-06-12', 19043.22, 2, '1996-11-21');
INSERT INTO `employee` VALUES (96, '周悦', '青羊宫', 0, '2011-04-18', 12309.41, 9, '1999-05-01');
INSERT INTO `employee` VALUES (97, '廖萌水', '红瓦寺', 0, '2008-06-02', 10128.11, 9, '1990-02-18');
INSERT INTO `employee` VALUES (98, '廖云', '天府一街', 1, '2006-08-03', 14658.42, 8, '1996-01-11');
INSERT INTO `employee` VALUES (99, '涂蓝', '天府二街', 0, '2007-07-15', 16780.87, 5, '1998-12-08');
INSERT INTO `employee` VALUES (100, '肖若', '昭觉寺', 0, '1997-11-13', 19237.95, 2, '1995-07-14');
INSERT INTO `employee` VALUES (101, '徐华', '三圣乡', 0, '2010-10-18', 13966.53, 3, '1996-07-02');
INSERT INTO `employee` VALUES (102, '胡达', '建设路', 1, '2004-07-12', 17872.95, 10, '1996-11-18');
INSERT INTO `employee` VALUES (103, '涂若蓝', '昭觉寺', 0, '1996-06-13', 5735.77, 13, '1994-02-13');
INSERT INTO `employee` VALUES (104, '李强', '人民中路', 1, '2013-10-20', 9136.57, 9, '1997-05-17');
INSERT INTO `employee` VALUES (105, '涂三刚', '天府二街', 1, '2008-01-21', 11304.84, 4, '1998-02-12');
INSERT INTO `employee` VALUES (106, '涂敏悦', '天府三街', 0, '2005-01-09', 5924.04, 1, '1995-05-14');
INSERT INTO `employee` VALUES (107, '张君', '电子科大成华校区', 0, '2008-05-04', 5490.17, 3, '1991-02-10');
INSERT INTO `employee` VALUES (108, '徐若紫', '红瓦寺', 0, '2004-03-18', 18548.73, 2, '1992-04-20');
INSERT INTO `employee` VALUES (109, '肖蓝', '红瓦寺', 0, '2011-07-10', 16098.36, 13, '1995-04-08');
INSERT INTO `employee` VALUES (110, '周蓝', '三圣乡', 0, '2002-11-09', 15610.02, 5, '1993-10-03');
INSERT INTO `employee` VALUES (111, '胡萌蓝', '电子科大成华校区', 0, '2009-02-13', 19530.72, 6, '1990-12-21');
INSERT INTO `employee` VALUES (112, '肖敏水', '成渝立交', 0, '2007-11-08', 9846.03, 1, '1996-08-19');
INSERT INTO `employee` VALUES (113, '徐贺', '成华区SM广场', 1, '2005-06-21', 4159.88, 10, '1992-03-16');
INSERT INTO `employee` VALUES (114, '李若', '春熙路', 0, '2000-07-13', 4824.83, 10, '1999-12-29');
INSERT INTO `employee` VALUES (115, '涂可蓝', '红瓦寺', 0, '2003-10-07', 13061.09, 7, '1991-08-23');
INSERT INTO `employee` VALUES (116, '周留若', '建设路', 0, '2014-03-15', 11400.30, 7, '2000-07-28');
INSERT INTO `employee` VALUES (117, '袁留蓝', '春熙路', 0, '2009-12-14', 13691.75, 7, '2000-12-27');
INSERT INTO `employee` VALUES (118, '李可紫', '浣花溪公寓', 0, '2013-04-04', 3249.16, 14, '1997-07-19');
INSERT INTO `employee` VALUES (119, '袁紫', '人民中路', 0, '2013-10-10', 19316.20, 6, '1996-03-09');
INSERT INTO `employee` VALUES (120, '肖敏水', '万家湾', 0, '2011-07-16', 16332.07, 9, '1998-11-29');
INSERT INTO `employee` VALUES (121, '徐梅', '天府三街', 0, '1997-07-03', 6494.65, 7, '1994-03-23');
INSERT INTO `employee` VALUES (122, '花芷君', '成渝立交', 0, '2002-04-18', 7971.23, 12, '1992-09-22');
INSERT INTO `employee` VALUES (123, '周浩', '春熙路', 1, '2004-06-05', 11211.37, 9, '1998-08-22');
INSERT INTO `employee` VALUES (124, '袁卫越', '三圣乡', 1, '1999-01-11', 9664.31, 3, '1999-02-03');
INSERT INTO `employee` VALUES (125, '花可瑶', '人民北路', 0, '2014-05-04', 16286.01, 13, '2000-07-29');
INSERT INTO `employee` VALUES (126, '张留瑶', '天府一街', 0, '1997-03-13', 18226.94, 4, '1991-11-29');
INSERT INTO `employee` VALUES (127, '廖水', '天府一街', 0, '2009-03-18', 3741.32, 2, '1991-11-27');
INSERT INTO `employee` VALUES (128, '张水', '昭觉寺', 0, '1999-07-20', 16745.74, 1, '2000-01-06');
INSERT INTO `employee` VALUES (129, '廖若悦', '春熙路', 0, '2003-04-18', 3172.67, 12, '2000-04-13');
INSERT INTO `employee` VALUES (130, '张敏梅', '天府二街', 0, '2009-01-13', 3067.93, 3, '1992-02-20');
INSERT INTO `employee` VALUES (131, '李中谦', '人民南路', 1, '2008-03-11', 18282.45, 13, '1991-07-09');
INSERT INTO `employee` VALUES (132, '花千浩', '浣花溪公寓', 1, '2001-01-06', 7748.05, 9, '2000-08-18');
INSERT INTO `employee` VALUES (133, '胡水', '科华南路', 0, '2002-06-07', 15352.89, 4, '2000-01-11');
INSERT INTO `employee` VALUES (134, '廖午贺', '天府三街', 1, '2015-03-13', 4595.34, 2, '1997-02-25');
INSERT INTO `employee` VALUES (135, '廖君', '太阳公馆', 0, '2007-09-16', 9566.14, 4, '1998-06-22');
INSERT INTO `employee` VALUES (136, '李千万', '万家湾', 1, '1996-12-05', 19176.25, 14, '1994-09-13');
INSERT INTO `employee` VALUES (137, '胡正贺', '建设路', 1, '2015-06-03', 11137.11, 14, '1990-01-25');
INSERT INTO `employee` VALUES (138, '廖伟', '青羊宫', 1, '2011-07-06', 3466.25, 11, '1992-06-21');
INSERT INTO `employee` VALUES (139, '袁留紫', '成渝立交', 0, '2009-03-12', 13744.27, 5, '1990-05-14');
INSERT INTO `employee` VALUES (140, '李乾', '昭觉寺', 1, '2005-02-07', 14862.55, 1, '1993-02-21');
INSERT INTO `employee` VALUES (141, '张午伟', '建设路', 1, '1997-07-18', 15976.98, 12, '1992-12-05');
INSERT INTO `employee` VALUES (142, '刘可华', '科华南路', 0, '2014-03-17', 4894.31, 13, '2000-02-24');
INSERT INTO `employee` VALUES (143, '李留君', '万家湾', 0, '2004-04-16', 18206.30, 7, '1998-05-15');
INSERT INTO `employee` VALUES (144, '肖千浩', '青羊宫', 1, '2008-02-20', 16954.80, 6, '1994-08-21');
INSERT INTO `employee` VALUES (145, '袁敏紫', '天府三街', 0, '1999-12-16', 4459.23, 12, '1998-11-26');
INSERT INTO `employee` VALUES (146, '李福达', '昭觉寺', 1, '1998-09-03', 6660.59, 1, '1999-10-07');
INSERT INTO `employee` VALUES (147, '张卫达', '太阳公馆', 1, '1997-07-03', 8824.59, 12, '1998-02-16');
INSERT INTO `employee` VALUES (148, '李军', '万家湾', 1, '1996-06-09', 13951.73, 5, '1991-12-17');
INSERT INTO `employee` VALUES (149, '胡华', '青羊宫', 0, '2006-08-10', 5277.33, 10, '2000-12-03');
INSERT INTO `employee` VALUES (150, '花中贺', '昭觉寺', 1, '1999-08-13', 17399.57, 2, '1995-04-23');
INSERT INTO `employee` VALUES (151, '肖可华', '人民中路', 0, '2001-09-02', 12633.50, 1, '1991-05-14');
INSERT INTO `employee` VALUES (152, '袁留瑶', '青羊宫', 0, '2011-04-04', 15738.91, 4, '1992-08-12');
INSERT INTO `employee` VALUES (153, '刘若', '人民南路', 0, '2007-05-02', 5458.58, 3, '1992-12-29');
INSERT INTO `employee` VALUES (154, '花钟万', '天府一街', 1, '2009-05-04', 4594.02, 6, '1990-05-16');
INSERT INTO `employee` VALUES (155, '肖谦', '红瓦寺', 1, '2009-01-15', 6474.68, 13, '1996-07-23');
INSERT INTO `employee` VALUES (156, '李威', '建设路', 1, '2008-05-17', 12642.41, 3, '1993-04-17');
INSERT INTO `employee` VALUES (157, '刘钟强', '人民北路', 1, '2000-08-15', 12973.86, 1, '1999-07-07');
INSERT INTO `employee` VALUES (158, '袁水', '昭觉寺', 0, '2000-02-09', 11815.73, 4, '1995-10-19');
INSERT INTO `employee` VALUES (159, '李可若', '三圣乡', 0, '2013-02-10', 10293.40, 13, '1998-09-14');
INSERT INTO `employee` VALUES (160, '刘可君', '成华区SM广场', 0, '2008-06-18', 6156.85, 5, '1991-05-14');
INSERT INTO `employee` VALUES (161, '廖明刚', '万家湾', 1, '2002-07-09', 12166.34, 13, '1992-07-02');
INSERT INTO `employee` VALUES (162, '张卫乾', '成渝立交', 1, '2002-11-15', 9609.09, 13, '1998-07-10');
INSERT INTO `employee` VALUES (163, '肖万', '电子科大成华校区', 1, '2012-01-13', 7364.08, 12, '1990-06-27');
INSERT INTO `employee` VALUES (164, '李若', '成华区SM广场', 0, '2011-02-16', 8211.17, 8, '1992-06-18');
INSERT INTO `employee` VALUES (165, '袁中刚', '成华区SM广场', 1, '1997-08-16', 14639.67, 3, '1996-04-22');
INSERT INTO `employee` VALUES (166, '袁云', '天府一街', 1, '2004-01-12', 19784.45, 9, '1997-04-09');
INSERT INTO `employee` VALUES (167, '袁萌华', '浣花溪公寓', 0, '2013-05-18', 13725.57, 6, '1996-02-27');
INSERT INTO `employee` VALUES (168, '徐若君', '万家湾', 0, '1997-07-02', 6344.91, 4, '1992-04-22');
INSERT INTO `employee` VALUES (169, '刘贺', '人民南路', 1, '2009-07-16', 15896.92, 5, '1999-12-13');
INSERT INTO `employee` VALUES (170, '花瑶', '人民北路', 0, '1998-11-02', 19836.15, 3, '1992-08-18');
INSERT INTO `employee` VALUES (171, '涂达', '天府三街', 1, '2015-08-18', 7998.43, 4, '1991-10-16');
INSERT INTO `employee` VALUES (172, '胡华', '科华南路', 0, '2011-08-13', 17202.31, 12, '1993-12-24');
INSERT INTO `employee` VALUES (173, '肖贺', '天府一街', 1, '2008-02-09', 13348.18, 4, '1992-07-29');
INSERT INTO `employee` VALUES (174, '张福靖', '建设路', 1, '2002-07-19', 4842.20, 1, '1994-02-11');
INSERT INTO `employee` VALUES (175, '李留紫', '青羊宫', 0, '2008-01-11', 15519.33, 12, '1994-12-14');
INSERT INTO `employee` VALUES (176, '徐水', '人民中路', 0, '2001-06-21', 15045.84, 4, '1996-06-21');
INSERT INTO `employee` VALUES (177, '廖敏紫', '浣花溪公寓', 0, '2005-03-02', 11173.66, 12, '2000-11-09');
INSERT INTO `employee` VALUES (178, '李长达', '天府三街', 1, '2012-04-17', 15326.13, 6, '2000-10-08');
INSERT INTO `employee` VALUES (179, '涂可华', '成华区SM广场', 0, '2004-01-19', 14010.79, 9, '1999-07-28');
INSERT INTO `employee` VALUES (180, '李福刚', '天府一街', 1, '2002-11-08', 19410.92, 14, '1993-07-25');
INSERT INTO `employee` VALUES (181, '廖中强', '人民北路', 1, '1998-07-02', 7212.02, 14, '1997-10-26');
INSERT INTO `employee` VALUES (182, '徐留君', '青羊宫', 0, '2008-04-11', 11856.34, 3, '1991-11-27');
INSERT INTO `employee` VALUES (183, '肖强', '成华区SM广场', 1, '2013-02-14', 11888.41, 6, '2000-04-09');
INSERT INTO `employee` VALUES (184, '花芷悦', '天府三街', 0, '2015-08-21', 18401.78, 4, '1998-10-22');
INSERT INTO `employee` VALUES (185, '廖萌蓝', '建设路', 0, '2009-08-16', 10081.38, 1, '1993-07-22');
INSERT INTO `employee` VALUES (186, '胡敏若', '红瓦寺', 0, '1999-09-10', 19066.57, 11, '1990-01-26');
INSERT INTO `employee` VALUES (187, '涂科刚', '天府二街', 1, '2008-06-11', 17436.53, 9, '1993-01-11');
INSERT INTO `employee` VALUES (188, '胡威', '万家湾', 1, '2004-02-07', 10491.11, 9, '1997-02-18');
INSERT INTO `employee` VALUES (189, '李长伟', '天府二街', 1, '2011-04-13', 3127.57, 5, '1998-11-02');
INSERT INTO `employee` VALUES (190, '徐悦', '人民北路', 0, '2007-06-09', 12024.18, 10, '1997-04-16');
INSERT INTO `employee` VALUES (191, '李留悦', '青羊宫', 0, '2014-04-19', 9794.65, 2, '1997-10-28');
INSERT INTO `employee` VALUES (192, '涂紫', '太阳公馆', 0, '2005-01-17', 15951.52, 4, '1994-12-23');
INSERT INTO `employee` VALUES (193, '花萌若', '太阳公馆', 0, '2014-02-19', 18309.05, 1, '1990-09-17');
INSERT INTO `employee` VALUES (194, '肖刚', '成华区SM广场', 1, '2013-04-21', 15813.97, 6, '1997-08-04');
INSERT INTO `employee` VALUES (195, '花云', '人民中路', 1, '2004-04-18', 7978.64, 2, '1997-03-25');
INSERT INTO `employee` VALUES (196, '胡可华', '人民中路', 0, '2004-07-15', 4891.30, 6, '1996-05-05');
INSERT INTO `employee` VALUES (197, '肖萌瑶', '万家湾', 0, '2015-01-18', 12662.09, 11, '1996-07-26');
INSERT INTO `employee` VALUES (198, '涂长靖', '春熙路', 1, '2003-07-12', 8446.98, 6, '1998-03-22');
INSERT INTO `employee` VALUES (199, '廖可梅', '昭觉寺', 0, '1997-03-21', 3988.68, 14, '1991-05-15');
INSERT INTO `employee` VALUES (200, '张芷华', '天府二街', 0, '1997-08-19', 3542.94, 12, '1993-02-17');
INSERT INTO `employee` VALUES (201, '廖千达', '科华南路', 1, '2012-07-19', 14678.15, 8, '1996-04-20');
INSERT INTO `employee` VALUES (202, '周可水', '春熙路', 0, '2006-11-08', 7646.50, 3, '1995-04-04');
INSERT INTO `employee` VALUES (203, '徐伟', '科华南路', 1, '1998-06-18', 11634.22, 12, '1996-11-09');
INSERT INTO `employee` VALUES (204, '李萌若', '建设路', 0, '2007-05-20', 18463.54, 6, '2000-11-19');
INSERT INTO `employee` VALUES (205, '肖可君', '电子科大成华校区', 0, '1997-08-20', 18392.72, 5, '1995-09-29');
INSERT INTO `employee` VALUES (206, '周贺', '太阳公馆', 1, '2008-12-08', 15601.40, 11, '1998-01-25');
INSERT INTO `employee` VALUES (207, '涂科达', '人民中路', 1, '2001-01-16', 7617.58, 6, '1991-01-24');
INSERT INTO `employee` VALUES (208, '花时', '昭觉寺', 1, '2005-06-13', 15943.05, 10, '1990-07-25');
INSERT INTO `employee` VALUES (209, '肖敏华', '太阳公馆', 0, '2013-02-15', 10804.60, 8, '1996-03-09');
INSERT INTO `employee` VALUES (210, '涂瑶', '太阳公馆', 0, '2010-02-02', 14044.49, 9, '1999-08-13');
INSERT INTO `employee` VALUES (211, '花芷水', '万家湾', 0, '2009-04-17', 3187.31, 3, '1992-10-12');
INSERT INTO `employee` VALUES (212, '胡留梅', '人民中路', 0, '2002-08-18', 14517.24, 4, '1996-09-29');
INSERT INTO `employee` VALUES (213, '肖若华', '红瓦寺', 0, '2001-11-15', 7270.79, 1, '1996-01-13');
INSERT INTO `employee` VALUES (214, '花冶强', '浣花溪公寓', 1, '2003-11-20', 8971.76, 7, '1991-02-14');
INSERT INTO `employee` VALUES (215, '胡三威', '成华区SM广场', 1, '2010-04-16', 15783.65, 11, '1998-09-29');
INSERT INTO `employee` VALUES (216, '周君', '天府三街', 0, '1998-05-06', 11058.39, 7, '1999-04-26');
INSERT INTO `employee` VALUES (217, '袁刚', '万家湾', 1, '1998-10-20', 8685.24, 7, '1996-02-27');
INSERT INTO `employee` VALUES (218, '张悦', '电子科大成华校区', 0, '2009-01-04', 13746.24, 9, '1991-03-10');
INSERT INTO `employee` VALUES (219, '刘若瑶', '太阳公馆', 0, '2010-03-06', 16021.22, 10, '1990-05-25');
INSERT INTO `employee` VALUES (220, '周留华', '红瓦寺', 0, '2006-07-17', 8789.85, 2, '2000-02-22');
INSERT INTO `employee` VALUES (221, '徐敏紫', '三圣乡', 0, '2015-05-19', 9725.78, 1, '1994-09-14');
INSERT INTO `employee` VALUES (222, '胡长云', NULL, 1, '1999-09-17', 9662.63, 10, '1991-05-15');
INSERT INTO `employee` VALUES (223, '廖梅', '青羊宫', 0, '2002-02-16', 16492.84, 9, '1993-03-04');
INSERT INTO `employee` VALUES (224, '刘萌紫', '成华区SM广场', 0, '2010-09-13', 17109.58, 3, '2000-04-24');
INSERT INTO `employee` VALUES (225, '廖中伟', '天府三街', 1, '2008-04-21', 17628.23, 9, '1990-11-11');
INSERT INTO `employee` VALUES (226, '胡瑶', '科华南路', 0, '2001-03-15', 14925.78, 6, '1990-01-04');
INSERT INTO `employee` VALUES (227, '涂越', '建设路', 1, '1999-07-20', 4584.14, 14, '1996-06-14');
INSERT INTO `employee` VALUES (228, '涂科贺', '建设路', 1, '2003-09-10', 6691.11, 9, '2000-07-28');
INSERT INTO `employee` VALUES (229, '廖中万', '电子科大成华校区', 1, '2010-11-14', 6670.89, 7, '2000-12-22');
INSERT INTO `employee` VALUES (230, '涂冶越', '天府三街', 1, '1997-01-05', 4336.19, 5, '1990-09-22');
INSERT INTO `employee` VALUES (231, '袁留水', '春熙路', 0, '2005-01-13', 14457.72, 14, '1995-02-07');
INSERT INTO `employee` VALUES (232, '周强', '科华南路', 1, '2008-02-15', 19687.72, 9, '1997-11-08');
INSERT INTO `employee` VALUES (233, '花科伟', '成华区SM广场', 1, '2014-05-07', 14284.01, 3, '1996-04-21');
INSERT INTO `employee` VALUES (234, '袁强', NULL, 1, '2009-08-09', 17316.37, 7, '1996-01-08');
INSERT INTO `employee` VALUES (235, '张若梅', '建设路', 0, '2009-10-05', 15489.96, 11, '1992-04-27');
INSERT INTO `employee` VALUES (236, '袁芷悦', '三圣乡', 0, '2010-01-13', 10332.89, 13, '1996-04-19');
INSERT INTO `employee` VALUES (237, '花强', '春熙路', 1, '2000-10-03', 12169.18, 8, '1992-06-17');
INSERT INTO `employee` VALUES (238, '涂芷蓝', '成华区SM广场', 0, '2003-05-03', 5572.20, 9, '1995-07-11');
INSERT INTO `employee` VALUES (239, '徐瑶', '人民中路', 0, '2002-05-06', 8276.77, 11, '1992-01-13');
INSERT INTO `employee` VALUES (240, '袁瑶', '成渝立交', 0, '2009-02-13', 7493.65, 3, '1991-03-17');
INSERT INTO `employee` VALUES (241, '李若', '春熙路', 0, '2014-06-20', 3009.73, 14, '1993-12-26');
INSERT INTO `employee` VALUES (242, '廖冶靖', '昭觉寺', 1, '2014-03-12', 17403.78, 1, '1995-09-01');
INSERT INTO `employee` VALUES (243, '涂贺', '青羊宫', 1, '2003-07-03', 3356.61, 2, '1990-03-23');
INSERT INTO `employee` VALUES (244, '张明靖', '三圣乡', 1, '2005-02-17', 4483.72, 10, '1993-03-05');
INSERT INTO `employee` VALUES (245, '袁紫', '人民南路', 0, '1998-04-09', 12787.97, 8, '1991-04-29');
INSERT INTO `employee` VALUES (246, '肖留水', '太阳公馆', 0, '2001-11-03', 14358.45, 2, '1990-04-10');
INSERT INTO `employee` VALUES (247, '袁强', '电子科大成华校区', 1, '2003-01-15', 11223.34, 7, '1998-01-24');
INSERT INTO `employee` VALUES (248, '刘三威', '天府二街', 1, '2004-12-10', 12423.72, 14, '1999-10-14');
INSERT INTO `employee` VALUES (249, '胡萌悦', '人民南路', 0, '2005-02-08', 17150.91, 12, '1999-01-19');
INSERT INTO `employee` VALUES (250, '涂福军', '天府二街', 1, '2006-01-14', 8437.85, 7, '1990-05-16');
INSERT INTO `employee` VALUES (251, '刘留水', '天府一街', 0, '2000-05-07', 12697.50, 5, '1997-10-24');
INSERT INTO `employee` VALUES (252, '廖芷紫', '红瓦寺', 0, '2007-06-13', 10953.62, 7, '1997-01-05');
INSERT INTO `employee` VALUES (253, '张萌若', '太阳公馆', 0, '1999-08-03', 5315.54, 2, '1996-06-22');
INSERT INTO `employee` VALUES (254, '胡达', '春熙路', 1, '2002-09-20', 18867.41, 6, '1991-07-13');
INSERT INTO `employee` VALUES (255, '周威', '电子科大成华校区', 1, '2013-11-21', 7802.01, 12, '1993-07-17');
INSERT INTO `employee` VALUES (256, '胡谦', '人民北路', 1, '2015-04-06', 4642.08, 8, '1992-05-10');
INSERT INTO `employee` VALUES (257, '徐越', '浣花溪公寓', 1, '2010-01-16', 8615.49, 6, '1994-01-29');
INSERT INTO `employee` VALUES (258, '涂刚', '春熙路', 1, '2006-04-05', 17371.23, 6, '1999-04-02');
INSERT INTO `employee` VALUES (259, '廖紫', '昭觉寺', 0, '2000-12-03', 11258.00, 2, '1992-01-13');
INSERT INTO `employee` VALUES (260, '刘可君', '昭觉寺', 0, '1997-07-07', 12118.46, 9, '1991-03-23');
INSERT INTO `employee` VALUES (261, '廖梅', '天府二街', 0, '2014-02-11', 9095.26, 10, '1992-10-13');
INSERT INTO `employee` VALUES (262, '涂梅', '天府三街', 0, '1998-08-14', 6468.64, 9, '1997-02-14');
INSERT INTO `employee` VALUES (263, '涂蓝', '人民北路', 0, '1999-08-10', 11198.42, 2, '1990-10-25');
INSERT INTO `employee` VALUES (264, '肖紫', '浣花溪公寓', 0, '2015-06-02', 5863.57, 2, '1999-11-22');
INSERT INTO `employee` VALUES (265, '涂明云', '天府二街', 1, '2005-08-03', 18572.37, 6, '1991-05-10');
INSERT INTO `employee` VALUES (266, '廖悦', '建设路', 0, '2004-09-21', 8169.83, 13, '1997-03-08');
INSERT INTO `employee` VALUES (267, '徐长谦', '浣花溪公寓', 1, '1999-07-15', 9982.26, 7, '1995-10-11');
INSERT INTO `employee` VALUES (268, '袁谦', '太阳公馆', 1, '1997-06-16', 5236.33, 4, '1995-04-01');
INSERT INTO `employee` VALUES (269, '花萌水', '昭觉寺', 0, '2003-02-10', 9846.82, 4, '1991-10-15');
INSERT INTO `employee` VALUES (270, '徐乾', '红瓦寺', 1, '2004-09-20', 5984.68, 3, '1991-03-23');
INSERT INTO `employee` VALUES (271, '周明伟', '三圣乡', 1, '2004-12-05', 15224.80, 2, '1991-04-08');
INSERT INTO `employee` VALUES (272, '刘浩', '天府一街', 1, '2001-10-15', 8703.71, 6, '1992-08-05');
INSERT INTO `employee` VALUES (273, '李千云', '天府三街', 1, '2004-06-08', 15743.77, 4, '1990-08-04');
INSERT INTO `employee` VALUES (274, '廖越', '建设路', 1, '2003-07-14', 17925.41, 12, '1997-12-28');
INSERT INTO `employee` VALUES (275, '肖正乾', '红瓦寺', 1, '2003-05-21', 11344.87, 11, '1998-10-29');
INSERT INTO `employee` VALUES (276, '袁萌瑶', '成华区SM广场', 0, '2011-02-09', 8016.21, 10, '1993-11-12');
INSERT INTO `employee` VALUES (277, '徐靖', '青羊宫', 1, '2007-07-04', 19013.21, 6, '1993-04-13');
INSERT INTO `employee` VALUES (278, '刘正伟', '科华南路', 1, '2013-02-05', 15604.15, 13, '1993-05-24');
INSERT INTO `employee` VALUES (279, '廖可水', '三圣乡', 0, '2004-11-20', 17983.06, 4, '1990-10-26');
INSERT INTO `employee` VALUES (280, '刘科云', '昭觉寺', 1, '2001-07-04', 6950.27, 9, '2000-04-12');
INSERT INTO `employee` VALUES (281, '周芷悦', '天府一街', 0, '1998-06-02', 16414.30, 3, '1991-08-14');
INSERT INTO `employee` VALUES (282, '肖冶越', '天府一街', 1, '2005-12-13', 13157.87, 4, '1996-09-19');
INSERT INTO `employee` VALUES (283, '刘长时', '建设路', 1, '2002-06-05', 12520.53, 13, '1990-06-29');
INSERT INTO `employee` VALUES (284, '肖梅', '红瓦寺', 0, '2002-03-17', 13669.08, 3, '1996-12-01');
INSERT INTO `employee` VALUES (285, '李萌梅', '红瓦寺', 0, '2014-03-11', 8688.14, 11, '1993-05-03');
INSERT INTO `employee` VALUES (286, '胡靖', '三圣乡', 1, '2004-08-15', 3631.04, 13, '1992-11-25');
INSERT INTO `employee` VALUES (287, '徐谦', '人民南路', 1, '1999-12-09', 8857.55, 1, '1996-03-06');
INSERT INTO `employee` VALUES (288, '廖达', '青羊宫', 1, '2010-11-12', 14254.89, 13, '1995-12-07');
INSERT INTO `employee` VALUES (289, '肖水', '成渝立交', 0, '2016-07-08', 10970.76, 7, '1993-12-22');
INSERT INTO `employee` VALUES (290, '花千军', '天府三街', 1, '2001-09-10', 18617.52, 10, '1999-03-13');
INSERT INTO `employee` VALUES (291, '肖若悦', '人民北路', 0, '2008-02-13', 13477.02, 9, '1995-05-07');
INSERT INTO `employee` VALUES (292, '周达', '成渝立交', 1, '2015-10-18', 6260.81, 9, '2000-03-29');
INSERT INTO `employee` VALUES (293, '廖长刚', '青羊宫', 1, '2001-07-13', 7176.40, 14, '1993-10-25');
INSERT INTO `employee` VALUES (294, '涂紫', '人民南路', 0, '2005-09-07', 7367.02, 6, '2000-01-19');
INSERT INTO `employee` VALUES (295, '周云', '成渝立交', 1, '2008-07-05', 10745.20, 7, '2000-09-25');
INSERT INTO `employee` VALUES (296, '袁午达', '科华南路', 1, '2009-03-13', 12264.90, 6, '1990-10-22');
INSERT INTO `employee` VALUES (297, '涂万', '成渝立交', 1, '2010-10-15', 6069.31, 6, '1993-07-17');
INSERT INTO `employee` VALUES (298, '李明贺', '春熙路', 1, '2000-03-06', 17840.25, 4, '1993-10-28');
INSERT INTO `employee` VALUES (299, '廖敏蓝', '科华南路', 0, '1998-02-02', 12310.81, 5, '1995-06-02');
INSERT INTO `employee` VALUES (300, '花中军', '天府二街', 1, '2010-05-18', 18549.44, 5, '1997-07-11');
INSERT INTO `employee` VALUES (301, '徐留梅', '春熙路', 0, '1997-04-07', 13062.62, 1, '1992-04-15');
INSERT INTO `employee` VALUES (302, '徐瑶', '昭觉寺', 0, '2001-02-15', 19895.24, 13, '1998-04-08');
INSERT INTO `employee` VALUES (303, '刘万', '太阳公馆', 1, '2007-08-06', 14184.52, 5, '1994-01-05');
INSERT INTO `employee` VALUES (304, '涂蓝', '建设路', 0, '2008-12-03', 13662.85, 12, '1997-11-06');
INSERT INTO `employee` VALUES (305, '肖军', '三圣乡', 1, '2014-08-15', 16209.85, 11, '1994-04-12');
INSERT INTO `employee` VALUES (306, '张若华', '太阳公馆', 0, '1998-02-04', 12428.32, 14, '1991-06-29');
INSERT INTO `employee` VALUES (307, '花乾', '天府一街', 1, '2010-06-21', 8049.88, 2, '1994-03-18');
INSERT INTO `employee` VALUES (308, '肖可蓝', '万家湾', 0, '2008-04-06', 14398.99, 5, '1996-12-04');
INSERT INTO `employee` VALUES (309, '张卫万', '成渝立交', 1, '2001-08-06', 13544.25, 1, '1998-07-08');
INSERT INTO `employee` VALUES (310, '周敏紫', '成渝立交', 0, '1999-10-19', 16126.59, 14, '1997-07-26');
INSERT INTO `employee` VALUES (311, '袁蓝', '春熙路', 0, '1999-10-21', 6693.51, 10, '1997-10-25');
INSERT INTO `employee` VALUES (312, '胡可华', '万家湾', 0, '2002-03-18', 7177.19, 2, '1999-09-04');
INSERT INTO `employee` VALUES (313, '花悦', '成华区SM广场', 0, '2013-04-18', 19864.36, 13, '1995-11-03');
INSERT INTO `employee` VALUES (314, '李悦', '成渝立交', 0, '2012-03-04', 19609.99, 8, '1997-05-17');
INSERT INTO `employee` VALUES (315, '涂华', '昭觉寺', 0, '2012-07-15', 14324.80, 11, '1998-04-27');
INSERT INTO `employee` VALUES (316, '李科乾', '人民南路', 1, '2001-05-04', 4111.94, 1, '1999-06-22');
INSERT INTO `employee` VALUES (317, '肖若若', '浣花溪公寓', 0, '2010-08-17', 13713.72, 12, '1993-06-07');
INSERT INTO `employee` VALUES (318, '廖水', '红瓦寺', 0, '2011-03-11', 12463.77, 11, '1999-07-01');
INSERT INTO `employee` VALUES (319, '胡长浩', '昭觉寺', 1, '1997-04-05', 17990.20, 13, '1995-07-03');
INSERT INTO `employee` VALUES (320, '徐敏君', '建设路', 0, '2001-06-05', 16160.91, 3, '1999-03-12');
INSERT INTO `employee` VALUES (321, '张卫靖', '电子科大成华校区', 1, '2015-07-05', 10699.07, 14, '1993-03-11');
INSERT INTO `employee` VALUES (322, '胡长军', '青羊宫', 1, '2004-06-13', 10547.61, 3, '1990-03-27');
INSERT INTO `employee` VALUES (323, '肖芷蓝', '人民北路', 0, '2004-05-21', 17392.52, 12, '1999-09-24');
INSERT INTO `employee` VALUES (324, '周芷蓝', '人民中路', 0, '2004-10-12', 19907.66, 11, '1999-02-02');
INSERT INTO `employee` VALUES (325, '刘若华', '电子科大成华校区', 0, '2013-05-17', 16567.81, 4, '1998-11-02');
INSERT INTO `employee` VALUES (326, '廖福强', '青羊宫', 1, '2002-10-17', 3375.09, 8, '1995-06-20');
INSERT INTO `employee` VALUES (327, '刘云', '科华南路', 1, '2013-04-15', 12900.18, 8, '1990-01-06');
INSERT INTO `employee` VALUES (328, '周明强', '成渝立交', 1, '2010-04-18', 12693.29, 1, '1999-07-11');
INSERT INTO `employee` VALUES (329, '张三军', '天府三街', 1, '2010-05-06', 8433.59, 1, '1991-06-25');
INSERT INTO `employee` VALUES (330, '肖科威', '青羊宫', 1, '2007-12-18', 4663.83, 12, '2000-05-28');
INSERT INTO `employee` VALUES (331, '袁梅', '天府一街', 0, '2015-08-19', 3989.57, 10, '1996-12-28');
INSERT INTO `employee` VALUES (332, '李正靖', '电子科大成华校区', 1, '2003-08-13', 15277.31, 7, '1990-04-15');
INSERT INTO `employee` VALUES (333, '徐谦', NULL, 1, '2009-02-05', 17502.42, 8, '1996-05-04');
INSERT INTO `employee` VALUES (334, '刘芷华', '天府三街', 0, '2013-04-03', 8518.11, 6, '1995-12-12');
INSERT INTO `employee` VALUES (335, '袁紫', '天府三街', 0, '2007-07-02', 8264.80, 12, '1990-03-23');
INSERT INTO `employee` VALUES (336, '花千越', '太阳公馆', 1, '2009-05-05', 5855.75, 6, '1992-10-09');
INSERT INTO `employee` VALUES (337, '袁紫', '人民中路', 0, '2004-08-04', 18453.91, 5, '1991-08-22');
INSERT INTO `employee` VALUES (338, '肖萌瑶', '太阳公馆', 0, '2001-05-13', 5228.31, 7, '1999-01-20');
INSERT INTO `employee` VALUES (339, '周谦', '昭觉寺', 1, '2010-04-07', 10541.13, 6, '1991-11-01');
INSERT INTO `employee` VALUES (340, '徐千贺', '电子科大成华校区', 1, '2008-09-21', 18415.88, 9, '1994-12-22');
INSERT INTO `employee` VALUES (341, '胡芷君', '万家湾', 0, '1998-04-12', 17793.95, 8, '1997-01-10');
INSERT INTO `employee` VALUES (342, '廖冶达', '电子科大成华校区', 1, '2009-08-21', 17905.35, 13, '1994-03-27');
INSERT INTO `employee` VALUES (343, '袁若', '天府二街', 0, '2009-04-18', 18758.98, 14, '1999-08-10');
INSERT INTO `employee` VALUES (344, '涂万', '人民南路', 1, '2016-05-21', 13745.15, 10, '1999-06-14');
INSERT INTO `employee` VALUES (345, '李水', '成渝立交', 0, '1998-08-13', 6888.28, 11, '1990-10-23');
INSERT INTO `employee` VALUES (346, '廖悦', '建设路', 0, '2008-04-02', 12731.56, 9, '1996-07-02');
INSERT INTO `employee` VALUES (347, '涂萌瑶', '人民北路', 0, '2002-06-21', 9496.29, 13, '1995-07-02');
INSERT INTO `employee` VALUES (348, '胡水', '人民南路', 0, '2014-05-11', 18158.41, 2, '1997-04-08');
INSERT INTO `employee` VALUES (349, '涂可瑶', '成华区SM广场', 0, '2002-01-14', 7687.12, 5, '1995-11-21');
INSERT INTO `employee` VALUES (350, '涂若', '科华南路', 0, '2000-07-06', 18947.44, 6, '2000-10-05');
INSERT INTO `employee` VALUES (351, '涂云', '春熙路', 1, '1998-04-14', 17920.23, 13, '1993-01-09');
INSERT INTO `employee` VALUES (352, '徐瑶', '建设路', 0, '2011-03-05', 17018.42, 6, '1993-08-03');
INSERT INTO `employee` VALUES (353, '徐冶谦', '天府二街', 1, '2007-06-06', 3609.01, 3, '1996-12-22');
INSERT INTO `employee` VALUES (354, '刘悦', '浣花溪公寓', 0, '2008-02-04', 16038.47, 6, '2000-07-26');
INSERT INTO `employee` VALUES (355, '胡紫', '人民南路', 0, '2008-04-16', 14944.64, 5, '1997-11-09');
INSERT INTO `employee` VALUES (356, '涂午浩', '天府三街', 1, '2014-07-09', 17422.86, 5, '1999-08-07');
INSERT INTO `employee` VALUES (357, '花可紫', '三圣乡', 0, '1996-08-05', 10670.09, 7, '1994-04-05');
INSERT INTO `employee` VALUES (358, '李敏蓝', '电子科大成华校区', 0, '2013-02-03', 6290.60, 6, '2000-02-27');
INSERT INTO `employee` VALUES (359, '廖刚', '天府一街', 1, '2012-02-05', 17667.59, 10, '1992-04-26');
INSERT INTO `employee` VALUES (360, '廖贺', '建设路', 1, '2005-01-04', 11427.56, 9, '1995-10-18');
INSERT INTO `employee` VALUES (361, '廖威', '三圣乡', 1, '2001-03-17', 8903.77, 4, '1996-04-18');
INSERT INTO `employee` VALUES (362, '胡强', '天府一街', 1, '2012-11-07', 4272.03, 11, '1990-06-08');
INSERT INTO `employee` VALUES (363, '徐云', '天府一街', 1, '1997-09-20', 14458.60, 14, '2000-10-03');
INSERT INTO `employee` VALUES (364, '刘蓝', '建设路', 0, '2012-03-20', 4113.34, 13, '1991-04-09');
INSERT INTO `employee` VALUES (365, '胡留华', '春熙路', 0, '2004-02-18', 14542.04, 12, '1994-05-13');
INSERT INTO `employee` VALUES (366, '周若华', '太阳公馆', 0, '2008-11-19', 13974.99, 5, '1990-01-29');
INSERT INTO `employee` VALUES (367, '刘若', '万家湾', 0, '2012-02-08', 17364.07, 12, '1998-01-24');
INSERT INTO `employee` VALUES (368, '张可蓝', '红瓦寺', 0, '2014-10-16', 19910.24, 10, '2000-06-08');
INSERT INTO `employee` VALUES (369, '廖若华', '昭觉寺', 0, '2012-02-09', 5417.34, 2, '1999-10-06');
INSERT INTO `employee` VALUES (370, '徐冶云', '浣花溪公寓', 1, '1997-01-12', 13187.03, 8, '1996-04-20');
INSERT INTO `employee` VALUES (371, '肖敏君', '红瓦寺', 0, '2005-06-06', 12446.49, 2, '1995-06-27');
INSERT INTO `employee` VALUES (372, '李千刚', '三圣乡', 1, '2008-11-20', 8290.29, 4, '1990-09-12');
INSERT INTO `employee` VALUES (373, '廖福越', '三圣乡', 1, '2001-02-07', 7414.74, 5, '1997-06-02');
INSERT INTO `employee` VALUES (374, '李时', '电子科大成华校区', 1, '1997-05-19', 14874.15, 13, '1999-04-26');
INSERT INTO `employee` VALUES (375, '廖若水', '科华南路', 0, '1997-05-19', 19522.55, 14, '1995-10-19');
INSERT INTO `employee` VALUES (376, '徐明谦', '人民北路', 1, '1998-06-11', 5339.55, 9, '1997-07-24');
INSERT INTO `employee` VALUES (377, '李中时', '万家湾', 1, '2008-08-14', 13547.39, 6, '1993-01-05');
INSERT INTO `employee` VALUES (378, '廖长伟', '天府一街', 1, '2005-08-17', 14875.46, 9, '1999-08-18');
INSERT INTO `employee` VALUES (379, '袁萌水', '昭觉寺', 0, '2000-07-11', 17368.20, 8, '1992-04-19');
INSERT INTO `employee` VALUES (380, '袁敏瑶', '太阳公馆', 0, '2004-08-07', 15428.75, 3, '1995-05-16');
INSERT INTO `employee` VALUES (381, '花军', '春熙路', 1, '2009-01-15', 10122.35, 10, '1994-08-27');
INSERT INTO `employee` VALUES (382, '胡卫威', '万家湾', 1, '1998-01-05', 13603.79, 11, '1996-02-23');
INSERT INTO `employee` VALUES (383, '花蓝', '天府三街', 0, '2012-07-14', 5486.46, 13, '1995-06-14');
INSERT INTO `employee` VALUES (384, '廖福万', '成华区SM广场', 1, '1997-05-20', 9535.91, 12, '1991-03-23');
INSERT INTO `employee` VALUES (385, '花敏梅', '昭觉寺', 0, '2005-01-05', 12761.24, 12, '1992-08-21');
INSERT INTO `employee` VALUES (386, '周可华', '建设路', 0, '2005-09-03', 11419.83, 14, '1995-05-12');
INSERT INTO `employee` VALUES (387, '涂正军', '天府一街', 1, '1998-06-07', 9889.02, 4, '1999-03-15');
INSERT INTO `employee` VALUES (388, '涂长靖', '成渝立交', 1, '2005-11-15', 10530.87, 12, '1998-05-12');
INSERT INTO `employee` VALUES (389, '肖可悦', '科华南路', 0, '2014-05-03', 5714.53, 9, '1990-12-19');
INSERT INTO `employee` VALUES (390, '李悦', '红瓦寺', 0, '2012-08-18', 13616.72, 8, '1993-09-18');
INSERT INTO `employee` VALUES (391, '刘若', '成渝立交', 0, '2005-07-15', 9316.49, 10, '1998-04-26');
INSERT INTO `employee` VALUES (392, '刘钟达', '青羊宫', 1, '2001-01-06', 15359.21, 7, '1996-04-22');
INSERT INTO `employee` VALUES (393, '涂伟', '浣花溪公寓', 1, '2008-03-16', 19017.98, 10, '1999-11-28');
INSERT INTO `employee` VALUES (394, '徐水', '红瓦寺', 0, '1999-08-19', 16191.75, 5, '1991-11-24');
INSERT INTO `employee` VALUES (395, '花萌华', '天府二街', 0, '1997-02-11', 19346.02, 4, '1995-12-16');
INSERT INTO `employee` VALUES (396, '廖明乾', '青羊宫', 1, '2002-07-20', 8897.32, 12, '1997-09-16');
INSERT INTO `employee` VALUES (397, '花达', '电子科大成华校区', 1, '1999-01-19', 7260.87, 3, '1995-12-07');
INSERT INTO `employee` VALUES (398, '徐福靖', '成渝立交', 1, '2007-05-16', 16739.76, 11, '1993-11-14');
INSERT INTO `employee` VALUES (399, '涂长谦', '人民北路', 1, '2002-02-19', 6445.03, 14, '1997-02-12');
INSERT INTO `employee` VALUES (400, '李若紫', '成渝立交', 0, '2006-08-12', 4783.39, 12, '1997-03-03');
INSERT INTO `employee` VALUES (401, '徐可蓝', '三圣乡', 0, '2006-06-06', 3358.69, 11, '1998-07-16');
INSERT INTO `employee` VALUES (402, '刘福军', '青羊宫', 1, '2008-03-09', 10201.97, 9, '2000-01-12');
INSERT INTO `employee` VALUES (403, '刘水', '人民中路', 0, '2012-05-07', 16022.42, 2, '2000-06-16');
INSERT INTO `employee` VALUES (404, '袁华', '人民中路', 0, '2010-08-04', 7753.87, 9, '1993-12-28');
INSERT INTO `employee` VALUES (405, '徐正伟', '万家湾', 1, '2008-12-17', 18534.68, 2, '1998-12-11');
INSERT INTO `employee` VALUES (406, '袁卫靖', '红瓦寺', 1, '2000-02-11', 13549.44, 14, '2000-12-19');
INSERT INTO `employee` VALUES (407, '周蓝', '三圣乡', 0, '2013-02-08', 15715.33, 2, '1994-04-01');
INSERT INTO `employee` VALUES (408, '胡越', '春熙路', 1, '2000-01-17', 4335.23, 6, '1992-01-22');
INSERT INTO `employee` VALUES (409, '肖靖', '科华南路', 1, '2010-08-11', 12716.87, 13, '1994-12-16');
INSERT INTO `employee` VALUES (410, '花悦', '红瓦寺', 0, '1997-02-07', 3590.08, 13, '1999-06-26');
INSERT INTO `employee` VALUES (411, '花留梅', '成华区SM广场', 0, '2012-08-08', 12833.03, 5, '2000-01-11');
INSERT INTO `employee` VALUES (412, '花华', '人民中路', 0, '1998-08-20', 19147.14, 7, '1998-10-15');
INSERT INTO `employee` VALUES (413, '肖水', '人民南路', 0, '2013-04-16', 9004.44, 9, '1991-05-10');
INSERT INTO `employee` VALUES (414, '花乾', '红瓦寺', 1, '2009-01-14', 8442.06, 4, '1995-07-06');
INSERT INTO `employee` VALUES (415, '李紫', '建设路', 0, '2015-03-08', 7781.68, 11, '1994-05-23');
INSERT INTO `employee` VALUES (416, '徐君', '三圣乡', 0, '2000-08-10', 18254.97, 7, '1996-11-15');
INSERT INTO `employee` VALUES (417, '胡中达', '三圣乡', 1, '2015-06-21', 12168.83, 4, '1999-12-06');
INSERT INTO `employee` VALUES (418, '周军', '建设路', 1, '2009-06-03', 18080.84, 2, '1990-08-02');
INSERT INTO `employee` VALUES (419, '涂可华', '电子科大成华校区', 0, '1997-02-04', 13984.98, 11, '1993-04-20');
INSERT INTO `employee` VALUES (420, '周卫云', '三圣乡', 1, '1998-03-08', 19461.83, 12, '1995-06-24');
INSERT INTO `employee` VALUES (421, '袁冶达', '人民南路', 1, '2006-03-20', 7446.25, 12, '1996-07-03');
INSERT INTO `employee` VALUES (422, '涂明时', '春熙路', 1, '1998-06-06', 14535.60, 3, '1998-05-21');
INSERT INTO `employee` VALUES (423, '周留悦', '青羊宫', 0, '2003-05-02', 8166.88, 7, '1993-09-15');
INSERT INTO `employee` VALUES (424, '花萌蓝', '建设路', 0, '2008-09-10', 17505.85, 3, '1993-02-20');
INSERT INTO `employee` VALUES (425, '刘军', '天府二街', 1, '2007-05-11', 7653.54, 13, '2000-11-13');
INSERT INTO `employee` VALUES (426, '胡科达', '电子科大成华校区', 1, '1996-03-20', 19472.87, 3, '1996-06-18');
INSERT INTO `employee` VALUES (427, '刘若水', '天府二街', 0, '2014-08-02', 3211.24, 11, '1997-09-14');
INSERT INTO `employee` VALUES (428, '涂萌君', '人民南路', 0, '2013-04-05', 11055.80, 6, '1991-06-20');
INSERT INTO `employee` VALUES (429, '花冶乾', '电子科大成华校区', 1, '2013-07-17', 14191.03, 9, '1990-02-17');
INSERT INTO `employee` VALUES (430, '肖敏蓝', '人民南路', 0, '2007-07-09', 4449.78, 10, '1995-11-21');
INSERT INTO `employee` VALUES (431, '周越', '成渝立交', 1, '2001-08-12', 13475.41, 3, '1990-01-04');
INSERT INTO `employee` VALUES (432, '李中靖', '万家湾', 1, '2011-07-04', 16518.21, 2, '1995-02-06');
INSERT INTO `employee` VALUES (433, '张敏水', '天府三街', 0, '2004-09-10', 8300.95, 8, '1995-01-15');
INSERT INTO `employee` VALUES (434, '周若若', '天府三街', 0, '2013-07-07', 7110.76, 3, '1995-12-06');
INSERT INTO `employee` VALUES (435, '李军', '人民北路', 1, '2008-03-10', 19353.25, 10, '1991-03-14');
INSERT INTO `employee` VALUES (436, '花蓝', '天府一街', 0, '2008-11-16', 5609.75, 8, '1998-08-18');
INSERT INTO `employee` VALUES (437, '张萌瑶', '青羊宫', 0, '2015-02-19', 14015.08, 3, '1991-02-02');
INSERT INTO `employee` VALUES (438, '廖敏瑶', '科华南路', 0, '1998-01-03', 6490.65, 13, '1999-03-12');
INSERT INTO `employee` VALUES (439, '李钟越', '电子科大成华校区', 1, '2014-08-15', 18392.09, 4, '1993-07-19');
INSERT INTO `employee` VALUES (440, '张钟军', '科华南路', 1, '2013-03-07', 13274.88, 14, '1996-03-01');
INSERT INTO `employee` VALUES (441, '徐中伟', '太阳公馆', 1, '2011-03-13', 11367.42, 12, '1996-10-11');
INSERT INTO `employee` VALUES (442, '肖冶越', '天府二街', 1, '2008-06-02', 7318.37, 11, '1993-09-16');
INSERT INTO `employee` VALUES (443, '廖冶越', '三圣乡', 1, '1998-03-09', 6523.35, 8, '1994-07-17');
INSERT INTO `employee` VALUES (444, '廖冶威', '天府一街', 1, '2000-06-13', 5353.70, 2, '1991-01-26');
INSERT INTO `employee` VALUES (445, '张越', '建设路', 1, '1997-11-06', 3715.43, 14, '1992-05-09');
INSERT INTO `employee` VALUES (446, '肖可君', '太阳公馆', 0, '2002-05-02', 12478.43, 3, '1992-06-17');
INSERT INTO `employee` VALUES (447, '周威', '红瓦寺', 1, '2005-05-20', 10659.89, 7, '1995-08-19');
INSERT INTO `employee` VALUES (448, '刘萌水', '建设路', 0, '2003-06-16', 7569.60, 1, '1993-09-22');
INSERT INTO `employee` VALUES (449, '刘留若', '春熙路', 0, '2002-10-14', 15543.38, 3, '1994-11-02');
INSERT INTO `employee` VALUES (450, '廖越', '成渝立交', 1, '2013-04-09', 4886.03, 7, '1996-01-11');
INSERT INTO `employee` VALUES (451, '胡千伟', '电子科大成华校区', 1, '2000-05-14', 18114.34, 12, '1997-03-06');
INSERT INTO `employee` VALUES (452, '廖明靖', '成华区SM广场', 1, '2006-04-02', 12873.73, 11, '1993-10-08');
INSERT INTO `employee` VALUES (453, '肖万', '万家湾', 1, '2007-04-05', 9284.74, 4, '1999-08-15');
INSERT INTO `employee` VALUES (454, '花千强', '建设路', 1, '2001-04-20', 11299.24, 1, '1996-05-04');
INSERT INTO `employee` VALUES (455, '李军', '电子科大成华校区', 1, '1999-06-18', 11322.27, 3, '1996-06-16');
INSERT INTO `employee` VALUES (456, '张贺', '昭觉寺', 1, '2010-03-18', 10207.72, 1, '1993-12-26');
INSERT INTO `employee` VALUES (457, '袁靖', '昭觉寺', 1, '2016-04-18', 8148.63, 11, '1996-01-21');
INSERT INTO `employee` VALUES (458, '胡午刚', '电子科大成华校区', 1, '2011-09-03', 17675.56, 11, '1993-08-02');
INSERT INTO `employee` VALUES (459, '胡达', '成华区SM广场', 1, '1999-11-06', 17809.41, 1, '1994-11-08');
INSERT INTO `employee` VALUES (460, '张敏梅', '浣花溪公寓', 0, '2000-02-14', 4367.28, 6, '1995-12-05');
INSERT INTO `employee` VALUES (461, '肖芷蓝', '三圣乡', 0, '2015-06-16', 7617.85, 13, '1999-01-17');
INSERT INTO `employee` VALUES (462, '周紫', '建设路', 0, '2002-02-08', 19976.38, 9, '1996-06-15');
INSERT INTO `employee` VALUES (463, '袁敏若', '红瓦寺', 0, '2013-05-04', 6141.46, 2, '1990-09-14');
INSERT INTO `employee` VALUES (464, '袁伟', '三圣乡', 1, '2001-06-08', 11979.13, 9, '1991-05-10');
INSERT INTO `employee` VALUES (465, '刘福云', '太阳公馆', 1, '2007-12-16', 7551.22, 6, '1996-02-26');
INSERT INTO `employee` VALUES (466, '花悦', '昭觉寺', 0, '2014-08-11', 11559.69, 12, '2000-01-15');
INSERT INTO `employee` VALUES (467, '李福云', '万家湾', 1, '2010-08-15', 11215.43, 6, '1993-01-12');
INSERT INTO `employee` VALUES (468, '李卫越', '昭觉寺', 1, '1999-12-02', 14144.81, 11, '1998-06-08');
INSERT INTO `employee` VALUES (469, '肖芷瑶', '天府三街', 0, '2005-10-02', 11231.06, 3, '1999-05-12');
INSERT INTO `employee` VALUES (470, '袁靖', '电子科大成华校区', 1, '2013-01-21', 12500.28, 11, '1998-12-05');
INSERT INTO `employee` VALUES (471, '张若水', '人民北路', 0, '2011-09-02', 13354.76, 11, '2000-05-26');
INSERT INTO `employee` VALUES (472, '花若', '成渝立交', 0, '2001-05-03', 8659.33, 7, '1993-02-20');
INSERT INTO `employee` VALUES (473, '肖正军', '成渝立交', 1, '2014-08-09', 7116.18, 14, '2000-10-02');
INSERT INTO `employee` VALUES (474, '肖若若', '三圣乡', 0, '2000-01-17', 19121.83, 3, '1998-12-09');
INSERT INTO `employee` VALUES (475, '周若', '三圣乡', 0, '2013-01-20', 19283.79, 3, '1997-05-26');
INSERT INTO `employee` VALUES (476, '廖明浩', '三圣乡', 1, '2005-08-02', 13999.50, 9, '1993-01-10');
INSERT INTO `employee` VALUES (477, '袁瑶', '天府三街', 0, '2005-08-14', 10408.38, 1, '1994-12-22');
INSERT INTO `employee` VALUES (478, '袁可瑶', '人民南路', 0, '1999-05-18', 17771.08, 11, '1998-10-17');
INSERT INTO `employee` VALUES (479, '李中刚', '科华南路', 1, '2016-05-07', 13948.46, 8, '1994-04-10');
INSERT INTO `employee` VALUES (480, '周若', '人民北路', 0, '2013-10-20', 8129.14, 2, '1998-11-01');
INSERT INTO `employee` VALUES (481, '张萌若', '电子科大成华校区', 0, '2000-03-06', 15382.57, 6, '1995-03-25');
INSERT INTO `employee` VALUES (482, '袁可梅', '人民北路', 0, '2007-07-03', 7081.17, 4, '1994-09-03');
INSERT INTO `employee` VALUES (483, '花科云', '人民北路', 1, '2000-08-07', 3806.06, 3, '1994-10-16');
INSERT INTO `employee` VALUES (484, '徐卫云', '万家湾', 1, '2012-08-16', 7307.76, 7, '1995-11-22');
INSERT INTO `employee` VALUES (485, '涂明云', '科华南路', 1, '2001-03-12', 9908.56, 1, '1991-08-19');
INSERT INTO `employee` VALUES (486, '周刚', '春熙路', 1, '1997-11-15', 6547.96, 5, '1992-06-13');
INSERT INTO `employee` VALUES (487, '徐若', '天府三街', 0, '2012-08-10', 8734.29, 2, '1999-02-23');
INSERT INTO `employee` VALUES (488, '刘卫军', '成渝立交', 1, '1998-09-16', 19467.70, 2, '1997-01-06');
INSERT INTO `employee` VALUES (489, '刘靖', '昭觉寺', 1, '1997-10-12', 11227.25, 8, '1998-04-06');
INSERT INTO `employee` VALUES (490, '胡敏悦', '青羊宫', 0, '2013-09-15', 8324.19, 3, '1990-09-16');
INSERT INTO `employee` VALUES (491, '李芷悦', '成渝立交', 0, '1997-07-06', 15179.16, 10, '1995-10-18');
INSERT INTO `employee` VALUES (492, '花云', '人民南路', 1, '2000-04-04', 19602.09, 3, '1997-05-25');
INSERT INTO `employee` VALUES (493, '徐谦', '成渝立交', 1, '2001-07-13', 5997.92, 4, '1991-04-27');
INSERT INTO `employee` VALUES (494, '花长谦', '成渝立交', 1, '2010-07-05', 15349.92, 12, '1998-12-17');
INSERT INTO `employee` VALUES (495, '周强', '万家湾', 1, '2015-01-07', 12572.57, 14, '1999-11-17');
INSERT INTO `employee` VALUES (496, '周芷君', '太阳公馆', 0, '2012-04-05', 7711.59, 8, '1993-11-16');
INSERT INTO `employee` VALUES (497, '徐若', '电子科大成华校区', 0, '2002-12-15', 3806.36, 8, '2000-02-21');
INSERT INTO `employee` VALUES (498, '张君', '浣花溪公寓', 0, '2003-10-16', 3017.79, 12, '1992-02-22');
INSERT INTO `employee` VALUES (499, '张瑶', '红瓦寺', 0, '2007-08-06', 16240.10, 10, '1993-08-01');
INSERT INTO `employee` VALUES (500, '徐靖', '昭觉寺', 1, '2009-05-20', 12806.73, 13, '1991-10-11');
INSERT INTO `employee` VALUES (501, '袁万', '春熙路', 1, '2011-02-08', 18778.12, 14, '1995-05-09');
INSERT INTO `employee` VALUES (502, '胡敏瑶', '人民南路', 0, '2008-07-21', 6614.85, 14, '1995-05-20');
INSERT INTO `employee` VALUES (503, '周水', '天府二街', 0, '1999-05-18', 19052.84, 14, '1991-09-04');
INSERT INTO `employee` VALUES (504, '李可蓝', '人民南路', 0, '2001-06-10', 8310.80, 2, '1995-02-05');
INSERT INTO `employee` VALUES (505, '周萌君', '建设路', 0, '2002-03-14', 18452.58, 6, '1994-07-17');
INSERT INTO `employee` VALUES (506, '廖若', '天府二街', 0, '2016-02-02', 15337.40, 5, '1991-01-22');
INSERT INTO `employee` VALUES (507, '胡若瑶', '万家湾', 0, '2014-03-14', 8331.19, 4, '1997-02-12');
INSERT INTO `employee` VALUES (508, '肖可君', '人民南路', 0, '2000-07-09', 16069.69, 1, '1998-09-07');
INSERT INTO `employee` VALUES (509, '花水', '电子科大成华校区', 0, '2009-03-15', 15932.55, 6, '1990-05-28');
INSERT INTO `employee` VALUES (510, '刘浩', '人民南路', 1, '2010-05-06', 19763.58, 10, '1995-09-25');
INSERT INTO `employee` VALUES (511, '肖留蓝', '太阳公馆', 0, '1997-03-02', 13355.71, 1, '1992-07-07');
INSERT INTO `employee` VALUES (512, '张紫', '天府二街', 0, '1999-03-02', 14026.39, 6, '1993-01-09');
INSERT INTO `employee` VALUES (513, '张钟强', '人民中路', 1, '1997-11-11', 11721.80, 3, '1992-04-20');
INSERT INTO `employee` VALUES (514, '刘紫', '建设路', 0, '2008-03-04', 13849.03, 6, '1996-09-29');
INSERT INTO `employee` VALUES (515, '徐正时', '红瓦寺', 1, '2004-08-17', 18044.84, 6, '1998-09-16');
INSERT INTO `employee` VALUES (516, '张留华', '成渝立交', 0, '2011-11-14', 12681.31, 12, '1994-04-15');
INSERT INTO `employee` VALUES (517, '胡科伟', '昭觉寺', 1, '2007-04-15', 19593.50, 11, '1994-10-20');
INSERT INTO `employee` VALUES (518, '涂浩', '成渝立交', 1, '2010-01-03', 11576.40, 13, '2000-12-20');
INSERT INTO `employee` VALUES (519, '涂正靖', '人民北路', 1, '2015-07-21', 6352.07, 10, '1996-01-14');
INSERT INTO `employee` VALUES (520, '徐伟', '青羊宫', 1, '2005-09-05', 15107.04, 10, '1991-03-21');
INSERT INTO `employee` VALUES (521, '花正万', '太阳公馆', 1, '2014-06-04', 14724.09, 13, '1999-01-26');
INSERT INTO `employee` VALUES (522, '涂水', '青羊宫', 0, '2001-08-14', 17244.15, 13, '1991-01-26');
INSERT INTO `employee` VALUES (523, '廖长越', '建设路', 1, '2009-02-02', 10889.30, 4, '1992-06-21');
INSERT INTO `employee` VALUES (524, '花千靖', '青羊宫', 1, '2013-04-07', 3551.97, 7, '1991-07-07');
INSERT INTO `employee` VALUES (525, '肖威', '建设路', 1, '1996-08-05', 9403.32, 11, '1995-11-23');
INSERT INTO `employee` VALUES (526, '涂浩', '人民南路', 1, '2013-07-17', 14737.92, 13, '1993-04-15');
INSERT INTO `employee` VALUES (527, '涂水', '建设路', 0, '1998-08-21', 10018.60, 11, '1997-10-29');
INSERT INTO `employee` VALUES (528, '刘萌紫', '青羊宫', 0, '2009-08-19', 18145.32, 7, '1994-05-13');
INSERT INTO `employee` VALUES (529, '张科乾', '建设路', 1, '2011-04-09', 9248.45, 3, '1990-12-16');
INSERT INTO `employee` VALUES (530, '涂贺', '昭觉寺', 1, '2007-05-15', 14229.06, 9, '1999-11-25');
INSERT INTO `employee` VALUES (531, '肖三威', '科华南路', 1, '2000-09-17', 3059.93, 7, '1994-08-23');
INSERT INTO `employee` VALUES (532, '胡可梅', NULL, 0, '2003-09-05', 4134.25, 11, '1991-02-09');
INSERT INTO `employee` VALUES (533, '花卫靖', '太阳公馆', 1, '2012-01-06', 10158.12, 13, '1990-06-02');
INSERT INTO `employee` VALUES (534, '袁君', '建设路', 0, '2002-12-15', 10469.08, 5, '1999-05-03');
INSERT INTO `employee` VALUES (535, '李靖', '人民中路', 1, '2006-06-14', 15213.47, 14, '1993-06-06');
INSERT INTO `employee` VALUES (536, '周君', '成华区SM广场', 0, '1999-08-07', 19851.56, 2, '1997-09-17');
INSERT INTO `employee` VALUES (537, '刘长靖', '春熙路', 1, '2000-06-09', 17878.15, 7, '1998-01-27');
INSERT INTO `employee` VALUES (538, '花蓝', '人民南路', 0, '2016-04-09', 4626.06, 10, '1995-10-15');
INSERT INTO `employee` VALUES (539, '李若', '红瓦寺', 0, '2010-03-02', 9629.51, 2, '1991-02-02');
INSERT INTO `employee` VALUES (540, '花留蓝', '天府三街', 0, '2016-03-12', 18717.46, 12, '1990-01-29');
INSERT INTO `employee` VALUES (541, '肖萌瑶', '昭觉寺', 0, '2007-02-03', 9846.50, 6, '1999-03-14');
INSERT INTO `employee` VALUES (542, '张刚', '人民南路', 1, '2001-01-14', 9755.57, 2, '1998-06-24');
INSERT INTO `employee` VALUES (543, '张明强', '万家湾', 1, '2014-10-21', 7193.82, 11, '1999-10-11');
INSERT INTO `employee` VALUES (544, '肖留华', '万家湾', 0, '2003-05-03', 18881.43, 7, '1994-01-23');
INSERT INTO `employee` VALUES (545, '涂明时', '红瓦寺', 1, '1999-12-04', 5682.51, 8, '2000-03-13');
INSERT INTO `employee` VALUES (546, '李伟', '科华南路', 1, '1998-01-05', 8648.65, 11, '1995-03-16');
INSERT INTO `employee` VALUES (547, '涂科乾', '万家湾', 1, '2008-08-11', 5034.45, 10, '1990-07-24');
INSERT INTO `employee` VALUES (548, '袁留华', '天府二街', 0, '2002-01-07', 4628.17, 14, '1992-10-05');
INSERT INTO `employee` VALUES (549, '张芷君', '万家湾', 0, '2006-03-13', 16450.70, 12, '1994-10-14');
INSERT INTO `employee` VALUES (550, '刘华', '青羊宫', 0, '2004-01-12', 15546.09, 12, '1990-09-14');
INSERT INTO `employee` VALUES (551, '刘千万', '三圣乡', 1, '2000-01-17', 16148.83, 3, '1992-08-18');
INSERT INTO `employee` VALUES (552, '肖若梅', '建设路', 0, '2000-05-15', 17185.30, 5, '1991-08-01');
INSERT INTO `employee` VALUES (553, '花敏悦', '青羊宫', 0, '2006-07-10', 13819.57, 10, '1990-04-12');
INSERT INTO `employee` VALUES (554, '花君', '昭觉寺', 0, '2002-04-16', 9309.40, 11, '2000-08-08');
INSERT INTO `employee` VALUES (555, '廖乾', '电子科大成华校区', 1, '2012-02-20', 12713.66, 13, '1993-01-02');
INSERT INTO `employee` VALUES (556, '周乾', '电子科大成华校区', 1, '2004-06-03', 19204.43, 7, '1992-10-10');
INSERT INTO `employee` VALUES (557, '廖强', '成华区SM广场', 1, '2003-07-21', 19140.65, 3, '1992-05-02');
INSERT INTO `employee` VALUES (558, '袁蓝', '天府一街', 0, '2003-01-04', 11756.00, 14, '1991-07-10');
INSERT INTO `employee` VALUES (559, '李三伟', '万家湾', 1, '2013-06-16', 5554.24, 13, '1990-01-06');
INSERT INTO `employee` VALUES (560, '张冶谦', '太阳公馆', 1, '1999-09-03', 10397.44, 2, '1998-04-05');
INSERT INTO `employee` VALUES (561, '胡千强', '三圣乡', 1, '2005-02-11', 15375.09, 1, '2000-03-04');
INSERT INTO `employee` VALUES (562, '廖留华', '成华区SM广场', 0, '2014-10-20', 15721.53, 13, '1990-10-24');
INSERT INTO `employee` VALUES (563, '胡乾', '天府二街', 1, '2004-09-21', 8790.05, 6, '1998-05-17');
INSERT INTO `employee` VALUES (564, '徐威', '天府二街', 1, '1999-01-21', 3885.94, 3, '1997-09-17');
INSERT INTO `employee` VALUES (565, '涂芷君', '春熙路', 0, '2013-02-02', 19132.81, 8, '1997-09-10');
INSERT INTO `employee` VALUES (566, '刘萌瑶', '电子科大成华校区', 0, '2005-03-06', 15818.92, 14, '1997-04-13');
INSERT INTO `employee` VALUES (567, '花梅', '太阳公馆', 0, '2010-03-04', 15163.87, 7, '1993-05-21');
INSERT INTO `employee` VALUES (568, '周明浩', '昭觉寺', 1, '2011-10-10', 17233.77, 11, '1995-06-25');
INSERT INTO `employee` VALUES (569, '涂明云', '人民中路', 1, '2010-01-04', 9620.16, 2, '1997-02-12');
INSERT INTO `employee` VALUES (570, '涂军', '天府三街', 1, '2003-07-03', 6570.80, 6, '1997-03-25');
INSERT INTO `employee` VALUES (571, '廖萌紫', '春熙路', 0, '2013-01-19', 7341.14, 1, '1997-11-09');
INSERT INTO `employee` VALUES (572, '花留水', '太阳公馆', 0, '2012-07-02', 3087.66, 12, '1999-06-18');
INSERT INTO `employee` VALUES (573, '肖芷君', '人民北路', 0, '2014-05-14', 17966.55, 3, '1997-09-12');
INSERT INTO `employee` VALUES (574, '袁悦', '电子科大成华校区', 0, '2011-02-15', 13303.88, 9, '1999-04-19');
INSERT INTO `employee` VALUES (575, '廖蓝', '天府三街', 0, '2016-07-19', 9035.48, 2, '1994-03-21');
INSERT INTO `employee` VALUES (576, '徐中谦', '人民北路', 1, '2012-01-06', 11811.97, 7, '2000-06-18');
INSERT INTO `employee` VALUES (577, '张水', '天府一街', 0, '2002-09-20', 10533.74, 14, '1996-04-13');
INSERT INTO `employee` VALUES (578, '袁钟越', '春熙路', 1, '2009-07-11', 18649.42, 10, '1994-07-20');
INSERT INTO `employee` VALUES (579, '廖冶万', '红瓦寺', 1, '2000-10-15', 6618.79, 3, '1997-05-27');
INSERT INTO `employee` VALUES (580, '刘萌若', '人民北路', 0, '2011-04-05', 4881.85, 14, '1995-07-11');
INSERT INTO `employee` VALUES (581, '张留若', '建设路', 0, '2006-12-07', 16356.74, 11, '1992-10-14');
INSERT INTO `employee` VALUES (582, '花伟', '太阳公馆', 1, '2011-01-21', 5025.18, 12, '2000-06-12');
INSERT INTO `employee` VALUES (583, '周萌悦', '电子科大成华校区', 0, '2002-03-21', 16181.42, 1, '1995-07-04');
INSERT INTO `employee` VALUES (584, '刘瑶', '电子科大成华校区', 0, '2008-05-20', 13345.04, 7, '1999-02-02');
INSERT INTO `employee` VALUES (585, '张芷悦', '太阳公馆', 0, '2002-02-05', 15339.51, 2, '1999-02-28');
INSERT INTO `employee` VALUES (586, '涂贺', '万家湾', 1, '2000-01-16', 3378.45, 3, '1994-04-03');
INSERT INTO `employee` VALUES (587, '胡悦', '人民南路', 0, '2008-10-21', 10819.82, 10, '1996-10-03');
INSERT INTO `employee` VALUES (588, '花正时', '红瓦寺', 1, '1997-02-06', 14858.60, 10, '1991-05-18');
INSERT INTO `employee` VALUES (589, '徐芷华', '人民南路', 0, '2002-11-19', 6255.30, 12, '1998-11-10');
INSERT INTO `employee` VALUES (590, '徐福强', '科华南路', 1, '2006-07-05', 13971.14, 7, '1999-06-23');
INSERT INTO `employee` VALUES (591, '张敏水', '科华南路', 0, '2012-04-03', 10446.52, 7, '1994-11-28');
INSERT INTO `employee` VALUES (592, '李科乾', '万家湾', 1, '2012-09-09', 10528.20, 2, '1991-12-09');
INSERT INTO `employee` VALUES (593, '花伟', '天府二街', 1, '2003-09-10', 14089.29, 6, '1996-03-06');
INSERT INTO `employee` VALUES (594, '周福强', '电子科大成华校区', 1, '2013-04-06', 7540.10, 3, '1993-01-08');
INSERT INTO `employee` VALUES (595, '周芷梅', '建设路', 0, '2016-08-19', 9020.78, 9, '1991-12-08');
INSERT INTO `employee` VALUES (596, '廖威', '天府二街', 1, '2001-05-16', 9455.97, 11, '1995-08-17');
INSERT INTO `employee` VALUES (597, '花若水', '天府二街', 0, '2004-10-03', 9168.82, 10, '1990-07-13');
INSERT INTO `employee` VALUES (598, '肖午贺', '成华区SM广场', 1, '2011-04-13', 18807.07, 14, '1996-11-13');
INSERT INTO `employee` VALUES (599, '李若君', '万家湾', 0, '2003-01-06', 16720.44, 1, '1996-10-29');
INSERT INTO `employee` VALUES (600, '刘若君', '人民中路', 0, '2013-05-21', 12463.22, 11, '1997-04-12');
INSERT INTO `employee` VALUES (601, '刘若悦', '春熙路', 0, '2003-01-04', 9863.44, 1, '1991-08-24');
INSERT INTO `employee` VALUES (602, '廖靖', '成渝立交', 1, '2010-05-02', 16504.51, 4, '1990-12-13');
INSERT INTO `employee` VALUES (603, '廖贺', '三圣乡', 1, '2015-01-14', 16571.67, 11, '1993-05-25');
INSERT INTO `employee` VALUES (604, '胡芷若', '红瓦寺', 0, '1996-02-15', 16327.28, 12, '1990-12-11');
INSERT INTO `employee` VALUES (605, '肖军', '昭觉寺', 1, '2008-03-14', 11834.15, 2, '1991-05-18');
INSERT INTO `employee` VALUES (606, '周若悦', '春熙路', 0, '2014-11-20', 11166.39, 3, '1999-05-16');
INSERT INTO `employee` VALUES (607, '涂芷悦', '天府三街', 0, '1999-06-10', 8708.24, 12, '1995-11-24');
INSERT INTO `employee` VALUES (608, '袁敏水', '春熙路', 0, '2001-12-20', 15603.44, 4, '1994-10-19');
INSERT INTO `employee` VALUES (609, '李中贺', '人民南路', 1, '2014-03-21', 14655.75, 8, '1998-11-01');
INSERT INTO `employee` VALUES (610, '刘三云', '太阳公馆', 1, '2006-05-19', 12368.02, 3, '1996-09-24');
INSERT INTO `employee` VALUES (611, '袁乾', '浣花溪公寓', 1, '2007-08-07', 18030.23, 4, '2000-05-24');
INSERT INTO `employee` VALUES (612, '李留瑶', '天府三街', 0, '2000-03-17', 19181.40, 9, '1991-02-10');
INSERT INTO `employee` VALUES (613, '袁梅', '天府二街', 0, '2008-08-15', 15206.54, 9, '1992-02-01');
INSERT INTO `employee` VALUES (614, '徐午伟', '太阳公馆', 1, '2011-10-21', 18563.07, 5, '1998-08-24');
INSERT INTO `employee` VALUES (615, '花强', '天府三街', 1, '2001-03-09', 7298.75, 2, '1992-11-20');
INSERT INTO `employee` VALUES (616, '袁正浩', '人民北路', 1, '1998-08-18', 12086.83, 4, '1997-04-19');
INSERT INTO `employee` VALUES (617, '肖芷紫', '万家湾', 0, '2009-05-12', 12110.85, 1, '1992-02-27');
INSERT INTO `employee` VALUES (618, '胡芷蓝', '春熙路', 0, '2002-10-03', 6125.34, 12, '1992-04-26');
INSERT INTO `employee` VALUES (619, '花乾', '天府一街', 1, '2005-05-12', 15996.14, 7, '1996-02-27');
INSERT INTO `employee` VALUES (620, '张留华', '浣花溪公寓', 0, '2010-02-11', 6293.35, 10, '1992-06-19');
INSERT INTO `employee` VALUES (621, '刘钟万', '天府一街', 1, '1999-06-04', 5782.88, 5, '1998-01-21');
INSERT INTO `employee` VALUES (622, '肖明刚', '成华区SM广场', 1, '1999-05-14', 8166.71, 2, '1995-07-29');
INSERT INTO `employee` VALUES (623, '李午刚', '青羊宫', 1, '2001-09-04', 15161.23, 11, '1993-07-27');
INSERT INTO `employee` VALUES (624, '花三刚', '三圣乡', 1, '2012-06-06', 17676.76, 3, '1999-09-25');
INSERT INTO `employee` VALUES (625, '肖三达', '太阳公馆', 1, '2013-08-20', 18891.38, 4, '1991-01-26');
INSERT INTO `employee` VALUES (626, '袁瑶', '春熙路', 0, '2001-03-21', 6333.31, 2, '1992-06-24');
INSERT INTO `employee` VALUES (627, '涂刚', '人民北路', 1, '2009-06-15', 17852.04, 3, '1996-08-09');
INSERT INTO `employee` VALUES (628, '廖刚', '春熙路', 1, '2007-08-02', 12267.95, 5, '1995-10-07');
INSERT INTO `employee` VALUES (629, '张三云', '天府三街', 1, '1997-01-11', 18073.93, 9, '1999-08-15');
INSERT INTO `employee` VALUES (630, '涂越', '科华南路', 1, '2010-08-20', 10105.88, 3, '1997-12-26');
INSERT INTO `employee` VALUES (631, '袁芷华', '天府二街', 0, '2014-06-03', 9540.14, 10, '1993-02-13');
INSERT INTO `employee` VALUES (632, '刘正云', '浣花溪公寓', 1, '2007-05-10', 16483.53, 9, '1999-03-11');
INSERT INTO `employee` VALUES (633, '徐乾', '浣花溪公寓', 1, '2000-07-04', 5802.55, 2, '1991-07-12');
INSERT INTO `employee` VALUES (634, '涂中越', '天府三街', 1, '2007-03-16', 9936.98, 14, '1994-09-12');
INSERT INTO `employee` VALUES (635, '肖卫伟', '昭觉寺', 1, '1999-05-08', 9062.66, 7, '1999-01-16');
INSERT INTO `employee` VALUES (636, '徐可紫', '昭觉寺', 0, '1996-06-19', 17361.42, 1, '1996-05-02');
INSERT INTO `employee` VALUES (637, '李可华', '三圣乡', 0, '2013-04-08', 12127.93, 6, '1992-10-10');
INSERT INTO `employee` VALUES (638, '张华', '人民中路', 0, '2014-09-11', 8259.96, 9, '1992-03-13');
INSERT INTO `employee` VALUES (639, '周蓝', '昭觉寺', 0, '1998-05-20', 3676.13, 14, '1995-03-17');
INSERT INTO `employee` VALUES (640, '廖冶万', '青羊宫', 1, '2007-03-12', 4985.03, 13, '1992-06-14');
INSERT INTO `employee` VALUES (641, '徐科靖', '浣花溪公寓', 1, '1997-06-20', 4089.46, 3, '1990-12-18');
INSERT INTO `employee` VALUES (642, '徐卫谦', '浣花溪公寓', 1, '1999-07-02', 19761.15, 2, '1991-01-19');
INSERT INTO `employee` VALUES (643, '涂留君', '红瓦寺', 0, '2008-06-06', 9137.43, 6, '1991-10-14');
INSERT INTO `employee` VALUES (644, '涂福贺', '电子科大成华校区', 1, '2003-07-11', 19953.21, 2, '2000-04-15');
INSERT INTO `employee` VALUES (645, '徐科浩', '天府二街', 1, '2015-04-09', 7183.23, 7, '1998-05-11');
INSERT INTO `employee` VALUES (646, '周梅', '浣花溪公寓', 0, '1996-02-06', 12443.44, 5, '1999-01-20');
INSERT INTO `employee` VALUES (647, '刘福威', '浣花溪公寓', 1, '2015-12-10', 5716.67, 6, '1993-06-14');
INSERT INTO `employee` VALUES (648, '廖留华', '建设路', 0, '2000-10-14', 14407.04, 3, '1999-02-25');
INSERT INTO `employee` VALUES (649, '廖云', '成华区SM广场', 1, '2011-06-10', 11323.82, 9, '1999-08-23');
INSERT INTO `employee` VALUES (650, '胡正靖', '建设路', 1, '2001-06-15', 19973.90, 11, '1999-01-15');
INSERT INTO `employee` VALUES (651, '徐钟军', '天府三街', 1, '2012-04-21', 9223.90, 9, '1994-09-08');
INSERT INTO `employee` VALUES (652, '周伟', '建设路', 1, '2009-08-21', 9373.89, 1, '1991-12-08');
INSERT INTO `employee` VALUES (653, '廖贺', '天府一街', 1, '2000-02-02', 13634.30, 5, '1995-08-20');
INSERT INTO `employee` VALUES (654, '刘华', '电子科大成华校区', 0, '2004-04-12', 12848.01, 14, '1995-05-10');
INSERT INTO `employee` VALUES (655, '胡若', '科华南路', 0, '2005-07-05', 11319.09, 10, '1997-03-06');
INSERT INTO `employee` VALUES (656, '李三强', '三圣乡', 1, '1999-05-08', 19465.08, 11, '1993-01-08');
INSERT INTO `employee` VALUES (657, '徐悦', '春熙路', 0, '2012-01-20', 17704.48, 1, '1992-03-08');
INSERT INTO `employee` VALUES (658, '花紫', '春熙路', 0, '1998-07-13', 8620.17, 9, '1998-04-25');
INSERT INTO `employee` VALUES (659, '胡谦', '万家湾', 1, '2013-07-10', 13307.03, 6, '1995-12-08');
INSERT INTO `employee` VALUES (660, '廖长时', '科华南路', 1, '2011-04-18', 10199.67, 4, '1994-05-23');
INSERT INTO `employee` VALUES (661, '周达', '浣花溪公寓', 1, '2001-06-02', 12787.80, 1, '1996-06-23');
INSERT INTO `employee` VALUES (662, '李浩', '天府二街', 1, '2006-01-18', 7100.60, 8, '1995-12-14');
INSERT INTO `employee` VALUES (663, '刘水', '人民南路', 0, '2005-03-17', 16797.89, 3, '1994-09-07');
INSERT INTO `employee` VALUES (664, '胡三靖', '建设路', 1, '2011-02-13', 14886.73, 1, '1990-07-22');
INSERT INTO `employee` VALUES (665, '刘芷若', '昭觉寺', 0, '2007-04-11', 10108.17, 1, '2000-05-04');
INSERT INTO `employee` VALUES (666, '涂长浩', '天府三街', 1, '1997-04-14', 9330.98, 10, '1995-01-20');
INSERT INTO `employee` VALUES (667, '袁萌梅', '人民北路', 0, '1999-05-07', 5279.64, 4, '1993-06-08');
INSERT INTO `employee` VALUES (668, '李时', '建设路', 1, '2007-08-21', 16443.14, 10, '1991-08-28');
INSERT INTO `employee` VALUES (669, '徐中时', '红瓦寺', 1, '2009-09-10', 3988.72, 9, '1999-04-24');
INSERT INTO `employee` VALUES (670, '徐萌梅', '人民南路', 0, '2012-07-05', 9536.42, 13, '1993-02-24');
INSERT INTO `employee` VALUES (671, '徐越', '人民南路', 1, '2004-03-06', 18292.73, 9, '1996-06-16');
INSERT INTO `employee` VALUES (672, '刘瑶', '昭觉寺', 0, '2012-04-20', 17821.05, 13, '1993-12-01');
INSERT INTO `employee` VALUES (673, '张芷水', '太阳公馆', 0, '2012-08-02', 18176.30, 3, '1991-09-28');
INSERT INTO `employee` VALUES (674, '刘悦', '三圣乡', 0, '1997-01-08', 18904.27, 13, '1996-04-23');
INSERT INTO `employee` VALUES (675, '肖留君', '昭觉寺', 0, '2015-06-05', 7873.53, 4, '1999-03-06');
INSERT INTO `employee` VALUES (676, '李军', '电子科大成华校区', 1, '1999-04-17', 19049.69, 1, '1995-09-08');
INSERT INTO `employee` VALUES (677, '李可悦', '建设路', 0, '2014-06-13', 15417.36, 10, '1991-10-21');
INSERT INTO `employee` VALUES (678, '李乾', '昭觉寺', 1, '2002-01-04', 18065.00, 10, '1990-01-09');
INSERT INTO `employee` VALUES (679, '涂瑶', '人民南路', 0, '2006-10-16', 16554.68, 5, '1993-08-02');
INSERT INTO `employee` VALUES (680, '张午刚', '电子科大成华校区', 1, '2011-01-16', 8431.91, 4, '1995-05-10');
INSERT INTO `employee` VALUES (681, '涂萌梅', '太阳公馆', 0, '2006-02-17', 6472.86, 2, '1996-11-17');
INSERT INTO `employee` VALUES (682, '张钟谦', '红瓦寺', 1, '2000-01-20', 13963.35, 5, '1993-10-01');
INSERT INTO `employee` VALUES (683, '肖长伟', '成渝立交', 1, '2005-01-19', 15351.58, 12, '1998-10-19');
INSERT INTO `employee` VALUES (684, '刘卫靖', '科华南路', 1, '1998-01-10', 11445.34, 12, '1998-01-23');
INSERT INTO `employee` VALUES (685, '李可若', '电子科大成华校区', 0, '2003-11-12', 18721.96, 14, '1999-12-07');
INSERT INTO `employee` VALUES (686, '李千贺', '浣花溪公寓', 1, '1998-03-11', 14617.07, 1, '1992-07-03');
INSERT INTO `employee` VALUES (687, '刘谦', '人民北路', 1, '2013-08-15', 19075.93, 14, '1997-03-25');
INSERT INTO `employee` VALUES (688, '袁科强', '成华区SM广场', 1, '2013-06-19', 4582.73, 2, '1997-01-04');
INSERT INTO `employee` VALUES (689, '涂贺', '建设路', 1, '2011-05-08', 11952.77, 2, '1995-12-16');
INSERT INTO `employee` VALUES (690, '徐钟万', '青羊宫', 1, '2011-08-20', 16171.43, 11, '1997-10-03');
INSERT INTO `employee` VALUES (691, '肖时', '天府二街', 1, '1999-01-19', 17985.26, 7, '2000-06-18');
INSERT INTO `employee` VALUES (692, '涂萌若', '太阳公馆', 0, '2013-03-17', 11345.16, 2, '1995-10-14');
INSERT INTO `employee` VALUES (693, '张军', '三圣乡', 1, '2014-04-16', 9610.25, 3, '1999-12-03');
INSERT INTO `employee` VALUES (694, '袁军', '人民北路', 1, '2003-08-11', 4511.26, 11, '1996-11-10');
INSERT INTO `employee` VALUES (695, '袁梅', '天府二街', 0, '2008-08-06', 11410.43, 12, '1991-11-25');
INSERT INTO `employee` VALUES (696, '胡可华', '成华区SM广场', 0, '2005-03-14', 3273.07, 9, '1997-08-07');
INSERT INTO `employee` VALUES (697, '涂卫万', '万家湾', 1, '2006-07-06', 19828.88, 4, '1991-03-15');
INSERT INTO `employee` VALUES (698, '胡明军', '成华区SM广场', 1, '2003-10-21', 9730.44, 3, '1999-10-14');
INSERT INTO `employee` VALUES (699, '廖敏君', '人民南路', 0, '2005-07-13', 18125.52, 5, '2000-04-21');
INSERT INTO `employee` VALUES (700, '徐水', '电子科大成华校区', 0, '2013-03-14', 8063.15, 11, '1996-01-06');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123123');
INSERT INTO `user` VALUES (2, 'jicheng', '123456');
INSERT INTO `user` VALUES (3, 'yuanjin', '345678');


SET FOREIGN_KEY_CHECKS = 1;

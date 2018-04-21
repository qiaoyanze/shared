/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : cisau

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-04-22 02:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bike
-- ----------------------------
DROP TABLE IF EXISTS `t_bike`;
CREATE TABLE `t_bike` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bike_code` int(11) NOT NULL COMMENT '单车号码',
  `bike_password` varchar(255) NOT NULL COMMENT '单车密码',
  `bike_brand` tinyint(2) DEFAULT NULL COMMENT '单车品牌-1：ofo单车,2：摩拜单车，3：哈罗单车',
  `place` varchar(64) DEFAULT NULL COMMENT '投放位置',
  `geo_code` varchar(12) DEFAULT NULL COMMENT 'geo hash编码',
  `status` tinyint(2) DEFAULT '1' COMMENT '单车状态- 1：正常，2：租车，3：报修，4：回收下线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='单车表';

-- ----------------------------
-- Records of t_bike
-- ----------------------------
INSERT INTO `t_bike` VALUES ('1', '4212702', '8948', '1', '太谷西高铁站', 'ww8j0', '3');
INSERT INTO `t_bike` VALUES ('2', '4117311', '6168', '2', '信息学院影城', 'ww8j1', '1');
INSERT INTO `t_bike` VALUES ('3', '2421749', '3057', '3', '尚客网咖', 'ww8j1', '3');
INSERT INTO `t_bike` VALUES ('4', '5687625', '2154', '1', '义全德旧址', 'ww8hc', '3');
INSERT INTO `t_bike` VALUES ('5', '9250033', '9402', '2', '尚客网咖', 'ww8j1', '3');
INSERT INTO `t_bike` VALUES ('6', '5520265', '6413', '2', '凤凰山森林公园', 'ww8hd', '3');
INSERT INTO `t_bike` VALUES ('7', '5798370', '4085', '1', '山西太谷中医医院', 'ww8hc', '1');
INSERT INTO `t_bike` VALUES ('8', '9034343', '8389', '3', '山西太谷中医医院', 'ww8hc', '3');
INSERT INTO `t_bike` VALUES ('9', '5555806', '1031', '3', '义全德旧址', 'ww8hc', '1');
INSERT INTO `t_bike` VALUES ('10', '1495030', '3010', '2', '凤凰山森林公园', 'ww8hd', '1');
INSERT INTO `t_bike` VALUES ('11', '9630872', '8603', '3', '武家堡村口公交站', 'ww8j0', '1');
INSERT INTO `t_bike` VALUES ('12', '2908220', '3201', '2', '太谷西高铁站', 'ww8j0', '3');
INSERT INTO `t_bike` VALUES ('13', '6850071', '5091', '2', '山西农大信息学院游泳馆', 'ww8j1', '2');
INSERT INTO `t_bike` VALUES ('14', '3375581', '3623', '1', '凤凰山森林公园', 'ww8hd', '1');
INSERT INTO `t_bike` VALUES ('15', '7825970', '3887', '2', '武家堡村口公交站', 'ww8j0', '1');
INSERT INTO `t_bike` VALUES ('16', '6352073', '6789', '3', '太谷西高铁站', 'ww8j0', '4');
INSERT INTO `t_bike` VALUES ('17', '1074025', '9176', '3', '义全德旧址', 'ww8hc', '1');
INSERT INTO `t_bike` VALUES ('18', '9336033', '5790', '3', '武家堡村口公交站', 'ww8j0', '3');
INSERT INTO `t_bike` VALUES ('19', '9548242', '6853', '1', '尚客网咖', 'ww8j1', '1');
INSERT INTO `t_bike` VALUES ('20', '6764716', '3628', '1', '尚客网咖', 'ww8j1', '3');
INSERT INTO `t_bike` VALUES ('21', '9589035', '4545', '1', '信息学院影城', 'ww8j1', '1');
INSERT INTO `t_bike` VALUES ('22', '7561624', '9808', '1', '信息学院影城', 'ww8j1', '1');
INSERT INTO `t_bike` VALUES ('23', '5031062', '3252', '1', '山西农业大学信息学院', 'ww8j1', '3');
INSERT INTO `t_bike` VALUES ('24', '3723450', '8570', '1', '嘉兴隆旧址', 'ww8hc', '1');
INSERT INTO `t_bike` VALUES ('25', '9442017', '7876', '3', '尚客网咖', 'ww8j1', '3');
INSERT INTO `t_bike` VALUES ('26', '7948014', '6735', '2', '太谷鼓楼', 'ww8hc', '1');

-- ----------------------------
-- Table structure for t_place_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_place_dict`;
CREATE TABLE `t_place_dict` (
  `name` varchar(64) NOT NULL COMMENT '位置名称',
  `lon` double(9,6) DEFAULT NULL COMMENT '经度',
  `lat` double(9,6) DEFAULT NULL COMMENT '纬度',
  `geo_code` varchar(12) DEFAULT NULL COMMENT 'geo hash编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置字典表';

-- ----------------------------
-- Records of t_place_dict
-- ----------------------------
INSERT INTO `t_place_dict` VALUES ('太谷西高铁站', '112.516298', '37.452410', 'ww8j0');
INSERT INTO `t_place_dict` VALUES ('嘉兴隆旧址', '112.571460', '37.433193', 'ww8hc');
INSERT INTO `t_place_dict` VALUES ('尚客网咖', '112.579669', '37.457911', 'ww8j1');
INSERT INTO `t_place_dict` VALUES ('信息学院影城', '112.582656', '37.457044', 'ww8j1');
INSERT INTO `t_place_dict` VALUES ('山西农大信息学院游泳馆', '112.586083', '37.454552', 'ww8j1');
INSERT INTO `t_place_dict` VALUES ('山西农业大学信息学院', '112.584376', '37.455626', 'ww8j1');
INSERT INTO `t_place_dict` VALUES ('武家堡村口公交站', '112.520529', '37.448112', 'ww8j0');
INSERT INTO `t_place_dict` VALUES ('山西太谷中医医院', '112.571954', '37.433361', 'ww8hc');
INSERT INTO `t_place_dict` VALUES ('义全德旧址', '112.570023', '37.432822', 'ww8hc');
INSERT INTO `t_place_dict` VALUES ('凤凰山森林公园', '112.597917', '37.368917', 'ww8hd');
INSERT INTO `t_place_dict` VALUES ('太谷鼓楼', '112.565674', '37.432983', 'ww8hc');

-- ----------------------------
-- Table structure for t_rent_bike
-- ----------------------------
DROP TABLE IF EXISTS `t_rent_bike`;
CREATE TABLE `t_rent_bike` (
  `account` varchar(64) NOT NULL COMMENT '用户账号',
  `bike_code` int(11) NOT NULL COMMENT '单车号码',
  `rent_time` datetime DEFAULT NULL COMMENT '租车时间',
  `return_time` datetime DEFAULT NULL COMMENT '还车时间',
  `return_place` varchar(64) DEFAULT NULL COMMENT '还车位置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租车表';

-- ----------------------------
-- Records of t_rent_bike
-- ----------------------------
INSERT INTO `t_rent_bike` VALUES ('13429250002', '5520265', '2018-04-21 23:59:49', null, null);
INSERT INTO `t_rent_bike` VALUES ('13429250007', '4117311', '2018-04-22 00:06:53', '2018-04-22 00:16:32', '义全德旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250003', '6850071', '2018-04-22 00:32:03', null, null);
INSERT INTO `t_rent_bike` VALUES ('13429250011', '5520265', '2018-04-22 00:59:19', '2018-04-22 01:15:35', '凤凰山森林公园');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '4117311', '2018-04-22 01:17:45', '2018-04-22 01:17:57', '信息学院影城');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '5798370', '2018-04-22 01:18:17', '2018-04-22 01:18:21', '山西太谷中医医院');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '1074025', '2018-04-22 01:27:49', '2018-04-22 01:28:03', '义全德旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '3723450', '2018-04-22 01:28:11', '2018-04-22 01:33:24', '嘉兴隆旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '3723450', '2018-04-22 01:28:21', '2018-04-22 01:33:24', '嘉兴隆旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '3723450', '2018-04-22 01:32:51', '2018-04-22 01:33:24', '嘉兴隆旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '3723450', '2018-04-22 01:32:56', '2018-04-22 01:33:24', '嘉兴隆旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '3723450', '2018-04-22 01:33:21', '2018-04-22 01:33:24', '嘉兴隆旧址');
INSERT INTO `t_rent_bike` VALUES ('13429250011', '7561624', '2018-04-22 01:33:27', '2018-04-22 01:34:02', '信息学院影城');

-- ----------------------------
-- Table structure for t_repair_bike
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_bike`;
CREATE TABLE `t_repair_bike` (
  `account` varchar(64) NOT NULL COMMENT '用户账号',
  `bike_code` int(11) NOT NULL COMMENT '单车号码',
  `repair_place` varchar(64) DEFAULT NULL COMMENT '报修位置',
  `repair_time` datetime DEFAULT NULL COMMENT '报修时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报修表';

-- ----------------------------
-- Records of t_repair_bike
-- ----------------------------
INSERT INTO `t_repair_bike` VALUES ('13429250007', '5687625', '义全德旧址', '2018-04-22 00:16:49');
INSERT INTO `t_repair_bike` VALUES ('13429250011', '5031062', '山西农业大学信息学院', '2018-04-22 00:19:01');
INSERT INTO `t_repair_bike` VALUES ('13429250011', '5520265', '凤凰山森林公园', '2018-04-22 01:34:16');

-- ----------------------------
-- Table structure for t_repair_info
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_info`;
CREATE TABLE `t_repair_info` (
  `account` varchar(64) NOT NULL COMMENT '维修人员账号',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `id_no` varchar(64) DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `gender` tinyint(2) DEFAULT NULL COMMENT '性别-1：男，2：女',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `is_pass` tinyint(2) DEFAULT NULL COMMENT '是否通过-1:待审核，2: 审核通过，3：拒绝'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修人员申请进度表';

-- ----------------------------
-- Records of t_repair_info
-- ----------------------------
INSERT INTO `t_repair_info` VALUES ('13429250022', '邓英平', '361125195409090039', '13429251122', '1', '1959-09-09', '3');
INSERT INTO `t_repair_info` VALUES ('13429250023', '章邦芬', '130102196303250459', '13429250024', '1', '1963-03-25', '2');
INSERT INTO `t_repair_info` VALUES ('13429250024', '丁楷剑', '511502199103223189', '13429250024', '2', '1991-03-22', '1');
INSERT INTO `t_repair_info` VALUES ('13429250025', '胡光燕', '431202198811101720', '13429250025', '2', '1988-11-10', '1');
INSERT INTO `t_repair_info` VALUES ('13429250026', '王彩同', '130821199103278829', '13429250026', '2', '1991-03-27', '1');
INSERT INTO `t_repair_info` VALUES ('13429250027', '刘百祥', '520323197806058856', '13429250027', '1', '1978-06-05', '2');
INSERT INTO `t_repair_info` VALUES ('13429250028', '朱振源', '350105199506138487', '13429250028', '2', '1995-06-13', '1');
INSERT INTO `t_repair_info` VALUES ('13429250029', '魏晓中', '610729197408202551', '13429250029', '1', '1974-08-20', '3');
INSERT INTO `t_repair_info` VALUES ('13429250030', '朱立成', '820000195008115837', '13429250030', '1', '1950-08-11', '2');
INSERT INTO `t_repair_info` VALUES ('13429250031', '唐俊公', '450101197405207446', '13429250031', '2', '1974-05-20', '1');
INSERT INTO `t_repair_info` VALUES ('13429250032', '刘广富', '411626198204167401', '13429250032', '2', '1982-04-16', '1');
INSERT INTO `t_repair_info` VALUES ('13429250033', '马漫媛', '654022197901228286', '13429250033', '2', '1979-01-22', '1');
INSERT INTO `t_repair_info` VALUES ('13429250034', '李文坚', '152224198908049211', '13429250034', '1', '1989-08-04', '1');
INSERT INTO `t_repair_info` VALUES ('13429250035', '王志荣', '230822197201256034', '13429250035', '1', '1972-01-25', '1');
INSERT INTO `t_repair_info` VALUES ('13429250036', '黄艳亮', '510682195211049323', '13429250036', '2', '1952-11-04', '1');
INSERT INTO `t_repair_info` VALUES ('13429250037', '徐敏正', '360424196802200795', '13429250037', '1', '1968-02-20', '1');
INSERT INTO `t_repair_info` VALUES ('13429250038', '张度莲', '152525196709024760', '13429250038', '2', '1967-09-02', '1');
INSERT INTO `t_repair_info` VALUES ('13429250039', '张钗中', '235402199407121617', '13429250039', '1', '1994-07-12', '1');
INSERT INTO `t_repair_info` VALUES ('13429250040', '邹宝添', '659006196909142989', '13429250040', '2', '1969-09-14', '1');
INSERT INTO `t_repair_info` VALUES ('13429250041', '姜芳波', '120111198912116881', '13429250041', '2', '1989-12-11', '1');
INSERT INTO `t_repair_info` VALUES ('13429250042', '陈琳炎', '440282195610226964', '13429250042', '2', '1956-10-22', '1');
INSERT INTO `t_repair_info` VALUES ('13429250043', '赵新潮', '632223195605199057', '13429250043', '1', '1956-05-19', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `role` tinyint(2) NOT NULL COMMENT '角色-1:管理员，2：维修人员，3：用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123', '1');
INSERT INTO `t_user` VALUES ('2', '13429250022', '123', '2');
INSERT INTO `t_user` VALUES ('3', '13429250023', '123', '2');
INSERT INTO `t_user` VALUES ('4', '13429250024', '123', '2');
INSERT INTO `t_user` VALUES ('5', '13429250025', '123', '2');
INSERT INTO `t_user` VALUES ('6', '13429250026', '123', '2');
INSERT INTO `t_user` VALUES ('7', '13429250027', '123', '2');
INSERT INTO `t_user` VALUES ('8', '13429250028', '123', '2');
INSERT INTO `t_user` VALUES ('9', '13429250029', '123', '2');
INSERT INTO `t_user` VALUES ('10', '13429250030', '123', '2');
INSERT INTO `t_user` VALUES ('11', '13429250031', '123', '2');
INSERT INTO `t_user` VALUES ('12', '13429250032', '123', '2');
INSERT INTO `t_user` VALUES ('13', '13429250033', '123', '2');
INSERT INTO `t_user` VALUES ('14', '13429250034', '123', '2');
INSERT INTO `t_user` VALUES ('15', '13429250035', '123', '2');
INSERT INTO `t_user` VALUES ('16', '13429250036', '123', '2');
INSERT INTO `t_user` VALUES ('17', '13429250037', '123', '2');
INSERT INTO `t_user` VALUES ('18', '13429250038', '123', '2');
INSERT INTO `t_user` VALUES ('19', '13429250039', '123', '2');
INSERT INTO `t_user` VALUES ('20', '13429250040', '123', '2');
INSERT INTO `t_user` VALUES ('21', '13429250041', '123', '2');
INSERT INTO `t_user` VALUES ('22', '13429250042', '123', '2');
INSERT INTO `t_user` VALUES ('23', '13429250043', '123', '2');
INSERT INTO `t_user` VALUES ('24', '13429250000', '123', '3');
INSERT INTO `t_user` VALUES ('25', '13429250001', '123', '3');
INSERT INTO `t_user` VALUES ('26', '13429250002', '123', '3');
INSERT INTO `t_user` VALUES ('27', '13429250003', '123', '3');
INSERT INTO `t_user` VALUES ('28', '13429250004', '123', '3');
INSERT INTO `t_user` VALUES ('29', '13429250005', '123', '3');
INSERT INTO `t_user` VALUES ('30', '13429250006', '123', '3');
INSERT INTO `t_user` VALUES ('31', '13429250007', '123', '3');
INSERT INTO `t_user` VALUES ('32', '13429250008', '123', '3');
INSERT INTO `t_user` VALUES ('33', '13429250009', '123', '3');
INSERT INTO `t_user` VALUES ('34', '13429250010', '123', '3');
INSERT INTO `t_user` VALUES ('35', '13429250011', '123', '3');
INSERT INTO `t_user` VALUES ('36', '13429250012', '123', '3');
INSERT INTO `t_user` VALUES ('37', '13429250013', '123', '3');
INSERT INTO `t_user` VALUES ('38', '13429250014', '123', '3');
INSERT INTO `t_user` VALUES ('39', '13429250015', '123', '3');
INSERT INTO `t_user` VALUES ('40', '13429250016', '123', '3');
INSERT INTO `t_user` VALUES ('41', '13429250017', '123', '3');
INSERT INTO `t_user` VALUES ('42', '13429250018', '123', '3');
INSERT INTO `t_user` VALUES ('43', '13429250019', '123', '3');
INSERT INTO `t_user` VALUES ('44', '13429250020', '123', '3');
INSERT INTO `t_user` VALUES ('45', '13429250021', '123', '3');

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `account` varchar(64) NOT NULL COMMENT '用户账号',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(2) DEFAULT NULL COMMENT '性别-1：男，2：女',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `status` tinyint(2) DEFAULT '1' COMMENT '是否激活-1：激活，2：冻结'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('13429250000', '项冷萱', '2', '1981-11-13', '100.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250001', '表子芸', '1', '1963-03-25', '10.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250002', '空子瑜', '2', '1991-03-22', '25.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250003', '敖白山', '2', '1988-11-10', '15.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250004', '承灵雨', '2', '1991-03-27', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250005', '随书雁', '1', '1978-06-05', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250006', '武悠柔', '2', '1995-06-13', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250007', '劳曼卉', '1', '1974-08-20', '13.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250008', '友康盛', '1', '1950-08-11', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250009', '兆瑞灵', '2', '1974-05-20', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250010', '曾水冬', '2', '1982-04-16', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250011', '弓香巧', '2', '1979-01-22', '42.00', '1');
INSERT INTO `t_user_info` VALUES ('13429250012', '钟离听', '1', '1989-08-04', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250013', '春越烨', '1', '1972-01-25', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250014', '磊溥子', '2', '1952-11-04', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250015', '爱隋逸', '1', '1968-02-20', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250016', '秀母乐', '2', '1967-09-02', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250017', '心中高', '1', '1994-07-12', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250018', '原牧翔', '2', '1969-09-14', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250019', '宇仝寻', '2', '1989-12-11', null, '1');
INSERT INTO `t_user_info` VALUES ('13429250020', '芳彭向', '2', '1956-10-22', null, '2');
INSERT INTO `t_user_info` VALUES ('13429250021', '笛韶秀', '1', '1956-05-19', null, '1');

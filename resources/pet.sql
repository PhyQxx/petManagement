/*
Navicat MySQL Data Transfer

Source Server         : 77
Source Server Version : 50725
Source Host           : rm-wz9ohbd888uxpp4n20o.mysql.rds.aliyuncs.com:3306
Source Database       : pet

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-10-06 17:03:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_activity
-- ----------------------------
DROP TABLE IF EXISTS `m_activity`;
CREATE TABLE `m_activity` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '活动编号',
  `name` varchar(40) DEFAULT NULL COMMENT '活动名称',
  `content` varchar(100) DEFAULT NULL COMMENT '活动内容',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动日程';

-- ----------------------------
-- Records of m_activity
-- ----------------------------
INSERT INTO `m_activity` VALUES ('7', '4', '545', '454', '2019-10-16 18:09:43', '0', '54');
INSERT INTO `m_activity` VALUES ('de4bbefee67311e9949300163e0eb114', '11', '清洁', '清洁', '2019-10-04 14:54:53', '0', '1111');

-- ----------------------------
-- Table structure for m_curing
-- ----------------------------
DROP TABLE IF EXISTS `m_curing`;
CREATE TABLE `m_curing` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '宠物编号',
  `name` varchar(40) DEFAULT NULL COMMENT '宠物姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '宠物体重',
  `types` varchar(2) DEFAULT NULL COMMENT '养护类型',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待产养护';

-- ----------------------------
-- Records of m_curing
-- ----------------------------
INSERT INTO `m_curing` VALUES ('022c3ceae58a11e9949300163e0eb114', '111', '嗯嗯', '1', '5.00', '1', '2019-10-03 11:00:51', '0', '2');
INSERT INTO `m_curing` VALUES ('4', '5', '5', '111', null, '0', null, '1', null);
INSERT INTO `m_curing` VALUES ('c37cccd7e67511e9949300163e0eb114', '222', '222', '110', '100.00', '0', '2019-10-04 15:08:27', '0', '');

-- ----------------------------
-- Table structure for m_customer
-- ----------------------------
DROP TABLE IF EXISTS `m_customer`;
CREATE TABLE `m_customer` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '客户编号',
  `name` varchar(40) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `petno` varchar(10) DEFAULT NULL COMMENT '宠物编号 ',
  `member` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否是会员(0不是 1是)',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of m_customer
-- ----------------------------
INSERT INTO `m_customer` VALUES ('e1e797e3e64e11e9949300163e0eb114', '12515', '121', '21', '21', '1', '0', '1121');

-- ----------------------------
-- Table structure for m_foster
-- ----------------------------
DROP TABLE IF EXISTS `m_foster`;
CREATE TABLE `m_foster` (
  `id` varchar(32) NOT NULL,
  `person` varchar(40) DEFAULT NULL COMMENT '寄养人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `no` varchar(10) DEFAULT NULL COMMENT '宠物编号',
  `name` varchar(40) DEFAULT NULL COMMENT '宠物姓名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '寄养费用',
  `create_by` varchar(30) DEFAULT NULL COMMENT '操作人',
  `time` datetime DEFAULT NULL COMMENT '寄养日期',
  `remark` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='寄养信息';

-- ----------------------------
-- Records of m_foster
-- ----------------------------
INSERT INTO `m_foster` VALUES ('1', '小李', '135', '01', '尿尿', '500.00', 'jsy', '2019-10-02 12:56:36', null, '0');

-- ----------------------------
-- Table structure for m_general
-- ----------------------------
DROP TABLE IF EXISTS `m_general`;
CREATE TABLE `m_general` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '账单编号',
  `types` varchar(2) DEFAULT NULL COMMENT '账单类型',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='总账管理';

-- ----------------------------
-- Records of m_general
-- ----------------------------
INSERT INTO `m_general` VALUES ('d6891b25e67511e9949300163e0eb114', '11', '0', '2019-10-04 15:08:59', '0', '11');

-- ----------------------------
-- Table structure for m_medicine
-- ----------------------------
DROP TABLE IF EXISTS `m_medicine`;
CREATE TABLE `m_medicine` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '宠物编号',
  `name` varchar(40) DEFAULT NULL COMMENT '宠物姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `bedno` varchar(10) DEFAULT NULL COMMENT '床位号',
  `disease` varchar(40) DEFAULT NULL COMMENT '疾病名称',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医疗信息';

-- ----------------------------
-- Records of m_medicine
-- ----------------------------
INSERT INTO `m_medicine` VALUES ('bb92a97ae67511e9949300163e0eb114', '001', '小红', '15000000000', '222', '感冒', '2019-10-04 15:08:14', '0', '');

-- ----------------------------
-- Table structure for m_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE `m_menu` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `menu_id` varchar(40) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(40) NOT NULL COMMENT '菜单名称',
  `menu_server` varchar(40) DEFAULT NULL,
  `menu_url` varchar(80) NOT NULL COMMENT '菜单URL',
  `menu_level` varchar(40) NOT NULL COMMENT '菜单层级',
  `menu_pid` varchar(40) NOT NULL COMMENT '父节点ID',
  `menu_sort` varchar(40) NOT NULL COMMENT '菜单顺序号',
  `menu_icon` varchar(400) NOT NULL COMMENT '菜单图标',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人  ',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of m_menu
-- ----------------------------
INSERT INTO `m_menu` VALUES ('04a5ea5ee3f011e9949300163e0eb114', '9040140', '宠物查询', 'http://localhost:8080/', 'petController/subMain', '1', '9040000', '0404', 'fa-users', null, 'jsy', '2019-10-01 10:06:02', 'jsy', '2019-10-01 10:06:02', '0');
INSERT INTO `m_menu` VALUES ('14c6ed27e3ef11e9949300163e0eb114', '9030120', '销售出库', 'http://localhost:8080/', 'salesoutController/subMain', '1', '9030000', '0302', 'fa-users', null, 'jsy', '2019-10-01 09:59:19', 'jsy', '2019-10-01 09:59:19', '0');
INSERT INTO `m_menu` VALUES ('18669fb40e5011e9afc27cd30ad32e2e', '9010000', '员工管理', '', '9010000', '0', '0000000', '0100', 'fa-bar-chart', null, '1001', '2019-01-02 13:34:38', '1001', '2019-04-23 15:49:17', '0');
INSERT INTO `m_menu` VALUES ('1866a2b20e5011e9afc27cd30ad32e2e', '9010110', '员工信息管理', 'http://localhost:8080/', 'userController/subMain', '1', '9010000', '0101', '', null, '1001', '2019-01-02 13:34:38', 'swlshi456', '2019-05-26 15:28:15', '0');
INSERT INTO `m_menu` VALUES ('1866a3a90e5011e9afc27cd30ad32e2e', '9010120', '员工权限管理', 'http://localhost:8080/', 'roleController/subMain', '1', '9010000', '0106', '', null, '1001', '2019-01-02 13:34:38', 'rendonghai', '2019-09-18 22:34:42', '0');
INSERT INTO `m_menu` VALUES ('1866a3fb0e5011e9afc27cd30ad32e2e', '9010130', '菜单管理', 'http://localhost:8080/', 'menuController/subMain', '1', '9010000', '0107', '', null, '1001', '2019-01-02 13:34:38', 'swlshi456', '2019-05-25 16:53:53', '0');
INSERT INTO `m_menu` VALUES ('1866a44b0e5011e9afc27cd30ad32e2e', '9020000', '宠物管理', '', '9020000', '0', '0000000', '0200', 'fa-users', null, '1001', '2019-01-02 13:34:38', '1001', '2019-01-02 13:34:38', '0');
INSERT INTO `m_menu` VALUES ('1866a4980e5011e9afc27cd30ad32e2e', '9020110', '活体销售记录', 'http://localhost:8080/', 'salesController/subMain', '1', '9020000', '0201', 'fa-users', null, '1001', '2019-01-02 13:34:38', 'jsy', '2019-10-01 13:57:57', '0');
INSERT INTO `m_menu` VALUES ('1866a4980e50sss7cd30ad32e2eweqrq', '9020120', '宠物寄养', 'http://localhost:8080/', 'fosterController/subMain', '1', '9020000', '0202', 'fa-users', null, '1001', '2019-01-02 13:34:38', 'jsy', '2019-10-02 12:55:20', '0');
INSERT INTO `m_menu` VALUES ('1866a4980sssss7cd30ad32e2eweqrq', '9020130', '宠物美容', 'http://localhost:8080/', 'petcareController/subMain', '1', '9020000', '0203', 'fa-users', null, '1001', '2019-01-02 13:34:38', 'jsy', '2019-10-02 15:39:10', '0');
INSERT INTO `m_menu` VALUES ('1866a4980sssss7cda30ad32e2eweqrq', '9020140', '基层时间年份统计表', 'http://localhost:8080/', 'jobMinCountController/subMain', '1', '9020000', '0204', 'fa-users', null, '1001', '2019-01-02 13:34:38', 'jsy', '2019-10-01 09:13:57', '1');
INSERT INTO `m_menu` VALUES ('28675eede3ef11e9949300163e0eb114', '9030130', '库存结余', 'http://localhost:8080/', 'stockController/subMain', '1', '9030000', '0303', 'fa-users', null, 'jsy', '2019-10-01 09:59:52', 'jsy', '2019-10-01 09:59:52', '0');
INSERT INTO `m_menu` VALUES ('33c0beafe3f211e9949300163e0eb114', '9060000', '财务管理', ' ', '9060000', '0', '0000000', '0600', 'fa-users', null, 'jsy', '2019-10-01 10:21:40', 'jsy', '2019-10-01 10:21:40', '0');
INSERT INTO `m_menu` VALUES ('4691697ee3f111e9949300163e0eb114', '9050000', '员工管理', ' ', '9050000', '0', '000000', '0500', 'fa-users', null, 'jsy', '2019-10-01 10:15:02', 'jsy', '2019-10-01 10:15:02', '1');
INSERT INTO `m_menu` VALUES ('587ce39de3ec11e9949300163e0eb114', '9030000', '库存管理', ' ', '9030000', '0', '000000', '0300', 'fa-users', null, 'jsy', '2019-10-01 09:39:44', 'jsy', '2019-10-01 09:40:10', '0');
INSERT INTO `m_menu` VALUES ('5a19e9aee3f211e9949300163e0eb114', '9060110', '总账管理', 'http://localhost:8080/', 'generalController/subMain', '1', '9060000', '0601', 'fa-users', null, 'jsy', '2019-10-01 10:22:44', 'jsy', '2019-10-01 10:22:44', '0');
INSERT INTO `m_menu` VALUES ('648bfce7e3ef11e9949300163e0eb114', '9040000', '客户管理', '', '9040000', '0', '000000', '0400', 'fa-users', null, 'jsy', '2019-10-01 10:01:33', 'jsy', '2019-10-01 10:01:33', '0');
INSERT INTO `m_menu` VALUES ('6b95b047e3f211e9949300163e0eb114', '9060120', '应付管理', 'http://localhost:8080/', 'payableController/subMain', '1', '9060000', '0602', 'fa-users', null, 'jsy', '2019-10-01 10:23:13', 'jsy', '2019-10-01 10:23:13', '0');
INSERT INTO `m_menu` VALUES ('7d0ad758e3f211e9949300163e0eb114', '9060130', '应收管理', 'http://localhost:8080/', 'receivableController/subMain', '1', '9060000', '0603', 'fa-users', null, 'jsy', '2019-10-01 10:23:43', 'jsy', '2019-10-01 10:23:43', '0');
INSERT INTO `m_menu` VALUES ('99fe308be3f111e9949300163e0eb114', '9050110', '员工信息管理', 'http://localhost:8080/', '8', '1', '9050000', '0501', 'fa-users', null, 'jsy', '2019-10-01 10:17:22', 'jsy', '2019-10-01 10:17:22', '1');
INSERT INTO `m_menu` VALUES ('ab90b736e4db11e9949300163e0eb114', '9020140', '宠物医疗', 'http://localhost:8080/', 'medicineController/subMain', '1', '9020000', '0204', 'fa-users', null, 'jsy', '2019-10-02 14:12:53', 'jsy', '2019-10-02 17:28:45', '0');
INSERT INTO `m_menu` VALUES ('b9671544e3f111e9949300163e0eb114', '9050120', '员工工作管理', 'http://localhost:8080/', 'workController/subMain', '1', '9010000', '0104', 'fa-users', null, 'jsy', '2019-10-01 10:18:14', 'jsy', '2019-10-01 10:18:14', '0');
INSERT INTO `m_menu` VALUES ('bcc6e3cce3ec11e9949300163e0eb114', '9030110', '采购入库', 'http://localhost:8080/', 'purchaseController/subMain', '1', '9030000', '0301', 'fa-users', null, 'jsy', '2019-10-01 09:42:33', 'jsy', '2019-10-01 09:42:33', '0');
INSERT INTO `m_menu` VALUES ('bff59372e3ef11e9949300163e0eb114', '9040110', '客户信息', 'http://localhost:8080/', 'customerController/subMain', '1', '9040000', '0401', 'fa-users', null, 'jsy', '2019-10-01 10:04:06', 'jsy', '2019-10-01 10:04:06', '0');
INSERT INTO `m_menu` VALUES ('c14df51ee4db11e9949300163e0eb114', '9020150', '待产养护', 'http://localhost:8080/', 'curingController/subMain', '1', '9020000', '0205', 'fa-users', null, 'jsy', '2019-10-02 14:13:30', 'jsy', '2019-10-03 10:40:12', '0');
INSERT INTO `m_menu` VALUES ('db87f65ee3ef11e9949300163e0eb114', '9040120', '活动日程', 'http://localhost:8080/', 'activityController/subMain', '1', '9040000', '0402', 'fa-users', null, 'jsy', '2019-10-01 10:04:53', 'jsy', '2019-10-01 10:04:53', '0');
INSERT INTO `m_menu` VALUES ('e5fc6d92e3f111e9949300163e0eb114', '9050130', '员工薪资管理', 'http://localhost:8080/', 'moneyController/subMain', '1', '9010000', '0105', 'fa-users', null, 'jsy', '2019-10-01 10:19:29', 'jsy', '2019-10-01 10:19:29', '0');
INSERT INTO `m_menu` VALUES ('f025978fe3ef11e9949300163e0eb114', '9040120', '客户预约提醒', 'http://localhost:8080/', 'subscribeController/subMain', '1', '9040000', '0403', 'fa-users', null, 'jsy', '2019-10-01 10:05:27', 'jsy', '2019-10-01 10:05:27', '0');

-- ----------------------------
-- Table structure for m_menu_power
-- ----------------------------
DROP TABLE IF EXISTS `m_menu_power`;
CREATE TABLE `m_menu_power` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `power_id` varchar(32) NOT NULL DEFAULT '' COMMENT '权限ID',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单ID',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人  ',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_menu_power
-- ----------------------------
INSERT INTO `m_menu_power` VALUES ('137e6cdb6a5511e9bc35b82a72dfc0af', 'J000', '9010000', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e704c6a5511e9bc35b82a72dfc0af', 'J000', '9010110', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e71996a5511e9bc35b82a72dfc0af', 'J000', '9010120', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e72936a5511e9bc35b82a72dfc0af', 'J000', '9010130', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e737f6a5511e9bc35b82a72dfc0af', 'J000', '9020000', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e74846a5511e9bc35b82a72dfc0af', 'J000', '9020110', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e75b76a5511e9bc35b82a72dfc0af', 'J000', '9020120', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e76b26a5511e9bc35b82a72dfc0af', 'J000', '9020130', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('137e77996a5511e9bc35b82a72dfc0af', 'J000', '9020140', null, '1', '2019-04-29 16:02:04', '1', '2019-04-29 16:09:39', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ec45d6fcb11e9bc35b82a72dfc0af', 'J102', '9010000', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ec7586fcb11e9bc35b82a72dfc0af', 'J102', '9010110', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ec8a06fcb11e9bc35b82a72dfc0af', 'J102', '9010120', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ec9a06fcb11e9bc35b82a72dfc0af', 'J102', '9010130', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7eca966fcb11e9bc35b82a72dfc0af', 'J102', '9020000', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ecbaf6fcb11e9bc35b82a72dfc0af', 'J102', '9020110', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ecc966fcb11e9bc35b82a72dfc0af', 'J102', '9020120', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ecd816fcb11e9bc35b82a72dfc0af', 'J102', '9020130', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ece676fcb11e9bc35b82a72dfc0af', 'J102', '9020140', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ecfb46fcb11e9bc35b82a72dfc0af', 'J102', '9030000', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('1c7ed0af6fcb11e9bc35b82a72dfc0af', 'J102', '9030110', null, 'rendonghai', '2019-05-06 14:49:39', 'rendonghai', '2019-05-07 10:57:05', '1');
INSERT INTO `m_menu_power` VALUES ('22cce04e6a5611e9bc35b82a72dfc0af', 'J000', '9010000', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce3816a5611e9bc35b82a72dfc0af', 'J000', '9010110', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce4af6a5611e9bc35b82a72dfc0af', 'J000', '9010120', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce59b6a5611e9bc35b82a72dfc0af', 'J000', '9010130', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce6916a5611e9bc35b82a72dfc0af', 'J000', '9020000', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce7776a5611e9bc35b82a72dfc0af', 'J000', '9020110', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce85e6a5611e9bc35b82a72dfc0af', 'J000', '9020120', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cce9a56a5611e9bc35b82a72dfc0af', 'J000', '9020130', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cceaaa6a5611e9bc35b82a72dfc0af', 'J000', '9020140', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22cceb916a5611e9bc35b82a72dfc0af', 'J000', '9030000', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('22ccec726a5611e9bc35b82a72dfc0af', 'J000', '9030110', null, '1', '2019-04-29 16:09:39', '1', '2019-04-29 16:11:24', '1');
INSERT INTO `m_menu_power` VALUES ('61604b256a5611e9bc35b82a72dfc0af', 'J000', '9010000', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('61604e076a5611e9bc35b82a72dfc0af', 'J000', '9010110', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('61604f3a6a5611e9bc35b82a72dfc0af', 'J000', '9010130', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('6160502b6a5611e9bc35b82a72dfc0af', 'J000', '9010120', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616051166a5611e9bc35b82a72dfc0af', 'J000', '9020000', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616051fc6a5611e9bc35b82a72dfc0af', 'J000', '9020110', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616052e36a5611e9bc35b82a72dfc0af', 'J000', '9020120', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616053c46a5611e9bc35b82a72dfc0af', 'J000', '9020130', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616054f26a5611e9bc35b82a72dfc0af', 'J000', '9020140', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616055f76a5611e9bc35b82a72dfc0af', 'J000', '9030000', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('616056e36a5611e9bc35b82a72dfc0af', 'J000', '9030110', null, '1', '2019-04-29 16:11:24', '1', '2019-05-08 15:50:44', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb1e437d5b11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb20c37d5b11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb21237d5b11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb21677d5b11e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb21fd7d5b11e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb22567d5b11e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb22977d5b11e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb22d37d5b11e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('6cbb23137d5b11e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-23 21:05:23', 'gf', '2019-09-18 22:15:29', '1');
INSERT INTO `m_menu_power` VALUES ('7d4082fae41011e9949300163e0eb114', 'J000', '9010000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441af3e41011e9949300163e0eb114', 'J000', '9010110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441c42e41011e9949300163e0eb114', 'J000', '9010120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441cbee41011e9949300163e0eb114', 'J000', '9010130', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441d06e41011e9949300163e0eb114', 'J000', '9020000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441f17e41011e9949300163e0eb114', 'J000', '9020110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441f5ae41011e9949300163e0eb114', 'J000', '9020120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441f91e41011e9949300163e0eb114', 'J000', '9020130', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d441fc8e41011e9949300163e0eb114', 'J000', '9030000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442005e41011e9949300163e0eb114', 'J000', '9030110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d44203fe41011e9949300163e0eb114', 'J000', '9030120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d44207ae41011e9949300163e0eb114', 'J000', '9030130', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4420c3e41011e9949300163e0eb114', 'J000', '9040000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4420ffe41011e9949300163e0eb114', 'J000', '9040110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442135e41011e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d44216fe41011e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4421b2e41011e9949300163e0eb114', 'J000', '9040140', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4421e9e41011e9949300163e0eb114', 'J000', '9050000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442220e41011e9949300163e0eb114', 'J000', '9050110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442259e41011e9949300163e0eb114', 'J000', '9050120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442295e41011e9949300163e0eb114', 'J000', '9050130', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4422cfe41011e9949300163e0eb114', 'J000', '9060000', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d44238ce41011e9949300163e0eb114', 'J000', '9060110', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d4423c6e41011e9949300163e0eb114', 'J000', '9060120', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('7d442404e41011e9949300163e0eb114', 'J000', '9060130', null, 'jsy', '2019-10-01 13:58:28', 'jsy', '2019-10-02 15:38:16', '1');
INSERT INTO `m_menu_power` VALUES ('98c21310e4e711e9949300163e0eb114', 'J000', '9010000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a178e4e711e9949300163e0eb114', 'J000', '9010110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a314e4e711e9949300163e0eb114', 'J000', '9010120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a373e4e711e9949300163e0eb114', 'J000', '9010130', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a3bce4e711e9949300163e0eb114', 'J000', '9020000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a3fce4e711e9949300163e0eb114', 'J000', '9020110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a435e4e711e9949300163e0eb114', 'J000', '9020120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a46fe4e711e9949300163e0eb114', 'J000', '9020130', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a4c5e4e711e9949300163e0eb114', 'J000', '9020140', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a50ce4e711e9949300163e0eb114', 'J000', '9020150', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a55ee4e711e9949300163e0eb114', 'J000', '9030000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a5a8e4e711e9949300163e0eb114', 'J000', '9030110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a603e4e711e9949300163e0eb114', 'J000', '9030120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a643e4e711e9949300163e0eb114', 'J000', '9030130', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a67ce4e711e9949300163e0eb114', 'J000', '9040000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a6b2e4e711e9949300163e0eb114', 'J000', '9040110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a6f8e4e711e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a735e4e711e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a769e4e711e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a797e4e711e9949300163e0eb114', 'J000', '9040120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a7d0e4e711e9949300163e0eb114', 'J000', '9040140', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a807e4e711e9949300163e0eb114', 'J000', '9050000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a839e4e711e9949300163e0eb114', 'J000', '9050110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a869e4e711e9949300163e0eb114', 'J000', '9050120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a89ee4e711e9949300163e0eb114', 'J000', '9050130', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a8cee4e711e9949300163e0eb114', 'J000', '9060000', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a901e4e711e9949300163e0eb114', 'J000', '9060110', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a936e4e711e9949300163e0eb114', 'J000', '9060120', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('98c2a96be4e711e9949300163e0eb114', 'J000', '9060130', null, 'jsy', '2019-10-02 15:38:16', 'jsy', '2019-10-02 15:38:16', '0');
INSERT INTO `m_menu_power` VALUES ('abe35d6ddeca11e9956400163e0a0562', 'J001', '9010000', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe36206deca11e9956400163e0a0562', 'J001', '9010110', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe3660adeca11e9956400163e0a0562', 'J001', '9010120', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe3669ddeca11e9956400163e0a0562', 'J001', '9010130', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe366ffdeca11e9956400163e0a0562', 'J001', '9020000', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe3675bdeca11e9956400163e0a0562', 'J001', '9020110', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe367c0deca11e9956400163e0a0562', 'J001', '9020120', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe36822deca11e9956400163e0a0562', 'J001', '9020130', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('abe3687edeca11e9956400163e0a0562', 'J001', '9020140', null, 'rendonghai', '2019-09-24 20:56:06', 'rendonghai', '2019-09-24 20:56:06', '0');
INSERT INTO `m_menu_power` VALUES ('b455e5f1697b11e9bc35b82a72dfc0af', 'J102', '9010000', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455ea58697b11e9bc35b82a72dfc0af', 'J102', '9010110', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455ebf1697b11e9bc35b82a72dfc0af', 'J102', '9010130', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455ecf6697b11e9bc35b82a72dfc0af', 'J102', '9010120', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455edf6697b11e9bc35b82a72dfc0af', 'J102', '9020000', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455eee7697b11e9bc35b82a72dfc0af', 'J102', '9020110', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455f010697b11e9bc35b82a72dfc0af', 'J102', '9020120', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455f101697b11e9bc35b82a72dfc0af', 'J102', '9020130', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b455f1f1697b11e9bc35b82a72dfc0af', 'J102', '9020140', null, '1', '2019-04-28 14:06:03', '1', '2019-04-28 14:07:49', '1');
INSERT INTO `m_menu_power` VALUES ('b716ab7c697b11e9bc35b82a72dfc0af', 'J000', '9010000', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716ae3f697b11e9bc35b82a72dfc0af', 'J000', '9010110', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716af77697b11e9bc35b82a72dfc0af', 'J000', '9010130', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b077697b11e9bc35b82a72dfc0af', 'J000', '9010120', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b168697b11e9bc35b82a72dfc0af', 'J000', '9020000', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b24e697b11e9bc35b82a72dfc0af', 'J000', '9020110', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b32f697b11e9bc35b82a72dfc0af', 'J000', '9020120', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b41b697b11e9bc35b82a72dfc0af', 'J000', '9020130', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('b716b501697b11e9bc35b82a72dfc0af', 'J000', '9020140', null, '1', '2019-04-28 14:06:08', '1', '2019-04-28 14:07:45', '1');
INSERT INTO `m_menu_power` VALUES ('c49825afda1e11e9956400163e0a0562', 'J000', '9010000', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c49829a5da1e11e9956400163e0a0562', 'J000', '9010110', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982a26da1e11e9956400163e0a0562', 'J000', '9010120', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982a76da1e11e9956400163e0a0562', 'J000', '9010130', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982abeda1e11e9956400163e0a0562', 'J000', '9020000', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982b0ada1e11e9956400163e0a0562', 'J000', '9020110', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982b4dda1e11e9956400163e0a0562', 'J000', '9020120', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982b8eda1e11e9956400163e0a0562', 'J000', '9020130', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c4982bd5da1e11e9956400163e0a0562', 'J000', '9020140', null, 'gf', '2019-09-18 22:15:29', 'jsy', '2019-10-01 13:58:28', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b01b7b1711e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b2777b1711e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b2ce7b1711e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b3157b1711e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b3577b1711e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b3a17b1711e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b3d87b1711e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c7c0b40d7b1711e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-20 23:56:07', '123456', '2019-05-20 23:56:27', '1');
INSERT INTO `m_menu_power` VALUES ('c83e07f0da1e11e9956400163e0a0562', 'J001', '9020000', null, 'gf', '2019-09-18 22:15:35', 'rendonghai', '2019-09-24 20:56:05', '1');
INSERT INTO `m_menu_power` VALUES ('c83e0b00da1e11e9956400163e0a0562', 'J001', '9020110', null, 'gf', '2019-09-18 22:15:35', 'rendonghai', '2019-09-24 20:56:05', '1');
INSERT INTO `m_menu_power` VALUES ('c83e0b71da1e11e9956400163e0a0562', 'J001', '9020120', null, 'gf', '2019-09-18 22:15:35', 'rendonghai', '2019-09-24 20:56:05', '1');
INSERT INTO `m_menu_power` VALUES ('c83e0bb5da1e11e9956400163e0a0562', 'J001', '9020130', null, 'gf', '2019-09-18 22:15:35', 'rendonghai', '2019-09-24 20:56:05', '1');
INSERT INTO `m_menu_power` VALUES ('c83e0bf4da1e11e9956400163e0a0562', 'J001', '9020140', null, 'gf', '2019-09-18 22:15:35', 'rendonghai', '2019-09-24 20:56:05', '1');
INSERT INTO `m_menu_power` VALUES ('ca14ebbe707311e9bc35b82a72dfc0af', 'J102', '9010000', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14ef10707311e9bc35b82a72dfc0af', 'J102', '9010110', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f06c707311e9bc35b82a72dfc0af', 'J102', '9010120', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f171707311e9bc35b82a72dfc0af', 'J102', '9010130', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f26c707311e9bc35b82a72dfc0af', 'J102', '9020000', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f381707311e9bc35b82a72dfc0af', 'J102', '9020110', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f46c707311e9bc35b82a72dfc0af', 'J102', '9020120', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f562707311e9bc35b82a72dfc0af', 'J102', '9020130', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('ca14f653707311e9bc35b82a72dfc0af', 'J102', '9020140', null, 'rendonghai', '2019-05-07 10:57:05', '1', '2019-05-07 11:33:14', '1');
INSERT INTO `m_menu_power` VALUES ('d3b2795d7b1711e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27cbd7b1711e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27d727b1711e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27df47b1711e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27e657b1711e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27edf7b1711e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27f527b1711e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b27fb77b1711e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d3b280977b1711e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-20 23:56:27', '123456', '2019-05-22 14:01:01', '1');
INSERT INTO `m_menu_power` VALUES ('d6dae37d707811e9bc35b82a72dfc0af', 'J102', '9010000', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6dae73a707811e9bc35b82a72dfc0af', 'J102', '9010110', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6dae8b0707811e9bc35b82a72dfc0af', 'J102', '9010120', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6dae9d4707811e9bc35b82a72dfc0af', 'J102', '9010130', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daeb12707811e9bc35b82a72dfc0af', 'J102', '9020000', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daebfd707811e9bc35b82a72dfc0af', 'J102', '9020110', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daee3a707811e9bc35b82a72dfc0af', 'J102', '9020120', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daef26707811e9bc35b82a72dfc0af', 'J102', '9020130', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daf007707811e9bc35b82a72dfc0af', 'J102', '9020140', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daf0e9707811e9bc35b82a72dfc0af', 'J102', '9030000', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('d6daf1cf707811e9bc35b82a72dfc0af', 'J102', '9030110', null, '1', '2019-05-07 11:33:14', '1', '2019-05-07 11:33:14', '0');
INSERT INTO `m_menu_power` VALUES ('e54f59c97d5a11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-23 21:01:35', '123456', '2019-05-23 21:01:57', '1');
INSERT INTO `m_menu_power` VALUES ('e54f5cbb7d5a11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-23 21:01:35', '123456', '2019-05-23 21:01:57', '1');
INSERT INTO `m_menu_power` VALUES ('e54f5d247d5a11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-23 21:01:35', '123456', '2019-05-23 21:01:57', '1');
INSERT INTO `m_menu_power` VALUES ('e54f5d6c7d5a11e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-23 21:01:35', '123456', '2019-05-23 21:01:57', '1');
INSERT INTO `m_menu_power` VALUES ('ebe1676479fb11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16a7479fb11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16b1779fb11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16b5e79fb11e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16b9c79fb11e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16bdb79fb11e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16c1779fb11e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ebe16c4a79fb11e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-19 14:04:11', '123456', '2019-05-19 14:04:19', '1');
INSERT INTO `m_menu_power` VALUES ('ecb7fb53795311e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-18 18:01:37', '123456', '2019-05-18 18:01:46', '1');
INSERT INTO `m_menu_power` VALUES ('ecb800ae795311e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-18 18:01:37', '123456', '2019-05-18 18:01:46', '1');
INSERT INTO `m_menu_power` VALUES ('ecb8011b795311e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-18 18:01:37', '123456', '2019-05-18 18:01:46', '1');
INSERT INTO `m_menu_power` VALUES ('ecb80160795311e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-18 18:01:37', '123456', '2019-05-18 18:01:46', '1');
INSERT INTO `m_menu_power` VALUES ('f096966b79fb11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f09698de79fb11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f096993879fb11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f096997879fb11e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f09699c379fb11e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f0969a0079fb11e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f0969a3579fb11e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f0969a6a79fb11e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f0969aa279fb11e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-19 14:04:19', '123456', '2019-05-20 23:56:07', '1');
INSERT INTO `m_menu_power` VALUES ('f12a08ae697b11e9bc35b82a72dfc0af', 'J000', '9010000', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a0be6697b11e9bc35b82a72dfc0af', 'J000', '9010110', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a0d1e697b11e9bc35b82a72dfc0af', 'J000', '9010120', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a0e0f697b11e9bc35b82a72dfc0af', 'J000', '9010130', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a0f47697b11e9bc35b82a72dfc0af', 'J000', '9020000', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a104d697b11e9bc35b82a72dfc0af', 'J000', '9020110', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a1138697b11e9bc35b82a72dfc0af', 'J000', '9020120', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a121e697b11e9bc35b82a72dfc0af', 'J000', '9020130', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f12a1338697b11e9bc35b82a72dfc0af', 'J000', '9020140', null, '1', '2019-04-28 14:07:45', '1', '2019-04-29 16:02:04', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42ad07d5a11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42d2e7d5a11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42d907d5a11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42dd77d5a11e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42e187d5a11e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f1f42e657d5a11e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-23 21:01:57', '123456', '2019-05-23 21:02:07', '1');
INSERT INTO `m_menu_power` VALUES ('f25cb91d795311e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cbf2a795311e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cbfab795311e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cbffa795311e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cc034795311e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cc07b795311e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cc0b1795311e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cc0e6795311e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f25cc116795311e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-18 18:01:46', '123456', '2019-05-19 14:04:11', '1');
INSERT INTO `m_menu_power` VALUES ('f32767d7697b11e9bc35b82a72dfc0af', 'J102', '9010000', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276a70697b11e9bc35b82a72dfc0af', 'J102', '9010110', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276b9e697b11e9bc35b82a72dfc0af', 'J102', '9010120', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276c8a697b11e9bc35b82a72dfc0af', 'J102', '9010130', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276d7b697b11e9bc35b82a72dfc0af', 'J102', '9020000', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276e61697b11e9bc35b82a72dfc0af', 'J102', '9020110', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3276f42697b11e9bc35b82a72dfc0af', 'J102', '9020120', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f3277029697b11e9bc35b82a72dfc0af', 'J102', '9020130', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f327710f697b11e9bc35b82a72dfc0af', 'J102', '9020140', null, '1', '2019-04-28 14:07:49', 'rendonghai', '2019-05-06 14:49:39', '1');
INSERT INTO `m_menu_power` VALUES ('f809db937d5a11e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809decf7d5a11e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809df787d5a11e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809dff67d5a11e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809e05d7d5a11e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809e0d87d5a11e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f809e1347d5a11e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-23 21:02:07', '123456', '2019-05-23 21:05:23', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0a7957c5611e9b79d00163e0a37c7', 'J000', '9010000', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0aa177c5611e9b79d00163e0a37c7', 'J000', '9010110', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0aa7c7c5611e9b79d00163e0a37c7', 'J000', '9010120', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0aac77c5611e9b79d00163e0a37c7', 'J000', '9010130', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0ab077c5611e9b79d00163e0a37c7', 'J000', '9020000', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0ab5c7c5611e9b79d00163e0a37c7', 'J000', '9020110', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0ab947c5611e9b79d00163e0a37c7', 'J000', '9020120', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0abd87c5611e9b79d00163e0a37c7', 'J000', '9020130', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0ac397c5611e9b79d00163e0a37c7', 'J000', '9020140', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('f9e0b3c87c5611e9b79d00163e0a37c7', 'J000', '9020150', null, '123456', '2019-05-22 14:01:01', '123456', '2019-05-23 21:01:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794b16716511e9b79d00163e0a37c7', 'J001', '9010000', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794d9e716511e9b79d00163e0a37c7', 'J001', '9010110', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794e00716511e9b79d00163e0a37c7', 'J001', '9010130', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794e3b716511e9b79d00163e0a37c7', 'J001', '9010120', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794e78716511e9b79d00163e0a37c7', 'J001', '9020000', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794ead716511e9b79d00163e0a37c7', 'J001', '9020110', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794ede716511e9b79d00163e0a37c7', 'J001', '9020120', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794f10716511e9b79d00163e0a37c7', 'J001', '9020130', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794f3f716511e9b79d00163e0a37c7', 'J001', '9020140', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794f6b716511e9b79d00163e0a37c7', 'J001', '9030000', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fa794f98716511e9b79d00163e0a37c7', 'J001', '9030110', null, '1', '2019-05-08 15:50:41', 'gf', '2019-09-18 22:15:35', '1');
INSERT INTO `m_menu_power` VALUES ('fbced90b716511e9b79d00163e0a37c7', 'J000', '9010000', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedb6e716511e9b79d00163e0a37c7', 'J000', '9010110', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedc0a716511e9b79d00163e0a37c7', 'J000', '9010120', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedc64716511e9b79d00163e0a37c7', 'J000', '9010130', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedc98716511e9b79d00163e0a37c7', 'J000', '9020000', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedccd716511e9b79d00163e0a37c7', 'J000', '9020110', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedd00716511e9b79d00163e0a37c7', 'J000', '9020120', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedd30716511e9b79d00163e0a37c7', 'J000', '9020130', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedd60716511e9b79d00163e0a37c7', 'J000', '9020140', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbcedd8f716511e9b79d00163e0a37c7', 'J000', '9030000', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');
INSERT INTO `m_menu_power` VALUES ('fbceddc4716511e9b79d00163e0a37c7', 'J000', '9030110', null, '1', '2019-05-08 15:50:44', '123456', '2019-05-18 18:01:37', '1');

-- ----------------------------
-- Table structure for m_money
-- ----------------------------
DROP TABLE IF EXISTS `m_money`;
CREATE TABLE `m_money` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '活动编号',
  `name` varchar(40) DEFAULT NULL COMMENT '活动名称',
  `content` varchar(100) DEFAULT NULL COMMENT '活动内容',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动日程';

-- ----------------------------
-- Records of m_money
-- ----------------------------
INSERT INTO `m_money` VALUES ('1', '2', 'zhangsan', '5000', '2019-10-16 18:09:43', '0', '7');
INSERT INTO `m_money` VALUES ('7307413be67511e9949300163e0eb114', '001', '张三', '200', '2019-10-04 15:06:12', '0', '');
INSERT INTO `m_money` VALUES ('9fde3fd0e67511e9949300163e0eb114', '002', '李四', '5000', '2019-10-04 15:07:27', '0', '');

-- ----------------------------
-- Table structure for m_payable
-- ----------------------------
DROP TABLE IF EXISTS `m_payable`;
CREATE TABLE `m_payable` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '订单编号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '应付金额',
  `types` varchar(2) DEFAULT NULL COMMENT '付款状态',
  `payer` varchar(40) DEFAULT NULL COMMENT '付款人',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应付管理';

-- ----------------------------
-- Records of m_payable
-- ----------------------------
INSERT INTO `m_payable` VALUES ('da417212e67511e9949300163e0eb114', '22', '11.00', '1', '21', '2019-10-04 15:09:05', '0', '');

-- ----------------------------
-- Table structure for m_pet
-- ----------------------------
DROP TABLE IF EXISTS `m_pet`;
CREATE TABLE `m_pet` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '宠物编号',
  `name` varchar(40) DEFAULT NULL COMMENT '宠物姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '宠物性别',
  `birthday` datetime DEFAULT NULL COMMENT '宠物生日',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_pet
-- ----------------------------

-- ----------------------------
-- Table structure for m_petcare
-- ----------------------------
DROP TABLE IF EXISTS `m_petcare`;
CREATE TABLE `m_petcare` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '宠物编号',
  `name` varchar(40) DEFAULT NULL COMMENT '宠物姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `types` varchar(2) DEFAULT NULL COMMENT '美容类型',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_petcare
-- ----------------------------
INSERT INTO `m_petcare` VALUES ('0', '0', '0', '0', '0', '2019-10-01 18:09:26', '0', null);

-- ----------------------------
-- Table structure for m_purchase
-- ----------------------------
DROP TABLE IF EXISTS `m_purchase`;
CREATE TABLE `m_purchase` (
  `id` varchar(32) NOT NULL,
  `orderno` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `goods` varchar(40) DEFAULT NULL COMMENT '入库商品',
  `amount` int(10) DEFAULT NULL COMMENT '商品数量',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `remark` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_purchase
-- ----------------------------
INSERT INTO `m_purchase` VALUES ('2', '2', '2', '2', '2019-10-03 18:10:00', '2', '0');

-- ----------------------------
-- Table structure for m_receivable
-- ----------------------------
DROP TABLE IF EXISTS `m_receivable`;
CREATE TABLE `m_receivable` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '订单编号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '应收金额',
  `types` varchar(2) DEFAULT NULL COMMENT '收款状态',
  `payer` varchar(40) DEFAULT NULL COMMENT '收款人',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应收管理';

-- ----------------------------
-- Records of m_receivable
-- ----------------------------

-- ----------------------------
-- Table structure for m_role
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  `role_name` varchar(40) NOT NULL COMMENT '角色名称',
  `remark` varchar(40) NOT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人  ',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` VALUES ('8dafc9c5f21911e8805c00163e03b92e', 'J000', '超级管理员', '全部', '1001', '2018-11-27 15:53:40', '123456', '2019-05-23 10:09:20', '0');
INSERT INTO `m_role` VALUES ('8dafccd5f21911e8805c00163e03b92e', 'J108', '研发管理员', '研发人员', '1001', '2018-11-27 15:53:40', '1', '2019-05-08 15:47:22', '1');
INSERT INTO `m_role` VALUES ('8dafcd5ef21911e8805c00163e03b92e', 'J102', '研发部', '研发人员', '1001', '2018-11-27 15:53:40', '1', '2019-05-08 15:47:22', '1');
INSERT INTO `m_role` VALUES ('8dafcdaff21911e8805c00163e03b92e', 'J010', '产品部', '产品人员', '1001', '2018-11-27 15:53:40', '1', '2019-05-08 15:47:22', '1');
INSERT INTO `m_role` VALUES ('8dafcdf1f21911e8805c00163e03b92e', 'J001', '管理员', '招考信息', '1001', '2018-11-27 15:53:40', '123456', '2019-05-23 10:09:41', '0');
INSERT INTO `m_role` VALUES ('8dafce35f21911e8805c00163e03b92e', 'J002', '城市管理员', '城市人员', '1001', '2018-11-27 15:53:40', '1', '2019-05-08 15:47:22', '1');
INSERT INTO `m_role` VALUES ('918b2657f9d111e89d0e346ac25f0751', 'J104', '财务部', '财务人员', 'lijianguo', '2018-12-07 11:38:32', '1', '2019-05-08 15:47:22', '1');

-- ----------------------------
-- Table structure for m_sales
-- ----------------------------
DROP TABLE IF EXISTS `m_sales`;
CREATE TABLE `m_sales` (
  `id` varchar(32) NOT NULL,
  `breed` varchar(40) DEFAULT NULL COMMENT '宠物品种',
  `sex` varchar(10) DEFAULT NULL COMMENT '宠物性别',
  `birthday` datetime DEFAULT NULL COMMENT '宠物生日',
  `price` decimal(10,2) DEFAULT NULL COMMENT '宠物价格',
  `time` datetime DEFAULT NULL COMMENT '出售时间',
  `buyer` varchar(20) DEFAULT NULL COMMENT '购买人',
  `seller` varchar(20) DEFAULT NULL COMMENT '出售人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '删除状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_sales
-- ----------------------------
INSERT INTO `m_sales` VALUES ('1', '猫', '母', '2019-09-01 00:00:00', '300.00', '0000-00-00 00:00:00', '李', 'jsy', '备注', '0');
INSERT INTO `m_sales` VALUES ('4828ed01e41411e9949300163e0eb114', '狗', '公', '2018-08-01 00:00:00', '800.00', '2019-10-01 14:25:37', '张三', 'jsy', '2', '0');
INSERT INTO `m_sales` VALUES ('aae133d4e4ce11e9949300163e0eb114', '1', '1', '2019-10-03 00:00:00', '1.00', '2019-10-02 12:39:49', '张三', 'jsy', '2', '1');
INSERT INTO `m_sales` VALUES ('b072e8d8e67511e9949300163e0eb114', '仓鼠', '公', '2019-01-30 00:00:00', '200.00', '2019-10-04 15:07:55', '123', 'jsy', '', '0');

-- ----------------------------
-- Table structure for m_salesout
-- ----------------------------
DROP TABLE IF EXISTS `m_salesout`;
CREATE TABLE `m_salesout` (
  `id` varchar(32) NOT NULL,
  `orderno` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `goods` varchar(40) DEFAULT NULL COMMENT '出库商品',
  `amount` int(10) DEFAULT NULL COMMENT '商品数量',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `remark` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_salesout
-- ----------------------------
INSERT INTO `m_salesout` VALUES ('45123c3de64f11e9949300163e0eb114', '1', '2', '2312', '2019-10-04 10:32:54', '12', '0');

-- ----------------------------
-- Table structure for m_stock
-- ----------------------------
DROP TABLE IF EXISTS `m_stock`;
CREATE TABLE `m_stock` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(40) DEFAULT NULL COMMENT '商品名称',
  `qty` int(11) DEFAULT NULL COMMENT '库存数量',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存结余';

-- ----------------------------
-- Records of m_stock
-- ----------------------------

-- ----------------------------
-- Table structure for m_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `m_subscribe`;
CREATE TABLE `m_subscribe` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '客户编号',
  `name` varchar(40) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `time` datetime DEFAULT NULL COMMENT '提醒时间',
  `content` varchar(100) DEFAULT NULL COMMENT '提醒内容',
  `way` varchar(1) DEFAULT NULL COMMENT '提醒方式（0 电话 1 短信）',
  `remark` varchar(255) DEFAULT NULL,
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户预约提醒';

-- ----------------------------
-- Records of m_subscribe
-- ----------------------------
INSERT INTO `m_subscribe` VALUES ('9', '9', '9', '9', '2019-10-08 18:09:13', '9', '1', '9', '0');

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `user_name` varchar(40) NOT NULL COMMENT '用户名称',
  `user_password` varchar(40) NOT NULL COMMENT '用户密码',
  `user_role_id` varchar(40) NOT NULL COMMENT '角色ID',
  `user_login_date` varchar(20) DEFAULT NULL COMMENT '登录时间',
  `remark` varchar(80) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人  ',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES ('031f8407815111e9b79d00163e0a37c7', 'rendonghai', '任东海', '123456', 'J000', null, '', null, '2019-05-28 22:00:55', 'gf', '2019-09-18 22:16:09', '0');
INSERT INTO `m_user` VALUES ('e4ac9709da1e11e9956400163e0a0562', 'jsy', 'jsy', '123456', 'J000', null, '', '', '2019-09-18 22:16:23', '', '2019-09-18 22:16:23', '0');

-- ----------------------------
-- Table structure for m_work
-- ----------------------------
DROP TABLE IF EXISTS `m_work`;
CREATE TABLE `m_work` (
  `id` varchar(32) NOT NULL,
  `no` varchar(10) DEFAULT NULL COMMENT '活动编号',
  `name` varchar(40) DEFAULT NULL COMMENT '活动名称',
  `content` varchar(100) DEFAULT NULL COMMENT '活动内容',
  `time` datetime DEFAULT NULL COMMENT '日期',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动日程';

-- ----------------------------
-- Records of m_work
-- ----------------------------
INSERT INTO `m_work` VALUES ('7', '001', '保洁', '7', '2019-10-16 18:09:43', '0', '7');
INSERT INTO `m_work` VALUES ('95c556c9e67511e9949300163e0eb114', '002', '门卫', '看门', '2019-10-04 15:07:10', '0', '111');

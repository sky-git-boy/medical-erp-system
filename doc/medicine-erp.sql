/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : medicine-erp

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 24/02/2023 09:46:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stock_inventory_log
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventory_log`;
CREATE TABLE `stock_inventory_log`  (
  `inventory_log_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入库ID',
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购单据ID',
  `medicines_id` bigint(20) NULL DEFAULT NULL COMMENT '药品ID',
  `inventory_log_num` int(10) NULL DEFAULT NULL COMMENT '入库数量',
  `trade_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发价',
  `prescription_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方价',
  `trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发额',
  `prescription_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方额',
  `batch_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品生产批次号',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `producer_id` bigint(20) NULL DEFAULT NULL COMMENT '生产厂家ID',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `provider_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`inventory_log_id`) USING BTREE,
  INDEX `purchase_fk`(`purchase_id`) USING BTREE,
  INDEX `provider_fk`(`provider_id`) USING BTREE,
  INDEX `producer_fk`(`producer_id`) USING BTREE,
  INDEX `medicines_fk`(`medicines_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_inventory_log
-- ----------------------------
INSERT INTO `stock_inventory_log` VALUES ('1327540791496802304', 'CG1327540652937969664', 1, 10, 10.00, NULL, 100.00, NULL, '1234', '阿胶珠', '1', '1', 1, 1, 'g', NULL, '2021-03-11 09:23:25', 'sky');
INSERT INTO `stock_inventory_log` VALUES ('1327540791530356736', 'CG1327540652937969664', 2, 10, 10.00, NULL, 100.00, NULL, '1234', '醋艾炭', '1', '1', 2, 1, 'g', NULL, '2021-03-11 09:23:25', 'sky');
INSERT INTO `stock_inventory_log` VALUES ('1327540791563911168', 'CG1327540652937969664', 3, 10, 10.00, NULL, 100.00, NULL, '1234', '制巴戟天', '1', '1', 1, 1, 'g', NULL, '2021-03-11 09:23:25', 'sky');
INSERT INTO `stock_inventory_log` VALUES ('1327543481001967616', 'CG1327543323640070144', 6, 10, 10.00, NULL, 100.00, NULL, '1', '白芨', '1', '1', 1, 1, 'g', NULL, '2021-03-11 09:23:25', '超级管理员');
INSERT INTO `stock_inventory_log` VALUES ('1327543481165545472', 'CG1327543323640070144', 7, 10, 10.00, NULL, 100.00, NULL, '1', '白芍', '1', '1', 1, 1, 'g', NULL, '2021-03-11 09:23:25', '超级管理员');
INSERT INTO `stock_inventory_log` VALUES ('1343216322120646656', 'CG1343215879214727168', 2, 1, 2.00, NULL, 2.00, NULL, '1111', '醋艾炭', '1', '1', 2, 1, 'g', NULL, '2021-03-11 09:23:25', '超级管理员');
INSERT INTO `stock_inventory_log` VALUES ('1343216322166784000', 'CG1343215879214727168', 6, 1, 2.00, NULL, 2.00, NULL, '1111', '白芨', '1', '1', 1, 1, 'g', NULL, '2021-03-11 09:23:25', '超级管理员');
INSERT INTO `stock_inventory_log` VALUES ('1454795003527299072', 'CG1454794926570209280', 2, 3, 5.00, NULL, 15.00, NULL, '', '醋艾炭', '1', '1', 2, 1, 'g', NULL, '2021-10-31 12:59:16', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1454795003531493376', 'CG1454794926570209280', 3, 3, 5.00, NULL, 15.00, NULL, '', '制巴戟天', '1', '1', 1, 1, 'g', NULL, '2021-10-31 12:59:16', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1454801618896814080', 'CG1454801546314383360', 2, 3, 6.00, NULL, 18.00, NULL, '1231', '醋艾炭', '1', '1', 2, 1, 'g', NULL, '2021-10-31 13:25:46', '超级管理员');
INSERT INTO `stock_inventory_log` VALUES ('1454801618934562816', 'CG1454801546314383360', 4, 3, 6.00, NULL, 18.00, NULL, '1231', '白蔹', '1', '1', 1, 1, 'g', NULL, '2021-10-31 13:25:46', '超级管理员');

-- ----------------------------
-- Table structure for stock_medicines
-- ----------------------------
DROP TABLE IF EXISTS `stock_medicines`;
CREATE TABLE `stock_medicines`  (
  `medicines_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `medicines_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品编号',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `prescription_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方价格',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `keywords` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `producer_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品状态0正常0停用 sys_dict_data表 sys_normal_disable',
  `medicines_stock_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '库存量',
  `medicines_stock_danger_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '预警值',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态0正常0删除 要有重新导入功能',
  PRIMARY KEY (`medicines_id`) USING BTREE,
  INDEX `medicines_number`(`medicines_number`) USING BTREE,
  INDEX `medicines_name`(`medicines_name`) USING BTREE,
  INDEX `index_keywords`(`keywords`) USING BTREE,
  INDEX `producer_fk`(`producer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 531 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '药品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_medicines
-- ----------------------------
INSERT INTO `stock_medicines` VALUES (1, 'ptu0001', '阿胶珠', '1', '1', 2.00, 'g', 1, 'ajz', '1', '0', 120, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', 'sky', '0');
INSERT INTO `stock_medicines` VALUES (2, 'ptu0002', '醋艾炭', '1', '1', 2.00, 'g', 1, 'cat', '2', '0', 227, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '超级管理员', '0');
INSERT INTO `stock_medicines` VALUES (3, 'ptu0003', '制巴戟天', '1', '1', 2.00, 'g', 1, 'zbjt', '1', '0', 113, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (4, 'ptu0004', '白蔹', '1', '1', 2.00, 'g', 1, 'bl', '1', '0', 103, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '超级管理员', '0');
INSERT INTO `stock_medicines` VALUES (5, 'ptu0005', '白果', '1', '1', 2.00, 'g', 1, 'bg', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (6, 'ptu0006', '白芨', '1', '1', 2.00, 'g', 1, 'bj', '1', '0', 111, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '超级管理员', '0');
INSERT INTO `stock_medicines` VALUES (7, 'ptu0007', '白芍', '1', '1', 2.00, 'g', 1, 'bs', '1', '0', 110, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '超级管理员', '0');
INSERT INTO `stock_medicines` VALUES (8, 'ptu0008', '白英', '1', '1', 2.00, 'g', 1, 'by', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (9, 'ptu0009', '白芷', '1', '1', 2.00, 'g', 1, 'bz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (10, 'ptu0010', '炒牵牛子', '1', '1', 2.00, 'g', 1, 'cqnz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (11, 'ptu0011', '白豆蔻', '1', '1', 2.00, 'g', 1, 'bdk', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (12, 'ptu0012', '制白附子', '1', '1', 2.00, 'g', 1, 'zbfz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (13, 'ptu0013', '金钱白花蛇', '1', '1', 2.00, '条', 1, 'jqbhs', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (14, 'ptu0014', '白花蛇舌草', '1', '1', 2.00, 'g', 1, 'bhssc', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (15, 'ptu0015', '半枝莲', '1', '1', 2.00, 'g', 1, 'bzl', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (16, 'ptu0016', '盐蒺藜', '1', '1', 2.00, 'g', 1, 'yjl', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (17, 'ptu0017', '白梅花', '1', '1', 2.00, 'g', 1, 'bmh', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (18, 'ptu0018', '白前', '1', '1', 2.00, 'g', 1, 'bq', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (19, 'ptu0019', '白头翁', '1', '1', 2.00, 'g', 1, 'btw', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (20, 'ptu0020', '白薇', '1', '1', 2.00, 'g', 1, 'bw', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (21, 'ptu0021', '白鲜皮', '1', '1', 2.00, 'g', 1, 'bxp', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (22, 'ptu0022', '百合', '1', '1', 2.00, 'g', 1, 'bh', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (23, 'ptu0023', '柏子仁', '1', '1', 2.00, 'g', 1, 'bzr', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (24, 'ptu0024', '北败酱草', '1', '1', 2.00, 'g', 1, 'bbjc', '3', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (25, 'ptu0025', '板蓝根', '1', '1', 2.00, 'g', 1, 'blg', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (26, 'ptu0026', '北沙参', '1', '1', 2.00, 'g', 1, 'bss', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (27, 'ptu0027', '荜茇', '1', '1', 2.00, 'g', 1, 'bb', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (28, 'ptu0028', '绵萆薢', '1', '1', 2.00, 'g', 1, 'mbx', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (29, 'ptu0029', '萹蓄', '1', '1', 2.00, 'g', 1, 'bx', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (30, 'ptu0030', '醋鳖甲', '1', '1', 2.00, 'g', 1, 'cbj', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (31, 'ptu0031', '薄荷', '1', '1', 2.00, 'g', 1, 'bh', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (32, 'ptu0032', '伏龙肝', '1', '1', 2.00, 'g', 1, 'flg', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (33, 'ptu0033', '茯苓', '1', '1', 2.00, 'g', 1, 'fl', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (34, 'ptu0034', '茯苓皮', '1', '1', 2.00, 'g', 1, 'flp', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (35, 'ptu0035', '茯神', '1', '1', 2.00, 'g', 1, 'fs', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (36, 'ptu0036', '浮萍', '1', '1', 2.00, 'g', 1, 'fp', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (37, 'ptu0037', '浮小麦', '1', '1', 2.00, 'g', 1, 'fxm', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (38, 'ptu0038', '覆盆子', '1', '1', 2.00, 'g', 1, 'fpz', '4', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (39, 'ptu0039', '木通', '1', '1', 2.00, 'g', 1, 'mt', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (40, 'ptu0040', '山慈菇', '1', '1', 2.00, 'g', 1, 'scg', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (41, 'ptu0041', '广藿香', '1', '1', 2.00, 'g', 1, 'ghx', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (42, 'ptu0042', '干姜', '1', '1', 2.00, 'g', 1, 'gj', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (43, 'ptu0043', '甘草', '1', '1', 2.00, 'g', 1, 'gc', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (44, 'ptu0044', '甘松', '1', '1', 2.00, 'g', 1, 'gs', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (45, 'ptu0045', '高良姜', '1', '1', 2.00, 'g', 1, 'glj', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (46, 'ptu0046', '藁本', '1', '1', 2.00, 'g', 1, 'gb', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (47, 'ptu0047', '葛根', '1', '1', 2.00, 'g', 1, 'gg', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (48, 'ptu0048', '钩藤', '1', '1', 2.00, 'g', 1, 'gt', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (49, 'ptu0049', '烫狗脊', '1', '1', 2.00, 'g', 1, 'tgj', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (50, 'ptu0050', '枸杞子', '1', '1', 2.00, 'g', 1, 'gqz', '9', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (51, 'ptu0051', '烫骨碎补', '1', '1', 2.00, 'g', 1, 'tgsb', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (52, 'ptu0052', '瓜蒌皮', '1', '1', 2.00, 'g', 1, 'gjp', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (53, 'ptu0053', '蜜瓜蒌子', '1', '1', 2.00, 'g', 1, 'mgjz', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (54, 'ptu0054', '海风藤', '1', '1', 2.00, 'g', 1, 'hft', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (55, 'ptu0055', '海金沙', '1', '1', 2.00, 'g', 1, 'hjs', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (56, 'ptu0056', '海螵蛸', '1', '1', 2.00, 'g', 1, 'hps', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (57, 'ptu0057', '海藻', '1', '1', 2.00, 'g', 1, 'hz', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (58, 'ptu0058', '柯子肉', '1', '1', 2.00, 'g', 1, 'kzr', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (59, 'ptu0059', '合欢花', '1', '1', 2.00, 'g', 1, 'hhh', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (60, 'ptu0060', '南沙参', '1', '1', 2.00, 'g', 1, 'nss', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (61, 'ptu0061', '酒女贞子', '1', '1', 2.00, 'g', 1, 'jnzz', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (62, 'ptu0062', '藕节', '1', '1', 2.00, 'g', 1, 'oj', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (63, 'ptu0063', '藕节炭', '1', '1', 2.00, 'g', 1, 'ojt', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (64, 'ptu0064', '胖大海', '1', '1', 2.00, 'g', 1, 'pdh', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (65, 'ptu0065', '炮姜', '1', '1', 2.00, 'g', 1, 'pj', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (66, 'ptu0066', '佩兰', '1', '1', 2.00, 'g', 1, 'pl', '10', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (67, 'ptu0067', '炙枇杷叶', '1', '1', 2.00, 'g', 1, 'zbby', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (68, 'ptu0068', '蒲公英', '1', '1', 2.00, 'g', 1, 'pgy', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (69, 'ptu0069', '盐补骨脂', '1', '1', 2.00, 'g', 1, 'ybgz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (70, 'ptu0070', '白矾', '1', '1', 2.00, 'g', 1, 'bf', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (71, 'ptu0071', '炒半夏曲', '1', '1', 2.00, 'g', 1, 'cbxq', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (72, 'ptu0072', '炒芡实', '1', '1', 2.00, 'g', 1, 'cqs', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (73, 'ptu0073', '麸炒山药', '1', '1', 2.00, 'g', 1, 'fcsy', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (74, 'ptu0074', '炒山楂', '1', '1', 2.00, 'g', 1, 'csc', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (75, 'ptu0075', '生神曲', '1', '1', 2.00, 'g', 1, 'ssq', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (76, 'ptu0076', '炒紫苏子', '1', '1', 2.00, 'g', 1, 'czsz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (77, 'ptu0077', '麸炒薏苡仁', '1', '1', 2.00, 'g', 1, 'fcyyr', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (78, 'ptu0078', '炒栀子', '1', '1', 2.00, 'g', 1, 'czz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (79, 'ptu0079', '麸炒枳壳', '1', '1', 2.00, 'g', 1, 'fczk', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (80, 'ptu0080', '车前草', '1', '1', 2.00, 'g', 1, 'cqc', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (81, 'ptu0081', '车前子', '1', '1', 2.00, 'g', 1, 'cqz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (82, 'ptu0082', '陈皮', '1', '1', 2.00, 'g', 1, 'cp', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (83, 'ptu0083', '陈皮炭', '1', '1', 2.00, 'g', 1, 'cpt', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (84, 'ptu0084', '赤芍', '1', '1', 2.00, 'g', 1, 'cs', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (85, 'ptu0085', '赤小豆', '1', '1', 2.00, 'g', 1, 'cxd', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (86, 'ptu0086', '炒稻芽', '1', '1', 2.00, 'g', 1, 'cdy', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (87, 'ptu0087', '炒谷芽', '1', '1', 2.00, 'g', 1, 'cgy', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (88, 'ptu0088', '炒槐花', '1', '1', 2.00, 'g', 1, 'chh', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (89, 'ptu0089', '炒芥子', '1', '1', 2.00, 'g', 1, 'cjz', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (90, 'ptu0090', '炒苦杏仁', '1', '1', 2.00, 'g', 1, 'ckxr', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (91, 'ptu0091', '炒麦芽', '1', '1', 2.00, 'g', 1, 'cmy', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (92, 'ptu0092', '蚕砂', '1', '1', 2.00, 'g', 1, 'cs', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (93, 'ptu0093', '炒苍耳子', '1', '1', 2.00, 'g', 1, 'ccez', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (94, 'ptu0094', '草豆蔻', '1', '1', 2.00, 'g', 1, 'cdk', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (95, 'ptu0095', '炒草果仁', '1', '1', 2.00, 'g', 1, 'ccgr', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (96, 'ptu0096', '侧柏炭', '1', '1', 2.00, 'g', 1, 'cbt', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (97, 'ptu0097', '柴胡', '1', '1', 2.00, 'g', 1, 'ch', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (98, 'ptu0098', '蝉蜕', '1', '1', 2.00, 'g', 1, 'ct', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (99, 'ptu0099', '川贝母', '1', '1', 2.00, 'g', 1, 'cbm', '1', '0', 100, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (530, 'ptu221', '221', '7', '2', 2.00, '221', 221, '221', '2', '0', 99, 100, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '扁鹊', '1');

-- ----------------------------
-- Table structure for stock_producer
-- ----------------------------
DROP TABLE IF EXISTS `stock_producer`;
CREATE TABLE `stock_producer`  (
  `producer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `producer_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家名称',
  `producer_code` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家简码 搜索用',
  `producer_address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家地址 ',
  `producer_tel` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家电话',
  `producer_person` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态标志（0正常 1停用）sys_normal_disable',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`producer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '生产厂家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_producer
-- ----------------------------
INSERT INTO `stock_producer` VALUES (1, '云南白药集团股份有限公司', '000538', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (2, '上海医药（集团）有限公司', '1812538', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (3, '中国医药集团总公司', '1238571', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (4, '广州医药集团有限公司 ', '1031377', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (5, '哈药集团有限公司', '727719', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (6, '华北制药集团有限责任公司', '700869', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (7, '太极集团有限公司', '589700', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (8, '北京同仁堂集团有限责任公司', '224882', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (9, '湖南九芝堂股份有限公司', '101857', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (10, '新疆新特药民族药业有限责任公司', '85191', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (11, '江苏江山制药有限公司', '72669', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (12, '武汉新琪安药业有限责任公司', '71581', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (13, '武汉中联药业集团股份有限公司', '58164', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (14, '江苏正大天晴药业股份有限公司', '47643', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (15, '贵州三力制药股份有限公司', '603439', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '');
INSERT INTO `stock_producer` VALUES (17, 'ptu', '1133', 'pt', '1231', 'erwr', '2', '1', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '扁鹊', '扁鹊');

-- ----------------------------
-- Table structure for stock_provider
-- ----------------------------
DROP TABLE IF EXISTS `stock_provider`;
CREATE TABLE `stock_provider`  (
  `provider_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `provider_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '供应商名称',
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `contact_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contact_tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行账号',
  `provider_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）sys_normal_disable',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`provider_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_provider
-- ----------------------------
INSERT INTO `stock_provider` VALUES (101, '云南英广贸易有限公司', '雷华', '13645273944', '027-8989765', '6379865245129741669', '云南', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'sky');
INSERT INTO `stock_provider` VALUES (102, '武汉英广贸易有限公司', '王素', '19374826543', '027-8984192', '6379865245129741023', '武汉', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'sky');
INSERT INTO `stock_provider` VALUES (103, '北京英广贸易有限公司', '斯顿', '18367492743', '027-8989321', '6379865245129742831', '北京', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'sky');
INSERT INTO `stock_provider` VALUES (104, '深圳英广贸易有限公司', '沃尔', '17428462833', '027-8934723', '6379865245129741834', '深圳', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'sky');
INSERT INTO `stock_provider` VALUES (106, '莆田医药有限公司', '苏静', '18346782977', '023-5483294', '4213215213232', '莆田', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'sky', 'sky');

-- ----------------------------
-- Table structure for stock_purchase
-- ----------------------------
DROP TABLE IF EXISTS `stock_purchase`;
CREATE TABLE `stock_purchase`  (
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '制单号ID 全局ID雪花算法',
  `provider_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `purchase_trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购批发总额',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status',
  `apply_user_id` bigint(20) NULL DEFAULT NULL COMMENT '申请人ID',
  `apply_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请人名称',
  `storage_opt_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入库操作人',
  `storage_opt_time` datetime(0) NULL DEFAULT NULL COMMENT '入库操作时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `examine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核信息',
  PRIMARY KEY (`purchase_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_purchase
-- ----------------------------
INSERT INTO `stock_purchase` VALUES ('CG1327540652937969664', '106', 300.00, '6', 10, 'sky', 'sky', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', 'sky', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1327543323640070144', '103', 200.00, '6', 10, 'sky', '超级管理员', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', 'sky', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1327549689360416768', '102', 200.00, '4', 10, 'sky', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', 'sky', '', '1111');
INSERT INTO `stock_purchase` VALUES ('CG1343215879214727168', '102', 4.00, '6', 1, '超级管理员', '超级管理员', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1343890183413694464', '103', 432.00, '3', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1343890354537103360', '104', 432.00, '4', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', '222');
INSERT INTO `stock_purchase` VALUES ('CG1343890473672114176', '104', 0.00, '3', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1343890572859015168', '102', 300.00, '4', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', 'null');
INSERT INTO `stock_purchase` VALUES ('CG1343890674705104896', '106', 600.00, '4', 2, '扁鹊', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', '库存足够');
INSERT INTO `stock_purchase` VALUES ('CG1343890804866940928', '103', 300.00, '5', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', '库存足够');
INSERT INTO `stock_purchase` VALUES ('CG1343890917093933056', '106', 4800.00, '2', 1, '超级管理员', NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '超级管理员', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1405066598313754624', '102', 1000.00, '1', NULL, NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '2021-10-31 18:40:36', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454760757886582784', '102', 9.00, '3', 2, '扁鹊', NULL, NULL, '2021-10-31 10:43:32', '2021-10-31 18:43:31', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454777311080611840', '102', 15.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 11:56:03', '2021-10-31 19:56:02', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454781678533869568', '101', 12.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:06:39', '2021-10-31 20:06:38', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454781919068815360', '102', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:07:03', '2021-10-31 20:07:02', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454782371504193536', '102', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:08:47', '2021-10-31 20:08:47', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454783552314015744', '103', 48.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:13:58', '2021-10-31 20:13:57', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454786327303290880', '102', 30.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:24:38', '2021-10-31 20:24:37', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454786419066273792', '102', 36.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:25:01', '2021-10-31 20:25:01', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454788959577178112', '102', 66.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:35:17', '2021-10-31 20:35:16', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454789934652194816', '106', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:38:55', '2021-10-31 20:38:55', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454790146573598720', '102', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:39:43', '2021-10-31 20:39:42', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454790931227213824', '102', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:42:49', '2021-10-31 20:42:48', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454791648713244672', '103', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:45:41', '2021-10-31 20:45:41', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454792168265875456', '103', 0.00, '2', 2, '扁鹊', NULL, NULL, '2021-10-31 12:47:44', '2021-10-31 20:47:43', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454794530724380672', '106', 30.00, '5', 2, '扁鹊', NULL, NULL, '2021-10-31 12:57:13', '2021-10-31 20:57:13', '扁鹊', '', '222');
INSERT INTO `stock_purchase` VALUES ('CG1454794926570209280', '102', 30.00, '6', 2, '扁鹊', '扁鹊', '2021-10-31 12:59:16', '2021-10-31 12:58:52', '2021-10-31 20:58:52', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1454801546314383360', '102', 36.00, '6', 1, '超级管理员', '超级管理员', '2021-10-31 13:25:46', '2021-10-31 13:25:09', '2021-10-31 21:25:09', '超级管理员', '', NULL);

-- ----------------------------
-- Table structure for stock_purchase_item
-- ----------------------------
DROP TABLE IF EXISTS `stock_purchase_item`;
CREATE TABLE `stock_purchase_item`  (
  `item_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详情ID',
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购单据ID',
  `medicines_id` bigint(20) NULL DEFAULT NULL COMMENT '药品ID',
  `purchase_number` int(10) NULL DEFAULT NULL COMMENT '采购数量',
  `trade_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发价',
  `trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发额',
  `batch_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品生产批次号',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `producer_id` bigint(50) NULL DEFAULT NULL COMMENT '生产厂家ID',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `keywords` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `item_purchase_fk`(`purchase_id`) USING BTREE,
  INDEX `item_producer_fk`(`producer_id`) USING BTREE,
  INDEX `item_medicines_fk`(`medicines_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_purchase_item
-- ----------------------------
INSERT INTO `stock_purchase_item` VALUES ('1327540791496802304', 'CG1327540652937969664', 1, 10, 10.00, 100.00, '1234', '优先处理', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1327540791530356736', 'CG1327540652937969664', 2, 10, 10.00, 100.00, '1234', '优先处理', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1327540791563911168', 'CG1327540652937969664', 3, 10, 10.00, 100.00, '1234', '优先处理', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1327543481001967616', 'CG1327543323640070144', 6, 10, 10.00, 100.00, '1', '无', '白芨', '1', '1', 1, 1, 'g', 'bj');
INSERT INTO `stock_purchase_item` VALUES ('1327543481165545472', 'CG1327543323640070144', 7, 10, 10.00, 100.00, '1', '无', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1327549846541959168', 'CG1327549689360416768', 7, 10, 10.00, 100.00, '1', '1', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1327549846567124992', 'CG1327549689360416768', 8, 10, 10.00, 100.00, '1', '1', '白英', '1', '1', 1, 1, 'g', 'by');
INSERT INTO `stock_purchase_item` VALUES ('1343216322120646656', 'CG1343215879214727168', 2, 1, 2.00, 2.00, '1111', '32', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1343216322166784000', 'CG1343215879214727168', 6, 1, 2.00, 2.00, '1111', '32', '白芨', '1', '1', 1, 1, 'g', 'bj');
INSERT INTO `stock_purchase_item` VALUES ('1343890298174046208', 'CG1343890183413694464', 5, 12, 12.00, 144.00, '31231', '444', '白果', '1', '1', 1, 1, 'g', 'bg');
INSERT INTO `stock_purchase_item` VALUES ('1343890298228572160', 'CG1343890183413694464', 4, 12, 12.00, 144.00, '31231', '444', '白蔹', '1', '1', 1, 1, 'g', 'bl');
INSERT INTO `stock_purchase_item` VALUES ('1343890298241155072', 'CG1343890183413694464', 7, 12, 12.00, 144.00, '31231', '444', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1343890448279797760', 'CG1343890354537103360', 3, 12, 12.00, 144.00, '12', '12', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1343890448292380672', 'CG1343890354537103360', 5, 12, 12.00, 144.00, '12', '12', '白果', '1', '1', 1, 1, 'g', 'bg');
INSERT INTO `stock_purchase_item` VALUES ('1343890448309157888', 'CG1343890354537103360', 7, 12, 12.00, 144.00, '12', '12', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1343890554458603520', 'CG1343890473672114176', 9, 30, 0.00, 0.00, '23', '41', '白芷', '1', '1', 1, 1, 'g', 'bz');
INSERT INTO `stock_purchase_item` VALUES ('1343890554471186432', 'CG1343890473672114176', 10, 30, 0.00, 0.00, '23', '41', '炒牵牛子', '1', '1', 1, 1, 'g', 'cqnz');
INSERT INTO `stock_purchase_item` VALUES ('1343890554479575040', 'CG1343890473672114176', 54, 30, 0.00, 0.00, '23', '41', '海风藤', '1', '1', 10, 1, 'g', 'hft');
INSERT INTO `stock_purchase_item` VALUES ('1343890638235631616', 'CG1343890572859015168', 44, 10, 10.00, 100.00, '1', '1', '甘松', '1', '1', 9, 1, 'g', 'gs');
INSERT INTO `stock_purchase_item` VALUES ('1343890638244020224', 'CG1343890572859015168', 46, 10, 10.00, 100.00, '1', '1', '藁本', '1', '1', 9, 1, 'g', 'gb');
INSERT INTO `stock_purchase_item` VALUES ('1343890638252408832', 'CG1343890572859015168', 48, 10, 10.00, 100.00, '1', '1', '钩藤', '1', '1', 9, 1, 'g', 'gt');
INSERT INTO `stock_purchase_item` VALUES ('1343890768300998656', 'CG1343890674705104896', 58, 20, 10.00, 200.00, '23', '32', '柯子肉', '1', '1', 10, 1, 'g', 'kzr');
INSERT INTO `stock_purchase_item` VALUES ('1343890768309387264', 'CG1343890674705104896', 55, 20, 10.00, 200.00, '23', '32', '海金沙', '1', '1', 10, 1, 'g', 'hjs');
INSERT INTO `stock_purchase_item` VALUES ('1343890768321970176', 'CG1343890674705104896', 53, 20, 10.00, 200.00, '23', '32', '蜜瓜蒌子', '1', '1', 10, 1, 'g', 'mgjz');
INSERT INTO `stock_purchase_item` VALUES ('1343890894419525632', 'CG1343890804866940928', 5, 10, 10.00, 100.00, '1', '1', '白果', '1', '1', 1, 1, 'g', 'bg');
INSERT INTO `stock_purchase_item` VALUES ('1343890894427914240', 'CG1343890804866940928', 3, 10, 10.00, 100.00, '1', '1', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1343890894436302848', 'CG1343890804866940928', 7, 10, 10.00, 100.00, '1', '1', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1343890983170998272', 'CG1343890917093933056', 5, 40, 40.00, 1600.00, '4', '4', '白果', '1', '1', 1, 1, 'g', 'bg');
INSERT INTO `stock_purchase_item` VALUES ('1343890983183581184', 'CG1343890917093933056', 7, 40, 40.00, 1600.00, '4', '4', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1343890983200358400', 'CG1343890917093933056', 3, 40, 40.00, 1600.00, '4', '4', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1405068972897992704', 'CG1405066598313754624', 1, 40, 10.00, 400.00, '1234', '优先处理', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1405068972948324352', 'CG1405066598313754624', 6, 10, 10.00, 100.00, '1234', '优先处理', '白芨', '1', '1', 1, 1, 'g', 'bj');
INSERT INTO `stock_purchase_item` VALUES ('1405068972960907264', 'CG1405066598313754624', 7, 10, 10.00, 100.00, '1234', '优先处理', '白芍', '1', '1', 1, 1, 'g', 'bs');
INSERT INTO `stock_purchase_item` VALUES ('1405068972977684480', 'CG1405066598313754624', 3, 10, 40.00, 400.00, '1234', '优先处理', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454760942742142976', 'CG1454760757886582784', 1, 1, 3.00, 3.00, '', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454760942767308800', 'CG1454760757886582784', 2, 1, 3.00, 3.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454760942771503104', 'CG1454760757886582784', 3, 1, 3.00, 3.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454779192578277376', 'CG1454777311080611840', 2, 3, 5.00, 15.00, '213', '22', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454781860751212544', 'CG1454781678533869568', 1, 2, 3.00, 6.00, '', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454781860776378368', 'CG1454781678533869568', 3, 2, 3.00, 6.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454781960487567360', 'CG1454781919068815360', 1, 1, 0.00, 0.00, '', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454781960491761664', 'CG1454781919068815360', 2, 1, 0.00, 0.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454782400130318336', 'CG1454782371504193536', 2, 1, 0.00, 0.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454782400147095552', 'CG1454782371504193536', 3, 1, 0.00, 0.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454783701786427392', 'CG1454783552314015744', 13, 4, 6.00, 24.00, '12', '2', '金钱白花蛇', '1', '1', 3, 1, '条', 'jqbhs');
INSERT INTO `stock_purchase_item` VALUES ('1454783701794816000', 'CG1454783552314015744', 12, 4, 6.00, 24.00, '12', '2', '制白附子', '1', '1', 1, 1, 'g', 'zbfz');
INSERT INTO `stock_purchase_item` VALUES ('1454786386677858304', 'CG1454786327303290880', 2, 3, 5.00, 15.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454786386682052608', 'CG1454786327303290880', 3, 3, 5.00, 15.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454786484505804800', 'CG1454786419066273792', 3, 3, 6.00, 18.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454786484509999104', 'CG1454786419066273792', 4, 3, 6.00, 18.00, '', '', '白蔹', '1', '1', 1, 1, 'g', 'bl');
INSERT INTO `stock_purchase_item` VALUES ('1454789065357524992', 'CG1454788959577178112', 1, 3, 11.00, 33.00, '11', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454789065361719296', 'CG1454788959577178112', 2, 3, 11.00, 33.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454789983062851584', 'CG1454789934652194816', 1, 1, 0.00, 0.00, '', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454789983067045888', 'CG1454789934652194816', 2, 1, 0.00, 0.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454790182711721984', 'CG1454790146573598720', 4, 1, 0.00, 0.00, '', '', '白蔹', '1', '1', 1, 1, 'g', 'bl');
INSERT INTO `stock_purchase_item` VALUES ('1454790182753665024', 'CG1454790146573598720', 6, 1, 0.00, 0.00, '', '', '白芨', '1', '1', 1, 1, 'g', 'bj');
INSERT INTO `stock_purchase_item` VALUES ('1454790962789351424', 'CG1454790931227213824', 5, 1, 0.00, 0.00, '', '', '白果', '1', '1', 1, 1, 'g', 'bg');
INSERT INTO `stock_purchase_item` VALUES ('1454790962801934336', 'CG1454790931227213824', 6, 1, 0.00, 0.00, '', '', '白芨', '1', '1', 1, 1, 'g', 'bj');
INSERT INTO `stock_purchase_item` VALUES ('1454791685539233792', 'CG1454791648713244672', 3, 1, 0.00, 0.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454791685543428096', 'CG1454791648713244672', 4, 1, 0.00, 0.00, '', '', '白蔹', '1', '1', 1, 1, 'g', 'bl');
INSERT INTO `stock_purchase_item` VALUES ('1454792200440381440', 'CG1454792168265875456', 2, 1, 0.00, 0.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454792200448770048', 'CG1454792168265875456', 3, 1, 0.00, 0.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454794588672884736', 'CG1454794530724380672', 1, 3, 5.00, 15.00, '', '', '阿胶珠', '1', '1', 1, 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1454794588681273344', 'CG1454794530724380672', 3, 3, 5.00, 15.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454795003527299072', 'CG1454794926570209280', 2, 3, 5.00, 15.00, '', '', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454795003531493376', 'CG1454794926570209280', 3, 3, 5.00, 15.00, '', '', '制巴戟天', '1', '1', 1, 1, 'g', 'zbjt');
INSERT INTO `stock_purchase_item` VALUES ('1454801618896814080', 'CG1454801546314383360', 2, 3, 6.00, 18.00, '1231', '1231', '醋艾炭', '1', '1', 2, 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1454801618934562816', 'CG1454801546314383360', 4, 3, 6.00, 18.00, '1231', '1231', '白蔹', '1', '1', 1, 1, 'g', 'bl');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门科室id',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `reg_number` int(11) NULL DEFAULT 0 COMMENT '挂号编号',
  `dept_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科室编号',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `dept_leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `leader_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门/科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (101, '内科', 18, 'HIS-NK', 1, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (102, '外科', 0, 'HIS-WK', 2, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (103, '儿科', 0, 'HIS-EK', 3, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (104, '妇科', 0, 'HIS-FK', 4, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (105, '眼科', 0, 'HIS-YK', 5, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (106, '耳鼻侯科', 0, 'HIS-EBHK', 6, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (107, '口腔科', 0, 'HIS-KQK', 7, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (108, '皮肤科', 0, 'HIS-PFK', 8, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (109, '其它', 0, 'HIS-OTHER', 9, 'sky', '15902738715', '0', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '1', '性别男', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '0', '性别女', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '0', '性别未知', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (4, 1, '正常', '0', 'sys_normal_disable', '0', '正常状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (5, 2, '停用', '1', 'sys_normal_disable', '0', '停用状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (6, 1, '是', 'Y', 'sys_yes_no', '0', '系统默认是', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (7, 2, '否', 'N', 'sys_yes_no', '0', '系统默认否', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (8, 1, '成功', '0', 'sys_common_status', '0', '成功状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (9, 2, '失败', '1', 'sys_common_status', '0', '失败状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (10, 1, '专科', '1', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (11, 2, '本科', '2', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (12, 3, '研究生', '3', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (13, 4, '博士', '4', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (14, 5, '博士后', '5', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (15, 6, '研究员', '6', 'sys_user_background', '0', '用户背景', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (16, 1, '主任医师', '1', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (17, 2, '副主任医师', '2', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (18, 3, '医师', '3', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (19, 4, '助理医师', '4', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (20, 5, '实习医师', '5', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (21, 6, '主管护士', '6', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (22, 7, '护士', '7', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (23, 8, '其它', '8', 'sys_user_level', '0', '用户级别', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (29, 1, '未提交', '1', 'his_order_status', '0', '入库单状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (30, 2, '待审核', '2', 'his_order_status', '0', '入库单状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (31, 3, '审核通过', '3', 'his_order_status', '0', '入库单状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (32, 4, '审核失败', '4', 'his_order_status', '0', '入库单状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (33, 5, '作废', '5', 'his_order_status', '0', '入库单状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (34, 6, '入库成功', '6', 'his_order_status', '0', '入库成功', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (36, 1, '通知', '0', 'sys_notice_type', '0', '通知状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (37, 2, '公告', '1', 'sys_notice_type', '0', '公告状态', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (38, 1, '系统用户', '0', 'sys_user_type', '0', '系统用户', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (39, 0, '患者用户', '1', 'sys_user_type', '0', '患者用户', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (40, 1, '新增', '1', 'sys_oper_type', '0', '新增', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (41, 2, '修改', '2', 'sys_oper_type', '0', '修改', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (42, 3, '删除', '3', 'sys_oper_type', '0', '删除', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (43, 4, '授权', '4', 'sys_oper_type', '0', '授权', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (44, 5, '导出', '5', 'sys_oper_type', '0', '导出', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (45, 6, '导入', '6', 'sys_oper_type', '0', '导入', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (46, 0, '退出', '7', 'sys_oper_type', '0', '退出', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (47, 8, '清空数据', '8', 'sys_oper_type', '0', '清空数据', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (48, 1, '拍片类', '1', 'his_inspection_type', '0', '拍片类', '超级管理员', '2021-03-11 09:23:25', '超级管理员', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (49, 2, '化验类', '2', 'his_inspection_type', '0', '化验类', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (50, 1, '中药处方', '1', 'his_prescription_type', '0', '中药处方', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (51, 2, '西药处方', '2', 'his_prescription_type', '0', '西药处方', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (52, 1, '中草药', '1', 'his_medicines_type', '0', '中草药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (53, 2, '儿科用药', '2', 'his_medicines_type', '0', '儿科用药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (54, 3, '耳鼻喉科用药', '3', 'his_medicines_type', '0', '耳鼻喉科用药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (55, 4, '抗生素类抗感染药物', '4', 'his_medicines_type', '0', '抗生素类抗感染药物', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (56, 5, '妇科用药', '5', 'his_medicines_type', '0', '妇科用药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (57, 6, '骨伤科用药', '6', 'his_medicines_type', '0', '骨伤科用药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (58, 7, '呼吸系统用药物', '7', 'his_medicines_type', '0', '呼吸系统用药物', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (59, 8, '激素类药', '8', 'his_medicines_type', '0', '激素类药', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (60, 9, '解热镇痛药物', '9', 'his_medicines_type', '0', '解热镇痛药物', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (61, 10, '抗肿瘤药物', '10', 'his_medicines_type', '0', '抗肿瘤药物', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (63, 1, '门诊', '1', 'his_scheduling_type', '0', '门诊', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (64, 2, '急诊', '2', 'his_scheduling_type', '0', '急诊', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (65, 1, '上午', '1', 'his_subsection_type', '0', '上午', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (66, 2, '下午', '2', 'his_subsection_type', '0', '下午', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (67, 3, '晚上', '3', 'his_subsection_type', '0', '晚上', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (68, 1, '未完善', '0', 'his_patient_msg_final', '0', '未完善', '超级管理员', '2021-03-11 09:23:25', '超级管理员', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (69, 2, '已完善', '1', 'his_patient_msg_final', '0', '已完善', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (70, 1, '未收费', '0', 'his_registration_status', '0', '未收费', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (71, 2, '待就诊', '1', 'his_registration_status', '0', '待就诊', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (72, 3, '就诊中', '2', 'his_registration_status', '0', '就诊中', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (73, 4, '就诊完成', '3', 'his_registration_status', '0', '就诊完成', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (74, 5, '已退号', '4', 'his_registration_status', '0', '已退号', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (75, 6, '作废', '5', 'his_registration_status', '0', '作废', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (76, 1, '初诊', '0', 'his_receive_type', '0', '初诊', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (77, 2, '复诊', '1', 'his_receive_type', '0', '复诊', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (78, 1, '否', '0', 'his_contagious_status', '0', '否', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (79, 2, '是', '1', 'his_contagious_status', '0', '是', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (80, 1, '未支付', '0', 'his_order_details_status', '0', '未支付', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (81, 2, '已支付', '1', 'his_order_details_status', '0', '已支付', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (82, 3, '已退费', '2', 'his_order_details_status', '0', '已退费', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (83, 4, '已完成', '3', 'his_order_details_status', '0', '已完成=已检查和已发药', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (84, 1, '检测中', '0', 'his_check_result_status', '0', '检测中', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (85, 2, '检测完成', '1', 'his_check_result_status', '0', '检测完成', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (86, 1, '未支付', '0', 'his_order_charge_status', '0', '未支付', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (87, 2, '支付成功', '1', 'his_order_charge_status', '0', '支付成功', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (88, 3, '支付超时', '2', 'his_order_charge_status', '0', '支付超时', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (89, 4, '支付失败', '3', 'his_order_charge_status', '0', '支付失败', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (90, 1, '未退费', '0', 'his_backfee_status', '0', '未退费', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (91, 2, '已退费', '1', 'his_backfee_status', '0', '已退费', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (92, 3, '退费失败', '2', 'his_backfee_status', '0', '退费失败', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (93, 1, '现金', '0', 'his_pay_type_status', '0', '现金', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');
INSERT INTO `sys_dict_data` VALUES (94, 2, '支付宝', '1', 'his_pay_type_status', '0', '支付宝', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '系统状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统是否', 'sys_yes_no', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (4, '系统状态', 'sys_common_status', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (5, '学历', 'sys_user_background', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '学历列表');
INSERT INTO `sys_dict_type` VALUES (6, '医生级别', 'sys_user_level', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '医生级别列表');
INSERT INTO `sys_dict_type` VALUES (7, '入库单状态', 'his_order_status', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '入库单状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知类型', 'sys_notice_type', '0', 'admin', '2021-03-11 09:23:25', 'admin', '2021-03-11 09:23:25', '通知类型');
INSERT INTO `sys_dict_type` VALUES (9, '用户类型', 'sys_user_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '用户类型');
INSERT INTO `sys_dict_type` VALUES (10, '操作类型', 'sys_oper_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '操作日志类型');
INSERT INTO `sys_dict_type` VALUES (11, '检查项目类型', 'his_inspection_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '检查项目类型');
INSERT INTO `sys_dict_type` VALUES (18, '处方类型', 'his_prescription_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '处方类型');
INSERT INTO `sys_dict_type` VALUES (19, '药品分类', 'his_medicines_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '药品分类');
INSERT INTO `sys_dict_type` VALUES (21, '排班类型', 'his_scheduling_type', '0', '超级管理员', '2021-03-11 09:23:25', '超级管理员', '2021-03-11 09:23:25', '排班类型');
INSERT INTO `sys_dict_type` VALUES (22, '排班时段', 'his_subsection_type', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '排班时段');
INSERT INTO `sys_dict_type` VALUES (23, '患者信息完善状态', 'his_patient_msg_final', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '患者信息完善状态');
INSERT INTO `sys_dict_type` VALUES (24, '挂号单类型', 'his_registration_status', '0', '超级管理员', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '挂号单类型');
INSERT INTO `sys_dict_type` VALUES (25, '接诊类型', 'his_receive_type', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '接诊类型');
INSERT INTO `sys_dict_type` VALUES (26, '是否传染', 'his_contagious_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '是否传染');
INSERT INTO `sys_dict_type` VALUES (27, '订单和处方详情状态', 'his_order_details_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '处方详情支付状态');
INSERT INTO `sys_dict_type` VALUES (28, '检查状态', 'his_check_result_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '检查状态');
INSERT INTO `sys_dict_type` VALUES (29, '订单状态', 'his_order_charge_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '订单状态');
INSERT INTO `sys_dict_type` VALUES (30, '退费状态', 'his_backfee_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '退费表退费状态');
INSERT INTO `sys_dict_type` VALUES (31, '收费退费类型', 'his_pay_type_status', '0', '扁鹊', '2021-03-11 09:23:25', '', '2021-03-11 09:23:25', '收费退费类型');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名称',
  `login_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登陆账号',
  `ip_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `login_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）字典表',
  `login_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登陆类型0系统用户1患者用户 字典表',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES (1, '超级管理员', '110', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-27 08:09:41');
INSERT INTO `sys_login_info` VALUES (2, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 10:35:38');
INSERT INTO `sys_login_info` VALUES (3, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 10:45:31');
INSERT INTO `sys_login_info` VALUES (4, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 10:48:01');
INSERT INTO `sys_login_info` VALUES (5, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 10:56:50');
INSERT INTO `sys_login_info` VALUES (6, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 11:45:24');
INSERT INTO `sys_login_info` VALUES (7, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:02:19');
INSERT INTO `sys_login_info` VALUES (8, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:31:36');
INSERT INTO `sys_login_info` VALUES (9, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:39:29');
INSERT INTO `sys_login_info` VALUES (10, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:40:09');
INSERT INTO `sys_login_info` VALUES (11, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:42:34');
INSERT INTO `sys_login_info` VALUES (12, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:44:18');
INSERT INTO `sys_login_info` VALUES (13, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:47:30');
INSERT INTO `sys_login_info` VALUES (14, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 12:54:17');
INSERT INTO `sys_login_info` VALUES (15, '皇甫谧', '13888001005', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:00:05');
INSERT INTO `sys_login_info` VALUES (16, '皇甫谧', '13888001005', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:00:34');
INSERT INTO `sys_login_info` VALUES (17, '皇甫谧', '13888001005', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:08:25');
INSERT INTO `sys_login_info` VALUES (18, '扁鹊', '13888001001', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:14:25');
INSERT INTO `sys_login_info` VALUES (19, '超级管理员', '110', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:14:45');
INSERT INTO `sys_login_info` VALUES (20, '超级管理员', '110', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-10-31 13:21:49');
INSERT INTO `sys_login_info` VALUES (21, '超级管理员', '110', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '0', '登录成功', '2021-12-01 01:20:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `parent_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父节点ID集合',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `percode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, NULL, '系统管理', 'M', NULL, '/system', '系统管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (3, 0, NULL, '药品进销存', 'M', NULL, '/stock', '药品进销存', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (7, 1, '1', '科室管理', 'C', NULL, '/system/dept', '科室管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (8, 1, '1', '用户管理', 'C', NULL, '/system/user', '用户管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (9, 1, '1', '角色管理', 'C', NULL, '/system/role', '角色管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (10, 1, '1', '菜单管理', 'C', NULL, '/system/menu', '菜单管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (11, 1, '1', '字典管理', 'C', NULL, '/system/dict', '字典管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (12, 1, '1', '通知公告', 'C', NULL, '/system/notice', '通知公告', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (13, 1, '1', '登陆日志管理', 'C', NULL, '/system/log_login', '登陆日志管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (14, 1, '1', '操作日志管理', 'C', NULL, '/system/log_opt', '操作日志管理', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (22, 3, '3', '厂家信息维护', 'C', NULL, '/stock/producter', '厂家信息维护', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (23, 3, '3', '药品信息维护', 'C', NULL, '/stock/medicinal', '药品信息维护', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (24, 3, '3', '供应商维护', 'C', NULL, '/stock/provider', '供应商维护', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (25, 3, '3', '采购入库', 'C', NULL, '/stock/purchase', '采购入库', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (26, 3, '3', '入库审核', 'C', NULL, '/stock/examine', '入库审核', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (27, 3, '3', '库存查询', 'C', NULL, '/stock/inventory', '库存查询', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '公告功能测试', '1', 'HOS系统于2020年11月1日开始开发', '1', 'sky', '2021-03-11 09:23:25', 'sky', NULL, '系统上线成功！');
INSERT INTO `sys_notice` VALUES (4, '系统模块开始测试', '0', '1. ~~## ***# 测试公告模块！**~~', '0', 'sky', '2021-04-22 09:23:25', 'sky', NULL, '测试');
INSERT INTO `sys_notice` VALUES (5, '系统模块完成', '0', '一切正常', '0', 'sky', '2021-04-13 09:23:25', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454760757886582784\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":9},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 10:43:32');
INSERT INTO `sys_oper_log` VALUES (2, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454760757886582784\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":9},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":3,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 10:43:34');
INSERT INTO `sys_oper_log` VALUES (3, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454760757886582784', '127.0.0.1', '内网IP', 'CG1454760757886582784', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 10:43:50');
INSERT INTO `sys_oper_log` VALUES (4, '采购单管理--入库', '3', 'com.sky.controller.erp.PurchaseController.doInventory()', 'POST', 1, '扁鹊', '/erp/purchase/doInventory/CG1454760757886582784', '127.0.0.1', '内网IP', 'CG1454760757886582784', '{\"msg\":\"采购单【CG1454760757886582784】没有审核通过，不能入库\",\"code\":400}', '0', '', '2021-10-31 10:43:58');
INSERT INTO `sys_oper_log` VALUES (5, '采购单管理--审核通过', '3', 'com.sky.controller.erp.PurchaseController.auditPass()', 'POST', 1, '扁鹊', '/erp/purchase/auditPass/CG1454760757886582784', '127.0.0.1', '内网IP', 'CG1454760757886582784', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 10:44:33');
INSERT INTO `sys_oper_log` VALUES (6, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 11:48:55');
INSERT INTO `sys_oper_log` VALUES (7, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:48:57');
INSERT INTO `sys_oper_log` VALUES (8, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:49:04');
INSERT INTO `sys_oper_log` VALUES (9, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:49:28');
INSERT INTO `sys_oper_log` VALUES (10, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:49:50');
INSERT INTO `sys_oper_log` VALUES (11, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:50:47');
INSERT INTO `sys_oper_log` VALUES (12, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"22\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"213\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:51:05');
INSERT INTO `sys_oper_log` VALUES (13, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"22\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"213\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', 'null', '1', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\norg.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`medicine-erp`.`stock_purchase_item`, CONSTRAINT `item_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `stock_purchase` (`purchase_id`))\r\n### The error may exist in com/sky/mapper/PurchaseMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM stock_purchase WHERE purchase_id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationExc', '2021-10-31 11:54:43');
INSERT INTO `sys_oper_log` VALUES (14, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454777311080611840\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":15},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"22\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"213\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 11:56:03');
INSERT INTO `sys_oper_log` VALUES (15, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454777311080611840', '127.0.0.1', '内网IP', 'CG1454777311080611840', '{\"msg\":\"当前单据不是【未提交】或【审核失败】状态，不能提交审核\",\"code\":400}', '0', '', '2021-10-31 11:56:27');
INSERT INTO `sys_oper_log` VALUES (16, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454781678533869568\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"101\",\"purchaseTradeTotalAmount\":12},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":6,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":2},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":6,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":2}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:06:17');
INSERT INTO `sys_oper_log` VALUES (17, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454781678533869568', '127.0.0.1', '内网IP', 'CG1454781678533869568', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:06:32');
INSERT INTO `sys_oper_log` VALUES (18, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454781678533869568\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"101\",\"purchaseTradeTotalAmount\":12,\"status\":\"1\"},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"purchaseId\":\"CG1454781678533869568\",\"remark\":\"\",\"tradeTotalAmount\":6,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":2},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"purchaseId\":\"CG1454781678533869568\",\"remark\":\"\",\"tradeTotalAmount\":6,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":3,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":2}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:06:39');
INSERT INTO `sys_oper_log` VALUES (19, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454781919068815360\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:07:03');
INSERT INTO `sys_oper_log` VALUES (20, '采购单管理--作废', '3', 'com.sky.controller.erp.PurchaseController.doInvalid()', 'POST', 1, '扁鹊', '/erp/purchase/doInvalid/CG1454781919068815360', '127.0.0.1', '内网IP', 'CG1454781919068815360', '{\"msg\":\"当前单据不是【未提交】或【审核失败】状态，不能作废\",\"code\":400}', '0', '', '2021-10-31 12:07:12');
INSERT INTO `sys_oper_log` VALUES (21, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454782371504193536\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:08:47');
INSERT INTO `sys_oper_log` VALUES (22, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454782371504193536', '127.0.0.1', '内网IP', 'CG1454782371504193536', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:08:53');
INSERT INTO `sys_oper_log` VALUES (23, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454782371504193536', '127.0.0.1', '内网IP', 'CG1454782371504193536', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:09:02');
INSERT INTO `sys_oper_log` VALUES (24, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454782371504193536', '127.0.0.1', '内网IP', 'CG1454782371504193536', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:09:23');
INSERT INTO `sys_oper_log` VALUES (25, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454782371504193536', '127.0.0.1', '内网IP', 'CG1454782371504193536', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:10:11');
INSERT INTO `sys_oper_log` VALUES (26, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454783552314015744\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"103\",\"purchaseTradeTotalAmount\":48},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"金钱白花蛇\",\"keywords\":\"jqbhs\",\"remark\":\"2\",\"tradeTotalAmount\":24,\"medicinesId\":\"13\",\"unit\":\"条\",\"medicinesType\":\"1\",\"producerId\":\"3\",\"tradePrice\":6,\"batchNumber\":\"12\",\"conversion\":1,\"purchaseNumber\":4},{\"prescriptionType\":\"1\",\"medicinesName\":\"制白附子\",\"keywords\":\"zbfz\",\"remark\":\"2\",\"tradeTotalAmount\":24,\"medicinesId\":\"12\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":6,\"batchNumber\":\"12\",\"conversion\":1,\"purchaseNumber\":4}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:13:58');
INSERT INTO `sys_oper_log` VALUES (27, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454783552314015744', '127.0.0.1', '内网IP', 'CG1454783552314015744', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:14:07');
INSERT INTO `sys_oper_log` VALUES (28, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454783552314015744', '127.0.0.1', '内网IP', 'CG1454783552314015744', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:14:48');
INSERT INTO `sys_oper_log` VALUES (29, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454783552314015744', '127.0.0.1', '内网IP', 'CG1454783552314015744', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:18:35');
INSERT INTO `sys_oper_log` VALUES (30, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454783552314015744', '127.0.0.1', '内网IP', 'CG1454783552314015744', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:19:40');
INSERT INTO `sys_oper_log` VALUES (31, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454783552314015744', '127.0.0.1', '内网IP', 'CG1454783552314015744', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:21:24');
INSERT INTO `sys_oper_log` VALUES (32, '采购单管理--审核通过', '3', 'com.sky.controller.erp.PurchaseController.auditPass()', 'POST', 1, '扁鹊', '/erp/purchase/auditPass/CG1343890473672114176', '127.0.0.1', '内网IP', 'CG1343890473672114176', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:04');
INSERT INTO `sys_oper_log` VALUES (33, '采购单管理--审核不通过', '3', 'com.sky.controller.erp.PurchaseController.auditNoPass()', 'POST', 1, '扁鹊', '/erp/purchase/auditNoPass/CG1343890572859015168/null', '127.0.0.1', '内网IP', 'CG1343890572859015168 null', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:08');
INSERT INTO `sys_oper_log` VALUES (34, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454782371504193536', '127.0.0.1', '内网IP', 'CG1454782371504193536', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:18');
INSERT INTO `sys_oper_log` VALUES (35, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454786327303290880\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:36');
INSERT INTO `sys_oper_log` VALUES (36, '采购单管理--添加并提交审核采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchaseToAudit()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchaseToAudit/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454786327303290880\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:38');
INSERT INTO `sys_oper_log` VALUES (37, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454786419066273792\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"白蔹\",\"keywords\":\"bl\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"4\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:24:53');
INSERT INTO `sys_oper_log` VALUES (38, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454786419066273792\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":36},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":18,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":6,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"白蔹\",\"keywords\":\"bl\",\"remark\":\"\",\"tradeTotalAmount\":18,\"medicinesId\":\"4\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":6,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:25:01');
INSERT INTO `sys_oper_log` VALUES (39, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454786419066273792', '127.0.0.1', '内网IP', 'CG1454786419066273792', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:25:10');
INSERT INTO `sys_oper_log` VALUES (40, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454788959577178112\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":66},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":33,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":11,\"batchNumber\":\"11\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":33,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":11,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:35:17');
INSERT INTO `sys_oper_log` VALUES (41, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:35:28');
INSERT INTO `sys_oper_log` VALUES (42, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:35:42');
INSERT INTO `sys_oper_log` VALUES (43, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:35:59');
INSERT INTO `sys_oper_log` VALUES (44, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:36:02');
INSERT INTO `sys_oper_log` VALUES (45, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:36:03');
INSERT INTO `sys_oper_log` VALUES (46, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:36:05');
INSERT INTO `sys_oper_log` VALUES (47, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:36:08');
INSERT INTO `sys_oper_log` VALUES (48, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454788959577178112', '127.0.0.1', '内网IP', 'CG1454788959577178112', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:37:28');
INSERT INTO `sys_oper_log` VALUES (49, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454789934652194816\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"106\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:38:55');
INSERT INTO `sys_oper_log` VALUES (50, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454789934652194816', '127.0.0.1', '内网IP', 'CG1454789934652194816', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:39:20');
INSERT INTO `sys_oper_log` VALUES (51, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454790146573598720\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"白蔹\",\"keywords\":\"bl\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"4\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"白芨\",\"keywords\":\"bj\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"6\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:39:43');
INSERT INTO `sys_oper_log` VALUES (52, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790146573598720', '127.0.0.1', '内网IP', 'CG1454790146573598720', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:39:48');
INSERT INTO `sys_oper_log` VALUES (53, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454790931227213824\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"白果\",\"keywords\":\"bg\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"5\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"白芨\",\"keywords\":\"bj\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"6\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:42:49');
INSERT INTO `sys_oper_log` VALUES (54, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:42:56');
INSERT INTO `sys_oper_log` VALUES (55, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:43:09');
INSERT INTO `sys_oper_log` VALUES (56, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:43:12');
INSERT INTO `sys_oper_log` VALUES (57, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:43:13');
INSERT INTO `sys_oper_log` VALUES (58, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"操作失败\",\"code\":400}', '0', '', '2021-10-31 12:44:31');
INSERT INTO `sys_oper_log` VALUES (59, '采购单管理--作废', '3', 'com.sky.controller.erp.PurchaseController.doInvalid()', 'POST', 1, '扁鹊', '/erp/purchase/doInvalid/CG1454790931227213824', '127.0.0.1', '内网IP', 'CG1454790931227213824', '{\"msg\":\"当前单据不是【未提交】或【审核失败】状态，不能作废\",\"code\":400}', '0', '', '2021-10-31 12:45:27');
INSERT INTO `sys_oper_log` VALUES (60, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454791648713244672\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"103\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"白蔹\",\"keywords\":\"bl\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"4\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:45:41');
INSERT INTO `sys_oper_log` VALUES (61, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454791648713244672', '127.0.0.1', '内网IP', 'CG1454791648713244672', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:45:46');
INSERT INTO `sys_oper_log` VALUES (62, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454792168265875456\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"103\",\"purchaseTradeTotalAmount\":0},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":0,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":0,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":1}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:47:44');
INSERT INTO `sys_oper_log` VALUES (63, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454792168265875456', '127.0.0.1', '内网IP', 'CG1454792168265875456', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:47:49');
INSERT INTO `sys_oper_log` VALUES (64, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454794530724380672\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"106\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"阿胶珠\",\"keywords\":\"ajz\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"1\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:57:13');
INSERT INTO `sys_oper_log` VALUES (65, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454794530724380672', '127.0.0.1', '内网IP', 'CG1454794530724380672', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:57:24');
INSERT INTO `sys_oper_log` VALUES (66, '采购单管理--审核不通过', '3', 'com.sky.controller.erp.PurchaseController.auditNoPass()', 'POST', 1, '扁鹊', '/erp/purchase/auditNoPass/CG1454794530724380672/222', '127.0.0.1', '内网IP', 'CG1454794530724380672 222', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:57:57');
INSERT INTO `sys_oper_log` VALUES (67, '采购单管理--作废', '3', 'com.sky.controller.erp.PurchaseController.doInvalid()', 'POST', 1, '扁鹊', '/erp/purchase/doInvalid/CG1454794530724380672', '127.0.0.1', '内网IP', 'CG1454794530724380672', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:58:09');
INSERT INTO `sys_oper_log` VALUES (68, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454794530724380672', '127.0.0.1', '内网IP', 'CG1454794530724380672', '{\"msg\":\"当前单据不是【未提交】或【审核失败】状态，不能提交审核\",\"code\":400}', '0', '', '2021-10-31 12:58:26');
INSERT INTO `sys_oper_log` VALUES (69, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '扁鹊', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454794926570209280\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"扁鹊\",\"userId\":2},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":30},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"制巴戟天\",\"keywords\":\"zbjt\",\"remark\":\"\",\"tradeTotalAmount\":15,\"medicinesId\":\"3\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":5,\"batchNumber\":\"\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:58:52');
INSERT INTO `sys_oper_log` VALUES (70, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '扁鹊', '/erp/purchase/doAudit/CG1454794926570209280', '127.0.0.1', '内网IP', 'CG1454794926570209280', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:58:58');
INSERT INTO `sys_oper_log` VALUES (71, '采购单管理--审核通过', '3', 'com.sky.controller.erp.PurchaseController.auditPass()', 'POST', 1, '扁鹊', '/erp/purchase/auditPass/CG1454794926570209280', '127.0.0.1', '内网IP', 'CG1454794926570209280', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:59:08');
INSERT INTO `sys_oper_log` VALUES (72, '采购单管理--入库', '3', 'com.sky.controller.erp.PurchaseController.doInventory()', 'POST', 1, '扁鹊', '/erp/purchase/doInventory/CG1454794926570209280', '127.0.0.1', '内网IP', 'CG1454794926570209280', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 12:59:16');
INSERT INTO `sys_oper_log` VALUES (73, '采购单管理--暂存采购单位和详情数据', '1', 'com.sky.controller.erp.PurchaseController.addPurchase()', 'POST', 1, '超级管理员', '/erp/purchase/addPurchase/', '127.0.0.1', '内网IP', '{\"purchaseDto\":{\"purchaseId\":\"CG1454801546314383360\",\"pageSize\":10,\"pageNum\":1,\"simpleUser\":{\"userName\":\"超级管理员\",\"userId\":1},\"providerId\":\"102\",\"purchaseTradeTotalAmount\":36},\"purchaseItemDtos\":[{\"prescriptionType\":\"1\",\"medicinesName\":\"醋艾炭\",\"keywords\":\"cat\",\"remark\":\"1231\",\"tradeTotalAmount\":18,\"medicinesId\":\"2\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"2\",\"tradePrice\":6,\"batchNumber\":\"1231\",\"conversion\":1,\"purchaseNumber\":3},{\"prescriptionType\":\"1\",\"medicinesName\":\"白蔹\",\"keywords\":\"bl\",\"remark\":\"1231\",\"tradeTotalAmount\":18,\"medicinesId\":\"4\",\"unit\":\"g\",\"medicinesType\":\"1\",\"producerId\":\"1\",\"tradePrice\":6,\"batchNumber\":\"1231\",\"conversion\":1,\"purchaseNumber\":3}],\"pageSize\":10,\"pageNum\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 13:25:10');
INSERT INTO `sys_oper_log` VALUES (74, '采购单管理--提交审核', '3', 'com.sky.controller.erp.PurchaseController.doAudit()', 'POST', 1, '超级管理员', '/erp/purchase/doAudit/CG1454801546314383360', '127.0.0.1', '内网IP', 'CG1454801546314383360', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 13:25:18');
INSERT INTO `sys_oper_log` VALUES (75, '采购单管理--审核通过', '3', 'com.sky.controller.erp.PurchaseController.auditPass()', 'POST', 1, '超级管理员', '/erp/purchase/auditPass/CG1454801546314383360', '127.0.0.1', '内网IP', 'CG1454801546314383360', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 13:25:38');
INSERT INTO `sys_oper_log` VALUES (76, '采购单管理--入库', '3', 'com.sky.controller.erp.PurchaseController.doInventory()', 'POST', 1, '超级管理员', '/erp/purchase/doInventory/CG1454801546314383360', '127.0.0.1', '内网IP', 'CG1454801546314383360', '{\"msg\":\"操作成功\",\"code\":200}', '0', '', '2021-10-31 13:25:46');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色权限编码',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'role:admin', 1, '管理员', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (2, '医生', 'role:doctor', 2, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (3, '护士', 'role:hs', 3, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (4, '挂号员', 'role:ghy', 4, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (5, '收费员', 'role:sfy', 5, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (6, '发药员', 'role:fyy', 6, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (7, '财务', 'role:cw', 7, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (8, '其他人员', 'role:other', 8, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (9, '库存管理人员', 'role:kg', 9, '普通角色', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '扁鹊', '超级管理员', '1');
INSERT INTO `sys_role` VALUES (10, '宣传人员', 'role:xc', 10, '宣传部', '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `sys_role` VALUES (11, '计划人员', 'role:jhry', 11, NULL, '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');
INSERT INTO `sys_role` VALUES (12, '采购人员', 'role:cgry', 12, NULL, '0', '2021-03-11 09:23:25', '2021-03-11 09:23:25', '超级管理员', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_fk` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_fk2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (9, 3);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (9, 22);
INSERT INTO `sys_role_menu` VALUES (9, 23);
INSERT INTO `sys_role_menu` VALUES (9, 25);
INSERT INTO `sys_role_menu` VALUES (9, 26);
INSERT INTO `sys_role_menu` VALUES (9, 27);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_fk1`(`role_id`) USING BTREE,
  CONSTRAINT `role_fk1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (1, 2);
INSERT INTO `sys_role_user` VALUES (1, 3);
INSERT INTO `sys_role_user` VALUES (5, 5);
INSERT INTO `sys_role_user` VALUES (5, 6);
INSERT INTO `sys_role_user` VALUES (5, 9);
INSERT INTO `sys_role_user` VALUES (6, 9);
INSERT INTO `sys_role_user` VALUES (7, 9);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `user_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '用户类型（0超级用户为 1为系统用户）',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `background` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历 sys_dict_type:sys_user_background',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `strong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '擅长',
  `honor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '荣誉',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `user_rank` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '\r\n医生级别sys_dict_type:sys_user_level',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `union_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户授权登录openid 扩展第三方登陆使用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `salt` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `scheduling_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否需要参与排班0需要,1 不需要',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 109, '超级管理员', '0', '0', 108, '', '6', '110', 'admin@163.com', '全科', '神医', '医学奇才', '8', '47a42ee6006fdf69e53de74cfe29072d', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '扁鹊', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '0');
INSERT INTO `sys_user` VALUES (2, 101, '扁鹊', '1', '1', 22, '', '1', '13888001001', 'his1@163.com', '全科', '神医', '医学奇才', '1', '02f80d33e1e8aad07fa46280b36d0522', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '81BF9FF7C91B47A491B76615E408E234', '0', '0');
INSERT INTO `sys_user` VALUES (3, 102, '李时珍', '1', '1', 18, '', '2', '13888001002', 'his2@163.com', '全科', '神医', '医学奇才', '1', '0cebc3ed9f23cc258ae8c65a56a9ee75', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '93FBC8C44F46480FA6FC115F8E261E81', '0', '0');
INSERT INTO `sys_user` VALUES (4, 103, '孙思邈', '1', '1', 16, '', '3', '13888001003', 'his3@163.com', '全科', '神医', '医学奇才', '1', '8f01277cea0b5db28e6558444cc7987d', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '19035F127290470C8F533FE2FABCA3EE', '0', '0');
INSERT INTO `sys_user` VALUES (5, 104, '华佗', '1', '1', 22, '', '4', '13888001004', 'his4@163.com', '全科', '神医', '医学奇才', '1', '520a5b05dbec9f937f70092e088058e8', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '91D53B3C4B8E40C7BA3613E41546AAE1', '0', '0');
INSERT INTO `sys_user` VALUES (6, 105, '皇甫谧', '1', '1', 36, NULL, '5', '13888001005', 'his5@163.com', '全科', '神医', '医学奇才', '2', 'febeb7fc90866cafa0349de7b0a336e7', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '4EE266FA0935443B9AE3F131DDAF1C80', '0', '0');
INSERT INTO `sys_user` VALUES (7, 106, '林道飞', '1', '1', 45, '', '6', '13888001006', 'his6@163.com', '全科', '神医', '医学奇才', '2', 'f303a4c24323dbb3210c90f2273da20b', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '扁鹊', 'EC46A74E43414EE4A3600F60146096F4', '0', '1');
INSERT INTO `sys_user` VALUES (8, 107, '熊宗立', '1', '1', 28, '', '5', '13888001007', 'his7@163.com', '全科', '神医', '医学奇才', '2', '0aa3e471f4edb47bc5306cc886e0abb2', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'sky', '超级管理员', '9D2252E59A964D888DBD541162FFC1AE', '0', '1');
INSERT INTO `sys_user` VALUES (9, 108, '肖药儿', '1', '0', 99, '', '2', '13888001008', 'his8@163.com', '全科', '神医', '医学奇才', '3', 'a2038c9a1c43b774f75376a924b46ca1', NULL, '127.0.0.1', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', 'admin', '超级管理员', '0FB216BE844C4D688340A13AD27D3427', '0', '1');
INSERT INTO `sys_user` VALUES (10, 109, 'sky', '1', '0', 22, NULL, '2', '13888001009', '123@qq.com', '敲代码,码', '\"码圣\"', '码出人生！', '8', '83b3d1ecc9e5dfe8548c5480035f8c51', NULL, '', '0', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '皇甫谧', '', '2D755C8341F54AB38F60C854CD1BFA7D', '0', '0');
INSERT INTO `sys_user` VALUES (11, 109, 'test', '1', '1', 22, NULL, '2', '11111111111', '111', '11111', '11111', '11111', '8', '25f63feacd2c891dcc95bac02d122e51', NULL, '', '1', NULL, NULL, '2021-03-11 09:23:25', '2021-03-11 09:23:25', '扁鹊', '', 'F9A04B0000A547BC9DC4CFE706F5DC47', '0', '1');

SET FOREIGN_KEY_CHECKS = 1;

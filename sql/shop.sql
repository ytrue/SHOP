/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 12/06/2018 21:01:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//收货人',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//电子邮件',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//收获地址',
  `code` char(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '//邮政编码',
  `tel` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '//电话号码',
  `buildings` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//标志性建筑',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//会员账号',
  `selected` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//是否首选',
  `flag` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//是否是江浙沪',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_address
-- ----------------------------
INSERT INTO `mall_address` VALUES (1, '阳毅', '1151832035@qq.com', '广西桂林', '24324', '223423435', '好看的1', 'admin', 1, 0);
INSERT INTO `mall_address` VALUES (4, '好吃的牛肉', '321312', '2311312', '312313', '123123', '123123', 'admin', 0, 0);
INSERT INTO `mall_address` VALUES (5, '好吃的牛肉', '1151832035@qq.com', '广西桂林', '24324', '213432423', '好看的', '阳毅', 1, 0);

-- ----------------------------
-- Table structure for mall_attr
-- ----------------------------
DROP TABLE IF EXISTS `mall_attr`;
CREATE TABLE `mall_attr`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//属性名称',
  `way` tinyint(1) UNSIGNED NOT NULL COMMENT '//选择方式',
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//属性项目',
  `nav` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_attr
-- ----------------------------
INSERT INTO `mall_attr` VALUES (5, '颜色', 0, '白色|黑色|红色|黄色', '41');
INSERT INTO `mall_attr` VALUES (6, '产地', 0, '日本|美国|法国|中国|英国', '41,42');
INSERT INTO `mall_attr` VALUES (7, '赠品', 1, '好吃的|好玩的|好看的', '41,42,44,45');

-- ----------------------------
-- Table structure for mall_brand
-- ----------------------------
DROP TABLE IF EXISTS `mall_brand`;
CREATE TABLE `mall_brand`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//品牌名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//地址',
  `info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//简介',
  `reg_time` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_brand
-- ----------------------------
INSERT INTO `mall_brand` VALUES (13, '软件研发', 'www.baidu.com', '软件研发', '2017-11-29 19:57:13');
INSERT INTO `mall_brand` VALUES (14, '人工智能', 'www.baidu.com', '人工智能', '2017-11-29 19:57:31');
INSERT INTO `mall_brand` VALUES (16, '陕西苹果', 'www.baidu.com', '陕西苹果', '2017-11-30 16:46:13');
INSERT INTO `mall_brand` VALUES (17, '百色芒果', 'www.baidu.com', '百色芒果', '2017-11-30 16:46:35');
INSERT INTO `mall_brand` VALUES (18, '神户牛肉', 'www.baidu.com', '神户牛肉', '2017-11-30 16:47:40');

-- ----------------------------
-- Table structure for mall_collect
-- ----------------------------
DROP TABLE IF EXISTS `mall_collect`;
CREATE TABLE `mall_collect`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) UNSIGNED NOT NULL,
  `user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_collect
-- ----------------------------
INSERT INTO `mall_collect` VALUES (1, 20, 'admin', '2017-12-20 20:53:20');
INSERT INTO `mall_collect` VALUES (2, 19, 'admin', '2017-12-20 21:01:23');

-- ----------------------------
-- Table structure for mall_commend
-- ----------------------------
DROP TABLE IF EXISTS `mall_commend`;
CREATE TABLE `mall_commend`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `goods_id` int(8) UNSIGNED NOT NULL COMMENT '//商品id',
  `order_id` int(8) UNSIGNED NOT NULL COMMENT '//订单id',
  `star` int(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '//几颗星',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//内容',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//用户',
  `re_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//回复内容',
  `attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//属性',
  `flag` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `date` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_commend
-- ----------------------------
INSERT INTO `mall_commend` VALUES (10, 13, 39, 5, 'wq', 'admin', '', '  颜色:白色;产地:日本;赠品:好吃的;', 0, '2017-12-19 22:33:22');
INSERT INTO `mall_commend` VALUES (11, 13, 40, 5, '11111', 'admin', '', '  颜色:白色;赠品:好吃的;', 0, '2017-12-19 22:34:34');
INSERT INTO `mall_commend` VALUES (12, 13, 41, 5, '111', 'admin', '', '  颜色:白色;赠品:好吃的;', 0, '2017-12-19 22:39:05');
INSERT INTO `mall_commend` VALUES (13, 13, 42, 5, '12231', 'admin', '', '  颜色:白色;赠品:好吃的;', 0, '2017-12-19 22:40:39');
INSERT INTO `mall_commend` VALUES (14, 13, 43, 5, '22222', 'admin', '', '  颜色:白色;赠品:好吃的;', 0, '2017-12-19 22:41:19');

-- ----------------------------
-- Table structure for mall_delivery
-- ----------------------------
DROP TABLE IF EXISTS `mall_delivery`;
CREATE TABLE `mall_delivery`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//快递名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//连接',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//内容',
  `price_in` decimal(10, 2) NULL DEFAULT 0.00,
  `price_out` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `price_add` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `date` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_delivery
-- ----------------------------
INSERT INTO `mall_delivery` VALUES (1, '邮政快递', 'www.chinapost.com.cn', '江浙沪2元起步，省外5元起步，1公斤内，额外的1公斤加1元。', 2.00, 5.00, 1.00, '2017-12-15 15:35:03');
INSERT INTO `mall_delivery` VALUES (2, '顺丰速递', 'www.sf-express.com', '江浙沪4元起步，省外5元起步，1公斤内，额外的1公斤加4元。', 4.00, 5.00, 4.00, '2017-12-15 15:35:43');
INSERT INTO `mall_delivery` VALUES (3, '圆通快递', 'www.yto.net.cn', '江浙沪3元起步，省外5元起步，1公斤内，额外的1公斤加1元。', 3.00, 5.00, 1.00, '2017-12-15 15:36:05');
INSERT INTO `mall_delivery` VALUES (6, '申通快递', 'www.sto.cn', '江浙沪12元起步，省外12元起步，1公斤内，额外的1公斤加11元。', 12.00, 12.00, 11.00, '2017-12-15 22:20:35');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `nav` mediumint(8) UNSIGNED NOT NULL COMMENT '//类型',
  `brand` mediumint(8) UNSIGNED NOT NULL COMMENT '//品牌',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//名称',
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//编号',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//属性',
  `price_sale` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '//销售价',
  `price_market` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '//市场价',
  `keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//关键字',
  `price_cost` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '//成本价',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//计量单位',
  `weight` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '//重量',
  `thumbnail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//大缩略图',
  `thumbnail2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//200*200图片',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//详情',
  `is_up` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//是否上架',
  `is_freight` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//是否免运费',
  `inventory` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//库存',
  `warn_inventory` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//库存告急',
  `service` mediumint(8) UNSIGNED NOT NULL,
  `commendnum` int(8) UNSIGNED NOT NULL COMMENT '//商品的评价数',
  `sales` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//销量',
  `date` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES (12, 41, 16, '陕西好吃的苹果', '3243242342', '  颜色:黑色|红色|黄色;产地:日本|美国|法国|中国|英国', 5.00, 15.00, '苹果|水果|好吃的', 9.00, '斤', 1.00, './uploads/20171211/20171211211515663.jpg', './uploads/20171211/20171211211515663220x220.jpg', '<div id=\"J_DcTopRightWrap\">\r\n	&nbsp;</div>\r\n<div>\r\n	<a name=\"hlg_list_1_18124678_start\"></a></div>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1910146537/TB22p5naM1J.eBjy0FaXXaXeVXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1910146537/TB2uqrxXZHA11Bjy0FiXXckfVXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1910146537/TB2KjjCbxvzQeBjSZFMXXcVfFXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1910146537/TB2F.jwX.bA11BjSspiXXa7EXXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1910146537/TB2jtPwX._C11Bjy1zeXXXtGpXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1910146537/TB2DI2xX7TB11BjSspbXXbhcVXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1910146537/TB2Cs6xX7TB11BjSspbXXbhcVXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1910146537/TB2GIvxXVrB11BjSspjXXciYpXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1910146537/TB2GADwX0YA11Bjy0FhXXbIwVXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1910146537/TB2W7HBX2Tz11Bjy1XcXXapnpXa_!!1910146537.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1910146537/TB2z2wsaVXXXXaJXpXXXXXXXXXX_!!1910146537.jpg\" /></p>\r\n<div>\r\n	<a name=\"hlg_list_5_17546621_start\"></a></div>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<div>\r\n					<div>\r\n						<img alt=\"自定义 20171025\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1910146537/TB28Gn8m6uhSKJjSspdXXc11XXa_!!1910146537.jpg\" usemap=\"#hlgCustomMap_dppgu2_1508938763544\" /><map name=\"hlgCustomMap_dppgu2_1508938763544\"></map></div>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	<a name=\"hlg_list_5_17546621_end\"></a></div>\r\n<div>\r\n	<a name=\"maijsoft_s1_146026_start\"></a></div>\r\n<p style=\"margin: 0;\">\r\n	<img alt=\"\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1910146537/TB27Ig5bhTI8KJjSspiXXbM4FXa_!!1910146537.jpg\" style=\"float: none;margin: 0.0px;\" /></p>\r\n<div>\r\n	<a name=\"maijsoft_s1_146026_end\"></a></div>\r\n<div>\r\n	<a name=\"hlg_list_6_18182380_start\"></a></div>\r\n<p>\r\n	<img alt=\"自定义 20171211\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.7406545.0.i3.6b5501b88QAA9V\" src=\"https://img.alicdn.com/imgextra/i1/1910146537/TB2B5hghZrI8KJjy0FhXXbfnpXa_!!1910146537.jpg\" style=\"\" usemap=\"#hlgCustomMap_ruwcrzih14s2k4d20rudi_1512984685591\" /></p>\r\n', 1, 1, 10001, 100, 12, 0, 0, '2017-12-03 19:53:29');
INSERT INTO `mall_goods` VALUES (13, 41, 17, '白色好吃的芒果', '4535436vbcbgf', '  颜色:白色|红色|黄色;产地:日本|美国|中国;赠品:好吃的|好玩的|好看的', 1.00, 23.00, '芒果|水果|好吃的', 9.00, '斤', 1.00, './uploads/20171211/20171211211213495.jpg', './uploads/20171211/20171211211213495220x220.jpg', '<div class=\"attributes\" id=\"attributes\">\r\n	<div class=\"attributes-list\" id=\"J_AttrList\">\r\n		<div class=\"tm-clear tb-hidden tm_brandAttr\" id=\"J_BrandAttr\" style=\"display: block;\">\r\n			<div class=\"name\" data-spm-anchor-id=\"a220o.1000855.0.i1.66b2cec6HheKqG\">\r\n				品牌名称：<b class=\"J_EbrandLogo\" href=\"https://brand.tmall.com/brandInfo.htm?brandId=84027415&amp;type=0&amp;scm=1048.1.1.4\" target=\"_blank\">纯乐</b></div>\r\n		</div>\r\n		<p class=\"attr-list-hd tm-clear\">\r\n			<em>产品参数：</em></p>\r\n		<ul id=\"J_AttrUL\">\r\n			<li title=\"鸿远华成商贸有限公司\">\r\n				厂名：鸿远华成商贸有限公司</li>\r\n			<li title=\"海南省海口市琼山区\">\r\n				厂址：海南省海口市琼山区</li>\r\n			<li title=\"18189828483\">\r\n				厂家联系方式：18189828483</li>\r\n			<li title=\"自然生长水果 天然健康\">\r\n				配料表：自然生长水果 天然健康</li>\r\n			<li title=\"自然放置 放置温度较高的地方\">\r\n				储藏方法：自然放置 放置温度较高的地方</li>\r\n			<li title=\"10\">\r\n				保质期：10 天</li>\r\n			<li title=\"无\">\r\n				食品添加剂：无</li>\r\n			<li title=\"&nbsp;2500g\">\r\n				净含量:&nbsp;2500g</li>\r\n			<li title=\"&nbsp;散装\">\r\n				包装方式:&nbsp;散装</li>\r\n			<li title=\"&nbsp;500-1250g\">\r\n				单果重量:&nbsp;500-1250g</li>\r\n			<li title=\"&nbsp;中国\">\r\n				原产地:&nbsp;中国</li>\r\n			<li id=\"J_attrBrandName\" title=\"&nbsp;纯乐\">\r\n				品牌:&nbsp;纯乐</li>\r\n			<li title=\"&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;5月&nbsp;11月&nbsp;12月\">\r\n				热卖时间:&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;5月&nbsp;11月&nbsp;12月</li>\r\n			<li title=\"&nbsp;中国大陆\">\r\n				产地:&nbsp;中国大陆</li>\r\n			<li title=\"&nbsp;海南省\">\r\n				省份:&nbsp;海南省</li>\r\n			<li title=\"&nbsp;三亚市\">\r\n				城市:&nbsp;三亚市</li>\r\n			<li title=\"&nbsp;3人份\">\r\n				套餐份量:&nbsp;3人份</li>\r\n			<li title=\"&nbsp;1周\">\r\n				套餐周期:&nbsp;1周</li>\r\n			<li title=\"&nbsp;1周1次\">\r\n				配送频次:&nbsp;1周1次</li>\r\n			<li title=\"&nbsp;金煌芒\">\r\n				水果种类:&nbsp;金煌芒</li>\r\n			<li title=\"&nbsp;三亚青皮芒果\">\r\n				特产品类:&nbsp;三亚青皮芒果</li>\r\n			<li title=\"&nbsp;51-100元\">\r\n				价格:&nbsp;51-100元</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n<div id=\"mall-banner\">\r\n	<div data-spm=\"1998132255\">\r\n		<a href=\"https://pages.tmall.com/wow/act/18622/industry-100982?wh_weex=true&amp;acm=lb-zebra-163061-948625.1003.4.2661293&amp;scm=1003.4.lb-zebra-163061-948625.OTHER_63_2661293\" target=\"_blank\"><img height=\"120\" src=\"https://img.alicdn.com/tfs/TB1yjn4gRHH8KJjy0FbXXcqlpXa-790-120.jpg\" width=\"790\" /></a></div>\r\n	<div id=\"J_DescTMS1\">\r\n		&nbsp;</div>\r\n</div>\r\n<div id=\"J_DcTopRightWrap\">\r\n	&nbsp;</div>\r\n<div class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" id=\"description\">\r\n	<div class=\"content ke-post\" style=\"height: auto;\">\r\n		<p>\r\n			<a name=\"duomai_mjs_1208524897_start\"></a></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2H.CcgZnI8KJjSspeXXcwIpXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2188920613/TB2j5WPbgnH8KJjSspcXXb3QFXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2kDeFbnnI8KJjSszbXXb4KFXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2yUWRbb_I8KJjy1XaXXbsxpXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2188920613/TB2z.eFbdfJ8KJjy0FeXXXKEXXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB27jCPbf6H8KJjy0FjXXaXepXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2tmOMbf2H8KJjy0FcXXaDlFXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB20g9enylnpuFjSZFgXXbi7FXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2vJqGbdfJ8KJjy0FeXXXKEXXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2DLqVbcLJ8KJjy0FnXXcFDpXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2LgGNblTH8KJjy0FiXXcRsXXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2VdmEbdzJ8KJjSspkXXbF7VXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2J6p0nstnpuFjSZFKXXalFFXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2Wdspd77myKJjSZFzXXXgDpXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2BOkgXBExEKJjSZFAXXckhpXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2188920613/TB2pwOQbgnD8KJjy1XdXXaZsVXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2fOWNbcbI8KJjy1zdXXbe1VXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2bM9VbcLJ8KJjy0FnXXcFDpXa_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2188920613/TB2S1dzXp_AQeBjSZFtXXbFBVXa_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2DMDoeFXXXXcaXpXXXXXXXXXX-2188920613.jpg\" /></p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2or2GeFXXXXcgXXXXXXXXXXXX_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2BV7dbYOJ.eBjy1XaXXbNupXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2188920613/TB23vOjXV15V1Bjy1XbXXaNcVXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2188920613/TB2YMWgXV55V1Bjy0FjXXbikXXa_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2TBU5A9VmpuFjSZFFXXcZApXa_!!2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2NQxRapXXXXXSXXXXXXXXXXXX-2188920613.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2188920613/TB2QmRPapXXXXXtXpXXXXXXXXXX-2188920613.jpg\" /></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2T25hXV95V1Bjy0FhXXb5wXXa_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2J3vTcxeK.eBjSZFlXXaywXXa_!!2188920613.jpg\" /></p>\r\n		<p>\r\n			&nbsp;</p>\r\n		<p>\r\n			<img align=\"absmiddle\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.1000855.0.i2.66b2cec6HheKqG\" src=\"https://img.alicdn.com/imgextra/i2/2188920613/TB2vd57tXXXXXXiXpXXXXXXXXXX_!!2188920613.jpg\" /></p>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 10024, 1, 12, 6, 0, '2017-12-03 19:55:17');
INSERT INTO `mall_goods` VALUES (17, 42, 18, '好吃的牛肉', '3432432', '  产地:日本|美国|法国|中国|英国;赠品:好吃的|好玩的|好看的', 323.00, 434.00, '牛肉|好吃的|美食', 222.00, '斤', 1.00, './uploads/20171211/20171211210944155.jpg', './uploads/20171211/20171211210944155220x220.jpg', '<div>\r\n	&nbsp;<br />\r\n	<div class=\"tm-clear tb-hidden tm_brandAttr\" id=\"J_BrandAttr\" style=\"display: block;\">\r\n		<div class=\"name\" data-spm-anchor-id=\"a220o.1000855.0.i1.ece4bc8WBFYVN\">\r\n			品牌名称：<b class=\"J_EbrandLogo\" href=\"https://brand.tmall.com/brandInfo.htm?brandId=40809549&amp;type=0&amp;scm=1048.1.1.4\" target=\"_blank\">聚元</b></div>\r\n	</div>\r\n	<p class=\"attr-list-hd tm-clear\">\r\n		<em>产品参数：</em></p>\r\n	<ul id=\"J_AttrUL\">\r\n		<li title=\"SC11135012100014\">\r\n			生产许可证编号：SC11135012100014</li>\r\n		<li title=\"SB/T 10379-2012\">\r\n			产品标准号：SB/T 10379-2012</li>\r\n		<li title=\"福建省聚元食品股份有限公司\">\r\n			厂名：福建省聚元食品股份有限公司</li>\r\n		<li title=\"闽侯县甘蔗街道昙石山东大道6号\">\r\n			厂址：闽侯县甘蔗街道昙石山东大道6号</li>\r\n		<li title=\"0591-22928385\">\r\n			厂家联系方式：0591-22928385</li>\r\n		<li title=\"牛肉、食用盐、白砂糖、纯天然食用香料等\">\r\n			配料表：牛肉、食用盐、白砂糖、纯天然食用香料等</li>\r\n		<li title=\"冷冻\">\r\n			储藏方法：冷冻</li>\r\n		<li title=\"365\">\r\n			保质期：365 天</li>\r\n		<li title=\"&nbsp;1500g\">\r\n			净含量:&nbsp;1500g</li>\r\n		<li title=\"&nbsp;包装\">\r\n			包装方式:&nbsp;包装</li>\r\n		<li id=\"J_attrBrandName\" title=\"&nbsp;聚元\">\r\n			品牌:&nbsp;聚元</li>\r\n		<li title=\"&nbsp;单品\">\r\n			售卖方式:&nbsp;单品</li>\r\n		<li title=\"&nbsp;10片\">\r\n			片数:&nbsp;10片</li>\r\n		<li title=\"&nbsp;整切调理\">\r\n			牛排加工工艺:&nbsp;整切调理</li>\r\n		<li title=\"&nbsp;-18℃\">\r\n			生鲜储存温度:&nbsp;-18℃</li>\r\n		<li title=\"&nbsp;中国大陆\">\r\n			产地:&nbsp;中国大陆</li>\r\n		<li title=\"&nbsp;福建省\">\r\n			省份:&nbsp;福建省</li>\r\n		<li title=\"&nbsp;福州市\">\r\n			城市:&nbsp;福州市</li>\r\n		<li title=\"&nbsp;5人份\">\r\n			套餐份量:&nbsp;5人份</li>\r\n		<li title=\"&nbsp;1周\">\r\n			套餐周期:&nbsp;1周</li>\r\n		<li title=\"&nbsp;1周1次\">\r\n			配送频次:&nbsp;1周1次</li>\r\n	</ul>\r\n	<div class=\"tb-validity\">\r\n		<img height=\"13\" src=\"https://img.alicdn.com/tps/i2/T1BzTmXnNbXXX1azE.-13-13.png\" width=\"13\" /> 生产日期: 2017-07-01 至 2017-10-20</div>\r\n	<div id=\"mall-banner\">\r\n		<div data-spm=\"1998132255\">\r\n			<a href=\"https://pages.tmall.com/wow/act/18622/industry-100982?wh_weex=true&amp;acm=lb-zebra-163061-948625.1003.4.2624668&amp;scm=1003.4.lb-zebra-163061-948625.OTHER_80_2624668\" target=\"_blank\"><img height=\"120\" src=\"https://img.alicdn.com/tfs/TB1yjn4gRHH8KJjy0FbXXcqlpXa-790-120.jpg\" width=\"790\" /></a></div>\r\n		<div id=\"J_DescTMS1\">\r\n			&nbsp;</div>\r\n	</div>\r\n	<div id=\"J_DcTopRightWrap\">\r\n		<div class=\"J_DcAsyn tb-shop\" id=\"J_DcTopRight\">\r\n			<div class=\"J_TModule\" data-componentid=\"5003\" data-spm=\"110.0.5003-15257722147\" data-title=\"自定义内容区\" data-widgetid=\"15257722147\" id=\"shop15257722147\">\r\n				<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\">\r\n					<div class=\"skin-box-bd clear-fix\">\r\n						<span><img alt=\" 双12PC关联.jpg\" border=\"0\" class=\"img-ks-lazyload\" src=\"https://gdp.alicdn.com/imgextra/i1/2627579032/TB2WSP9cMjN8KJjSZFkXXaboXXa_!!2627579032.jpg\" usemap=\"#Map\" /><map name=\"Map\"><area coords=\"398,1262,787,1547\" href=\"https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.117.5b1e01a2ehcjtL&amp;id=523927138614&amp;user_id=2627579032&amp;cat_id=2&amp;is_b=1&amp;rn=f4dc140d0e2ae7281cd1e493fdbae4d6#\" /> <area coords=\"0,1264,389,1549\" href=\"https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.117.5b1e01a2ehcjtL&amp;id=523927138614&amp;user_id=2627579032&amp;cat_id=2&amp;is_b=1&amp;rn=f4dc140d0e2ae7281cd1e493fdbae4d6#\" /> <area coords=\"403,945,792,1230\" href=\"https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.117.5b1e01a2ehcjtL&amp;id=523927138614&amp;user_id=2627579032&amp;cat_id=2&amp;is_b=1&amp;rn=f4dc140d0e2ae7281cd1e493fdbae4d6#\" /> <area coords=\"667,377,780,453\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=0eb68b614cc0445992969c83c59b7bf5&amp;scene=taobao_shop\" target=\"_blank\" /><area coords=\"6,495,783,891\" href=\"https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.117.5b1e01a2ehcjtL&amp;id=523927138614&amp;user_id=2627579032&amp;cat_id=2&amp;is_b=1&amp;rn=f4dc140d0e2ae7281cd1e493fdbae4d6#\" /><area coords=\"2,946,391,1231\" href=\"https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.117.5b1e01a2ehcjtL&amp;id=523927138614&amp;user_id=2627579032&amp;cat_id=2&amp;is_b=1&amp;rn=f4dc140d0e2ae7281cd1e493fdbae4d6#\" /> <area coords=\"538,377,651,453\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=4c0d10ef806e459fafe0074ae231a47a&amp;scene=taobao_shop\" target=\"_blank\" /> <area coords=\"417,377,530,453\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=d3d293e953a24794a504a98fb42ddffd&amp;scene=taobao_shop\" target=\"_blank\" /> <area coords=\"291,377,404,453\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=a5015b76b85e4f0c9b34247cb5c8a67d&amp;scene=taobao_shop\" target=\"_blank\" /> <area coords=\"166,378,279,454\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=e04cc8ecc6324214be6e0c00447ce23a&amp;scene=taobao_shop\" target=\"_blank\" /><area coords=\"1,4,790,360\" href=\"https://juyuansp.tmall.com/campaign-3766-15.htm?wh_weex=true&amp;scene=taobao_shop#9;\" target=\"_blank\" /><area coords=\"45,377,158,453\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2627579032&amp;activityId=e48c54d0d0a743318dfc58b0a29c8080&amp;scene=taobao_shop\" target=\"_blank\" /></map></span></div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" id=\"description\">\r\n		<div class=\"content ke-post\" style=\"height: auto;\">\r\n			<p>\r\n				<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2627579032/TB2YOGvamiK.eBjSZFDXXbxZVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2627579032/TB2xzCuak5M.eBjSZFrXXXPgVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2627579032/TB2fqqzahaK.eBjSZFAXXczFXXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2627579032/TB2ubZmXYaI.eBjy1XdXXcoqXXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2627579032/TB2q6evalyN.eBjSZFgXXXmGXXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2627579032/TB2OiKsaiGO.eBjSZFjXXcU9FXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2627579032/TB2rICtaX5N.eBjSZFKXXX_QVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2627579032/TB2YR9zahqK.eBjSZJiXXaOSFXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2627579032/TB2wXywalaM.eBjSZFMXXcypVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2627579032/TB2cCSuak5M.eBjSZFrXXXPgVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2627579032/TB2vy5oak1M.eBjSZFOXXc0rFXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2627579032/TB2iGUqX4eI.eBjSsplXXX6GFXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2627579032/TB2sFZsX9iJ.eBjSszfXXa4bVXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2627579032/TB29ZMwXZaK.eBjSspjXXXL.XXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2627579032/TB240kxX3SI.eBjy1XcXXc1jXXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2627579032/TB23zozX89J.eBjy0FoXXXyvpXa_!!2627579032.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2627579032/TB2edR7XLTJXuFjSspeXXapipXa_!!2627579032.jpg\" /></p>\r\n		</div>\r\n	</div>\r\n	<span><img src=\"https://gdp.alicdn.com/imgextra/i4/2627579032/TB2scyamXXXXXXdXXXXXXXXXXXX_!!2627579032.jpg\" /><br />\r\n	<img data-spm-anchor-id=\"a220o.1000855.5003-15257684748.i0.ece4bc8WBFYVN\" src=\"https://gdp.alicdn.com/imgextra/i4/2627579032/TB2.pNEmXXXXXbkXpXXXXXXXXXX_!!2627579032.jpg\" /></span></div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 985, 1, 12, 1, 114, '2017-12-08 13:40:43');
INSERT INTO `mall_goods` VALUES (18, 44, 0, '兰花', '3435346546', '  赠品:好看的', 11000.00, 32323.00, '兰花|花卉|好看得', 2323.00, '株', 1.00, './uploads/20171211/20171211204625476.jpg', './uploads/20171211/20171211204625476220x220.jpg', '<div class=\"attributes\" id=\"attributes\">\r\n	<div class=\"attributes-list\" id=\"J_AttrList\">\r\n		<div class=\"tm-clear tb-hidden tm_brandAttr\" id=\"J_BrandAttr\" style=\"display: block;\">\r\n			<div class=\"name\" data-spm-anchor-id=\"a220o.1000855.0.i1.51d857c5yxWLFX\">\r\n				品牌名称：<b class=\"J_EbrandLogo\" href=\"https://brand.tmall.com/brandInfo.htm?brandId=27436471&amp;type=0&amp;scm=1048.1.1.4\" target=\"_blank\">芊艺</b></div>\r\n		</div>\r\n		<p class=\"attr-list-hd tm-clear\">\r\n			<em>产品参数：</em></p>\r\n		<ul id=\"J_AttrUL\">\r\n			<li id=\"J_attrBrandName\" title=\"&nbsp;芊艺\">\r\n				品牌:&nbsp;芊艺</li>\r\n			<li title=\"&nbsp;是\">\r\n				是否带花苞/花箭:&nbsp;是</li>\r\n			<li title=\"&nbsp;花蝴蝶3连体 裸根不带花&nbsp;花蝴蝶4连体 裸根不带花&nbsp;花蝴蝶5连体 裸根不带花&nbsp;花蝴蝶6连体 裸根不带花&nbsp;立叶桃红3连体 不带花芽&nbsp;企黑5连体 带1花芽&nbsp;黄金万两3连体 不带花&nbsp;东方美人3连体 不带花&nbsp;红美人3连体 不带花&nbsp;企黑6连体 带1花芽&nbsp;立叶桃红4连体 不带花芽&nbsp;企黑3连体 不带花&nbsp;立叶桃红6连体 不带花芽&nbsp;立叶桃红5连体 不带花芽&nbsp;金丝马尾爪3连体 不带花&nbsp;凤头钗3连体 不带花&nbsp;企黑4连体 不带花芽&nbsp;省3元花蝴蝶3株体原盆&nbsp;花蝴蝶4连体套装&nbsp;神童爪3连体 不带花&nbsp;花蝴蝶3株套装&nbsp;白雪公主3连体 不带花\">\r\n				颜色分类:&nbsp;花蝴蝶3连体 裸根不带花&nbsp;花蝴蝶4连体 裸根不带花&nbsp;花蝴蝶5连体 裸根不带花&nbsp;花蝴蝶6连体 裸根不带花&nbsp;立叶桃红3连体 不带花芽&nbsp;企黑5连体 带1花芽&nbsp;黄金万两3连体 不带花&nbsp;东方美人3连体 不带花&nbsp;红美人3连体 不带花&nbsp;企黑6连体 带1花芽&nbsp;立叶桃红4连体 不带花芽&nbsp;企黑3连体 不带花&nbsp;立叶桃红6连体 不带花芽&nbsp;立叶桃红5连体 不带花芽&nbsp;金丝马尾爪3连体 不带花&nbsp;凤头钗3连体 不带花&nbsp;企黑4连体 不带花芽&nbsp;省3元花蝴蝶3株体原盆&nbsp;花蝴蝶4连体套装&nbsp;神童爪3连体 不带花&nbsp;花蝴蝶3株套装&nbsp;白雪公主3连体 不带花</li>\r\n			<li title=\"&nbsp;兰花\">\r\n				植物品种:&nbsp;兰花</li>\r\n			<li title=\"&nbsp;阳台&nbsp;办公桌&nbsp;窗台&nbsp;茶几&nbsp;书房&nbsp;卫生间&nbsp;厨房&nbsp;卧室&nbsp;客厅&nbsp;庭院&nbsp;楼顶\">\r\n				适用空间:&nbsp;阳台&nbsp;办公桌&nbsp;窗台&nbsp;茶几&nbsp;书房&nbsp;卫生间&nbsp;厨房&nbsp;卧室&nbsp;客厅&nbsp;庭院&nbsp;楼顶</li>\r\n			<li title=\"&nbsp;加湿&nbsp;吸甲醛&nbsp;防辐射&nbsp;净化空气&nbsp;提神&nbsp;驱蚊&nbsp;杀菌&nbsp;美观&nbsp;趣味\">\r\n				功能:&nbsp;加湿&nbsp;吸甲醛&nbsp;防辐射&nbsp;净化空气&nbsp;提神&nbsp;驱蚊&nbsp;杀菌&nbsp;美观&nbsp;趣味</li>\r\n			<li title=\"&nbsp;夏季&nbsp;秋季\">\r\n				开花季节:&nbsp;夏季&nbsp;秋季</li>\r\n			<li title=\"&nbsp;草本花卉\">\r\n				植物类别:&nbsp;草本花卉</li>\r\n			<li title=\"&nbsp;非常容易\">\r\n				难易程度:&nbsp;非常容易</li>\r\n			<li title=\"&nbsp;不含盆\">\r\n				是否含花盆:&nbsp;不含盆</li>\r\n			<li title=\"&nbsp;201705272111\">\r\n				货号:&nbsp;201705272111</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n<div id=\"mall-banner\">\r\n	<div data-spm=\"1998132255\">\r\n		<a href=\"https://pages.tmall.com/wow/act/18622/industry-100966?wh_weex=true&amp;acm=lb-zebra-163061-948625.1003.4.2624668&amp;scm=1003.4.lb-zebra-163061-948625.OTHER_25_2624668\" target=\"_blank\"><img height=\"120\" src=\"https://img.alicdn.com/tfs/TB1kz6vgRDH8KJjSspnXXbNAVXa-790-120.jpg\" width=\"790\" /></a></div>\r\n	<div id=\"J_DescTMS1\">\r\n		&nbsp;</div>\r\n</div>\r\n<div id=\"J_DcTopRightWrap\">\r\n	<div class=\"J_DcAsyn tb-shop\" id=\"J_DcTopRight\">\r\n		<div class=\"J_TModule\" data-componentid=\"5003\" data-spm=\"110.0.5003-17421110734\" data-title=\"自定义内容区\" data-widgetid=\"17421110734\" id=\"shop17421110734\">\r\n			<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\">\r\n				<div class=\"skin-box-bd clear-fix\">\r\n					<p>\r\n						<span><a href=\"https://qianyizz.tmall.com/shop/view_shop.htm?spm=a220o.1000855.w5001-17420991210.2.75828670Ckeakz&amp;tracelog=twddp&amp;user_number_id=2614167580&amp;scene=taobao_shop\" target=\"_blank\"><img class=\"img-ks-lazyload\" src=\"https://gdp.alicdn.com/imgextra/i2/2614167580/TB2ol9GfL6H8KJjSspmXXb2WXXa_!!2614167580.jpg\" /></a> </span></p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB2QjkbiHsTMeJjSszdXXcEupXa_!!2614167580.jpg\" /></p>\r\n<p>\r\n	<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB2yoRiXwOFJuJjy1zjXXXp7pXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2V0u0bHsTMeJjy1zcXXXAgXXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2Qkq3bUgQMeJjy0FiXXXhqXXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB2URq6bMoQMeJjy0FnXXb8gFXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB2As12bMsSMeJjSspeXXa77VXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB22OL3dnAKL1JjSZFCXXXFspXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2yKrUdosIL1JjSZPiXXXKmpXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2iiT3dnAKL1JjSZFCXXXFspXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2sEjocO0TMKJjSZFNXXa_1FXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2ie5.cUF7MKJjSZFLXXcMBVXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2614167580/TB2LobXX3n.PuJjSZFkXXc_lpXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB2hV6pcOFTMKJjSZFAXXckJpXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2614167580/TB2slkado3IL1JjSZFMXXajrFXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2614167580/TB2O9Y3de7JL1JjSZFKXXc4KXXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2bC23de7JL1JjSZFKXXc4KXXa_!!2614167580.jpg\" /><img alt=\"\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/2614167580/TB2H5piXrKFJuJjSszgXXXVnXXa_!!2614167580.jpg\" style=\"margin: 10.0px;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/2614167580/TB2m51PXjTlJKJjSszbXXXS1FXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB2gLaRXlLkJKJjSspjXXXkLXXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB2xF4lXsaCJuJjy1zkXXbelVXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB22CqOXi_mJKJjy0FiXXcmzXXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB2QV9PXizmJKJjy0FeXXaYvVXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/2614167580/TB2JtiRXlzkJKJjSspiXXXd4XXa_!!2614167580.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.1000855.0.i2.51d857c5yxWLFX\" src=\"https://img.alicdn.com/imgextra/i4/2614167580/TB2SbIrXCOFJuJjSZFAXXblRFXa_!!2614167580.jpg\" /></p>\r\n', 1, 1, 98, 1, 12, 0, 1, '2017-12-11 20:49:08');
INSERT INTO `mall_goods` VALUES (19, 41, 17, '  黄青皮芒果 ', '2222222322434333', '  颜色:白色|黑色|红色|黄色;产地:日本|美国|法国|中国|英国;赠品:好吃的|好玩的|好看的', 12.00, 15.00, '芒果|水果|好吃的', 11.00, '斤', 1.00, './uploads/20171220/20171220195046183.jpg', './uploads/20171220/20171220195046183220x220.jpg', '<h1 data-spm=\"1000983\" data-spm-anchor-id=\"a220o.1000855.0.i1000983.7f7c6b5cuCs5IB\">\r\n	&nbsp;</h1>\r\n<p>\r\n	<a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.1940.7745fa88iHqIKe&amp;id=560354455010&amp;rn=793f3ee9424dea3dc7ed6380f31cfe7d&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2iATagMDD8KJjy0FdXXcjvXXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.0.0.456ab9c5vaWzfU&amp;id=39988389780\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2iFsZbKLM8KJjSZFqXXa7.FXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.4f0c2d8ddUb0Bf&amp;id=558487098126\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2lYWQfH_I8KJjy1XaXXbsxpXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.1.511cce49LzrV1A&amp;abtest=_AB-LR32-PR32&amp;pvid=056bf245-67a2-4c91-b736-6c07fe069e58&amp;pos=1&amp;abbucket=_AB-M32_B18&amp;acm=03054.1003.1.2431317&amp;id=546109416556&amp;scm=1007.12144.81309.23864_0\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2davUdiqAXuNjy1XdXXaYcVXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.134.3912b8efq8rN8X&amp;id=556555017647&amp;rn=2ea807d7a0aac757366a86fa2b856890&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2E27Aa7fb_uJkHFCcXXXagFXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.42a5c15bMMZUAk&amp;id=559415490993\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1070626038/TB2AFwqa7fb_uJkSndVXXaBkpXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.1250.7745fa88iHqIKe&amp;id=548096705458&amp;rn=793f3ee9424dea3dc7ed6380f31cfe7d&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB273WhfTnI8KJjSszgXXc8ApXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7782695.0.0.34c5f7d8KKSjMy&amp;id=560132904422\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2PXsZbKLM8KJjSZFqXXa7.FXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?id=558319986477\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2f6mnbLal9eJjSZFzXXaITVXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.3.460dc565Wd8Whk&amp;abtest=_AB-LR32-PR32&amp;pvid=bf504671-cd65-45bb-9d68-c69e209db445&amp;pos=2&amp;abbucket=_AB-M32_B18&amp;acm=03054.1003.1.2431317&amp;id=560135340044&amp;scm=1007.12144.93797.23864_0\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2duw8bGLN8KJjSZFGXXbjrVXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.5545c6cftO9B6B&amp;id=560281770530\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2AVMocjgy_uJjSZPxXXanNpXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.284.7745fa88iHqIKe&amp;id=543745801855&amp;rn=793f3ee9424dea3dc7ed6380f31cfe7d&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2feQva6gy_uJjSZR0XXaK5pXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?id=562902727168\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2cKAjbJLO8KJjSZPcXXaV0FXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.1a0c23e6VWEJC&amp;id=556679229542\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2aM5hfTnI8KJjSszgXXc8ApXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.40.ea161e3i9Vipv&amp;id=556726798577&amp;rn=7bc25eacfebe05fdc8013cb3c69f6327&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2I2kvbRfM8KJjSZPiXXXdspXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.2032.7745fa88iHqIKe&amp;id=546748506687&amp;rn=793f3ee9424dea3dc7ed6380f31cfe7d&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1070626038/TB2yH5QfH_I8KJjy1XaXXbsxpXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16305850059.40.678b203fOwXfDy&amp;id=559416962428&amp;rn=4e8373e28db1993ada4af409faa5a1d6&amp;abbucket=16\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2r2ASbJHO8KJjSZFLXXaTqVXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.42a5c15bMMZUAk&amp;id=555827888737\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1070626038/TB2boCXfJbJ8KJjy1zjXXaqapXa_!!1070626038.jpg\" /></a><a href=\"https://detail.tmall.com/item.htm?spm=a21ag.7623864.0.0.42a5c15bMMZUAk&amp;id=555906849730\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1070626038/TB2SI3Ja7fb_uJkSnhJXXbdDVXa_!!1070626038.jpg\" /></a></p>\r\n<p>\r\n	<a data-spm-anchor-id=\"a220o.1000855.0.0\" href=\"https://favorite.shopmodule.jaeapp.com/?spm=a220o.1000855.0.0.a116891tJaatl&amp;sid=100788315\" style=\"line-height: 1.5;\" target=\"_blank\"><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2MsnhkqagSKJjy0FaXXb0dpXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/1070626038/TB2r8niaQonyKJjSZFtXXXNaVXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/1070626038/TB2BPxgag6DK1JjSZPhXXa8uVXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2p_TUafAkyKJjy0FfXXaxhpXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB29oUhbbglyKJjSZFuXXaE6FXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/1070626038/TB2ctblaPZnyKJjSZFLXXXWqpXa_!!1070626038.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.1000855.0.i2.a116891tJaatl\" src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2tv6iaNwlyKJjSZFNXXcOlpXa_!!1070626038.jpg\" /></a></p>\r\n', 1, 1, 100, 1, 12, 0, 0, '2017-12-20 19:51:51');
INSERT INTO `mall_goods` VALUES (20, 41, 16, '云南昭通苹果', '3435346546111', '  颜色:白色|黑色|红色|黄色;产地:日本|美国|法国|中国|英国;赠品:好吃的|好玩的|好看的', 12.00, 13.00, '苹果|水果|好吃的', 11.00, '斤', 1.00, './uploads/20171220/20171220195410590.jpg', './uploads/20171220/20171220195410590220x220.jpg', '<div class=\"content ke-post\" data-spm-anchor-id=\"a220o.1000855.0.i5.f1d0308hGmWgY\" style=\"height: auto;\">\r\n	<p style=\"text-align: center;\">\r\n		<img align=\"absmiddle\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.1000855.0.i4.f1d0308hGmWgY\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB27TWtmzuhSKJjSspjXXci8VXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2C3jdlLNNTKJjSspfXXbXIFXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2L.RffEsIL1JjSZPiXXXKmpXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2ZVxofuEJL1JjSZFGXXa6OXXa_!!3252345093.jpg\" /></p>\r\n	<p style=\"text-align: center;\">\r\n		<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2ZggwcQ.HL1JjSZFuXXX8dXXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB238hLbwoQMeJjy0FpXXcTxpXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2GuRIbEgQMeJjy0FeXXXOEVXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2eplCbBUSMeJjSszcXXbnwVXa_!!3252345093.jpg\" /></p>\r\n	<p style=\"text-align: center;\">\r\n		<img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2FQnbXg3pLuJjSZFPXXXWtXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2n7OIXFcJL1JjSZFOXXcWlXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB27mmOXRcHL1JjSZFBXXaiGXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2XrlKawoQMeJjy0FpXXcTxpXa_!!3252345093.jpg\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB29BQFXK2CK1JjSZFjXXXk_VXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2vADbXg3pLuJjSZFPXXXWtXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/3252345093/TB2fYuCXS7PL1JjSZFHXXcciXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2YcMFXMYDK1JjSZFCXXX.vXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i2/3252345093/TB2YwSIXTAKL1JjSZFCXXXFspXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/3252345093/TB208wFXH_EK1JjSZFBXXa0HVXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i1/3252345093/TB2I5UEXIPEK1JjSZFEXXaA3XXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2S7zUXsrHK1JjSszeXXcuMFXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2fjDSXsrHK1JjSszcXXch4VXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2K_vUXDzGK1JjSspjXXcHWXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2onzUXDzGK1JjSspjXXcHWXXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2rHzUXwfHK1Jjy1zbXXahRFXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" src=\"https://img.alicdn.com/imgextra/i3/3252345093/TB2ZM2UXDzGK1JjSspbXXbHpFXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /><img align=\"absmiddle\" class=\"img-ks-lazyload\" data-spm-anchor-id=\"a220o.1000855.0.i7.f1d0308hGmWgY\" src=\"https://img.alicdn.com/imgextra/i4/3252345093/TB2B0DUXwvGK1Jjy0FbXXb4vVXa_!!3252345093.jpg\" style=\"line-height: 1.5;\" /></p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 98, 1, 12, 0, 2, '2017-12-20 19:55:22');

-- ----------------------------
-- Table structure for mall_level
-- ----------------------------
DROP TABLE IF EXISTS `mall_level`;
CREATE TABLE `mall_level`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `level_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//等级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_level
-- ----------------------------
INSERT INTO `mall_level` VALUES (1, '超级管理员');
INSERT INTO `mall_level` VALUES (2, '普通管理员');
INSERT INTO `mall_level` VALUES (3, '商品发布专员');
INSERT INTO `mall_level` VALUES (4, '订单处理专员');

-- ----------------------------
-- Table structure for mall_manage
-- ----------------------------
DROP TABLE IF EXISTS `mall_manage`;
CREATE TABLE `mall_manage`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//用户名',
  `pass` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//密码',
  `level` tinyint(1) UNSIGNED NOT NULL COMMENT '//等级',
  `last_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//最后登录IP',
  `last_time` datetime(0) NOT NULL COMMENT '//最后登录时间',
  `reg_time` datetime(0) NOT NULL COMMENT '//注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_manage
-- ----------------------------
INSERT INTO `mall_manage` VALUES (3, 'admin', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 1, '::1', '2018-06-12 20:55:43', '2017-11-16 15:52:45');
INSERT INTO `mall_manage` VALUES (6, '蜡笔小新', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', 2, '::1', '0000-00-00 00:00:00', '2017-11-17 16:40:46');
INSERT INTO `mall_manage` VALUES (12, '2222', 'e8248cbe79a288ffec75d7300ad2e07172f487f6', 1, '::1', '0000-00-00 00:00:00', '2017-11-24 18:03:39');

-- ----------------------------
-- Table structure for mall_nav
-- ----------------------------
DROP TABLE IF EXISTS `mall_nav`;
CREATE TABLE `mall_nav`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//导航名',
  `info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//导航简介',
  `sort` mediumint(8) UNSIGNED NOT NULL COMMENT '//排序',
  `sid` mediumint(8) UNSIGNED NOT NULL COMMENT '//类别',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//品牌',
  `price` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '//价格区间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_nav
-- ----------------------------
INSERT INTO `mall_nav` VALUES (4, '时尚家居', '时尚家居', 2, 0, '', 'a:1:{i:0;s:5:\"1 - 2\";}');
INSERT INTO `mall_nav` VALUES (11, '数码产品', '数码产品', 4, 0, '', '0');
INSERT INTO `mall_nav` VALUES (12, '健康美食', '健康美食', 1, 0, '', 'a:5:{i:0;s:5:\"1 - 2\";i:1;s:5:\"3 - 4\";i:2;s:5:\"5 - 6\";i:3;s:5:\"7 - 8\";i:4;s:6:\"9 - 10\";}');
INSERT INTO `mall_nav` VALUES (13, '童装玩具', '童装玩具', 6, 0, '', '0');
INSERT INTO `mall_nav` VALUES (14, '运动户外', '运动户外', 7, 0, '', '0');
INSERT INTO `mall_nav` VALUES (15, '美容护肤', '美容护肤', 8, 0, '', '0');
INSERT INTO `mall_nav` VALUES (16, '珠宝首饰', '珠宝首饰', 9, 0, '', '0');
INSERT INTO `mall_nav` VALUES (17, '游戏动漫', '游戏动漫', 11, 0, '', '0');
INSERT INTO `mall_nav` VALUES (18, '鲜花宠物', '鲜花宠物', 10, 0, '', '0');
INSERT INTO `mall_nav` VALUES (19, '黑客技术', '计算机技术', 3, 0, '', '0');
INSERT INTO `mall_nav` VALUES (39, 'php', 'php', 39, 19, 'a:1:{i:0;s:2:\"13\";}', '0');
INSERT INTO `mall_nav` VALUES (40, '云计算', 'mysql', 40, 19, 'a:2:{i:0;s:2:\"13\";i:1;s:2:\"14\";}', '0');
INSERT INTO `mall_nav` VALUES (41, '水果', '水果', 41, 12, 'a:2:{i:0;s:2:\"16\";i:1;s:2:\"17\";}', 'a:5:{i:0;s:5:\"1 - 2\";i:1;s:5:\"3 - 4\";i:2;s:5:\"5 - 6\";i:3;s:5:\"7 - 8\";i:4;s:6:\"9 - 10\";}');
INSERT INTO `mall_nav` VALUES (42, '牛肉', '神户牛肉', 42, 12, 'a:1:{i:0;s:2:\"18\";}', 'a:3:{i:0;s:5:\"1 - 2\";i:1;s:5:\"3 - 4\";i:2;s:5:\"5 - 6\";}');
INSERT INTO `mall_nav` VALUES (44, '花卉', '花卉', 44, 12, '', 'a:4:{i:0;s:5:\"1 - 2\";i:1;s:5:\"5 - 6\";i:2;s:5:\"7 - 8\";i:3;s:6:\"9 - 10\";}');
INSERT INTO `mall_nav` VALUES (45, '蔬菜', '蔬菜', 45, 12, '', 'a:4:{i:0;s:5:\"1 - 2\";i:1;s:5:\"3 - 4\";i:2;s:5:\"5 - 6\";i:3;s:5:\"7 - 8\";}');
INSERT INTO `mall_nav` VALUES (46, '111', '11111', 46, 0, '', '');

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//用户名',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//收货人',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//电子邮件',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//地址',
  `code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//邮政编码',
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '//手机号码',
  `buildings` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//标志性建筑物',
  `delivery` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//物流方式',
  `pay` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//支付方式',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '//总金额',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//订单处理',
  `ps` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//缺货处理方式',
  `ordernum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//订单号',
  `goods` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//商品列表',
  `order_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未确认' COMMENT '//订单状态',
  `order_pay` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未付款' COMMENT '//支付状态',
  `order_delivery` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未发货',
  `delivery_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//快递名',
  `delivery_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//官方网址',
  `delivery_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//快递单号',
  `refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '//申请退款',
  `date` datetime(0) NOT NULL COMMENT '//下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES (19, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 15.00, '', '先发有货的', '2017121120143038155', 'a:1:{i:12;s:227:\"a:6:{s:2:\"id\";s:2:\"12\";s:4:\"name\";s:21:\"陕西好吃的苹果\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3243242342\";s:10:\"price_sale\";s:4:\"5.00\";}\";}', '已取消', '未付款', '未发货', '', '', '0', 0, '2017-12-11 20:14:30');
INSERT INTO `mall_order` VALUES (21, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 32615.00, '', '先发有货的', '2017121321081464325', 'a:3:{i:17;s:224:\"a:6:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:4:\"attr\";a:2:{s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3432432\";s:10:\"price_sale\";s:6:\"323.00\";}\";i:14;s:189:\"a:6:{s:2:\"id\";s:2:\"14\";s:4:\"name\";s:18:\"好吃的西兰花\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3343dfg\";s:10:\"price_sale\";s:4:\"3.00\";}\";i:12;s:227:\"a:6:{s:2:\"id\";s:2:\"12\";s:4:\"name\";s:21:\"陕西好吃的苹果\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3243242342\";s:10:\"price_sale\";s:4:\"5.00\";}\";}', '已确认', '已付款', '已配货', '邮政快递', 'www.chinapost.com.cn', '34433333111111', 1, '2017-12-13 21:08:14');
INSERT INTO `mall_order` VALUES (22, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 32615.00, '', '先发有货的', '2017121321082911843', 'a:3:{i:17;s:224:\"a:6:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:4:\"attr\";a:2:{s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3432432\";s:10:\"price_sale\";s:6:\"323.00\";}\";i:14;s:189:\"a:6:{s:2:\"id\";s:2:\"14\";s:4:\"name\";s:18:\"好吃的西兰花\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3343dfg\";s:10:\"price_sale\";s:4:\"3.00\";}\";i:12;s:227:\"a:6:{s:2:\"id\";s:2:\"12\";s:4:\"name\";s:21:\"陕西好吃的苹果\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3243242342\";s:10:\"price_sale\";s:4:\"5.00\";}\";}', '已确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '32222222222', 2, '2017-12-13 21:08:29');
INSERT INTO `mall_order` VALUES (23, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 32615.00, '', '先发有货的', '2017121321093666191', 'a:3:{i:17;s:224:\"a:6:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:4:\"attr\";a:2:{s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3432432\";s:10:\"price_sale\";s:6:\"323.00\";}\";i:14;s:189:\"a:6:{s:2:\"id\";s:2:\"14\";s:4:\"name\";s:18:\"好吃的西兰花\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"100\";s:2:\"sn\";s:7:\"3343dfg\";s:10:\"price_sale\";s:4:\"3.00\";}\";i:12;s:227:\"a:6:{s:2:\"id\";s:2:\"12\";s:4:\"name\";s:21:\"陕西好吃的苹果\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3243242342\";s:10:\"price_sale\";s:4:\"5.00\";}\";}', '已取消', '未付款', '未发货', '', '', '0', 0, '2017-12-13 21:09:36');
INSERT INTO `mall_order` VALUES (27, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 11.00, '', '先发有货的', '2017121522020512228', 'a:1:{i:13;s:154:\"a:6:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已确认', '已付款', '已配货', '0', '', '', 0, '2017-12-15 22:02:05');
INSERT INTO `mall_order` VALUES (28, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '支付宝', 11.00, '', '先发有货的', '2017121522043885333', 'a:1:{i:13;s:271:\"a:6:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:4:\"attr\";a:3:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已确认', '已付款', '已发货', '顺丰速递', 'www.sf-express.com', '2333433333333333333333', 0, '2017-12-15 22:04:38');
INSERT INTO `mall_order` VALUES (29, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '申通快递', '货到付', 22.00, '', '先发有货的', '2017121619520880858', 'a:1:{i:13;s:260:\"a:7:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:2:\"10\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已取消', '未付款', '未发货', '', '', '', 0, '2017-12-16 19:52:08');
INSERT INTO `mall_order` VALUES (30, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '货到付款', 6.00, '', '先发有货的', '2017121619523230547', 'a:1:{i:13;s:259:\"a:7:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已取消', '未付款', '未发货', '', '', '', 0, '2017-12-16 19:52:32');
INSERT INTO `mall_order` VALUES (33, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 328.00, '', '先发有货的', '2017121620311290940', 'a:1:{i:17;s:267:\"a:8:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";a:2:{s:8:\"  产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '已取消', '未付款', '未发货', '', '', '', 0, '2017-12-16 20:31:12');
INSERT INTO `mall_order` VALUES (35, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121620420965111', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已确认', '已付款', '已发货', '顺丰速递', 'www.sf-express.com', '23333333333333333', 0, '2017-12-16 20:42:09');
INSERT INTO `mall_order` VALUES (36, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 11328.00, '', '先发有货的', '2017121720395826299', 'a:2:{i:17;s:302:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";i:18;s:300:\"a:9:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:6:\"兰花\";s:3:\"nav\";s:2:\"44\";s:4:\"attr\";a:1:{s:8:\"  赠品\";a:1:{i:0;s:9:\"好看的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3435346546\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211204625476220x220.jpg\";s:10:\"price_sale\";s:8:\"11000.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '12222232', 0, '2017-12-17 20:39:58');
INSERT INTO `mall_order` VALUES (37, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 328.00, '', '先发有货的', '2017121921271695460', 'a:1:{i:17;s:259:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '32222222222', 0, '2017-12-19 21:27:16');
INSERT INTO `mall_order` VALUES (38, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922211373171', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '34433333111111', 0, '2017-12-19 22:21:13');
INSERT INTO `mall_order` VALUES (39, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922221840624', 'a:1:{i:13;s:387:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:3:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"产地\";a:1:{i:0;s:6:\"日本\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '121321321321321', 0, '2017-12-19 22:22:18');
INSERT INTO `mall_order` VALUES (40, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922335817088', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已确认', '已付款', '已发货', '申通快递', 'www.sto.cn', '12222232', 0, '2017-12-19 22:33:58');
INSERT INTO `mall_order` VALUES (41, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922374852623', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '未确认', '已付款', '已发货', '顺丰速递', 'www.sf-express.com', '12222232', 0, '2017-12-19 22:37:48');
INSERT INTO `mall_order` VALUES (42, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922400729732', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '34433333111111', 0, '2017-12-19 22:40:07');
INSERT INTO `mall_order` VALUES (43, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017121922405527170', 'a:1:{i:13;s:351:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '未确认', '已付款', '已发货', '圆通快递', 'www.yto.net.cn', '2333433333333333333333', 0, '2017-12-19 22:40:55');
INSERT INTO `mall_order` VALUES (44, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 6.00, '', '先发有货的', '2017122019352092498', 'a:1:{i:13;s:270:\"a:9:{s:2:\"id\";s:2:\"13\";s:4:\"name\";s:21:\"白色好吃的芒果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"4535436vbcbgf\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211211213495220x220.jpg\";s:10:\"price_sale\";s:4:\"1.00\";}\";}', '已取消', '未付款', '未发货', '0', '', '', 0, '2017-12-20 19:35:20');
INSERT INTO `mall_order` VALUES (45, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 35959.00, '', '先发有货的', '2017122019395837837', 'a:1:{i:17;s:304:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:3:\"111\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2017-12-20 19:39:58');
INSERT INTO `mall_order` VALUES (46, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 17.00, '', '先发有货的', '201712202204303214', 'a:1:{i:20;s:349:\"a:9:{s:2:\"id\";s:2:\"20\";s:4:\"name\";s:18:\"云南昭通苹果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"3435346546111\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171220/20171220195410590220x220.jpg\";s:10:\"price_sale\";s:5:\"12.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2017-12-20 22:04:30');
INSERT INTO `mall_order` VALUES (47, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 328.00, '', '先发有货的', '2017122022072175410', 'a:1:{i:17;s:302:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";a:1:{s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2017-12-20 22:07:21');
INSERT INTO `mall_order` VALUES (48, 'admin', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 17.00, '', '先发有货的', '2017122117415812591', 'a:1:{i:20;s:349:\"a:9:{s:2:\"id\";s:2:\"20\";s:4:\"name\";s:18:\"云南昭通苹果\";s:3:\"nav\";s:2:\"41\";s:4:\"attr\";a:2:{s:8:\"  颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"赠品\";a:1:{i:0;s:9:\"好吃的\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:13:\"3435346546111\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171220/20171220195410590220x220.jpg\";s:10:\"price_sale\";s:5:\"12.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2017-12-21 17:41:58');
INSERT INTO `mall_order` VALUES (49, '阳毅', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 328.00, '', '先发有货的', '2018011213570078505', 'a:1:{i:17;s:259:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2018-01-12 13:57:00');
INSERT INTO `mall_order` VALUES (50, '阳毅', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 328.00, '', '先发有货的', '2018011420422139179', 'a:1:{i:17;s:259:\"a:9:{s:2:\"id\";s:2:\"17\";s:4:\"name\";s:15:\"好吃的牛肉\";s:3:\"nav\";s:2:\"42\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:7:\"3432432\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211210944155220x220.jpg\";s:10:\"price_sale\";s:6:\"323.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2018-01-14 20:42:21');
INSERT INTO `mall_order` VALUES (51, '阳毅', '李炎恢', 'bnbbs@163.com', '江苏盐城大庆中路', '224000', '13748930203', '移动总部斜对面', '邮政快递', '支付宝', 11005.00, '', '先发有货的', '2018011420423643931', 'a:1:{i:18;s:255:\"a:9:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:6:\"兰花\";s:3:\"nav\";s:2:\"44\";s:4:\"attr\";N;s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:10:\"3435346546\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:47:\"./uploads/20171211/20171211204625476220x220.jpg\";s:10:\"price_sale\";s:8:\"11000.00\";}\";}', '未确认', '未付款', '未发货', '', '', '', 0, '2018-01-14 20:42:36');

-- ----------------------------
-- Table structure for mall_price
-- ----------------------------
DROP TABLE IF EXISTS `mall_price`;
CREATE TABLE `mall_price`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `price_left` smallint(6) NOT NULL DEFAULT 0 COMMENT '//左区间',
  `price_right` smallint(6) NOT NULL DEFAULT 0 COMMENT '//右区间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_price
-- ----------------------------
INSERT INTO `mall_price` VALUES (1, 1, 2);
INSERT INTO `mall_price` VALUES (2, 3, 4);
INSERT INTO `mall_price` VALUES (3, 5, 6);
INSERT INTO `mall_price` VALUES (4, 7, 8);
INSERT INTO `mall_price` VALUES (5, 9, 10);

-- ----------------------------
-- Table structure for mall_record
-- ----------------------------
DROP TABLE IF EXISTS `mall_record`;
CREATE TABLE `mall_record`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(6) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_record
-- ----------------------------
INSERT INTO `mall_record` VALUES (5, 17, '好吃的牛肉', 'admin', '赠品:好吃的;', 1, '2017-12-18 20:55:56', 323.00);
INSERT INTO `mall_record` VALUES (6, 18, '兰花', 'admin', '  赠品:好看的;', 1, '2017-12-18 20:55:56', 11000.00);
INSERT INTO `mall_record` VALUES (7, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-18 20:56:50', 1.00);
INSERT INTO `mall_record` VALUES (8, 13, '白色好吃的芒果', 'admin', '  颜色:白色,产地:日本,赠品:好吃的;', 1, '2017-12-18 20:57:02', 1.00);
INSERT INTO `mall_record` VALUES (9, 17, '好吃的牛肉', 'admin', ';', 1, '2017-12-19 21:27:50', 323.00);
INSERT INTO `mall_record` VALUES (10, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:21:38', 1.00);
INSERT INTO `mall_record` VALUES (11, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:21:55', 1.00);
INSERT INTO `mall_record` VALUES (12, 13, '白色好吃的芒果', 'admin', '  颜色:白色,产地:日本,赠品:好吃的;', 1, '2017-12-19 22:22:36', 1.00);
INSERT INTO `mall_record` VALUES (13, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:34:21', 1.00);
INSERT INTO `mall_record` VALUES (14, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:35:52', 1.00);
INSERT INTO `mall_record` VALUES (15, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:38:03', 1.00);
INSERT INTO `mall_record` VALUES (16, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:40:28', 1.00);
INSERT INTO `mall_record` VALUES (17, 13, '白色好吃的芒果', 'admin', '  颜色:白色,赠品:好吃的;', 1, '2017-12-19 22:41:12', 1.00);

-- ----------------------------
-- Table structure for mall_service
-- ----------------------------
DROP TABLE IF EXISTS `mall_service`;
CREATE TABLE `mall_service`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//服务名称',
  `first` tinyint(1) NOT NULL COMMENT '//首先',
  `date` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_service
-- ----------------------------
INSERT INTO `mall_service` VALUES (12, '食品售后', '<p>\r\n	<img src=\"https://gdp.alicdn.com/imgextra/i1/619123122/TB2kvfscDnI8KJjSszbXXb4KFXa-619123122.jpg\" /></p>\r\n', 1, '2017-12-12 12:34:37');
INSERT INTO `mall_service` VALUES (13, '服饰售后', '<p>\r\n	<img alt=\"\" src=\"uploads\\20171212\\20171212195252163.jpg\" style=\"width: 300px; height: 300px;\" /></p>\r\n', 0, '2017-12-12 12:34:55');

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '//id',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//用户名',
  `pass` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//密码',
  `date` datetime(0) NOT NULL COMMENT '//时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES (1, '阳毅', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '2017-12-08 19:32:35');
INSERT INTO `mall_user` VALUES (2, 'admin', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '2017-12-08 19:46:23');

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : third-homework

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-11-18 14:45:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(512) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容描述',
  `summary` text,
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `post_count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
  `order_num` int(11) DEFAULT NULL COMMENT '排序编码',
  `parent_id` bigint(32) unsigned DEFAULT NULL COMMENT '父级分类的ID',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '提问', null, null, null, '0', null, null, null, null, '2019-11-17 00:24:44', null, '0');
INSERT INTO `category` VALUES ('2', '分享', null, null, null, '0', null, null, null, null, '2019-11-17 00:24:47', null, '0');
INSERT INTO `category` VALUES ('3', '讨论', null, null, null, '0', null, null, null, null, '2019-11-17 00:25:04', null, '0');
INSERT INTO `category` VALUES ('4', '建议', null, null, null, '0', null, null, null, null, '2019-11-17 00:25:04', null, '0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` longtext NOT NULL COMMENT '评论的内容',
  `parent_id` bigint(32) DEFAULT NULL COMMENT '回复的评论ID',
  `post_id` bigint(32) NOT NULL COMMENT '评论的内容ID',
  `user_id` bigint(32) NOT NULL COMMENT '评论的用户ID',
  `vote_up` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '“顶”的数量',
  `vote_down` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '“踩”的数量',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `status` tinyint(2) DEFAULT NULL COMMENT '评论的状态',
  `created` datetime NOT NULL COMMENT '评论的时间',
  `modified` datetime DEFAULT NULL COMMENT '评论的更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('9', '顶顶顶顶', null, '4', '5', '0', '0', '0', null, '2019-07-25 03:18:32', '2019-07-25 03:18:32');
INSERT INTO `comment` VALUES ('10', '@111111 1111111', null, '4', '5', '0', '0', '0', null, '2019-07-25 03:57:20', '2019-07-25 03:57:20');
INSERT INTO `comment` VALUES ('11', '哈哈，我知道的啦', null, '2', '5', '0', '0', '0', null, '2019-07-25 04:01:30', '2019-07-25 04:01:30');
INSERT INTO `comment` VALUES ('12', '@111111 你知道就好了', null, '2', '5', '0', '0', '0', null, '2019-07-25 04:01:39', '2019-07-25 04:01:39');
INSERT INTO `comment` VALUES ('13', 'face[吃惊] face[色] [pre]\nhello world\n[/pre]', null, '1', '5', '0', '0', '0', null, '2019-07-25 12:58:57', '2019-07-25 12:58:57');
INSERT INTO `comment` VALUES ('14', '1116665', null, '2', '12', '0', '0', '0', null, '2019-09-03 14:57:48', '2019-09-03 14:57:48');
INSERT INTO `comment` VALUES ('15', '2222', null, '2', '7', '0', '0', '0', null, '2019-09-03 14:58:35', '2019-09-03 14:58:35');
INSERT INTO `comment` VALUES ('16', '啥东西的', null, '2', '13', '0', '0', '0', null, '2019-09-03 14:58:44', '2019-09-03 14:58:44');
INSERT INTO `comment` VALUES ('17', '123', null, '2', '8', '0', '0', '0', null, '2019-09-03 14:59:12', '2019-09-03 14:59:12');
INSERT INTO `comment` VALUES ('18', '哦豁', null, '3', '11', '0', '0', '0', null, '2019-09-03 14:59:32', '2019-09-03 14:59:32');
INSERT INTO `comment` VALUES ('19', '嘿嘿黑', null, '2', '9', '0', '0', '0', null, '2019-09-03 14:59:33', '2019-09-03 14:59:33');
INSERT INTO `comment` VALUES ('20', '12345', null, '2', '8', '0', '0', '0', null, '2019-09-03 14:59:34', '2019-09-03 14:59:34');
INSERT INTO `comment` VALUES ('21', '窝窝头，一块钱四个 嘿嘿！', null, '1', '12', '0', '0', '0', null, '2019-09-03 15:00:52', '2019-09-03 15:00:52');
INSERT INTO `comment` VALUES ('22', '嘿嘿！', null, '1', '12', '0', '0', '0', null, '2019-09-03 15:01:16', '2019-09-03 15:01:16');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `edit_mode` varchar(32) NOT NULL DEFAULT '0' COMMENT '编辑模式：html可视化，markdown ..',
  `category_id` bigint(32) DEFAULT NULL,
  `user_id` bigint(32) DEFAULT NULL COMMENT '用户ID',
  `vote_up` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支持人数',
  `vote_down` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '反对人数',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问量',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `recommend` tinyint(1) DEFAULT NULL COMMENT '是否为精华',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '这是标222222222222222222', '内容，这是内容', '0', '1', '5', '0', '0', '87', '102', '1', '0', '0', '2019-04-17 13:27:26', '2018-10-13 16:33:07');
INSERT INTO `post` VALUES ('2', '这是标222222222222222222', '内容，这是内容', '0', '1', '4', '0', '0', '152', '63', '0', '1', '0', '2019-04-18 13:27:26', '2018-10-13 16:33:07');
INSERT INTO `post` VALUES ('3', '这是标222222222222222222', '内容，这是内容', '0', '1', '4', '0', '0', '84', '78', '0', '0', '0', '2018-10-14 13:27:26', '2018-10-13 16:33:07');
INSERT INTO `post` VALUES ('4', '啊实打实的', 'asd啊实打实大苏打', '0', '1', '10', '0', '0', '1', '0', '1', '1', null, '2019-09-03 14:56:54', '2019-09-03 14:56:54');
INSERT INTO `post` VALUES ('5', '哈哈哈哈', '啥东西啊', '0', '1', '13', '0', '0', '1', '0', '0', '0', null, '2019-09-03 14:57:34', '2019-09-03 14:57:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(128) NOT NULL COMMENT '昵称',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机电话',
  `point` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `gender` varchar(16) DEFAULT NULL COMMENT '性别',
  `wechat` varchar(32) DEFAULT NULL COMMENT '微信号',
  `vip_level` int(32) DEFAULT NULL COMMENT 'vip等级',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `avatar` varchar(256) NOT NULL COMMENT '头像',
  `post_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内容数量',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `lasted` datetime DEFAULT NULL COMMENT '最后的登陆时间',
  `created` datetime NOT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lv-success', '1111', null, null, '0', null, '0', null, '0', null, 'https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg', '0', '0', '0', null, '2019-04-18 16:02:42', '2019-04-18 16:02:44');
INSERT INTO `user` VALUES ('4', '吕一明', 'string', 'string', 'string', '0', 'string', '1', 'string', '1', '2019-04-22 13:06:43', 'https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg', '0', '0', '0', '2019-04-22 13:06:43', '2019-04-22 13:07:26', '2019-04-22 13:06:43');
INSERT INTO `user` VALUES ('5', '111111', '96e79218965eb72c92a549dd5a330112', '1111@qq.com', null, '0', '1111111111111', '1', null, '0', null, 'http://localhost:8080/upload/avatar/avatar_5.png', '0', '0', '0', '2019-10-09 12:26:28', '2019-07-19 12:41:35', null);
INSERT INTO `user` VALUES ('6', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-07-30 16:28:31', '2019-07-30 03:33:50', null);
INSERT INTO `user` VALUES ('7', '666666', '96e79218965eb72c92a549dd5a330112', '11111141@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:54:10', '2019-09-03 14:54:03', null);
INSERT INTO `user` VALUES ('8', '陈超', 'e10adc3949ba59abbe56e057f20f883e', 'chenchao@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:55:58', '2019-09-03 14:55:44', null);
INSERT INTO `user` VALUES ('9', 'sadasd', '96e79218965eb72c92a549dd5a330112', 'qzl@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:55:59', '2019-09-03 14:55:52', null);
INSERT INTO `user` VALUES ('10', '123123', '4297f44b13955235245b2497399d7a93', '123123@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:56:03', '2019-09-03 14:55:57', null);
INSERT INTO `user` VALUES ('11', 'yjf', 'e10adc3949ba59abbe56e057f20f883e', 'abc@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:56:18', '2019-09-03 14:56:07', null);
INSERT INTO `user` VALUES ('12', '冲浪的', 'e10adc3949ba59abbe56e057f20f883e', '222@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:56:50', '2019-09-03 14:56:31', null);
INSERT INTO `user` VALUES ('13', '123123123', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 14:56:53', '2019-09-03 14:56:35', null);
INSERT INTO `user` VALUES ('14', 'starboy', 'd90b982061f178c3892e6429bdb8ba13', '51919490@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', null, '2019-09-03 14:58:07', null);
INSERT INTO `user` VALUES ('15', '888811@qq.com', '670b14728ad9902aecba32e22fa4f6bd', '888811@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 15:00:18', '2019-09-03 15:00:07', null);
INSERT INTO `user` VALUES ('16', '111123123211@qq.com', 'f379eaf3c831b04de153469d1bec345e', '111123123211@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 15:00:23', '2019-09-03 15:00:10', null);
INSERT INTO `user` VALUES ('17', 'qqq', '96e79218965eb72c92a549dd5a330112', 'qqq@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 15:00:37', '2019-09-03 15:00:29', null);
INSERT INTO `user` VALUES ('18', 'wx', '96e79218965eb72c92a549dd5a330112', '1111123456@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 15:00:51', '2019-09-03 15:00:41', null);
INSERT INTO `user` VALUES ('19', '123', 'e10adc3949ba59abbe56e057f20f883e', '11211@qq.com', null, '0', null, '0', null, '0', null, '/res/images/avatar/default.png', '0', '0', '0', '2019-09-03 15:01:23', '2019-09-03 15:01:16', null);

-- ----------------------------
-- Table structure for user_action
-- ----------------------------
DROP TABLE IF EXISTS `user_action`;
CREATE TABLE `user_action` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `action` varchar(32) DEFAULT NULL COMMENT '动作类型',
  `point` int(11) DEFAULT NULL COMMENT '得分',
  `post_id` varchar(32) DEFAULT NULL COMMENT '关联的帖子ID',
  `comment_id` varchar(32) DEFAULT NULL COMMENT '关联的评论ID',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_action
-- ----------------------------

-- ----------------------------
-- Table structure for user_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `post_user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_collection
-- ----------------------------
INSERT INTO `user_collection` VALUES ('1', '6', '2', '4', '2019-07-30 03:37:34', '2019-07-30 03:37:34');
INSERT INTO `user_collection` VALUES ('2', '5', '2', '4', '2019-07-30 06:21:06', '2019-07-30 06:21:06');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) NOT NULL COMMENT '发送消息的用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '接收消息的用户ID',
  `post_id` bigint(20) DEFAULT NULL COMMENT '消息可能关联的帖子',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '消息可能关联的评论',
  `content` text,
  `type` tinyint(2) DEFAULT NULL COMMENT '消息类型',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('1', '5', '5', '4', '9', null, '1', '2019-07-25 03:18:32', null, '1');
INSERT INTO `user_message` VALUES ('2', '5', '5', '4', '10', null, '1', '2019-07-25 03:57:20', null, '1');
INSERT INTO `user_message` VALUES ('3', '5', '5', null, '10', null, '3', '2019-07-25 03:57:20', null, '1');
INSERT INTO `user_message` VALUES ('4', '5', '4', '2', '11', null, '1', '2019-07-25 04:01:30', null, null);
INSERT INTO `user_message` VALUES ('5', '5', '4', '2', '12', null, '1', '2019-07-25 04:01:39', null, null);
INSERT INTO `user_message` VALUES ('6', '5', '5', null, '12', null, '3', '2019-07-25 04:01:39', null, '1');
INSERT INTO `user_message` VALUES ('7', '5', '5', '1', '13', 'face[吃惊] face[色] [pre]\nhello world\n[/pre]', '1', '2019-07-25 12:58:57', null, '1');
INSERT INTO `user_message` VALUES ('8', '12', '4', '2', '14', '1116665', '1', '2019-09-03 14:57:48', null, null);
INSERT INTO `user_message` VALUES ('9', '7', '4', '2', '15', '2222', '1', '2019-09-03 14:58:35', null, null);
INSERT INTO `user_message` VALUES ('10', '13', '4', '2', '16', '啥东西的', '1', '2019-09-03 14:58:44', null, null);
INSERT INTO `user_message` VALUES ('11', '8', '4', '2', '17', '123', '1', '2019-09-03 14:59:12', null, null);
INSERT INTO `user_message` VALUES ('12', '11', '4', '3', '18', '哦豁', '1', '2019-09-03 14:59:32', null, null);
INSERT INTO `user_message` VALUES ('13', '9', '4', '2', '19', '嘿嘿黑', '1', '2019-09-03 14:59:33', null, null);
INSERT INTO `user_message` VALUES ('14', '8', '4', '2', '20', '12345', '1', '2019-09-03 14:59:34', null, null);
INSERT INTO `user_message` VALUES ('15', '12', '5', '1', '21', '窝窝头，一块钱四个 嘿嘿！', '1', '2019-09-03 15:00:52', null, null);
INSERT INTO `user_message` VALUES ('16', '12', '5', '1', '22', '嘿嘿！', '1', '2019-09-03 15:01:16', null, null);

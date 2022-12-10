/*
 Navicat Premium Data Transfer

 Source Server         : song
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : shijie

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 08/12/2022 20:08:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sj_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `sj_article_cate`;
CREATE TABLE `sj_article_cate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `only`(`id` ASC, `name` ASC, `alias` ASC) USING BTREE COMMENT 'wei yi'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_article_cate
-- ----------------------------
INSERT INTO `sj_article_cate` VALUES (1, '图片', 'image', 0, '2022-12-03 17:23:27');
INSERT INTO `sj_article_cate` VALUES (2, '视频', 'video', 0, '2022-12-03 17:40:43');

-- ----------------------------
-- Table structure for sj_articles
-- ----------------------------
DROP TABLE IF EXISTS `sj_articles`;
CREATE TABLE `sj_articles`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pub_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0',
  `cate_id` int NOT NULL,
  `author_id` int NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '用户未命名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `likesum` int NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_articles
-- ----------------------------
INSERT INTO `sj_articles` VALUES (49, 'Auvergne', 'Wildlife photographer📷 & filmaker🎥🦅\r\n«Il faut autour de soi pour exister des réalités qui durent»\r\nAntoine de Saint-Exupéry', 'http://127.0.0.1:8000/uploads/d821f24b84154648202449843a21a17b.jpg', '2022-12-07 18:02:59.434', '已发布', 0, 1, 32, 'Alexandre', 'AlexandreVelluet', 235234);
INSERT INTO `sj_articles` VALUES (51, 'Pursuit of Purpose', 'When you cant find your purpose, find out your passion. For your passion will lead you right to your purpose. Capturing these surreal painting like moments through a combination of aerial imagery and motion blur preserve a snapshot in time where I am completely where I needed to be. On the pursuit of my purpose.', 'http://127.0.0.1:8000/uploads/9d1a336eb37d18afee38315b4fa220a7.jpg', '2022-12-07 18:03:46.154', '已发布', 0, 1, 32, 'Tim', 'timear', 23412);
INSERT INTO `sj_articles` VALUES (52, '风暴彩虹', '十年前在校园操场里循环听《追梦赤子心》里唱到： “充满鲜花的世界到底在哪里，如果它真的存在那么我一定会去！” 2017年我发现了充满鲜花的地方', 'http://127.0.0.1:8000/uploads/a363f2d41512f2ee69f0e6be2f4fd31c.jpg', '2022-12-07 18:03:50.456', '已发布', 0, 1, 32, '曦哲', 'zcxvxb', 1234);
INSERT INTO `sj_articles` VALUES (53, '太原萧河夜景 仿佛不属于这个城市的地方', '真实存在的动漫场景，在新疆《伊犁的童话II：鹰的国》', 'http://127.0.0.1:8000/uploads/fc84c2ca943a1c9cb24c839046c34bc1.jpg', '2022-12-07 18:03:54.828', '已发布', 0, 1, 32, '旭鹏', 'tjsrhffa', 5);
INSERT INTO `sj_articles` VALUES (54, 'Aerial view of a block of houses in Barcelona.', 'Aerial view of a block of houses in Barcelona. Photograph taken with all aerial permissions granted.', 'http://127.0.0.1:8000/uploads/45931118b6ad60128c3e4b2f5d9b0df2.jpg', '2022-12-07 18:03:58.959', '已发布', 0, 1, 32, '肖奕叁', 'xiaoyishan', 12);
INSERT INTO `sj_articles` VALUES (55, '御见杭城“蓬莱”仙境', '探索不一样的城市风光，喜欢航拍带来的不一样的视角\r\n\r\n#每一张照片的场景都有视频素材，详情私信。', 'http://127.0.0.1:8000/uploads/7ad7ce7d010706594effa998c7c0f07d.jpg', '2022-12-07 18:04:05.702', '已发布', 0, 1, 32, '肖奕叁', 'xiaoyishan', 23);
INSERT INTO `sj_articles` VALUES (56, '一路向西', '“我想拥有一对翅膀，然后邀请风儿跳支舞” 当她来到大理之前，她的生活被钢筋水泥包围着，有时烦恼和焦虑让她觉得就像高楼林立的围墙，而唯一让她感到不窒息的地方，便是抬起头才能看见的天空。在大理，她时常抬头仰望天空，看着飞鸟划过蓝天白云，眼神里流露出三分感伤，七分憧憬。她想象自己能像一只鸟一样，展翅与风共舞，飞过洱海、飞过田野、消失在天际。', 'http://127.0.0.1:8000/uploads/da94d2ae163347193d6c4653cdef088b.jpg', '2022-12-07 18:04:09.786', '已发布', 0, 1, 32, '彦昌', 'Blackstation\r\n\r\n', 32);
INSERT INTO `sj_articles` VALUES (57, '逐', '治愈心灵大理旅拍《爱仰望天空的人》', 'http://127.0.0.1:8000/uploads/80e2b4c69071eb19c8a25994e39b9eb8.jpg', '2022-12-07 18:04:14.671', '已发布', 0, 1, 32, '永昌', 'xiaoming', 32);
INSERT INTO `sj_articles` VALUES (58, '天边的红云', '在云南丽江玉龙雪山下有一处鲜有人知的秘境，在那有颗神树下，珍藏着我与昔日好友们的美好回忆，当我第二次独自来到这里，我知道故人已难再相聚，物是人非的风景依旧惊艳，它保管着我曾经置于远方的梦。 拍摄地点：复游城·丽江地中海国际度假区 / 玉龙雪山 / 白沙古镇 / 文海 拍摄设备：Fx3+RSC2 / A7C / Mavic2Pro', 'http://127.0.0.1:8000/uploads/98f90a6401935fbb8545f2f95eb2e181.jpg', '2022-12-07 18:04:18.655', '已发布', 0, 1, 32, '鸿运', 'wertrjk', 12);
INSERT INTO `sj_articles` VALUES (59, '光与海', '《雪山秘境》一个雪山下的绝美秘境，藏着昔日友人的记忆，还有梦', 'http://127.0.0.1:8000/uploads/ad700487eb9131c99f43db655aad1af7.jpg', '2022-12-07 18:04:22.318', '已发布', 0, 1, 32, '鑫鹏', 'asdgfsh', 56);
INSERT INTO `sj_articles` VALUES (60, '千窗百孔', '新疆绝美白色仙境《冰河时代最后的旅人》', 'http://127.0.0.1:8000/uploads/713356beb81469c1689ad5543d416e47.jpg', '2022-12-07 18:04:26.370', '已发布', 0, 1, 32, '炫明', 'asdghsfgd', 45);
INSERT INTO `sj_articles` VALUES (61, 'Pixel 2020 ｜ 五彩斑斓的黑', '几分钟的影像把黑像素一年拍过的有意思的建筑工作、视频影像以及走到看到的画面以某种形式串联了起来，也终于有办法把一些平日记录的杂碎的没有涵义的片段用出来。它们不是高山大海，也不需要是视觉大片，就是一些有感觉的点点滴滴，连在一起，依然五彩斑斓，观感非常。 希望未来，2021，更多的时间留给灵感。 导演：Blackstation 剪辑&后期：Blackstation 摄影：Kevin 孙 / William 姚 / Blackstation 特别合作：（ REV) Stan Yihung / Vview陈胤 / William远征', 'http://127.0.0.1:8000/uploads/e89e8a3c4474f8e2dec24125d1a589bb.jpg', '2022-12-07 21:28:11.758', '已发布', 0, 1, 32, '文昂', 'uvasfds', 65);
INSERT INTO `sj_articles` VALUES (62, '无边城市', '冰河时代最后的旅人，她日复一日跋山涉雪，在无止境的白色世界里寻找缤纷的痕迹，天空仿佛为之感动，彩色的朝霞是天空为了鼓舞她所编织的善意谎言，但她依然坚信彩色的世界在天空的尽头。', 'http://127.0.0.1:8000/uploads/d6e414049e91514db77ed4d2bf71da39.jpg', '2022-12-07 21:36:14.795', '已发布', 0, 1, 32, '佑运', 'auliss', 345);
INSERT INTO `sj_articles` VALUES (63, '这是测试标题', '测试的文本文本', 'http://127.0.0.1:8000/uploads/bd8f7a2bce78f1a5316315fec8a22456.jpg', '2022-12-08 11:35:18.774', '已发布', 0, 1, 32, '小明', 'xiaoming', 0);

-- ----------------------------
-- Table structure for sj_user
-- ----------------------------
DROP TABLE IF EXISTS `sj_user`;
CREATE TABLE `sj_user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_pic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `utime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `uname`(`uname` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_user
-- ----------------------------
INSERT INTO `sj_user` VALUES (15, 'potter', '$2a$10$pHQZsYwmDLtPsdIbW/gob.h3NJb.JyVGuNA1tgjeM8W9TohW9kIeC', NULL, NULL, NULL, NULL);
INSERT INTO `sj_user` VALUES (16, 'potter1', '$2a$10$HZqTpIZko846Np0UNivID.oX63oYHQGDo.HTOYyc91eIMsez0mVeC', NULL, NULL, NULL, '2022-12-02 21:10:16');
INSERT INTO `sj_user` VALUES (25, 'potter1', '$2a$10$DwUfqOdWIcFS6cbDop2FwurDXwHWExzVKY0SLufUJK73r32O2IwFO', NULL, NULL, NULL, '2022-12-02 22:01:07');
INSERT INTO `sj_user` VALUES (26, 'hpotter', '$2a$10$nBE.zP65X5qv2lJvTkjvWe1IoDvlCoaZX/2iOgPN9N7/Pp9tUpL6O', 'xiaoming', NULL, 'data:image/png;base64,VE9PTUFOWVNFQ1JFVFM=', '2022-12-03 20:20:14');
INSERT INTO `sj_user` VALUES (27, 'hpotter1', '$2a$10$/iLGMwACsSaP1bhxAsaR/O4Ln8H4BmIO3PDQZnSuCEOyvw9gIgHwa', '波特', '2153384@qq.com', '123', '2022-12-03 12:12:19');
INSERT INTO `sj_user` VALUES (28, 'potter', '$2a$10$j7jO6Wmvn5ke9Kf42EILHuD9gfNDpsExIiN9mXPLljD/TKaxyijh6', NULL, NULL, NULL, '2022-12-03 14:18:07');
INSERT INTO `sj_user` VALUES (29, 'potter', '$2a$10$mz9NRkqgqjqv9zLpQXDXY.FO6IwahomGr1Y1iMenQ.M87jRjHOfR.', NULL, NULL, NULL, '2022-12-03 14:19:15');
INSERT INTO `sj_user` VALUES (30, 'potter', '$2a$10$3fa5dc/1RyeCV2jpdRUtL.aXDt/UUeU9Z2UN8XsGlWq9JUW/z37IS', NULL, NULL, NULL, '2022-12-03 14:19:27');
INSERT INTO `sj_user` VALUES (31, 'potter00', '$2a$10$JlsVgNNt9D0LPV2dTe/bwu/gJqy2oWlhDn0LzLgm.KUc8J4P7E8Oe', NULL, NULL, NULL, '2022-12-03 14:20:35');
INSERT INTO `sj_user` VALUES (32, 'xiaoming', '$2a$10$EAZvkUXGhRYHkEx1Ul2DNOc6ILtL8kgxP/ABnzn8yj/ZkKoXAqeCq', '小明', NULL, 'data:image/png;base64,VE9PTUFOWVNFQ1JFVFM=', '2022-12-03 20:04:58');
INSERT INTO `sj_user` VALUES (33, 'potter999', '$2a$10$dskkjkdilrKfETu982Pu8ugR3iA62iLroaG016z2KeTe9TCz3txry', NULL, NULL, NULL, '2022-12-03 20:06:36');
INSERT INTO `sj_user` VALUES (34, 'guojiaju', '$2a$10$NnfZxTpgKwZyWyfULu8W9uS2Fr04Qc83ne1aI75jMrnqe5S9o8RHS', NULL, NULL, NULL, '2022-12-06 20:16:15');
INSERT INTO `sj_user` VALUES (35, 'xiaoming1', '$2a$10$9WkV8N4sYnm4O0nl70G8iOiJdtsMESZogeLJget3V0609KvvOXIV2', NULL, NULL, NULL, '2022-12-07 01:30:57');
INSERT INTO `sj_user` VALUES (36, 'xiaoming11', '$2a$10$tj7qDK78U/8u/Lf6g3OiSOolNcDS7Gp13ibfV1FfOTzvRQdC38r5W', NULL, NULL, NULL, '2022-12-07 01:31:25');
INSERT INTO `sj_user` VALUES (37, 'xiaoming0', '$2a$10$ZdxsJ3prW7DbKzsWOM77GOrAdjvjngiRHxmt2cZvHBrvVjxtXrW1K', NULL, NULL, NULL, '2022-12-07 01:34:28');
INSERT INTO `sj_user` VALUES (38, 'xiaohong', '$2a$10$fk9C/dniZ/m1DNkkp8JxeORbhFBU2S2cnss.92n5ZCCF9dN293Rze', NULL, NULL, NULL, '2022-12-07 22:12:49');
INSERT INTO `sj_user` VALUES (39, 'xiao', '$2a$10$n4/Mtr6uNYY1yE6HC/mfYuoRAXynT1em0H7DdQHxCziDSNBCHxavi', NULL, NULL, NULL, '2022-12-07 22:12:55');
INSERT INTO `sj_user` VALUES (40, 'xia', '$2a$10$NQX9vPyUhLQ3WBbDFtVz.Osy.hOLsd9zqeTdM2w.OuYEnysI9QMZe', NULL, NULL, NULL, '2022-12-07 22:13:10');
INSERT INTO `sj_user` VALUES (41, '2343546576', '$2a$10$otc8.8dV4oy/30XnwzfbCOF6HGBqZcy3/wg4afKtSHhYZ39GRzcFC', NULL, NULL, NULL, '2022-12-08 00:58:29');
INSERT INTO `sj_user` VALUES (42, 'asdfgh', '$2a$10$xOSaRnG39zVEpQNswT12deP7STGcHWNPU4r0PctaLuSnBigaby9We', NULL, NULL, NULL, '2022-12-08 11:32:54');

SET FOREIGN_KEY_CHECKS = 1;

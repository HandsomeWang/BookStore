/*
Navicat MySQL Data Transfer

Source Server         : userdata
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2014-11-27 20:29:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` varchar(255) NOT NULL,
  `apwd` varchar(255) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');
INSERT INTO `admin` VALUES ('b', 'b');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(100) NOT NULL,
  `author` varchar(20) NOT NULL,
  `press` varchar(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `brief` varchar(200) DEFAULT NULL,
  `type` int(20) NOT NULL DEFAULT '0',
  `inventory` int(20) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `bdate` datetime NOT NULL,
  `recommend` int(11) NOT NULL DEFAULT '0',
  `pic` varchar(100) NOT NULL DEFAULT 'images/default.jpg',
  PRIMARY KEY (`bid`),
  KEY `type` (`type`),
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `btype` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring', '贾蓓', '清华大学出版社', '79.80', '99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！', '5', '20', '30', '2014-10-10 21:00:14', '0', 'images/1.jpg');
INSERT INTO `books` VALUES ('3', 'Java7入门经典', '霍尔顿', '清华大学出版社', '118.00', '跟编程导师Ivor Horton学Java 预计到货日期9月初', '5', '0', '10', '2014-10-02 05:00:42', '1', 'images/3.jpg');
INSERT INTO `books` VALUES ('4', 'Java开发实战1200例（第Ⅱ卷）', '无', '清华大学出版社', '99.00', '史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手', '5', '100', '59', '2014-10-08 21:00:58', '0', 'images/4.jpg');
INSERT INTO `books` VALUES ('5', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)', 'Nicholas ', '人民邮电出版社', '148.00', '(套装共2册)(超值附赠《码农》光盘1张)', '5', '99', '8', '2014-10-10 21:01:09', '1', 'images/5.jpg');
INSERT INTO `books` VALUES ('6', 'JavaScript从入门到精通（附光盘1张）', '明日科技', '清华大学出版社', '69.80', '连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库', '5', '100', '4', '2014-10-07 21:01:14', '0', 'images/6.jpg');
INSERT INTO `books` VALUES ('7', '基于MVC的JavaScript Web富应用开发', '麦卡劳', '电子工业出版社', '59.00', '无', '5', '700', '3', '2014-10-01 21:02:46', '0', 'images/7.jpg');
INSERT INTO `books` VALUES ('8', '深入理解Java虚拟机:JVM高级特性与最佳实践', '周志明', '机械工业出版社', '69.00', '超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备', '5', '97', '9', '2014-09-28 21:06:12', '0', 'images/8.jpg');
INSERT INTO `books` VALUES ('9', 'jQuery实战(第2版)', 'Bear', '人民邮电出版社', '69.00', '畅销书升级版，掌握Web开发利器必修宝典', '5', '900', '5', '2014-10-04 21:05:44', '0', 'images/9.jpg');
INSERT INTO `books` VALUES ('10', '文化苦旅', '余秋雨', '长江文艺出版社', '38.00', '                                    《文化苦旅》一书于1992年首次出版，是余秋雨先生1980年代在海内外讲学和考察途中写下的作品，是他的第一部文化散文集。', '1', '218', '6', '2014-10-08 19:37:02', '0', 'images/10.jpg');
INSERT INTO `books` VALUES ('11', '三重门', '韩寒', '天津人民出版社', '35.00', '十四年，五种语言，十八个版本，千万册销量，《三重门》堪称为中国新文学的始点。\r\n十四年，五种语言，十八个版本，千万册销量，《三重门》堪称为中国新文学的始点。\r\n十四年，五种语言，十八个版本，千万册销量，《三重门》堪称为中国新文学的始点。', '1', '100', '11', '2014-10-29 19:39:14', '0', 'images/11.jpg');
INSERT INTO `books` VALUES ('12', '梦里花落知多少', '三毛', '北京十月文艺出版社', '24.00', '三毛华文世界里的传奇女子，她的足迹遍及世界各地，此篇是三毛最受欢迎的作品，倾倒了全世界的华文读者。', '1', '226', '24', '2014-10-19 19:40:59', '0', 'images/12.jpg');
INSERT INTO `books` VALUES ('13', '水浒传——青少年版四大名著', '施耐庵', '广东旅游出版社', '28.00', '增异彩纷呈的众家点评，减复杂枝蔓的情节内容，令《水浒传》成为一本最适合青少年阅读的名著。\r\n水浒品评名家穿越百年犀利点拨，青少年网友神聊海侃趣味点评，名著不再枯燥，鉴赏不再可怕。', '2', '298', '5', '2014-10-01 19:43:33', '0', 'images/13.jpg');
INSERT INTO `books` VALUES ('15', '三国演义（共两册）', '罗贯中', '人民文学出版社', '40.00', '中国古代的小说体类庞杂，作品浩繁。就语言形式而言，有文言、白话之不同：就作品类型而言，则有笔记、话本和章回体之别。它们以各自的方式记录了古时候的人生世象、社会风情，演绎着种种感人的故事。', '2', '330', '4', '2014-10-16 19:47:29', '0', 'images/15.jpg');
INSERT INTO `books` VALUES ('16', '瓦尔登湖(珍藏本)', '（美）梭罗　著，田伟华　译', '中国三峡出版社', '28.00', '该书出版于1854年，梭罗在书中详尽地描述了他在瓦尔登湖湖畔一片再生林中度过两年零两个月的生活以及期间他的许多思考。瓦尔登湖地处美国马萨诸塞州东部的康科德城，离梭罗家不远。梭罗把这次经历称为简朴隐居生活的一次尝试。', '3', '649', '16', '2014-10-27 19:49:45', '0', 'images/16.jpg');
INSERT INTO `books` VALUES ('17', '钢铁是怎样炼成的（精装珍藏本，内附精美插图，名家名译，新课标必读书目）', '（苏）奥斯特洛夫斯基 著，周露 译', '中国画报出版社', '24.00', '《钢铁是怎样炼成的》一书通过对保尔.柯察金成长历程的描述，从中折射出特定时代的战斗烽火、建设场景、社会生活风貌，具有独特的认识作用与教育价值。', '3', '229', '17', '2014-10-05 19:52:29', '1', 'images/17.jpg');
INSERT INTO `books` VALUES ('18', '21世纪资本论', '（法）皮凯蒂　著，巴曙松　等译', '中信出版社', '98.00', '法国经济学家、巴黎经济学院教授托马斯·皮凯蒂对过去300年来欧美国家的财富收入做了详尽探究，通过大量的历史数据分析，旨在证明近几十年来，不平等现象已经扩大，很快会变得更加严重。', '4', '23', '2', '2014-10-18 19:56:38', '0', 'images/18.jpg');
INSERT INTO `books` VALUES ('19', '经济学原理（第6版）', '（美）曼昆　著，梁小民　等译', '北京大学出版社', '64.00', '曼昆的《经济学原理》实在是经济学教材中难得的经典之作，作者遵循“学生导向”，独创“经济学十大原理”，为读者奉上了一本不一样的经济学教科书。', '4', '44', '6', '2014-10-16 19:57:54', '0', 'images/19.jpg');
INSERT INTO `books` VALUES ('20', '世界是平的：21世纪简史', '[美]托马斯·弗里德曼', '湖南科技出版社', '58.00', '这是比尔.盖茨推荐了多次的一本书，他说：这是所有决策者和企业员工的一本必读书。\r\n此书为面市一年即销售近百万册并多次重印的《世界是平的》2.0版的姊妹篇，必将掀起第二次畅销热潮！', '4', '95', '18', '2014-10-31 20:00:45', '1', 'images/20.jpg');
INSERT INTO `books` VALUES ('21', '第三次工业革命 ', '（美）里夫金　著，张体伟，孙豫宁　译', '中信出版社', '45.00', '站在人类发展历史与未来的高度，面对数百年一遇的发展机遇，我们似乎找到了中国经济发展的希望——可持续发展是方向，转变经济发展方式是途径，而第三次工业革命。', '4', '300', '16', '2014-09-30 20:02:35', '0', 'images/21.jpg');
INSERT INTO `books` VALUES ('22', '高效能人士的七个习惯（20周年纪念版）', '（美）柯维', '中国青年出版社', '49.00', '《高效能人士的七个习惯》是福布斯“有史以来最具影响力的10大管理类书籍之一”，《首席执行杂志》“20世纪最具影响力的经济类书籍》。在全球70个国家以32种语言畅销发行。', '6', '319', '9', '2014-10-05 20:04:23', '1', 'images/22.jpg');
INSERT INTO `books` VALUES ('23', '人性的弱点 ', '戴尔·卡耐基著 陶曚 译', '天津人民出版社', '32.00', '《人性的弱点》是1937年最初首印版本原汁原味的复刻，收录了卡耐基本人、他的朋友为此书所写的内容推荐与背景介绍，并完整保留首版中卡耐基对婚姻与家庭的真知灼见。', '6', '121', '11', '2014-10-14 20:06:10', '0', 'images/23.jpg');
INSERT INTO `books` VALUES ('24', '红楼梦（全两册）-- 四大名著名家点评', '曹雪芹 等', '中华书局', '92.00', '《红楼梦》是中国古典小说的巅峰之作。”《红楼梦》以其丰富的内涵和深刻的描写吸引了一代又一代读者。', '2', '398', '3', '2014-11-17 14:21:50', '0', 'images/24.jpg');
INSERT INTO `books` VALUES ('28', '千年一叹（平装）——畅销经典，十年精修，全新上市！', '余秋雨', '长江文艺出版社', '21.40', '余秋雨这位全球华文读书界都不感到陌生的作家，独自追寻踏查人类文明足迹，解读世界文化史，万里历程、文明追溯、历史思索、心灵对话。一流美文，一流深度。大幅修改、最新修订上市！', '1', '118', '67', '2014-11-24 23:45:22', '0', 'images/28.jpg');
INSERT INTO `books` VALUES ('29', '行者无疆（平装）', '余秋雨', '长江文艺出版社', '19.50', '十年来，《行者无疆》在海內外畅销一百多万册，广受读者喜欢。这是最具影响力的跨地域华文作家余秋雨彻底考察欧洲文明的作品。余先生花费十年时间精修此书内容，重新增删篇幅，此次出版，文字更为干净、精致、从容。', '1', '221', '38', '2014-11-18 23:48:15', '1', 'images/29.jpg');
INSERT INTO `books` VALUES ('30', '愿你与这世界温暖相拥', '毕淑敏', '江苏文艺出版社', '24.70', '人生真正的圆满，不是平静乏味的幸福，而是勇敢地面对所有不幸。毕淑敏执笔25年白金纪念版，让每个人重塑内心，相拥美好人生。', '1', '186', '24', '2014-11-03 23:50:07', '1', 'images/30.jpg');

-- ----------------------------
-- Table structure for `btype`
-- ----------------------------
DROP TABLE IF EXISTS `btype`;
CREATE TABLE `btype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of btype
-- ----------------------------
INSERT INTO `btype` VALUES ('0', '选择分类');
INSERT INTO `btype` VALUES ('1', '现代文学');
INSERT INTO `btype` VALUES ('2', '古代文学');
INSERT INTO `btype` VALUES ('3', '外国文学');
INSERT INTO `btype` VALUES ('4', '经济金融');
INSERT INTO `btype` VALUES ('5', '电脑网络');
INSERT INTO `btype` VALUES ('6', '其他类别');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `bid` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `bid` (`bid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `msg_uid` (`uid`),
  CONSTRAINT `msg_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('1', 'c', '购买图书事宜', '昨天买了两西安交大出版社的书，内容很精彩，好评哦！', '2014-10-10 11:22:00');
INSERT INTO `msg` VALUES ('2', 'a', '评价刚刚买的图书', '给孩子买了两本书，质量不错啊', '2014-10-01 01:00:00');
INSERT INTO `msg` VALUES ('3', 'b', '买书心得', '打折的书很便宜啊，下次还来买', '2014-10-08 05:05:34');
INSERT INTO `msg` VALUES ('12', 'a', '关于发货时间的问题', '昨天我买的红楼梦怎么还没发货呢？', '2014-11-24 23:53:36');

-- ----------------------------
-- Table structure for `note`
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(11) NOT NULL,
  `ncontent` varchar(255) NOT NULL,
  `ndate` datetime NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `n_aid` (`aid`),
  CONSTRAINT `n_aid` FOREIGN KEY (`aid`) REFERENCES `admin` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', 'a', '双十二购物通知，12月12日全场五折加全国包邮，12月8日起支付宝充100送100，现在已全面降价，分会场活动延续至18日止，早看早优惠，快快分享！', '2014-11-19 08:53:38');
INSERT INTO `note` VALUES ('2', 'b', '书店开张啦，所有图书一律五折，欢迎选购！', '2014-11-04 20:00:03');
INSERT INTO `note` VALUES ('3', 'a', '这是一条测试公告~~~', '2014-11-10 20:01:22');
INSERT INTO `note` VALUES ('4', 'b', '只能删除自己发布的公告哦！', '2014-11-09 20:02:00');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `bookname` varchar(100) NOT NULL,
  `price` double(10,2) NOT NULL,
  `sum` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`oiid`),
  KEY `oi_bid` (`bid`),
  KEY `oi_oid` (`oid`),
  CONSTRAINT `oi_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('13', '12', '梦里花落知多少', '24.00', '2', '11');
INSERT INTO `orderitem` VALUES ('14', '17', '钢铁是怎样炼成的（精装珍藏本，内附精美插图，名家名译，新课标必读书目）', '24.00', '1', '11');
INSERT INTO `orderitem` VALUES ('15', '10', '文化苦旅', '38.00', '2', '12');
INSERT INTO `orderitem` VALUES ('16', '3', 'Java7入门经典', '118.00', '1', '13');
INSERT INTO `orderitem` VALUES ('17', '4', 'Java开发实战1200例（第Ⅱ卷）', '99.00', '1', '13');
INSERT INTO `orderitem` VALUES ('18', '30', '愿你与这世界温暖相拥', '24.70', '2', '14');
INSERT INTO `orderitem` VALUES ('19', '16', '瓦尔登湖(珍藏本)', '28.00', '1', '14');
INSERT INTO `orderitem` VALUES ('21', '28', '千年一叹（平装）——畅销经典，十年精修，全新上市！', '21.40', '2', '16');
INSERT INTO `orderitem` VALUES ('22', '24', '红楼梦（全两册）-- 四大名著名家点评', '92.00', '1', '16');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `otime` datetime NOT NULL,
  `uid` varchar(11) NOT NULL,
  `allprice` double(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`),
  KEY `o_uid` (`uid`),
  CONSTRAINT `o_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11', '2014-11-27 16:20:27', 'a', '72.00', '2');
INSERT INTO `orders` VALUES ('12', '2014-11-27 16:21:21', 'a', '76.00', '1');
INSERT INTO `orders` VALUES ('13', '2014-11-27 16:21:45', 'a', '217.00', '4');
INSERT INTO `orders` VALUES ('14', '2014-11-27 19:51:24', 'w', '77.40', '3');
INSERT INTO `orders` VALUES ('16', '2014-11-27 20:02:29', 'a', '134.80', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `idcard` varchar(18) NOT NULL,
  `email` varchar(20) NOT NULL,
  `edu` varchar(10) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `post` varchar(10) NOT NULL,
  `addr` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('a', '小王', 'a', '4226781999080', '9874589@qq.com', '大学/专科', '18977886655', '334567', '青岛市胶州路');
INSERT INTO `user` VALUES ('b', '小张', 'b', '300877166298992209', 'dsf@qq.com', '中学', '15789867700', '546690', '天津市');
INSERT INTO `user` VALUES ('c', '王小森', 'c', '410822199208221234', '1234@qq.com', '大学/专科', '13845456565', '454450', '胶州市常州路552号');
INSERT INTO `user` VALUES ('d', '李小二', 'd', '563299198805230012', 'lixiaoer@16.3com', '中学', '18755691236', '300222', '青岛市人民公园');
INSERT INTO `user` VALUES ('w', 'test', 'a', '123', 'asd@qq.com', '大学/专科', '123231', '123', 'test');
DROP TRIGGER IF EXISTS `addcart_insert`;
DELIMITER ;;
CREATE TRIGGER `addcart_insert` BEFORE INSERT ON `cart` FOR EACH ROW BEGIN
	DECLARE
		v_inventory INT;
	SELECT inventory INTO v_inventory FROM books WHERE bid=new.bid;
	IF v_inventory-new.sum<0 THEN
		DELETE FROM cart where bid=-1;
	ELSE
		UPDATE books SET inventory=inventory-new.sum where bid=new.bid;
	END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addcart_update`;
DELIMITER ;;
CREATE TRIGGER `addcart_update` BEFORE UPDATE ON `cart` FOR EACH ROW BEGIN
	DECLARE
		v_inventory INT;
	SELECT inventory INTO v_inventory FROM books WHERE bid=new.bid;
	IF v_inventory+old.sum-new.sum<0 THEN
		DELETE FROM cart where bid=-1;
	ELSE
		UPDATE books SET inventory=inventory+old.sum-new.sum where bid=new.bid;
	END IF; 
END
;;
DELIMITER ;

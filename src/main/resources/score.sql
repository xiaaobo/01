/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.19 : Database - ssmscore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmscore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssmscore`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_username` varchar(30) NOT NULL,
  `a_psw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `a_username` (`a_username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

insert  into `admin`(`a_id`,`a_username`,`a_psw`) values (1,'wangzhuren','wangzhuren'),(2,'lizhuren','lizhuren');

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `class` */

insert  into `class`(`class_id`,`class_name`,`t_id`,`p_id`) values (1,'软件工程1班',1,1),(2,'软件工程2班',2,1),(3,'网络工程1班',3,2),(4,'计算机科学与技术1班',4,3),(5,'信息与计算科学1班',5,4),(6,'网络工程2班',NULL,2);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(20) NOT NULL DEFAULT '',
  `credit` double DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `course` */

insert  into `course`(`c_id`,`c_name`,`credit`,`t_id`) values (1,'语文',4,2),(2,'数学',4,1),(3,'英语',3,3),(4,'物理',4,4),(5,'数据结构',4,5),(6,'spring从入门到入土',4,1),(7,'算法',3,NULL),(8,'C语言',3,NULL);

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `faculty` */

insert  into `faculty`(`f_id`,`f_name`) values (1,'计算机工程学院');

/*Table structure for table `profession` */

DROP TABLE IF EXISTS `profession`;

CREATE TABLE `profession` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `profession` */

insert  into `profession`(`p_id`,`p_name`,`f_id`) values (1,'软件工程',1),(2,'网络工程',1),(3,'计算机科学与技术',1),(4,'信息与计算科学',1);

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `s_id` int NOT NULL,
  `c_id` int NOT NULL,
  `s_score` int DEFAULT NULL,
  PRIMARY KEY (`s_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `score` */

insert  into `score`(`s_id`,`c_id`,`s_score`) values (1,1,80),(1,2,99),(1,3,99),(2,1,70),(2,2,60),(2,3,80),(3,1,80),(3,2,80),(3,3,80),(4,1,50),(4,2,30),(4,3,20),(5,1,76),(5,2,87),(6,1,31),(6,2,100),(6,3,34),(7,2,89),(7,3,98),(8,1,98),(8,2,77),(8,3,99),(9,1,88),(9,2,78),(9,3,68),(10,1,87),(10,2,66),(10,3,68),(11,1,69),(11,2,77),(11,3,78),(12,1,79),(12,2,52),(13,1,43),(13,2,94),(13,3,90),(14,1,92),(14,2,94),(14,3,94),(15,1,55),(15,2,59),(16,1,58),(16,2,57),(17,1,44),(17,2,43),(17,3,42),(18,1,43),(18,2,66),(18,3,68),(19,1,78),(19,2,79),(19,3,88),(20,1,72),(20,2,73),(21,1,74),(21,2,71),(22,1,70),(22,2,88),(22,3,78),(23,1,68),(23,2,66),(23,3,78),(24,1,62),(24,2,88),(24,3,73),(25,1,62),(25,2,84),(25,3,78),(27,2,100);

/*Table structure for table `stu` */

DROP TABLE IF EXISTS `stu`;

CREATE TABLE `stu` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(30) NOT NULL,
  `s_birth` varchar(20) NOT NULL,
  `s_sex` varchar(20) NOT NULL,
  `s_tel` varchar(30) DEFAULT NULL,
  `s_email` varchar(30) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `s_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `s_psw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `s_username` (`s_username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `stu` */

insert  into `stu`(`s_id`,`s_name`,`s_birth`,`s_sex`,`s_tel`,`s_email`,`class_id`,`s_username`,`s_psw`) values (1,'赵雷','1990-01-13','女','123456111','123@qq.com',1,'zhaolei','zhaolei'),(2,'钱电','1990-12-21','男','111234','4561@qq.com',2,'qiandian','qiandian'),(3,'孙风','1990-05-20','男','545233453','121564@qq.com',3,'sunfeng','sunfeng'),(4,'李云','1990-08-06','男','4564535','48971516@qq.com',1,'liyun','liyun'),(5,'周梅','1991-12-06','女','411454','1564564@qq.com',2,'zhoumei','zhoumei'),(6,'吴兰','1992-03-01','女','13512152','478971@qq.com',3,NULL,NULL),(7,'郑竹','1989-07-01','女','15351312','21345687@qq.com',1,NULL,NULL),(8,'王菊','1990-01-20','女','15775757','1231564@qq.com',2,NULL,NULL),(9,'漩涡鸣人','1997-05-16','男','156489788','156489788@qq.com',3,NULL,NULL),(10,'宇智波佐助','1997-03-22','男','15646789','15646789@qq.com',1,NULL,NULL),(11,'春野樱','1997-05-26','女','1787984','1787984@qq.com',2,NULL,NULL),(12,'卡卡西','1995-04-16','男','1535164','1535164@qq.com',3,NULL,NULL),(13,'夕日红','1997-06-16','女','16657879','16657879@qq.com',1,NULL,NULL),(14,'犬冢牙','1997-01-26','男','1567856','1567856@qq.com',2,NULL,NULL),(15,'赤丸','1999-04-16','男','186452425','186452425@qq.com',3,NULL,NULL),(16,'油女志乃','1998-05-16','男','1987254645','1987254645@qq.com',1,NULL,NULL),(17,'日向雏田','1997-02-26','女','1375767856','1375767856@qq.com',2,NULL,NULL),(18,'奈良鹿丸','1996-04-16','男','1535478725','1535478725@qq.com',3,NULL,NULL),(19,'中井野','1996-06-26','女','1452378578','1452378578@qq.com',1,NULL,NULL),(20,'秋道丁次','1997-08-21','男','1854564523','1854564523@qq.com',2,NULL,NULL),(21,'阿斯玛','1997-09-12','男','1854312312','1854312312@qq.com',3,NULL,NULL),(22,'李洛克','1997-05-14','男','189756452','189756452@qq.com',1,NULL,NULL),(23,'日向宁次','1997-05-15','男','1354787875','1354787875@qq.com',2,NULL,NULL),(24,'天天','1998-04-16','女','135478515','135478515@qq.com',3,NULL,NULL),(25,'凯','1997-09-16','男','145687825','145687825@qq.com',1,NULL,NULL),(26,'孙境泽','2021-01-03','男','88888888','88888888@qq.com',4,'sunjingze','sunjingze'),(27,'小艾','2021-03-18','女','1234444','12333@qq.com',3,'xiaoai','xiaoai'),(28,'小蓝猫','2021-05-20','男','88888888','88888888@qq.com',1,'xiaolanmao','xiaolanmao'),(29,'小狗','1990-01-13','男','123456111','123@qq.com',1,'xiaomao','zhaolei'),(31,'小猪','1990-01-13','男','123456111','123@qq.com',1,'sdasdas','zhaolei'),(33,'微微','1990-01-13','女','123456111','123@qq.com',2,'weiwei','zhaolei'),(34,'易大师','1990-01-13','女','123456111','123@qq.com',3,'yidashi','zhaolei'),(35,'小明','1990-01-13','女','123456111','123@qq.com',5,'xiaoming','zhaolei');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) NOT NULL DEFAULT '',
  `t_birth` varchar(30) DEFAULT NULL,
  `t_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t_position` varchar(30) DEFAULT NULL,
  `t_education` varchar(30) DEFAULT NULL,
  `t_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t_psw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_username` (`t_username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`t_id`,`t_name`,`t_birth`,`t_sex`,`t_tel`,`t_email`,`t_position`,`t_education`,`t_username`,`t_psw`) values (1,'张三','1960-05-21','男','187891154','zhangsan@qq.com','助教','本科','zhangsan','zhangsan'),(2,'李四','1972-06-18','男','145678911','lisi@qq.com','讲师','本科','lisi','lisi'),(3,'王五','1985-04-16','男','157894123','wangwu@qq.com','副教授','博士','wangwu','wangwu'),(4,'老刘','2021-01-15','男','1878978941','1564564@qq.com','教授','博士','aaa','aaa'),(5,'孙境泽','2021-01-15','男','1878978941','1564564@qq.com','讲师','本科','sunze','sunze');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

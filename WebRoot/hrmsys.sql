/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.54-community : Database - db_hrmsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_hrmsys` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_hrmsys`;

/*Table structure for table `boon` */

DROP TABLE IF EXISTS `boon`;

CREATE TABLE `boon` (
  `boon_id` int(10) unsigned NOT NULL,
  `boon_name` varchar(200) DEFAULT NULL,
  `boon_money` float DEFAULT NULL,
  `boon_percent` float DEFAULT NULL,
  `boon_remark` text,
  PRIMARY KEY (`boon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `boon` */

insert  into `boon`(`boon_id`,`boon_name`,`boon_money`,`boon_percent`,`boon_remark`) values (1,'养老保险',1000,8,NULL),(2,'医疗保险',500,5,NULL),(3,'失业保险',400,1.5,NULL),(4,'工伤保险',500,0,NULL),(5,'生育保险',300,0,NULL),(6,'住房公积金',1000,10,'undefined');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_id` varchar(2) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_mgr` varchar(100) DEFAULT NULL,
  `dept_remark` text,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`dept_id`,`dept_name`,`dept_mgr`,`dept_remark`) values ('01','经理办','李官','备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注'),('02','行政部','李四','777'),('03','人力资源部','孙七',''),('04','平台软件部','sum',''),('05','产品部','jdongo',''),('06','质量部','fenha',''),('07','嵌入式部','cache','');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `dept_id` varchar(2) NOT NULL,
  `emp_id` varchar(20) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_sex` int(11) NOT NULL,
  `emp_birth` date NOT NULL,
  `emp_address` varchar(200) NOT NULL,
  `emp_post` varchar(6) NOT NULL,
  `emp_telephone` varchar(20) DEFAULT NULL,
  `emp_mobilephone` varchar(11) NOT NULL,
  `emp_qq` varchar(12) DEFAULT NULL,
  `emp_email` varchar(20) NOT NULL,
  `emp_account` varchar(20) NOT NULL,
  `emp_idcard` varchar(18) NOT NULL,
  `emp_photo` varchar(100) DEFAULT NULL,
  `emp_add_date` date DEFAULT NULL,
  `emp_add_person` varchar(100) DEFAULT NULL,
  `emp_job` int(11) DEFAULT NULL,
  `emp_bank` varchar(100) DEFAULT NULL,
  `emp_nationality` varchar(50) DEFAULT NULL,
  `emp_origin` varchar(50) DEFAULT NULL,
  `emp_nation` varchar(50) DEFAULT NULL,
  `emp_school` varchar(100) DEFAULT NULL,
  `emp_education` varchar(50) DEFAULT NULL,
  `emp_profession` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_employee` (`emp_job`),
  KEY `FK_dep_emp` (`dept_id`),
  CONSTRAINT `FK_dep_emp` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`emp_job`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`dept_id`,`emp_id`,`emp_name`,`emp_sex`,`emp_birth`,`emp_address`,`emp_post`,`emp_telephone`,`emp_mobilephone`,`emp_qq`,`emp_email`,`emp_account`,`emp_idcard`,`emp_photo`,`emp_add_date`,`emp_add_person`,`emp_job`,`emp_bank`,`emp_nationality`,`emp_origin`,`emp_nation`,`emp_school`,`emp_education`,`emp_profession`) values ('05','0001','张三',0,'1990-10-10','**************','322334','85553666','15832898327','只能为数字','sam@sina.com','6222838899992223000','430221194907185829','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',19,'9827423794824','美国','******','****','********','******','*******'),('02','0002','李四',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85536666','15832398327','452983728','sam@sina.com','6222888899992222876','430221199904185829',NULL,'2010-10-10','陈白',3,'',NULL,NULL,NULL,NULL,NULL,NULL),('04','0003','王五',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85554666','15832858327','452983728','sam@sina.com','6242888899992222876','430221199947185829',NULL,'2010-10-10','陈白',8,'',NULL,NULL,NULL,NULL,NULL,NULL),('04','0004','赵六',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','86556666','15836898327','452983728','sam@sina.com','6222888849992222876','430221199907185829',NULL,'2010-10-10','陈白',7,'',NULL,NULL,NULL,NULL,NULL,NULL),('03','0005','孙七',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85576666','15832888327','452983728','sam@sina.com','6222888896992222876','430221199207185829',NULL,'2010-10-10','陈白',4,'',NULL,NULL,NULL,NULL,NULL,NULL),('04','0006','王八',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85558666','15845898327','452983728','sam@sina.com','6222888899997222876','430221199107185829',NULL,'2010-10-10','陈白',7,'',NULL,NULL,NULL,NULL,NULL,NULL),('01','0007','李官',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85556576','15862898327','只能为数字','sam@sina.com','6222788899992223000','430221134907185829','http://localhost:8080/hrmsys/photo/2.jpg','2011-05-15','孙七',1,'24234234','2423','24','234','24','24','234'),('04','0008','刘友水',0,'1990-10-10','湖南省***市****区****街****号','322334','83556666','15832848327','只能为数字','sam@sina.com','6222888897992223000','430271199907185829','http://localhost:8080/hrmsys/photo/2.jpg','2011-05-15','孙七',10,'223423423423423','中国','湖南','汉','****大学','本科','计算机科学与技术'),('04','0009','夏青',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','25556666','15834898327','452983728','sam@sina.com','6222888799992222876','430221199902185829','http://localhost:8080/hrmsys/photo/2.jpg','2010-10-10','陈白',8,'',NULL,NULL,NULL,NULL,NULL,NULL),('04','0010','王不',0,'1990-10-10','广东省广州市天河区中山大道100号','322334','85456666','15562898327','452983728','sam@sina.com','6222888894992222876','430221199907145829','http://localhost:8080/hrmsys/photo/2.jpg','2010-10-10','陈白',7,'',NULL,NULL,NULL,NULL,NULL,NULL),('04','0011','右要',0,'2011-02-03','呵灰可用哪个顺加入因发国觉','432789','12325654','15878392923','546321565','kdj@sina.com','23948729875352','48392749285922','http://localhost:8080/hrmsys/photo/1.jpg','2011-02-28','孙七',8,'喹国','中国','湘','汉','中石油楞','本科','计算机'),('04','0012','sum',1,'2011-02-03','湘','637283','','24243242','2423','sld@sina.com','234928347293423','2434242342432','http://localhost:8080/hrmsys/photo/2.jpg',NULL,NULL,5,'中行','中国','湘','汉','人文','本科','计算机'),('04','0013','edwin',1,'2011-01-05','6','6','','6','只能为数字','6@sina.com','6','6','http://localhost:8080/hrmsys/photo/2.jpg','2011-05-15','孙七',8,'6','6','6','6','6','6','6'),('04','0014','jacky',1,'2011-02-01','6','6','','6','只能为数字','6@sina.com','6','6','http://localhost:8080/hrmsys/photo/1.jpg','2011-05-15','孙七',9,'6','6','6','6','6','6','6'),('05','0015','jdongo',1,'2011-02-10','66','6','5','6','只能为数字','6@sina.com','6','6','http://localhost:8080/hrmsys/photo/1.jpg','2011-05-15','孙七',6,'6','6','6','6','6','6','6'),('06','0016','lucy',0,'2011-05-15','河南省某某市某某区某某街','412100','85556666','15877292384','452912719','lucy@163.com','234234234234','430211999882938473','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',13,'234234234234234','中国','河南','汉','某某学校','硕士','某某专业'),('06','0017','suny',1,'1978-05-15','2222','412100','8555666','15873828492','954299822','suny@163.com','2423423424234234','430221198907105919','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',15,'mmm','2222','222','22','222','222','222'),('07','0018','sina',1,'1985-05-01','22','412100','0738-85556666','15873828492','452912739','sina@163.com','4324284234242342','43022119890710591x','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',22,'22222','22','222','22','22','22','22'),('07','0019','cache',1,'1978-05-01','23434','431200','85556666','15323928742','24928423424','cache@163.com','24242342423424','430221998907105912','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',23,'24234','234','234','24','234','234','234'),('06','0020','fenha',1,'2011-04-01','242423423','412080','8555666','15873829422','4521293434','fenha@sina.com','24242342141','430221198907105910','http://localhost:8080/hrmsys/img/default.gif','2011-05-15','孙七',12,'24234','3434','234','234','234','234','234');

/*Table structure for table `encourage_punish` */

DROP TABLE IF EXISTS `encourage_punish`;

CREATE TABLE `encourage_punish` (
  `ep_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `ep_type` int(11) DEFAULT NULL COMMENT '0奖励1处罚',
  `ep_topic` varchar(100) DEFAULT NULL,
  `ep_money` float(8,2) DEFAULT NULL,
  `ep_other` text COMMENT '其它奖励或惩罚',
  `ep_release_date` date DEFAULT NULL,
  `ep_release_person` varchar(100) DEFAULT NULL,
  `ep_reason` text,
  `ep_remark` text,
  PRIMARY KEY (`ep_id`),
  KEY `FK_emp_ep` (`emp_id`),
  CONSTRAINT `FK_emp_ep` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `encourage_punish` */

insert  into `encourage_punish`(`ep_id`,`emp_id`,`ep_type`,`ep_topic`,`ep_money`,`ep_other`,`ep_release_date`,`ep_release_person`,`ep_reason`,`ep_remark`) values (2,'0008',1,'ffff',50.00,'24234','2010-02-05','孙七','',''),(3,'0009',1,'dddd',100.00,NULL,'2010-02-05','孙七',NULL,NULL),(4,'0010',1,'222',300.00,NULL,'2010-02-05','孙七',NULL,NULL),(5,'0001',0,'243',111.00,'111','2010-02-05','孙七','',''),(6,'0002',0,'111',111.00,'111','2010-02-05','孙七','111','111'),(7,'0002',0,'111',111.00,'111','2010-02-05','孙七','111','111'),(8,'0003',1,'222',222.00,'22','2010-02-05','孙七','22',''),(11,'0007',0,'23',2323.00,'222','2011-05-02','孙七','22','22'),(12,'0007',0,'555',300.00,'',NULL,NULL,'','');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) NOT NULL,
  `job_remark` text,
  `job_dept_id` varchar(2) DEFAULT NULL,
  `job_basic_wage` float DEFAULT NULL COMMENT '基本工资',
  PRIMARY KEY (`job_id`),
  KEY `FK_job` (`job_dept_id`),
  CONSTRAINT `FK_job` FOREIGN KEY (`job_dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `job` */

insert  into `job`(`job_id`,`job_name`,`job_remark`,`job_dept_id`,`job_basic_wage`) values (1,'总经理','','01',6000),(2,'总经理助理','','01',5000),(3,'行政部经理','','02',6000),(4,'人力资源部经理','','03',6000),(5,'平台软件部经理','','04',6000),(6,'产品部经理','','05',5000),(7,'软件工程师','','04',4000),(8,'系统架构师','','04',5000),(9,'助理软件工程师','','04',2500),(10,'测试工程师','','04',4000),(11,'硬件高级工程师','','06',5000),(12,'质量部经理','','06',6000),(13,'工艺工程师','','06',3000),(14,'硬件工程师','','06',4000),(15,'PCB工程师','','06',4500),(16,'招聘专员','','03',3000),(17,'劳资专员','','03',3000),(18,'绩效专员','','03',3000),(19,'产品工程师','','05',4000),(20,'UI工程师','','05',4000),(21,'包装设计工程师','','05',4000),(22,'软件高级工程师','','07',4000),(23,'嵌入式部经理','','07',6000);

/*Table structure for table `job_change` */

DROP TABLE IF EXISTS `job_change`;

CREATE TABLE `job_change` (
  `jc_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `jc_old_dept` varchar(2) DEFAULT NULL,
  `jc_old_job` int(11) DEFAULT NULL,
  `jc_new_dept` varchar(2) DEFAULT NULL,
  `jc_new_job` int(11) DEFAULT NULL,
  `jc_add_person` varchar(100) DEFAULT NULL,
  `jc_date` date DEFAULT NULL,
  `jc_reason` varchar(500) DEFAULT NULL,
  `jc_remark` text,
  PRIMARY KEY (`jc_id`),
  KEY `FK_emp_jc` (`emp_id`),
  KEY `FK_job_old_job` (`jc_old_job`),
  KEY `FK_job_new_job` (`jc_new_job`),
  KEY `FK_jc_new_dept` (`jc_new_dept`),
  KEY `FK_jc_old_dept` (`jc_old_dept`),
  CONSTRAINT `FK_emp_jc` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_jc_new_dept` FOREIGN KEY (`jc_new_dept`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `FK_jc_old_dept` FOREIGN KEY (`jc_old_dept`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `FK_job_new_job` FOREIGN KEY (`jc_new_job`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FK_job_old_job` FOREIGN KEY (`jc_old_job`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `job_change` */

insert  into `job_change`(`jc_id`,`emp_id`,`jc_old_dept`,`jc_old_job`,`jc_new_dept`,`jc_new_job`,`jc_add_person`,`jc_date`,`jc_reason`,`jc_remark`) values (7,'0007','02',3,'01',1,'孙七','2011-05-16','',''),(8,'0008','04',9,'04',10,'孙七','2011-05-15','',''),(9,'0013','04',9,'04',8,'孙七','2011-05-16','','');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(20) NOT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `menu_leaf` int(11) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `menu_icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu_title`,`menu_parent_id`,`menu_leaf`,`menu_url`,`menu_icon`) values (1,'人力资源管理',0,0,NULL,NULL),(2,'部门管理',1,0,NULL,NULL),(3,'职员管理',1,0,NULL,NULL),(4,'奖惩管理',1,0,NULL,NULL),(5,'薪资管理',1,0,NULL,NULL),(6,'培训管理',1,0,NULL,NULL),(7,'招聘管理',1,0,NULL,NULL),(8,'报表管理',1,0,NULL,NULL),(9,'系统管理',1,0,NULL,NULL),(10,'部门信息管理',2,1,'jsp/department/deptInfo.jsp','deptInfo'),(11,'部门职位管理',2,1,'jsp/department/jobInfo.jsp','job'),(12,'员工信息管理',3,1,'jsp/employee/empInfo.jsp','employee'),(14,'员工职位变动',3,1,'jsp/employee/jobChange.jsp','change'),(15,'招聘信息管理',7,1,'jsp/recruitment/recruitment.jsp','recruitment'),(16,'培训信息发布',6,1,'jsp/train/train.jsp','train'),(17,'培训记录信息',6,1,'jsp/train/trainRecord.jsp','trainRecord'),(18,'奖惩信息管理',4,1,'jsp/encouragePunish/ePunish.jsp','epunish'),(19,'薪资标准管理',5,0,'',NULL),(20,'税率表管理',19,1,'jsp/salary/revenue.jsp','revenue'),(21,'福利表管理',19,1,'jsp/salary/boon.jsp','boon'),(22,'员工工资配置',19,1,'jsp/salary/salaryBasic.jsp','config'),(23,'员工工资录入',5,1,'jsp/salary/salaryAdd.jsp','salaryAdd'),(24,'员工工资信息',5,1,'jsp/salary/salaryInfo.jsp','salary'),(25,'用户管理',9,1,'jsp/system/userInfo.jsp','user'),(26,'角色管理',9,1,'jsp/system/permissionAssign.jsp','role'),(27,'部门人数统计图',8,1,'jsp/report/deptPersonNum.jsp','graph'),(28,'员工个人信息报表',8,1,'jsp/report/empDetail.jsp','userReport'),(29,'个人信息维护',9,1,'jsp/system/update.jsp','userUpdate'),(30,'员工薪水报表',8,1,'jsp/report/salary.jsp','money');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `per_function` int(1) NOT NULL,
  PRIMARY KEY (`per_id`),
  KEY `FK_permission` (`menu_id`),
  CONSTRAINT `FK_permission` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`per_id`,`menu_id`,`per_function`) values (1,10,1),(2,10,2),(3,10,3),(4,10,4),(5,11,1),(6,11,2),(7,11,3),(8,11,4),(9,12,1),(10,12,2),(11,12,3),(12,12,4),(13,14,1),(14,14,2),(15,14,4),(16,18,1),(17,18,2),(18,18,4),(19,20,1),(20,20,2),(21,20,4),(22,20,6),(23,21,1),(24,21,2),(25,21,4),(26,21,6),(27,22,1),(28,22,2),(29,22,4),(30,22,6),(31,23,1),(32,24,1),(33,24,3),(34,24,4),(35,24,5),(36,16,1),(37,16,2),(38,16,4),(39,17,1),(40,17,2),(41,17,4),(42,15,1),(43,15,2),(44,15,3),(45,15,4),(46,15,5),(47,27,1),(48,28,1),(49,12,5),(50,25,1),(51,25,2),(52,25,3),(53,25,4),(54,26,4),(55,26,2),(56,26,3),(57,26,1),(58,29,1),(59,14,3),(60,14,5),(61,18,3),(62,18,5),(63,16,3),(64,16,5),(65,17,3),(66,17,5),(67,30,1);

/*Table structure for table `recruitment` */

DROP TABLE IF EXISTS `recruitment`;

CREATE TABLE `recruitment` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_title` varchar(100) NOT NULL,
  `rec_content` text NOT NULL,
  `rec_start` date DEFAULT NULL,
  `rec_end` date DEFAULT NULL,
  `rec_person` varchar(100) NOT NULL,
  `rec_date` date NOT NULL,
  `rec_job` varchar(100) NOT NULL,
  `rec_num` int(11) NOT NULL,
  `rec_remark` text,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `recruitment` */

insert  into `recruitment`(`rec_id`,`rec_title`,`rec_content`,`rec_start`,`rec_end`,`rec_person`,`rec_date`,`rec_job`,`rec_num`,`rec_remark`) values (1,'1','1','2011-03-01','2011-03-03','孙七','2011-03-08','1',1,'1'),(2,'2','2','2011-03-01','2011-03-05','孙七','2011-03-09','2',2,'2'),(3,'2222','423','2011-05-10','2011-05-20','孙七','2011-05-16','234',2,''),(4,'13213','1','2011-05-09','2011-05-18','孙七','2011-05-16','123',3,'');

/*Table structure for table `revenue` */

DROP TABLE IF EXISTS `revenue`;

CREATE TABLE `revenue` (
  `re_id` int(11) NOT NULL,
  `re_min` float DEFAULT NULL,
  `re_max` float DEFAULT NULL,
  `re_percent` float DEFAULT NULL,
  `re_minus` float DEFAULT NULL,
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `revenue` */

insert  into `revenue`(`re_id`,`re_min`,`re_max`,`re_percent`,`re_minus`) values (1,2000,2500,5,0),(2,2500,4000,10,25),(3,4000,7000,15,125),(4,7000,22000,20,375),(5,22000,42000,25,1375),(6,42000,62000,30,3375),(7,62000,82000,35,6375),(8,82000,102000,40,10375),(9,102000,1e+006,45,15375);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_remark` text,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_remark`) values (1,'超级管理员',NULL),(2,'招聘专员',NULL),(3,'aa','a'),(5,'bbb2','');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`rp_id`),
  KEY `FK_role_permission` (`role_id`),
  KEY `FK_role_permission_id` (`per_id`),
  CONSTRAINT `FK_role_permission` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_role_permission_id` FOREIGN KEY (`per_id`) REFERENCES `permission` (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`rp_id`,`per_id`,`role_id`) values (409,36,1),(410,37,1),(411,38,1),(412,63,1),(413,64,1),(414,39,1),(415,40,1),(416,41,1),(417,65,1),(418,66,1),(419,16,1),(420,17,1),(421,18,1),(422,61,1),(423,62,1),(424,48,1),(425,67,1),(426,47,1),(427,42,1),(428,43,1),(429,44,1),(430,45,1),(431,46,1),(432,58,1),(433,50,1),(434,51,1),(435,52,1),(436,53,1),(437,54,1),(438,55,1),(439,56,1),(440,57,1),(441,9,1),(442,10,1),(443,11,1),(444,12,1),(445,49,1),(446,13,1),(447,14,1),(448,15,1),(449,59,1),(450,60,1),(451,27,1),(452,28,1),(453,29,1),(454,30,1),(455,23,1),(456,24,1),(457,25,1),(458,26,1),(459,19,1),(460,20,1),(461,21,1),(462,22,1),(463,32,1),(464,33,1),(465,34,1),(466,35,1),(467,31,1),(468,1,1),(469,2,1),(470,3,1),(471,4,1),(472,5,1),(473,6,1),(474,7,1),(475,8,1),(476,36,2),(477,37,2),(478,38,2),(479,39,2),(480,41,2),(481,48,2),(482,67,2),(483,42,2),(484,43,2),(485,44,2),(486,58,2),(487,50,2),(488,57,2),(489,9,2),(490,13,2),(491,27,2),(492,23,2),(493,19,2),(494,32,2),(495,1,2),(496,5,2);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `sal_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `sal_basic` float(8,2) DEFAULT NULL COMMENT '基本工资',
  `sal_job` float(8,2) DEFAULT NULL COMMENT '岗位工资',
  `sal_normal` float(8,2) DEFAULT NULL COMMENT '正常工作时间',
  `sal_all` float(8,2) DEFAULT NULL COMMENT '全勤奖',
  `sal_absenteeism` float(8,2) DEFAULT NULL COMMENT '旷工时间',
  `sal_absenteeism_money` float(8,2) DEFAULT NULL COMMENT '缺勤金额',
  `sal_endowmentint` float(8,2) DEFAULT NULL COMMENT '养老保险',
  `sal_hospitalizationint` float(8,2) DEFAULT NULL,
  `sal_unemploymentint` float(8,2) DEFAULT NULL,
  `sal_eateryfloat` float(8,2) NOT NULL,
  `sal_trafficfloat` float(8,2) DEFAULT NULL,
  `sal_telephone` float(8,2) DEFAULT NULL,
  `sal_allowance` float(8,2) DEFAULT NULL COMMENT '其它补贴',
  `sal_revenue` float(8,2) DEFAULT NULL COMMENT '个税',
  `sal_money` float(8,2) DEFAULT NULL COMMENT '实际工资',
  `sal_year` varchar(4) DEFAULT NULL COMMENT '年份',
  `sal_release_person` varchar(100) DEFAULT NULL,
  `sal_release_date` date DEFAULT NULL,
  `sal_check_person` varchar(100) DEFAULT NULL,
  `sal_check_date` date DEFAULT NULL,
  `sal_month` int(2) DEFAULT '0' COMMENT '月份',
  `sal_remark` text,
  PRIMARY KEY (`sal_id`),
  KEY `FK_emp_sal` (`emp_id`),
  CONSTRAINT `FK_emp_sal` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`sal_id`,`emp_id`,`sal_basic`,`sal_job`,`sal_normal`,`sal_all`,`sal_absenteeism`,`sal_absenteeism_money`,`sal_endowmentint`,`sal_hospitalizationint`,`sal_unemploymentint`,`sal_eateryfloat`,`sal_trafficfloat`,`sal_telephone`,`sal_allowance`,`sal_revenue`,`sal_money`,`sal_year`,`sal_release_person`,`sal_release_date`,`sal_check_person`,`sal_check_date`,`sal_month`,`sal_remark`) values (1,'0007',4000.00,1000.00,100.00,0.00,4.00,160.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,683.35,4705.65,'2011','孙七','2011-02-24',NULL,NULL,2,NULL),(2,'0008',4000.00,500.00,100.00,0.00,5.00,200.00,80.00,25.00,6.00,300.00,100.00,200.00,0.00,623.35,4365.65,'2011','孙七','2011-03-10',NULL,NULL,2,''),(3,'0007',4000.00,1000.00,100.00,0.00,3.00,120.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,683.35,4705.65,'2011','孙七','2011-01-09',NULL,NULL,1,''),(4,'0008',4000.00,500.00,100.00,100.00,0.00,0.00,80.00,25.00,6.00,300.00,100.00,200.00,0.00,623.35,4365.65,'2011','孙七','2011-03-10',NULL,NULL,1,''),(5,'0001',4000.00,4000.00,120.00,100.00,0.00,0.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,1302.80,7086.20,'2011','孙七','2011-05-16',NULL,NULL,5,''),(6,'0002',3500.00,6000.00,100.00,0.00,4.00,140.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,1602.80,8286.20,'2011','孙七','2011-05-16',NULL,NULL,4,''),(7,'0005',3000.00,6000.00,100.00,100.00,0.00,0.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,1502.80,7886.20,'2011','孙七','2011-05-16',NULL,NULL,3,''),(8,'0006',4000.00,4000.00,100.00,0.00,2.00,80.00,80.00,25.00,6.00,300.00,100.00,100.00,0.00,1286.80,7022.20,'2011','孙七','2011-05-16',NULL,NULL,4,'');

/*Table structure for table `salary_basic` */

DROP TABLE IF EXISTS `salary_basic`;

CREATE TABLE `salary_basic` (
  `sb_id` int(11) NOT NULL,
  `emp_id` varchar(20) NOT NULL,
  `sb_basic` float DEFAULT '0' COMMENT '基本工资',
  `sb_endowment` int(1) DEFAULT '0' COMMENT '养老保险',
  `sb_hospitalization` int(1) DEFAULT '0' COMMENT '医疗保险',
  `sb_unemployment` int(1) DEFAULT '0' COMMENT '失业保险',
  `sb_injury` int(1) DEFAULT '0' COMMENT '工伤保险',
  `sb_maternity` int(1) DEFAULT '0' COMMENT '生育保险',
  `sb_housing` int(1) DEFAULT '0' COMMENT '住房公积金',
  `sb_traffic` float DEFAULT '0' COMMENT '交通补贴',
  `sb_eatery` float DEFAULT '0' COMMENT '餐饮补贴',
  `sb_telephone` float DEFAULT '0' COMMENT '通信补贴',
  PRIMARY KEY (`sb_id`),
  KEY `FK_salary_basic` (`emp_id`),
  CONSTRAINT `FK_salary_basic` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salary_basic` */

insert  into `salary_basic`(`sb_id`,`emp_id`,`sb_basic`,`sb_endowment`,`sb_hospitalization`,`sb_unemployment`,`sb_injury`,`sb_maternity`,`sb_housing`,`sb_traffic`,`sb_eatery`,`sb_telephone`) values (1,'0007',4000,1,1,1,1,0,1,100,300,100),(2,'0008',4000,1,1,0,1,1,1,100,300,200),(3,'0006',4000,1,1,1,1,0,1,100,300,100),(4,'0001',4000,1,1,1,1,1,1,100,300,100),(6,'0003',3000,1,1,1,1,1,1,200,300,100),(7,'0004',4000,1,1,1,1,1,1,100,300,200),(8,'0005',3000,1,1,1,1,1,1,100,300,100),(9,'0002',3500,1,1,1,1,0,1,100,300,100);

/*Table structure for table `train` */

DROP TABLE IF EXISTS `train`;

CREATE TABLE `train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_title` varchar(100) NOT NULL,
  `train_content` text NOT NULL,
  `train_date` date NOT NULL,
  `train_place` varchar(100) NOT NULL,
  `train_person` varchar(100) NOT NULL,
  `train_add_person` varchar(100) NOT NULL,
  `train_add_date` date NOT NULL,
  `train_remark` text,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `train` */

insert  into `train`(`train_id`,`train_title`,`train_content`,`train_date`,`train_place`,`train_person`,`train_add_person`,`train_add_date`,`train_remark`) values (1,'入职培训','员工入职培训：\n1.公司介绍 2.公司财务 3.公司市场 4.公司产品','2010-02-23','总部','孙七','孙七','2011-05-01','sss'),(2,'a','a','2011-02-10','a','abbbcccc','孙七','2011-04-04','a'),(3,'b','b','2011-02-10','b','b','孙七','2011-02-21','b'),(5,'c','c','2011-02-02','c','c','孙七','2011-02-21','c'),(6,'d','d','2011-02-03','d','d','孙七','2011-02-21','d'),(7,'e','e','2011-02-11','e','e','孙七','2011-02-21','e'),(8,'f','f','2011-02-10','f','f','孙七','2011-02-21','f'),(9,'abbb','ab','2011-02-10','a','a','孙七','2011-04-04','a'),(10,'vvv','v','2011-04-07','v','vv','孙七','2011-04-04','v'),(11,'24','24','2011-05-18','24','234222','孙七','2011-05-16','234');

/*Table structure for table `train_record` */

DROP TABLE IF EXISTS `train_record`;

CREATE TABLE `train_record` (
  `tRecord_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  `tRecord_add_date` date DEFAULT NULL,
  `tRecord_add_person` varchar(100) DEFAULT NULL,
  `tRecord_result` int(11) DEFAULT NULL,
  `tRecord_remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tRecord_id`),
  KEY `FK_train_record_emp` (`emp_id`),
  KEY `FK_train_record_train` (`train_id`),
  CONSTRAINT `FK_train_record_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_train_record_train` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `train_record` */

insert  into `train_record`(`tRecord_id`,`emp_id`,`train_id`,`tRecord_add_date`,`tRecord_add_person`,`tRecord_result`,`tRecord_remark`) values (1,'0007',1,'2011-05-01','孙七',0,NULL),(3,'0009',1,'2011-05-01','孙七',2,NULL),(4,'0009',1,'2011-05-01','孙七',1,'999sfdfs'),(5,'0007',11,'2011-05-16','孙七',1,'s');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `emp_id` varchar(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_pwd` varchar(30) NOT NULL,
  `user_remark` text,
  `user_date` date NOT NULL,
  `user_last_ip` varchar(15) DEFAULT NULL,
  `user_last_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_emp_user` (`emp_id`),
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_emp_user` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`role_id`,`emp_id`,`user_name`,`user_pwd`,`user_remark`,`user_date`,`user_last_ip`,`user_last_time`) values (1,1,'0005','孙七','ICy5YqxZB1uWSwcVLSNLcA==',NULL,'2011-02-12','0:0:0:0:0:0:0:1','2011-05-17 20:04:30'),(3,1,'0011','右要','ICy5YqxZB1uWSwcVLSNLcA==','00','2011-03-26',NULL,NULL),(4,2,'0012','sum','ICy5YqxZB1uWSwcVLSNLcA==','11','2011-03-26','0:0:0:0:0:0:0:1','2011-05-13 15:56:10'),(5,2,'0007','李官','aVCqwteTLh8aTDz2raExbg==','111','2011-05-16',NULL,NULL),(6,2,'0006','王八','f4uw/oszeAoI/mtgztFFKQ==','23421111111','2011-05-16',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

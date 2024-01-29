/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.36-community-log : Database - digitalisasimasjid2110033
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`digitalisasimasjid2110033` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `digitalisasimasjid2110033`;

/*Table structure for table `tbl_agenda` */

DROP TABLE IF EXISTS `tbl_agenda`;

CREATE TABLE `tbl_agenda` (
  `idagenda` char(11) NOT NULL,
  `namakegiatan` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  PRIMARY KEY (`idagenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_agenda` */

insert  into `tbl_agenda`(`idagenda`,`namakegiatan`,`tanggal`,`jam`) values ('A001','Wirid Remaja','2023-11-21','20:00:00'),('A002','Majelis Ta\'lim','2023-11-25','16:00:00'),('A003','Tadarus','2023-11-30','20:30:00');

/*Table structure for table `tbl_donatur` */

DROP TABLE IF EXISTS `tbl_donatur`;

CREATE TABLE `tbl_donatur` (
  `iddonatur` char(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nohp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`iddonatur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_donatur` */

insert  into `tbl_donatur`(`iddonatur`,`nama`,`alamat`,`nohp`) values ('D0001','Shiha','Jl. Belimbing','089564321122'),('D0002','Rafa','Jl. Pampangan','089654321123'),('D0003','Yulia','Jl. Anggur','087654334567'),('D0005','Irba','Jl. Pepaya raya','089765445678');

/*Table structure for table `tbl_kas_keluar` */

DROP TABLE IF EXISTS `tbl_kas_keluar`;

CREATE TABLE `tbl_kas_keluar` (
  `id_kas_masjid` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `kas_keluar` double DEFAULT NULL,
  `jenis_kas` varchar(20) DEFAULT NULL,
  `idagendamasjid` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_kas_masjid`),
  KEY `idagendamasjid` (`idagendamasjid`),
  CONSTRAINT `tbl_kas_keluar_ibfk_1` FOREIGN KEY (`idagendamasjid`) REFERENCES `tbl_agenda` (`idagenda`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_kas_keluar` */

/*Table structure for table `tbl_kas_masjid` */

DROP TABLE IF EXISTS `tbl_kas_masjid`;

CREATE TABLE `tbl_kas_masjid` (
  `id_kas_masjid` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `kas_masuk` double DEFAULT NULL,
  `jenis_kas` varchar(20) DEFAULT NULL,
  `iddonaturmasjid` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_kas_masjid`),
  KEY `iddonaturmasjid` (`iddonaturmasjid`),
  CONSTRAINT `tbl_kas_masjid_ibfk_1` FOREIGN KEY (`iddonaturmasjid`) REFERENCES `tbl_donatur` (`iddonatur`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_kas_masjid` */

insert  into `tbl_kas_masjid`(`id_kas_masjid`,`tanggal`,`ket`,`kas_masuk`,`jenis_kas`,`iddonaturmasjid`) values (21,'2024-01-03','Infak',150000,'Anak Yatim',NULL),(23,'2024-01-01','Pembangunan Mesjid',0,'Masjid',NULL),(24,'2024-01-08','Hamba Allah',450000,'Masjid',NULL),(27,'2023-12-08','Santunan ',0,'Anak Yatim',NULL),(28,'2024-01-10','Bantuan',450000,'Anak Yatim','D0001'),(29,'2024-01-10','Donatur',90000,'Masjid','D0002'),(30,'2024-01-04','Pembangunan TPQ',450000,'TPQ','D0003'),(31,'2024-01-11','Pembangunan Mesjid',90000,'Masjid','D0005');

/*Table structure for table `tbl_pengurus` */

DROP TABLE IF EXISTS `tbl_pengurus`;

CREATE TABLE `tbl_pengurus` (
  `id_pengurus` char(11) COLLATE utf8_czech_ci NOT NULL,
  `nama_pengurus` varchar(35) COLLATE utf8_czech_ci DEFAULT NULL,
  `jabatan` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `no_hp` varchar(15) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_pengurus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

/*Data for the table `tbl_pengurus` */

insert  into `tbl_pengurus`(`id_pengurus`,`nama_pengurus`,`jabatan`,`alamat`,`no_hp`) values ('P001','Yolanda','Sekretaris','Sirsak 4','089560257622'),('P002','Rafa','Ketua','Belimbing','081324567789'),('P003','Shiha','Bendahara','Pepaya Raya','089675432212');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`nama_user`,`email`,`password`,`level`) values (1,'Yolanda','yolandassa@gmail.com','$2y$10$FzWv6to6C4FAk6VfadxgVuroiPWuwhXUw1zgA.Y/ZbgsCf3krIbxe',1),(2,'Reslina','husnatulha@gmail.com','$2y$10$q/B7Ikl7Kdad978PAQwZAODcddpg8BzSXpgLTOeUuNagwXsSHYwbi',2),(3,'Nurly','nurlysya@gmail.com','$2y$10$LAP6c6RdxAP597v5QupRYerDUdUC2p3yVUu1YmuhPqUQeTGUhtpT6',3),(4,'Shandra','shandramo@gmail.com','$2y$10$t6t.i6Shn1otvCo4BL5yhuEdlCZSUjtxs9yxRt7Mm5aTVCYhEtqV6',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

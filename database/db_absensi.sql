-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2021 at 06:24 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(93, '2021-08-01', '07:20:13', 'Masuk', 15),
(94, '2021-08-01', '16:00:12', 'Pulang', 15),
(95, '2021-08-02', '07:20:13', 'Masuk', 15),
(96, '2021-08-02', '16:00:00', 'Pulang', 15),
(97, '2021-08-03', '07:20:13', 'Masuk', 15),
(98, '2021-08-03', '16:00:12', 'Pulang', 15),
(99, '2021-08-04', '07:20:13', 'Masuk', 15),
(100, '2021-08-04', '16:00:12', 'Pulang', 15),
(101, '2021-08-05', '07:20:13', 'Masuk', 15),
(102, '2021-08-05', '16:00:12', 'Pulang', 15),
(103, '2021-08-06', '07:20:13', 'Masuk', 15),
(104, '2021-08-06', '16:00:12', 'Pulang', 15),
(107, '2021-08-09', '07:20:13', 'Masuk', 15),
(108, '2021-08-09', '16:00:12', 'Pulang', 15),
(109, '2021-08-10', '07:20:13', 'Masuk', 15),
(110, '2021-08-10', '16:00:12', 'Pulang', 15),
(112, '2021-08-11', '07:20:13', 'Masuk', 15),
(113, '2021-08-11', '16:00:12', 'Pulang', 15),
(114, '2021-08-01', '07:20:13', 'Masuk', 16),
(115, '2021-08-01', '16:00:12', 'Pulang', 16),
(116, '2021-08-02', '07:20:13', 'Masuk', 16),
(117, '2021-08-02', '16:00:00', 'Pulang', 16),
(118, '2021-08-03', '07:20:13', 'Masuk', 16),
(119, '2021-08-03', '16:00:12', 'Pulang', 16),
(120, '2021-08-04', '07:20:13', 'Masuk', 16),
(121, '2021-08-04', '16:00:12', 'Pulang', 16),
(122, '2021-08-05', '07:20:13', 'Masuk', 16),
(123, '2021-08-05', '16:00:12', 'Pulang', 16),
(124, '2021-08-06', '07:20:13', 'Masuk', 16),
(125, '2021-08-06', '16:00:12', 'Pulang', 16),
(126, '2021-08-09', '07:20:13', 'Masuk', 16),
(127, '2021-08-09', '16:00:12', 'Pulang', 16),
(128, '2021-08-10', '07:20:13', 'Masuk', 16),
(129, '2021-08-10', '16:00:12', 'Pulang', 16),
(134, '2021-08-16', '10:22:24', 'Masuk', 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `absen_masuk`
-- (See below for the actual view)
--
CREATE TABLE `absen_masuk` (
`id_user` int(11)
,`id_absen` int(11)
,`tgl` date
,`waktu` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `absen_pulang`
-- (See below for the actual view)
--
CREATE TABLE `absen_pulang` (
`id_user` int(11)
,`id_absen` int(11)
,`tgl` date
,`waktu` time
);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` smallint(3) NOT NULL,
  `nama_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'Marketing'),
(2, 'IT '),
(3, 'Akuntan'),
(4, 'Security'),
(5, 'HSE');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '06:30:00', '08:00:00', 'Masuk'),
(2, '16:00:00', '16:45:00', 'Pulang');

-- --------------------------------------------------------

--
-- Table structure for table `perhitungan_gaji`
--

CREATE TABLE `perhitungan_gaji` (
  `id_gaji` int(11) NOT NULL,
  `bulan` varchar(15) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `total_hadir` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_absensi`
-- (See below for the actual view)
--
CREATE TABLE `rekap_absensi` (
`tgl` date
,`id_user` smallint(5)
,`nama` varchar(50)
,`masuk` time
,`pulang` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_bulan`
-- (See below for the actual view)
--
CREATE TABLE `rekap_bulan` (
`bulan` varchar(2)
,`tahun` varchar(4)
,`id_user` smallint(5)
,`nama` varchar(50)
,`jumlah_hadir` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_count`
-- (See below for the actual view)
--
CREATE TABLE `rekap_count` (
`id_user` smallint(5)
,`nama` varchar(50)
,`divisi` varchar(255)
,`masuk` bigint(21)
,`pulang` bigint(21)
,`bulan` varchar(2)
,`tahun` varchar(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_diterima`
-- (See below for the actual view)
--
CREATE TABLE `rekap_diterima` (
`id_user` smallint(5)
,`nama` varchar(50)
,`persen_hadir` decimal(26,2)
,`uang_diterima` bigint(28)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` varchar(255) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(1, '12312312332123', 'Ahmad Fadillah 1', '08139212092', 'ahm.fadil@mail.com', '1564316194.png', NULL, 'hestu', '$2y$10$2kexYaZKVXX/5Liljm2FXO0Zk7BI5LUQgOTz1bRIf211eraxpju2a', 'Manager'),
(8, '8931289124891', 'Manager 1', '', '', 'no-foto.png', NULL, 'manager_1', '$2y$10$XtMY01KEOd5I065s8Exs0OcQ373RvRNG1JznORr6TmmBNWnZ3vjjK', 'Manager'),
(9, '1231231238900', 'Manager 2', '', '', 'no-foto.png', NULL, 'manager_2', '$2y$10$iJWUOXDznGEmxo.bqnhtmeFL51jN5130LfDlKg8VROfoEmlgC.cFW', 'Manager'),
(10, '908121310291', 'Manager 3', '', '', 'no-foto.png', NULL, 'manager_3', '$2y$10$uGsLvgl.6ji2iZ7tWkNvPelTwZdLQ6QA81Yawa20wsLairCXqV8BO', 'Manager'),
(11, '123801204012', 'Manager 4', '', '', 'no-foto.png', NULL, 'master_4', '$2y$10$Kot81WNqrho4WlcYI13kT.Y5V2sMg1ZSAXcITrp8cj3dqHpbl4vrS', 'Manager'),
(15, '1241423412', 'Fajar Maulana Ichsan', '08886004588', 'hestu@gmail.com', 'no-foto.png', 'Pengelola Administrasi Umum Pada Sub Bagian Umum dan Kepegawain', '123456', '$2y$10$LtkYczZUAhhkWzBb8Ih9J.tsahU6RA0iiAkeomQIjMY/LsCQ5IWnS', 'Karyawan'),
(16, '12312312412412421', 'Rani Apriliani', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Bantuan Keuangan pada Pemdes Seksi Pemerintahan', '123457', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan'),
(17, '12312312', 'Hani Nur Haningsih', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Pengendalian Monitoring dan Evaluasi pada Seksi Pembangunan', '123458', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan'),
(18, '34564574574', 'Ayi Muhammad Cahri', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Fasilitas Sosial dan Umum pada Seksi Sosial Budaya', '123459', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan'),
(19, '54534523', 'Yayan T Kurniawan', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Layana Opersional pada Sub Bagian Umum dan Kepegawaian', '1234510', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan'),
(20, '23214215', 'Mia Hildayanti', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Kesejahteraan Sosial pada Seksi Sosial Budaya', '1234511', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan'),
(21, '8679769', 'Agus Budianto', '0811261842684', 'aceng@gmail.com', 'no-foto.png', 'Pengelola Data pada Seksi Pemberdayaan Masyarakat', '1234512', '$2y$10$kG8hCEuFXVu39YGOZI.hs.u4PGWLqPnAbcG7t3iF9zrvFfQsgZ.di', 'Karyawan');

-- --------------------------------------------------------

--
-- Structure for view `absen_masuk`
--
DROP TABLE IF EXISTS `absen_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `absen_masuk`  AS SELECT `a`.`id_user` AS `id_user`, `a`.`id_absen` AS `id_absen`, `a`.`tgl` AS `tgl`, `a`.`waktu` AS `waktu` FROM `absensi` AS `a` WHERE `a`.`keterangan` = 'masuk' ;

-- --------------------------------------------------------

--
-- Structure for view `absen_pulang`
--
DROP TABLE IF EXISTS `absen_pulang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `absen_pulang`  AS SELECT `a`.`id_user` AS `id_user`, `a`.`id_absen` AS `id_absen`, `a`.`tgl` AS `tgl`, `a`.`waktu` AS `waktu` FROM `absensi` AS `a` WHERE `a`.`keterangan` = 'pulang' ;

-- --------------------------------------------------------

--
-- Structure for view `rekap_absensi`
--
DROP TABLE IF EXISTS `rekap_absensi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_absensi`  AS SELECT `am`.`tgl` AS `tgl`, `u`.`id_user` AS `id_user`, `u`.`nama` AS `nama`, `am`.`waktu` AS `masuk`, `ap`.`waktu` AS `pulang` FROM ((`absen_masuk` `am` join `absen_pulang` `ap` on(`am`.`tgl` = `ap`.`tgl`)) join `users` `u` on(`am`.`id_user` = `u`.`id_user` and `ap`.`id_user` = `u`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Structure for view `rekap_bulan`
--
DROP TABLE IF EXISTS `rekap_bulan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_bulan`  AS SELECT DISTINCT date_format(`ra`.`tgl`,'%m') AS `bulan`, date_format(`ra`.`tgl`,'%Y') AS `tahun`, `ra`.`id_user` AS `id_user`, `ra`.`nama` AS `nama`, (select count(`rekap_absensi`.`tgl`) from `rekap_absensi` where `rekap_absensi`.`nama` = `ra`.`nama`) AS `jumlah_hadir` FROM `rekap_absensi` AS `ra` ;

-- --------------------------------------------------------

--
-- Structure for view `rekap_count`
--
DROP TABLE IF EXISTS `rekap_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_count`  AS SELECT DISTINCT `u`.`id_user` AS `id_user`, `u`.`nama` AS `nama`, `u`.`divisi` AS `divisi`, (select count(`ra2`.`masuk`) from `rekap_absensi` `ra2` where `ra2`.`id_user` = `u`.`id_user`) AS `masuk`, (select count(`ra2`.`pulang`) from `rekap_absensi` `ra2` where `ra2`.`id_user` = `u`.`id_user`) AS `pulang`, ifnull(date_format(`a`.`tgl`,'%m'),date_format(current_timestamp(),'%m')) AS `bulan`, ifnull(date_format(`a`.`tgl`,'%Y'),date_format(current_timestamp(),'%Y')) AS `tahun` FROM ((`users` `u` left join `absensi` `a` on(`u`.`id_user` = `a`.`id_user`)) left join `rekap_absensi` `ra` on(`u`.`id_user` = `ra`.`id_user`)) WHERE `u`.`level` = 'karyawan' ;

-- --------------------------------------------------------

--
-- Structure for view `rekap_diterima`
--
DROP TABLE IF EXISTS `rekap_diterima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rekap_diterima`  AS SELECT `rb`.`id_user` AS `id_user`, `rb`.`nama` AS `nama`, round(`rb`.`jumlah_hadir` / 20 * 100,2) AS `persen_hadir`, 2250000 - (20 - `rb`.`jumlah_hadir`) * 11250 AS `uang_diterima` FROM `rekap_bulan` AS `rb` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indexes for table `perhitungan_gaji`
--
ALTER TABLE `perhitungan_gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perhitungan_gaji`
--
ALTER TABLE `perhitungan_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

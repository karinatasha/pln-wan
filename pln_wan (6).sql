-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2018 at 04:56 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pln_wan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_gangguan`
--

CREATE TABLE `tb_gangguan` (
  `id_gangguan` int(100) NOT NULL,
  `id_jenisgangguan` int(100) DEFAULT NULL,
  `id_layanan` int(10) NOT NULL,
  `deskripsi_jenisgangguan` varchar(255) DEFAULT NULL,
  `lokasi_gangguan` varchar(100) DEFAULT NULL,
  `penyebab_gangguan` varchar(255) DEFAULT NULL,
  `solusi_gangguan` varchar(255) DEFAULT NULL,
  `open_date` date NOT NULL,
  `open_time` time NOT NULL,
  `close_date` date DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `cari_durasi` varchar(20) DEFAULT NULL,
  `isDelete` varchar(10) DEFAULT 'no',
  `bulan` varchar(10) DEFAULT NULL,
  `tahun` varchar(10) DEFAULT NULL,
  `isSolved` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_gangguan`
--

INSERT INTO `tb_gangguan` (`id_gangguan`, `id_jenisgangguan`, `id_layanan`, `deskripsi_jenisgangguan`, `lokasi_gangguan`, `penyebab_gangguan`, `solusi_gangguan`, `open_date`, `open_time`, `close_date`, `close_time`, `durasi`, `cari_durasi`, `isDelete`, `bulan`, `tahun`, `isSolved`) VALUES
(77, 12, 25, '', 'Pop ke Lastmile.', 'aaa', 'aaa', '2018-08-01', '08:00:00', '0000-00-00', '00:00:00', '0:00:00', NULL, 'no', '08', '2018', 'yes'),
(82, 3, 9, 'modul error', 'Pop ke Lastmile', 'coba', 'coba', '2018-08-09', '08:10:03', '2018-08-09', '15:40:50', '7:30:47', '730', 'no', '08', '2018', 'no'),
(83, 2, 1, 's', 's', 's', 's', '2018-08-01', '08:00:00', '0000-00-00', '00:00:00', '0:00:00', NULL, 'no', '08', '2018', 'no'),
(84, 2, 17, '', '', '', '', '2018-08-08', '07:25:10', '2018-08-08', '08:26:11', '1:1:1', '1', 'yes', '08', '2018', 'no'),
(85, 2, 11, '', '', '', '', '2018-08-08', '07:25:10', '2018-08-08', '08:26:11', '1:1:1', '11', 'no', '08', '2018', 'no'),
(86, 3, 2, '', 'd', 'd', 'dd', '2018-08-29', '14:20:05', '2018-08-29', '03:30:01', '1:9:56', '19', 'no', '08', '2018', 'yes'),
(87, 16, 3, '', '', '', '', '2018-08-30', '08:30:45', '0000-00-00', '00:00:00', '0:00:00', NULL, 'yes', '08', '2018', 'no'),
(88, 3, 17, '', 's', 's', 's', '2018-08-30', '08:00:00', '2018-08-30', '09:35:56', '1:35:56', '135', 'no', '08', '2018', 'yes'),
(89, 16, 3, '', '', '', '', '2018-08-10', '08:00:00', '0000-00-00', '00:00:00', '0:00:00', NULL, 'no', '08', '2018', 'no'),
(90, 3, 25, 'test deskripsi gangguan', 'Pop ke Lastmile', 'modul error', 'modul diperbaiki', '2018-08-30', '01:20:00', '2018-08-30', '02:25:09', '1:5:9', '15', 'no', '08', '2018', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisgangguan`
--

CREATE TABLE `tb_jenisgangguan` (
  `id_jenisgangguan` int(100) NOT NULL,
  `jenis_gangguan` varchar(50) NOT NULL,
  `ket_gangguan` varchar(100) DEFAULT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no',
  `isShow` varchar(10) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenisgangguan`
--

INSERT INTO `tb_jenisgangguan` (`id_jenisgangguan`, `jenis_gangguan`, `ket_gangguan`, `isDelete`, `isShow`) VALUES
(1, 'Putus kabel', '', 'no', 'yes'),
(2, 'Perangkat', 'Switch/Router', 'no', 'yes'),
(3, 'Modul', 'Software/Config/Catalys', 'no', 'yes'),
(4, 'Wiring', 'Kabel non fo', 'no', 'yes'),
(5, 'Patchord', 'Fo indoor', 'no', 'yes'),
(6, 'Power supply', '', 'no', 'yes'),
(11, 'cobain', 'cobaa oyy', 'yes', 'yes'),
(12, 'Kabel', '', 'no', 'yes'),
(13, 'Terminal', '', 'no', 'yes'),
(14, 'Lain-lain', '', 'no', 'yes'),
(15, 'Switch', '', 'no', 'yes'),
(16, 'Belum Diketahui', 'Jenis gangguan belum dikonfirmasi', 'no', 'no'),
(17, 'test', '', 'no', 'yes'),
(18, 'test2', '', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jeniskeluhan`
--

CREATE TABLE `tb_jeniskeluhan` (
  `id_jeniskeluhan` int(100) NOT NULL,
  `jenis_keluhan` varchar(100) NOT NULL,
  `ket_keluhan` varchar(255) DEFAULT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no',
  `isShow` varchar(10) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jeniskeluhan`
--

INSERT INTO `tb_jeniskeluhan` (`id_jeniskeluhan`, `jenis_keluhan`, `ket_keluhan`, `isDelete`, `isShow`) VALUES
(3, 'Listrik setempat padam', '', 'no', 'yes'),
(4, 'IP yg di tunjuk monitoring down', '', 'no', 'yes'),
(5, 'Lain-lain', '', 'no', 'yes'),
(10, 'Belum Diketahui', 'jenis keluhan belum dikonfirmasi', 'no', 'no'),
(11, '', '', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenislayanan`
--

CREATE TABLE `tb_jenislayanan` (
  `id_jenislayanan` int(100) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenislayanan`
--

INSERT INTO `tb_jenislayanan` (`id_jenislayanan`, `nama_layanan`, `isDelete`) VALUES
(2, 'IPVPN', 'no'),
(3, 'Akses Internet', 'no'),
(6, 'service', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keluhan`
--

CREATE TABLE `tb_keluhan` (
  `id_keluhan` int(100) NOT NULL,
  `id_jeniskeluhan` int(100) NOT NULL,
  `id_layanan` int(10) NOT NULL,
  `deskripsi_jeniskeluhan` varchar(225) DEFAULT NULL,
  `penyebab_keluhan` varchar(225) DEFAULT NULL,
  `solusi_keluhan` varchar(225) DEFAULT NULL,
  `open_date` date NOT NULL,
  `open_time` time NOT NULL,
  `close_date` date DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `cari_durasi` varchar(20) DEFAULT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no',
  `bulan` varchar(10) DEFAULT NULL,
  `tahun` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_keluhan`
--

INSERT INTO `tb_keluhan` (`id_keluhan`, `id_jeniskeluhan`, `id_layanan`, `deskripsi_jeniskeluhan`, `penyebab_keluhan`, `solusi_keluhan`, `open_date`, `open_time`, `close_date`, `close_time`, `durasi`, `cari_durasi`, `isDelete`, `bulan`, `tahun`) VALUES
(12, 4, 8, 'a', 'a', 'a', '2017-10-10', '06:00:00', '2017-10-10', '13:45:15', '7:45:15', '745', 'no', '10', '2017'),
(13, 10, 1, 's', '', '', '2018-08-04', '08:00:00', '2018-08-04', '09:00:00', '1:0:0', '10', 'no', '08', '2018'),
(14, 4, 3, '', 't', '', '2018-08-02', '07:20:05', '0000-00-00', '00:00:00', '0:00:00', NULL, 'no', '08', '2018'),
(15, 4, 26, '', '', '', '2018-08-01', '07:20:05', '0000-00-00', '00:00:00', '0:00:00', NULL, 'no', '08', '2018');

-- --------------------------------------------------------

--
-- Table structure for table `tb_layanan`
--

CREATE TABLE `tb_layanan` (
  `id_layanan` int(10) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kapasitas` varchar(10) DEFAULT NULL,
  `nama_pic` varchar(10) DEFAULT NULL,
  `no_hp_pic` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_jenislayanan` int(100) NOT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_layanan`
--

INSERT INTO `tb_layanan` (`id_layanan`, `sid`, `lokasi`, `kapasitas`, `nama_pic`, `no_hp_pic`, `email`, `id_jenislayanan`, `isDelete`) VALUES
(1, '01000005549', 'Gudang Tanjung Priok', '2 Mb', 'Hidayat', '0858-6388-9993', '', 2, 'no'),
(2, '10000045240002', 'Condet (APL Kramat Jati)', '2 Mb', 'Handoyo', '0821-9691-6133', '', 2, 'no'),
(3, '10000045240004', 'Bandengan ', '2 Mb', 'Pendi', '0856-8587-000', '', 2, 'no'),
(4, '10000045240006', 'Tanjung priok', '2 Mb', 'Hidayat', '0858-6388-9993', '', 2, 'no'),
(5, '10000045240008', 'Kalideres', '2 Mb', 'Agus', '0817270811', '', 2, 'no'),
(6, '10000045240009', 'Grogol', '2 Mb', 'Adi', '', '', 2, 'no'),
(7, '10000045240010', 'Cempaka Putih', '2 Mb', 'Mulyono', '0878-8069-2999', '', 2, 'no'),
(8, '10000045240011', 'Bintaro', '2 Mb', 'Hanafi', '0819-0825-4774', '', 2, 'no'),
(9, '10000045240012', 'Gudang Klender', '2 Mb', 'Husni Topa', '0855-7023-434', '', 2, 'no'),
(10, '10000045240014', 'Pasar Minggu / Lenteng agung / Gudang Lenteng Agung', '2 Mb', 'Chandra', '081271672738', '', 2, 'no'),
(11, '10000045240015', 'Cengkareng', '2 Mb', 'Agus', '0817-270-811', '', 2, 'no'),
(12, '10000045240020', 'Marunda', '2 Mb', 'Asep', '0813-8532-5835', '', 2, 'no'),
(13, '10000045240021', 'Pamulang', '2 Mb', 'Sumarta', '0813-1059-5349', '', 2, 'no'),
(14, '10000045240022', 'Kebon Jeruk', '2 Mb', 'Pak Dwi', '0811-1852-007', '', 2, 'no'),
(15, '10000045240023', 'Ciputat', '2 Mb', 'Sumarta', '081310595349', '', 2, 'no'),
(16, '10000045240024', 'Cileduk', '2 Mb', 'Hanafi', '0819-0825-4774', '', 2, 'no'),
(17, '10000045240028', 'Bulungan  /  kebayoran', '2 Mb', 'Lutfi', '0811-1398-289', '', 2, 'no'),
(18, '10000045240033', 'Lenteng Agung', '2 Mb', 'Chandra', '081271672738', '', 2, 'no'),
(19, '10000045240035', 'Ciracas', '2 Mb', 'Ovel', '0811-9850-530', '', 2, 'no'),
(20, '10000045240036', 'Kalimalang', '2 Mb', 'Yuki', '0821-1399-2140', '', 2, 'no'),
(21, '10000045240037', 'Pondok Gede', '2 Mb', 'Nurdin', '0813-1464-3536', '', 2, 'no'),
(22, '10000045240087', 'Pondok Kopi', '2 Mb', 'Yuki', '0813-1464-3536', '', 2, 'no'),
(23, '10000045240091', 'Wisma Cipay', '1 Mb', 'Bu Anna ', '0855-1532-323', '', 2, 'no'),
(25, '170000268240020', 'Jatinegara', '2 Mb', 'Torik', '0812-8137-3867', '', 2, 'no'),
(26, '990000320271824', 'Gudang Jatirangon', '1 Mb', 'Sukardi', '0812-9268-812', '', 2, 'no'),
(27, '990000320335124', 'Posko Istana Negara', '2 Mb', 'Bu Anna', '0855-1532-323', '', 2, 'no'),
(28, '11111111111111', 'admin dan petugas input', NULL, NULL, NULL, NULL, 2, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_progress`
--

CREATE TABLE `tb_progress` (
  `id_progress` int(100) NOT NULL,
  `id_gangguan` int(100) NOT NULL,
  `status_progress` int(2) NOT NULL DEFAULT '1',
  `ket_progress` varchar(225) NOT NULL,
  `waktu` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_progress`
--

INSERT INTO `tb_progress` (`id_progress`, `id_gangguan`, `status_progress`, `ket_progress`, `waktu`) VALUES
(37, 77, 1, 'bismillah', '10:00:00'),
(38, 77, 2, 'ss', '11:00:00'),
(47, 86, 1, 'aa', '09:00:00'),
(48, 86, 2, 'selesai', '03:29:00'),
(49, 88, 1, 'a', '09:00:00'),
(50, 88, 2, 'selesai', '10:00:00'),
(51, 85, 1, 'a', '09:00:00'),
(52, 82, 1, 'petugas sampai lokasi', '10:00:00'),
(53, 90, 1, 'petugas menuju lokasi', '09:00:00'),
(54, 90, 2, 'selesai', '14:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_karyawan` int(100) NOT NULL,
  `no_karyawan` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status_user` varchar(50) NOT NULL,
  `id_layanan` int(10) NOT NULL,
  `isDelete` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_karyawan`, `no_karyawan`, `nama`, `password`, `status_user`, `id_layanan`, `isDelete`) VALUES
(1243, '333', 'Admin', '333', 'Admin', 28, 'no'),
(1244, '22', 'Petugas Input', '22', 'Input', 28, 'no'),
(1245, '44', 'Petugas Viewer', '44', 'Viewer', 1, 'no'),
(1246, '55', 'Petugas Viewer Gd Tanjung Priok', '55', 'Viewer', 4, 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_gangguan`
--
ALTER TABLE `tb_gangguan`
  ADD PRIMARY KEY (`id_gangguan`),
  ADD KEY `gangguan_fk1` (`id_jenisgangguan`),
  ADD KEY `gangguan_fk2` (`id_layanan`);

--
-- Indexes for table `tb_jenisgangguan`
--
ALTER TABLE `tb_jenisgangguan`
  ADD PRIMARY KEY (`id_jenisgangguan`);

--
-- Indexes for table `tb_jeniskeluhan`
--
ALTER TABLE `tb_jeniskeluhan`
  ADD PRIMARY KEY (`id_jeniskeluhan`);

--
-- Indexes for table `tb_jenislayanan`
--
ALTER TABLE `tb_jenislayanan`
  ADD PRIMARY KEY (`id_jenislayanan`);

--
-- Indexes for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  ADD PRIMARY KEY (`id_keluhan`),
  ADD KEY `keluhan_fk1` (`id_jeniskeluhan`),
  ADD KEY `keluhan_fk2` (`id_layanan`);

--
-- Indexes for table `tb_layanan`
--
ALTER TABLE `tb_layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `layanan_fk1` (`id_jenislayanan`);

--
-- Indexes for table `tb_progress`
--
ALTER TABLE `tb_progress`
  ADD PRIMARY KEY (`id_progress`),
  ADD KEY `progress_fk1` (`id_gangguan`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `user_fk1` (`id_layanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_gangguan`
--
ALTER TABLE `tb_gangguan`
  MODIFY `id_gangguan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `tb_jenisgangguan`
--
ALTER TABLE `tb_jenisgangguan`
  MODIFY `id_jenisgangguan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tb_jeniskeluhan`
--
ALTER TABLE `tb_jeniskeluhan`
  MODIFY `id_jeniskeluhan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_jenislayanan`
--
ALTER TABLE `tb_jenislayanan`
  MODIFY `id_jenislayanan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  MODIFY `id_keluhan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tb_layanan`
--
ALTER TABLE `tb_layanan`
  MODIFY `id_layanan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tb_progress`
--
ALTER TABLE `tb_progress`
  MODIFY `id_progress` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_karyawan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1247;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_gangguan`
--
ALTER TABLE `tb_gangguan`
  ADD CONSTRAINT `gangguan_fk1` FOREIGN KEY (`id_jenisgangguan`) REFERENCES `tb_jenisgangguan` (`id_jenisgangguan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `gangguan_fk2` FOREIGN KEY (`id_layanan`) REFERENCES `tb_layanan` (`id_layanan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  ADD CONSTRAINT `keluhan_fk1` FOREIGN KEY (`id_jeniskeluhan`) REFERENCES `tb_jeniskeluhan` (`id_jeniskeluhan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `keluhan_fk2` FOREIGN KEY (`id_layanan`) REFERENCES `tb_layanan` (`id_layanan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_layanan`
--
ALTER TABLE `tb_layanan`
  ADD CONSTRAINT `layanan_fk1` FOREIGN KEY (`id_jenislayanan`) REFERENCES `tb_jenislayanan` (`id_jenislayanan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_progress`
--
ALTER TABLE `tb_progress`
  ADD CONSTRAINT `progress_fk1` FOREIGN KEY (`id_gangguan`) REFERENCES `tb_gangguan` (`id_gangguan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `user_fk1` FOREIGN KEY (`id_layanan`) REFERENCES `tb_layanan` (`id_layanan`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 05:10 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pkbmksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE IF NOT EXISTS `absensi` (
`id_absensi` int(11) NOT NULL,
  `id_sekolah` varchar(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_sekolah`, `judul`, `tgl_mulai`, `tgl_akhir`, `keterangan`) VALUES
(5, 'KSI001', 'Absensi Harian', '2015-10-13', '2015-10-13', 'Absensi Pertama Testing'),
(6, 'KSI001', 'Pertemuan pertama', '2015-10-15', '2015-10-16', 'testing'),
(7, 'KSI003', 'pertemuan pertama', '2015-10-25', '2015-10-26', ''),
(8, 'KSI001', 'Pertemuan kedua', '2015-11-25', '2015-11-26', 'pertemuan kedua ');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama`, `email`, `kontak`) VALUES
('admin', 'b5b2193044b787d5fbad2778ef9e0f05', 'Toriq Pria Dhigfora', 'toriq.354@gmail.com', '089623997382');

-- --------------------------------------------------------

--
-- Table structure for table `detail_absensi`
--

CREATE TABLE IF NOT EXISTS `detail_absensi` (
`id_detail_absensi` int(11) NOT NULL,
  `id_absensi` int(11) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `status` enum('H','A','I','S') NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `detail_absensi`
--

INSERT INTO `detail_absensi` (`id_detail_absensi`, `id_absensi`, `id_siswa`, `status`, `tgl`) VALUES
(11, 4, 'KSI00071500', 'H', '2015-10-08'),
(12, 4, 'KSI000715001', 'H', '2015-10-08'),
(13, 3, 'KSI000715001', 'H', '2015-10-08'),
(14, 2, 'KSI000715001', 'H', '2015-10-08'),
(15, 1, 'SKL000415001', 'H', '2015-10-08'),
(16, 4, 'KSI000515009', 'H', '2015-10-09'),
(17, 5, 'KSI00115001', 'H', '2015-10-12'),
(18, 6, 'KSI00115001', 'H', '2015-10-13'),
(19, 6, 'KSI00115002', 'H', '2015-10-13'),
(20, 5, 'KSI00115002', 'H', '2015-10-13'),
(21, 6, 'KSI00115003', 'H', '2015-10-24'),
(22, 5, 'KSI00115003', 'H', '2015-10-24'),
(23, 7, 'KSI00315004', 'H', '2015-10-24'),
(24, 7, 'KSI00315003', 'H', '2015-10-26'),
(25, 6, 'KSI00115004', 'H', '2015-10-26'),
(26, 5, 'KSI00115004', 'H', '2015-10-26'),
(27, 6, 'KSI00115015', 'H', '2015-10-28'),
(28, 5, 'KSI00115015', 'H', '2015-10-28'),
(29, 6, 'KSI00115006', 'H', '2015-11-18'),
(30, 5, 'KSI00115006', 'H', '2015-11-18'),
(31, 6, 'KSI00115005', 'H', '2015-11-23'),
(32, 5, 'KSI00115005', 'H', '2015-11-23'),
(33, 8, 'KSI00115007', 'H', '2015-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
`id_email_log` int(5) NOT NULL,
  `tipe_email` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `id_tujuan` varchar(50) NOT NULL,
  `email_tujuan` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` enum('N','A') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `dibuat_oleh` varchar(45) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='N : New , A : Approve' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`id_email_log`, `tipe_email`, `kode`, `tujuan`, `id_tujuan`, `email_tujuan`, `subject`, `message`, `status`, `tgl_buat`, `dibuat_oleh`) VALUES
(1, 'pendaftaran_employer', 'XDLOEd85V9', 'employer', 'EMP1600003', 'toriq.354@gmail.com', 'Pendaftaran Employer', 'Selamat pendaftaran anda sebagai employer telah berhasil. Klik link ini untuk memverifikasi pendaftaran http://localhost/ksi//employer/verifikasi.php?verifikasi_kode=XDLOEd85V9. Terima kasih', 'N', '2016-01-11 10:22:44', 'system'),
(2, 'pendaftaran_employer', 'c2OmXXTx2W', 'employer', 'EMP1600004', 'toriq.354@gmail.com', 'Pendaftaran Employer', ' Selamat pendaftaran anda sebagai employer telah berhasil. Klik link ini untuk memverifikasi pendaftaran http://www.pkbm-ksi.sch.id/app//employer/verifikasi.php?verifikasi_kode=c2OmXXTx2W. Terima kasih', 'A', '2016-01-11 10:29:34', 'system'),
(3, 'pendaftaran_employer', '1dj8M41qOQ', 'employer', 'EMP1600005', 'toriq.354@gmail.com', 'Pendaftaran Employer', ' Selamat pendaftaran anda sebagai employer telah berhasil. Klik link ini untuk memverifikasi pendaftaran http://www.pkbm-ksi.sch.id/app//employer/verifikasi.php?verifikasi_kode=1dj8M41qOQ. Terima kasih', 'N', '2016-01-11 10:35:19', 'system'),
(4, 'verifikasi_employer', 'V_c2OmXXTx2W', 'employer', 'EMP1600004', 'toriq.354@gmail.com', 'Verifikasi Pendaftaran Employer', 'Selamat pendaftaran anda sebagai employer telah berhasil. ID employer anda adalah <strong>EMP1600004 </strong> dan password adalah <strong>tahugoreng354 </strong>  ', 'A', '2016-01-11 10:36:38', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE IF NOT EXISTS `employer` (
  `id_employer` varchar(100) NOT NULL,
  `id_perusahaan` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jnsklmn` varchar(10) NOT NULL,
  `tgllhr` varchar(11) NOT NULL,
  `alamat` text NOT NULL,
  `foto` text NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `perusahaan` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  `tgl_dibuat` date NOT NULL,
  `dibuat_oleh` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id_employer`, `id_perusahaan`, `nama`, `jnsklmn`, `tgllhr`, `alamat`, `foto`, `pendidikan`, `jenjang`, `password`, `email`, `telp`, `jabatan`, `perusahaan`, `status`, `tgl_dibuat`, `dibuat_oleh`) VALUES
('EMP1500002', '7', 'Albert', 'Pria', '09-09-2015', 'sdasdsad', 'avira.png', 'Perguruan Tinggi', 'D3 - Bina Sarana Informatika', '123456565', 'aminudin@gmail.com', '081212341234', 'manager sdm', '', 'a', '0000-00-00', ''),
('EMP1600003', '', 'Toriq Pria Dhigfora', 'Pria', '31-01-1989', 'Jakarta', '', '', '', 'tahugoreng354', 'toriq.354@gmail.com', '0892312312312', '', '', 'N', '2016-01-11', 'system'),
('EMP1600004', '7', 'Toriq Pria', 'Pria', '01-01-2016', 'TEst', '', '', '', 'efc5df519268bab152125cca01204874', 'toriq.354@gmail.com', '1231223', 'Programmer', 'A', 'A', '2016-01-11', 'system'),
('EMP1600005', '', 'Reynaldi Dwi Setiawan', 'Pria', '06-01-2016', 'Jakarta', '', '', '', 'oke123', 'toriq.354@gmail.com', '2131232131', '', '', 'N', '2016-01-11', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_lowongan`
--

CREATE TABLE IF NOT EXISTS `kategori_lowongan` (
`id_kat_lowongan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `kategori_lowongan`
--

INSERT INTO `kategori_lowongan` (`id_kat_lowongan`, `nama`) VALUES
(1, 'Full Time'),
(8, 'Part Time '),
(9, 'Shift ');

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE IF NOT EXISTS `lowongan` (
`id_lowongan` int(11) NOT NULL,
  `id_employer` varchar(20) NOT NULL,
  `id_kat_lowongan` int(11) NOT NULL,
  `judul` text NOT NULL,
  `posisi` text NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_posting` varchar(100) NOT NULL,
  `tgl_tutup` varchar(100) NOT NULL,
  `status` enum('N','A','R') NOT NULL COMMENT 'N : New , A : Approve , R : Reject'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`id_lowongan`, `id_employer`, `id_kat_lowongan`, `judul`, `posisi`, `deskripsi`, `tgl_posting`, `tgl_tutup`, `status`) VALUES
(5, 'EMP1500002', 1, 'Dibutuhkan Web Developer Evercoss Indonesia', 'Web Developer', '<p>Harus bisa Code Igniter</p>\r\n', '06-09-2015', '06-09-2015', ''),
(6, 'EMP1500002', 8, 'Dibutuhkan Web Konten Evercoss Indonesia', 'Web Konten', '<p>The company develop web and desktop applications using Object Oriented Programming language such as PHP, JAVA, and Joomla as the major base.<br />\r\nThe successful candidates are expected to work well with minimal supervision both in a team and independent to produce a very high standard product. Above all else, you must have a positive attitude and willingness to think outside the box.</p>\r\n\r\n<p><strong>Tanggung Jawab Pekerjaan :</strong></p>\r\n\r\n<p>&bull; Design and development of web applications using PHP / Mysql / Joomla</p>\r\n\r\n<p><strong>Persyaratan Pengalaman :</strong></p>\r\n\r\n<p>Min. 3 years experience in PHP and or or Joomla</p>\r\n\r\n<p><strong>Keahlian :</strong></p>\r\n\r\n<p>&ndash; Expert in PHP<br />\r\n&ndash; Strong knowledge of Mysql and Joomla<br />\r\n&ndash; Can code Joomla component</p>\r\n\r\n<p><strong>Kualifikasi :</strong></p>\r\n\r\n<p>&ndash; Male / female<br />\r\n&ndash; Honest and detailed<br />\r\n&ndash; Able to work under minimum supervision independently or in team<br />\r\n&ndash; Able to work with certain target</p>\r\n', '06-09-2015', '06-09-2015', ''),
(8, 'EMP1500002', 8, 'dibutuhkan karyawan di bidang gudang', 'quality control', '', '18-11-2015', '18-11-2015', '');

-- --------------------------------------------------------

--
-- Table structure for table `matpel`
--

CREATE TABLE IF NOT EXISTS `matpel` (
  `id_matpel` varchar(10) NOT NULL,
  `id_paket` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matpel`
--

INSERT INTO `matpel` (`id_matpel`, `id_paket`, `nama`, `keterangan`) VALUES
('MP0001', 'PK0001', 'BAHASA INDONESIA', 'BAHASA INDONESIA UNTUK SD'),
('MP0002', 'PK0001', 'MATEMATIKA', 'MATEMATIKA UNTUK SD'),
('MP0003', 'PK0001', 'ILMU PENGETAHUAN ALAM', 'IPA UNTUK SD'),
('MP0004', 'PK0001', 'ILMU PENGETAHUAN SOSIAL', 'IPS UNTUK SD'),
('MP0005', 'PK0001', 'PENDIDIKAN KEWARGANEGARAAN', 'PKN UNTUK SD'),
('MP0006', 'PK0002', 'BAHASA INDONESIA', 'BAHASA INDONESIA UNTUK SMP'),
('MP0007', 'PK0002', 'BAHASA INGGRIS', 'BAHASA INGGRIS UNTUK SMP'),
('MP0008', 'PK0002', 'MATEMATIKA', 'MATEMATIKA UNTUK SMP'),
('MP0009', 'PK0002', 'ILMU PENGETAHUAN ALAM', 'IPA UNTUK SMP'),
('MP0010', 'PK0002', 'ILMU PENGETAHUAN SOSIAL', 'IPS UNTUK SMP'),
('MP0011', 'PK0002', 'PENDIDIKAN KEWARGANEGARAAN', 'PKN UNTUK SMP'),
('MP0012', 'PK0003', 'BAHASA INDONESIA', 'BAHASA INDONESIA UNTUK SMA IPA'),
('MP0013', 'PK0003', 'BAHASA INGGRIS', 'BAHASA INGGRIS UNTUK SMA IPA'),
('MP0014', 'PK0003', 'MATEMATIKA', 'MATEMATIKA UNTUK SMA IPA'),
('MP0015', 'PK0003', 'FISIKA', 'FISIKA UNTUK SMA IPA'),
('MP0016', 'PK0003', 'KIMIA', 'KIMIA UNTUK SMA IPA'),
('MP0017', 'PK0003', 'BIOLOGI', 'BIOLOGI UNTUK SMA IPA'),
('MP0018', 'PK0003', 'PENDIDIKAN KEWARGANEGARAAN', 'PKN UNTUK SMA IPA'),
('MP0019', 'PK0004', 'BAHASA INDONESIA', 'BAHASA INDONESIA UNTUK SMA IPS'),
('MP0020', 'PK0004', 'BAHASA INGGRIS', 'BAHASA INGGRIS UNTUK SMA IPS'),
('MP0021', 'PK0004', 'MATEMATIKA', 'MATEMATIKA UNTUK SMA IPS'),
('MP0022', 'PK0004', 'EKONOMI', 'EKONOMI UNTUK SMA IPS'),
('MP0023', 'PK0004', 'GEOGRAFI', 'GEOGRAFI UNTUK SMA IPS'),
('MP0024', 'PK0004', 'SOSIOLOGI', 'SOSIOLOGI UNTUK SMA IPS'),
('MP0025', 'PK0004', 'PENDIDIKAN KEWARGANEGARAAN', 'PKN UNTUK SMA IPS');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
`id_modul` int(10) NOT NULL,
  `id_matpel` varchar(10) NOT NULL,
  `tgl_upload` varchar(15) NOT NULL,
  `judul` text NOT NULL,
  `file` text NOT NULL,
  `video` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `id_matpel`, `tgl_upload`, `judul`, `file`, `video`) VALUES
(6, 'MP0006', '08/09/15', 'BAHASA INDONESIA', 'Bhs.Indo pkt B 26.pdf', ''),
(7, 'MP0007', '08/09/15', 'BAHASA INGGRIS', 'B. Inggris PKT B 26.pdf', ''),
(8, 'MP0008', '08/09/15', 'MATEMATIKA', '', ''),
(9, 'MP0009', '08/09/15', 'ILMU PENGETAHUAN ALAM', 'IPA PKT B 26.pdf', ''),
(10, 'MP0010', '08/09/15', 'ILMU PENGETAHUAN SOSIAL', 'IPS PKT B 26.pdf', ''),
(11, 'MP0011', '08/09/15', 'PENDIDIKAN KEWARGANEGARAAN', 'PKN.pdf', ''),
(12, 'MP0012', '08/09/15', 'BAHASA INDONESIA', 'Paket C Bahasa Indonesia 28.pdf', ''),
(13, 'MP0013', '08/09/15', 'BAHASA INGGRIS', 'Paket C B. Inggris 28.pdf', ''),
(14, 'MP0014', '08/09/15', 'MATEMATIKA', 'Matematika PKT C 28.pdf', ''),
(15, 'MP0018', '08/09/15', 'PENDIDIKAN KEWARGANEGARAAN', 'Pkn  Paket C 28.pdf', ''),
(16, 'MP0019', '08/09/15', 'BAHASA INDONESIA', 'Pkn_Paket_C_28.pdf', 'https://www.youtube.com/watch?v=0IJT4_fDXlw'),
(17, 'MP0020', '08/09/15', 'BAHASA INGGRIS', '', ''),
(18, 'MP0021', '08/09/15', 'MATEMATIKA', 'Matematika PKT C 28.pdf', ''),
(19, 'MP0022', '08/09/15', 'EKONOMI', 'Paket C Ekonomi 28.pdf', ''),
(20, 'MP0023', '08/09/15', 'GEOGRAFI', 'Geografi paket C 28.pdf', ''),
(21, 'MP0024', '08/09/15', 'SOSIOLOGI', 'Sosiologi Paket C 28.pdf', ''),
(22, 'MP0025', '08/09/15', 'PENDIDIKAN KEWARGANEGARAAN', 'Pkn_Paket_C_28.pdf', ''),
(26, 'MP0001', '06/10/15', 'Latihan UN Bahasa Indonesia 2013', 'Pkn_Paket_C_28.pdf', 'https://www.youtube.com/watch?v=4gclD0hRNDg&list=PLCZlgfAG0GXBD2nko3bXRs-JSDNA8tNvq'),
(27, 'MP0002', '06/10/15', 'Latihan UN Matematika 2013', 'latihan-un-sd-mi-2013-Mtk.pdf', '27'),
(28, 'MP0003', '06/10/15', 'Latihan UN IPA 2013', 'latihan-un-sd-mi-2013-Ipa.pdf', '28'),
(29, 'MP0015', '06/10/15', 'Latihan UN Fisika ', 'latihan-un-sma-fisika.pdf', '29'),
(30, 'MP0016', '06/10/15', 'Latihan UN Kimia', 'latihan-un-sma-kimia.pdf', '30'),
(31, 'MP0017', '06/10/15', 'Latihan UN Biologi', 'latihan-un-sma-biologi.pdf', '31'),
(32, 'MP0002', '06/10/15', 'Soal UN Matematika 2013', 'soal-un-matematika-sd-p1-2013.pdf', '32'),
(33, 'MP0003', '06/10/15', 'Soal UN IPA 2013 ', 'soal-un-ipa-sd-p1-2013.pdf', '33'),
(34, 'MP0020', '07/10/15', 'Latihan UN Bahasa Inggris', 'latihan-un-sma-b-inggris.pdf', '34'),
(35, 'MP0019', '07/10/15', 'Latihan UN Bahasa Indonesia 2013', 'lt-soal-indo-un-sma-ipa-ips-keagamaan-2013 (1).pdf', '35'),
(36, 'MP0021', '07/10/15', 'Latihan UN Matematika 2013', 'lt-soal-mtk-un-sma-2013-ips-keagamaan.pdf', '36'),
(37, 'MP0022', '07/10/15', 'Latihan UN Ekonomi', 'latihan-un-sma-ekonomi.pdf', '37'),
(38, 'MP0023', '07/10/15', 'Latihan UN Geografi', 'latihan-un-sma-geografi.pdf', '38'),
(39, 'MP0024', '07/10/15', 'Latihan UN Sosiologi', 'latihan-un-sma-sosiologi.pdf', '39'),
(40, 'MP0006', '07/10/15', 'Latihan UN Bahasa Indonesia 2013', 'lt-soal-indo-un-smp-2013-1.pdf', '40'),
(41, 'MP0007', '07/10/15', 'Latihan UN Bahasa Inggris', 'lt-soal-ingg-un-smp.pdf', '40'),
(42, 'MP0008', '07/10/15', 'Latihan UN Matematika', 'lt-soal-mtk-un-smp.pdf', '42'),
(43, 'MP0009', '07/10/15', 'Latihan UN IPA', 'lt-soal-ipa-un-smp.pdf', '43'),
(44, 'MP0014', '07/10/15', 'Latihan UN Matematika 2013', 'lt-soal-mtk-un-sma-2013-Ipa.pdf', '44'),
(45, 'MP0024', '07/10/15', 'Soal UN Sosiologi 2013', 'soal-un-sosiologi-sma-ips-2013-kode-sosiologi_ips_sa_37.pdf', '45'),
(46, 'MP0021', '07/10/15', 'Soal UN Matematika Program IPS 2013', 'soal-un-matematika-ips-2013-kode-mtk_ips_sa_54.pdf', '46'),
(47, 'MP0023', '07/10/15', 'Soal UN Geografi 2013', 'soal-un-geografi-sma-ips-2013-kode-geo_ips_sa_76.pdf', '47'),
(48, 'MP0014', '07/10/15', 'Pembahasan UN Matematika Program IPA 2014', 'Pembahasan Soal UN Matematika Program IPA SMA 2014 Paket 1 (Full Version).pdf', '48'),
(49, 'MP0013', '07/10/15', 'Latihan UN Bahasa Inggris ', 'latihan-un-sma-b-inggris.pdf', '49'),
(50, 'MP0012', '07/10/15', 'Latihan UN Bahasa Indonesia 2013', 'lt-soal-indo-un-sma-ipa-ips-keagamaan-2013 (1).pdf', '50'),
(51, 'MP0025', '07/10/15', 'Ringkasan Materi PKN', 'Ringkasan Materi PKn.pdf', '51'),
(52, 'MP0022', '07/10/15', 'Ringkasan Materi Ekonomi', 'Ringkasan Materi Ekonomi.pdf', '52'),
(53, 'MP0020', '07/10/15', 'Ringkasan Materi Bahasa Inggris', 'Ringkasan Materi Bahasa Inggris.pdf', '53'),
(54, 'MP0021', '07/10/15', 'Ringkasan Materi Matematika', 'Ringkasan Materi Matematik.pdf', '54'),
(55, 'MP0023', '07/10/15', 'Ringkasan Materi Geografi', 'Ringkasan Materi Geografi.pdf', '55'),
(56, 'MP0024', '07/10/15', 'Ringkasan Materi Sosiologi', 'Ringkasan Materi Sosiologi.pdf', '56'),
(57, 'MP0025', '08/10/15', 'Buku Modul PKN Kelas 10', 'PKN-10-Rima.pdf', '57'),
(58, 'MP0025', '08/10/15', 'Buku Modul PKN Kelas 11', 'PKN-11-Rima.pdf', '58'),
(59, 'MP0021', '08/10/15', 'Pembahasan UN Matematika Program IPS 2014', 'Pembahasan Soal UN Matematika Program IPS SMA 2014 Paket 1 (Full Version).pdf', '59'),
(60, 'MP0018', '08/10/15', 'Ringkasan Materi PKN', 'Ringkasan Materi PKn.pdf', '60'),
(61, 'MP0014', '08/10/15', 'Ringkasan Materi Matematika', 'Ringkasan Materi Matematik.pdf', '61'),
(62, 'MP0013', '08/10/15', 'Ringkasan Materi Bahasa Inggris', 'Ringkasan Materi Bahasa Inggris.pdf', '62'),
(63, 'MP0018', '08/10/15', 'Buku Modul PKN Kelas 10', 'PKN-10-Rima.pdf', '63'),
(64, 'MP0018', '08/10/15', 'Buku Modul PKN Kelas 11', 'PKN-11-Rima.pdf', '64'),
(67, 'MP0021', '08/10/15', 'Buku Modul Matematika Program IPS Kelas 11', 'Khazanah Matematika (IPS)-11-Rosihan.pdf', '65'),
(68, 'MP0022', '08/10/15', 'Buku Modul Ekonomi Kelas 12', 'Ekonomi Kelas XII.pdf', '68'),
(70, 'MP0022', '08/10/15', 'Buku Modul Ekonomi Kelas 11', 'Ekonomi Kelas XI.pdf', '69'),
(71, 'MP0022', '08/10/15', 'Buku Modul Ekonomi Kelas 10', 'Ekonomi Kelas X.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_soal`
--

CREATE TABLE IF NOT EXISTS `nilai_soal` (
`id_nilai` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `nilai` int(11) NOT NULL,
  `salah` int(11) NOT NULL,
  `benar` int(11) NOT NULL,
  `kosong` int(11) DEFAULT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `nilai_soal`
--

INSERT INTO `nilai_soal` (`id_nilai`, `id_modul`, `id_siswa`, `nilai`, `salah`, `benar`, `kosong`, `tgl`) VALUES
(11, 17, 'KSI00115001', 20, 4, 1, 0, '2016-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE IF NOT EXISTS `paket` (
  `id_paket` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama`, `keterangan`) VALUES
('PK0001', 'Paket A', 'KESETARAAN SD'),
('PK0002', 'Paket B', 'KESETARAAN SMP'),
('PK0003', 'Paket C IPA', 'KESETARAAN SMA IPA'),
('PK0004', 'Paket C IPS', 'Kesetaraan SMA IPS');

-- --------------------------------------------------------

--
-- Table structure for table `pelamar`
--

CREATE TABLE IF NOT EXISTS `pelamar` (
`id` int(11) NOT NULL,
  `id_siswa` varchar(20) NOT NULL,
  `id_lowongan` varchar(2) NOT NULL,
  `status` varchar(1) NOT NULL,
  `tgl_lamar` varchar(15) NOT NULL,
  `tgl_diperbarui` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `pelamar`
--

INSERT INTO `pelamar` (`id`, `id_siswa`, `id_lowongan`, `status`, `tgl_lamar`, `tgl_diperbarui`) VALUES
(86, 'KSI00115003', '6', '1', '15/09/12', ''),
(87, 'KSI00115016', '6', '1', '15/09/12', ''),
(88, 'KSI00115015', '6', 'A', '15/10/28', '2015-11-23 05:37:15'),
(89, 'KSI00115015', '6', '2', '15/10/28', '2015-11-18 04:47:45'),
(90, 'KSI00115001', '5', '2', '15/10/29', '2015-11-18 04:48:07'),
(91, 'KSI00115012', '7', '1', '15/10/29', ''),
(92, 'pj001', 'KS', '5', '1', '15/11/18'),
(93, 'KSI00315001', '6', 'N', '2015-11-23 00:5', '2015-11-23 00:54:50'),
(94, 'KSI00315002', '8', 'A', '2015-11-23 00:5', '2015-11-23 00:59:47'),
(95, 'KSI00115005', '6', 'R', '2015-11-23 05:2', '2015-11-23 05:32:04'),
(96, 'KSI00115007', '5', 'N', '2015-11-25 04:5', '2015-11-25 04:54:15'),
(97, 'KSI00115008', '5', 'N', '2015-11-25 19:5', '2015-11-25 19:55:32'),
(98, 'KSI00115004', '5', 'N', '2015-11-25 19:5', '2015-11-25 19:55:32'),
(99, 'KSI00115011', '5', 'N', '2015-11-25 19:5', '2015-11-25 19:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `penjab`
--

CREATE TABLE IF NOT EXISTS `penjab` (
  `id_penjab` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jnsklmn` varchar(15) NOT NULL,
  `tmp_lhr` varchar(50) NOT NULL,
  `tgl_lhr` varchar(15) NOT NULL,
  `pdkn` varchar(10) NOT NULL,
  `jenjang` text NOT NULL,
  `kontak` varchar(15) NOT NULL,
  `prov` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjab`
--

INSERT INTO `penjab` (`id_penjab`, `nama`, `jnsklmn`, `tmp_lhr`, `tgl_lhr`, `pdkn`, `jenjang`, `kontak`, `prov`, `kota`, `alamat`, `email`, `password`, `foto`) VALUES
('PJ001', 'Dedy Prihatin', 'Pria', 'Jakarta', '08-10-1975', 'Perguruan ', 'UPN jakarta', '082110887887', 'DKI JAKARTA', 'JAKARTA BARAT', 'JL. FAJAR BARU II NO 2\r\nCENGKARENG TIMUR\r\nJAKARTA BARAT\r\nINDONESIA', 'dedy_dnd@yahoo.co.id', 'c51b6f38c872caebd0ea740dffcfb63d', '01032010(040).jpg'),
('PJ002', 'Drs. H. Darmani Abdillah', 'Pria', 'Ngawi', '04-03-1965', 'Sarjana', 'Universitas Malang', '081233744951', 'Malang Barat', 'Batu', 'Jln. Arjuno No. 3 Rt. 071 Rw. 011\r\nDusun Sumber sari\r\nDesa Giripurno\r\nKecamatan Bumiaji Kota Batu', 'darmani.abdillah@gmail.com', '18efdf3e78279693a55d690d91e3f651', 'IMG-20150901-WA0001[1].jpg'),
('PJ003', 'Abdullah Syafari', 'Pria', 'Jakarta', '23-05-1988', 'Sarjana', 'Sekolah Tinggi Agama Islam Salahudin al ayubi', '082255165561', 'DKI Jakarta', 'Jakarta Barat', 'Jl. Panjang H. Jaani No.43 \r\nRt 006  Rw 011 \r\nKebon Jeruk Jakarta Barat', 'syafarirhomadhon@gmail.com', '57bf67f9cbbd93feecb2b5af33833924', 'IMG-20150905-WA0005[1].jpg'),
('PJ004', 'SUNARYO', 'Pria', 'JAKARTA', '28-07-2015', 'Sarjana', 'BINA NUSANTARA', '085777267177', 'JAKARTA', 'JAKARTA BARAT', '', 'sunaryo@gmail.com', '28b662d883b6d76fd96e4ddc5e9ba780', 'pas foto.jpg'),
('PJ005', 'Wahyu Abdurrohman, S.Pd.I', 'Pria', 'Kediri', '17-07-1967', 'Sarjana', 'STAIN Kediri', '08123428294', 'Jawa Timur', 'Kediri', 'Jl. Slamet Riyadi 65', 'alathif@Gmail.com', '5efb3813347b3450e672c5170ea9322f', ''),
('PJ006', 'H. Luqman Hakim', 'Pria', 'Tulung Agung', '03-09-2015', 'Sarjana', 'Universitas Indonesia', '081234351213', 'Jawa Timur', 'Tulung Agung', '--', 'alen@gmail.com', '0079fcb602361af76c4fd616d60f9414', '1rjk5gd7.jpg'),
('PJ007', 'H. Agung Anugrahjati, SH.', 'Pria', 'Jakarta', '22-05-1977', 'Sarjana', 'Universitas Singaperbangsa Karawang', '083879778687', 'Jawa Barat', 'Karawang', 'Perum Bumi Telukjambe Blok J No 261 RT 04 RW 08 Desa Sukaluyu, Kec. Telukjambe Timur, Kab. Karawang 41361 ', 'agung.anugrahjati@gmail.com', '6934bd80b519fbdba6a211b2c00b8ff0', 'Agung Anugrahjati.jpg'),
('PJ008', 'IMELDA KHASIATIN', 'Wanita', 'Lebak', '12-01-1968', 'Sarjana', 'Ilmu Administrasi Niaga,  Universitas Indonesia', '081210256651', 'Jawa Barat', 'Bogor', 'Kavling Muara Barokah Blok Q 21-22\r\nRT 04/04 Desa Karihkil Kec. Ciseeng Kab. Bogor\r\n', 'imelda.tax@gmail.com', '6969cbe573942e7692f5f1769a276bd6', 'imelda.jpg'),
('PJ009', 'DAMAS ALCHUSNA SUPRAPTO, SH', 'Pria', 'KARANG ANYAR', '20-03-1966', 'Sarjana', 'UNIVERSITAS SURABAYA', '082152359000', 'JAWA BARAT', 'KERAWANG', 'Jl. Ciherang Rt. 02/06, Wadas, Teluk Jambe Timur\r\nKerawang Barat, Jawa Barat', 'p3nairlinesschool@gmail.com', 'c97c7b8bc1990c6d0eec1484103afa07', 'Snapshot_20150820_24-1.jpg'),
('PJ010', 'SUWARNO. S.Ag', 'Pria', 'SUKOHAFIJO', '04-11-1970', 'Sarjana', 'INSTITUT AGAMA ISLAM NEGRI WALISONGO SEMARANG', '085369469313', 'LAMPUNG', 'MULYOSARI PASIR SAKT', 'DUSUN SEMARANG BARU RT034/006\r\nKEL. MULYOSARI KEC. PASIR SAKTI\r\nLAMPUNG', 'warno@gmail.com', 'acdb57721a52ac9a372b67c7bb359974', '851334900_58037[1].jpg');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
`id_perusahaan` int(10) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `negara_perusahaan` varchar(100) NOT NULL,
  `provinsi_perusahaan` varchar(100) NOT NULL,
  `email_perusahaan` varchar(100) NOT NULL,
  `kontak_perusahaan` text NOT NULL,
  `alamat_perusahaan` text NOT NULL,
  `website` text NOT NULL,
  `desk_perusahaan` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_perusahaan`, `negara_perusahaan`, `provinsi_perusahaan`, `email_perusahaan`, `kontak_perusahaan`, `alamat_perusahaan`, `website`, `desk_perusahaan`, `logo`) VALUES
(7, 'Evercoss Indonesia', 'Indonesia', 'jakarta utara', 'admin@evercoss.com', '081231248549', 'Sunter', 'evercoss.com', 'sdsadassad\r\n', ''),
(10, 'Evercoss Indonesia', 'Indonesia', 'Jakarta Utara', 'hrd@evercoss.com', '02312213213', 'Sunter', 'evercoss.com', 'sdadsaadsa', '');

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE IF NOT EXISTS `sekolah` (
  `id_sekolah` varchar(10) NOT NULL,
  `id_penjab` varchar(10) NOT NULL,
  `nama` text NOT NULL,
  `prov` varchar(50) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `tgl_berdiri` varchar(15) NOT NULL,
  `Alamat` text NOT NULL,
  `telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `id_penjab`, `nama`, `prov`, `kota`, `tgl_berdiri`, `Alamat`, `telp`) VALUES
('KSI001', 'PJ001', 'KAIYISAH SMART INFORMATIKA', 'JAKARTA', 'JAKARTA BARAT', '06-07-2012', 'JL. FAJAR BARU II NO 2\r\nCENGKARENG TIMUR\r\nJAKARTA BARAT\r\nINDONESIA', '0215454126'),
('KSI002', 'PJ002', 'PKBM Kaiyisah Smart Informatika II', 'Jawa Timur', 'Batu', '01-09-2015', 'Jln Arjuno No. 3 Rt. 071 Rw. 011\r\nDusun Sumbersari\r\nDesa Giripurno\r\nKecamatan Bumiaji, kota Batu', '081233744951'),
('KSI003', 'PJ003', 'PKBM Kaiyisah Smart Informatika III', 'DKI Jakarta', 'Jakarta Barat', '01-09-2015', 'JlL. Panjang H. Jaani No.43\r\nRt 006 Rw 011\r\nKebon Jeruk  Jakarta Barat', '081325121404'),
('KSI004', 'PJ004', 'PKBM Kaiyisah Smart Informatika IV', 'TANGERANG', 'CILEDUK', '01-09-2015', 'CILEDUK RAYA\r\nJL. PENINGGILAN', '08962399'),
('KSI005', 'PJ005', 'PKBM Kaiyisah Smart Informatika V', 'Jawa Timur', 'Kediri', '01-09-2015', 'Jl. Slamet Riyadi', '08123428294'),
('KSI006', 'PJ006', 'PKBM Kaiyisah Smart Informatika VI', 'Jawa Timur', 'Tulung Agung', '13-09-2015', 'Jawa Timur', '085777267177'),
('KSI007', 'PJ007', 'PKBM Kaiyisah Smart Informatika VII', 'Jawa Barat', 'Karawang', '01-09-2015', 'Perum Bumi Telukjambe Blok J No 261 RT/RW 04/08 Desa Sukaluyu, Kec. Telukjambe Timur, Kab. Karawang 41361', '083879778687'),
('KSI008', 'PJ008', 'PKBM Kaiyisah Smart Informatika VIII', 'Jawa Barat', 'Bogor', '01-09-2015', 'Kavling Muara Barokah Blok Q 21-22\r\nRT 04/04 Desa Karihkil Kec. Ciseeng Kab. Bogor\r\n', '081210256651'),
('KSI009', 'PJ009', 'PKBM Kaiyisah Smart Informatika IX', 'JAWA BARAT', 'KERAWANG', '01-09-2015', 'Jl. Ciherang Rt. 02/06, Wadas, Teluk Jambe Timur\r\nKerawang Barat, Jawa Barat', '082152359000'),
('KSI010', 'PJ010', 'PKBM Kaiyisah Smart Informatika X', 'LAMPUNG', 'MULYOSARI PASIR SAKTI', '02-01-2016', 'DUSUN SEMARANG BARU RT 034/006\r\nKEL. MULYOSARI  KEC. PASIR SAKTI\r\nLAMPUNG', '085369469313');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `id_siswa` varchar(20) NOT NULL,
  `id_sekolah` varchar(20) NOT NULL,
  `id_paket` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jnsklmn` varchar(15) NOT NULL,
  `tmp_lhr` varchar(50) NOT NULL,
  `tgl_lhr` date NOT NULL,
  `agama` varchar(15) NOT NULL,
  `nama_ortu` varchar(50) NOT NULL,
  `pdkn` varchar(10) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `thn_lulus` varchar(7) NOT NULL,
  `no_ijasah` varchar(20) NOT NULL,
  `no_skhun` varchar(20) NOT NULL,
  `foto` text NOT NULL,
  `foto_ijasah` text NOT NULL,
  `foto_skhun` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `prov` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_sekolah`, `id_paket`, `nama`, `jnsklmn`, `tmp_lhr`, `tgl_lhr`, `agama`, `nama_ortu`, `pdkn`, `jenjang`, `thn_lulus`, `no_ijasah`, `no_skhun`, `foto`, `foto_ijasah`, `foto_skhun`, `email`, `prov`, `kota`, `telp`, `alamat`, `password`) VALUES
('KSI00115001', 'KSI001', 'PK0004', 'Prastya', 'Pria', 'Jakarta', '2016-06-05', 'Islam', 'Sukijan', 'Lain-Lain', 'SMPN 01 Batu', '2011', '354313', '87654321', 'profile.jpg', 'b4b4b6dfe94c873fb3a908c014bbe92b.PNG', 'fc571479a509ae54c9378f6fde156704.PNG', 'prastya313@gmail.com', 'JAKARTA', 'JAKARTA BARAT', '089623993782', 'Jalan Blah Blah Blah', '25d55ad283aa400af464c76d713c07ad'),
('KSI00115002', 'KSI001', 'PK0004', 'LUDVI NUR ALI', 'Pria', 'KLATEN', '0000-00-00', 'Islam', 'SRIHONO', 'SMP', 'SMP NEGRI 2 BAYAT', '2013', 'DN-03 DI 0180123', 'DN-03 DI 0180123', 'profile.jpg', 'ijazah ludvi.jpg', '', 'ludvinurali@gmail.com', 'JAWA TENGAH', 'KLATEN', '08128231231231', '', '25d55ad283aa400af464c76d713c07ad'),
('KSI00115003', 'KSI001', 'PK0004', 'ABDULLOH NUR SAB''I BIMO PIJJO SAKTI', 'Pria', 'KEDIRI', '0000-00-00', 'Islam', 'IDRIS FATCUROHMAN', 'SMP', 'SMP NEGRIB1 KEDAWUNG', '2013', 'DN-02 DI 0306994', 'DN-02 DI 0428781', '230882_219340401429334_4502897_n.jpg', '', '', 'abdullohnursab@yahoo.co.id', 'JAWA BARAT', 'CIREBON', '021', '', '3d65d0ddfb2f3f636c468f9fb47ad9d3'),
('KSI00115004', 'KSI001', 'PK0004', 'ALWI', 'Pria', 'BIMA', '0000-00-00', 'Islam', 'MUHAMMAD', 'SMP', 'SMP 2 BELO', '2003', 'DN-23.DI2328133', 'DN-23.DI2328133', 'Pas-Photo.jpg', '', '', 'ALWI@GMAIL.COM', 'NUSA TENGGARA BARAT', 'BIMA', '081', '', '4a23b82ef4bb184be52eba5db23019dc'),
('KSI00115005', 'KSI001', 'PK0004', 'HENI AGUSTIN', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'AAN ABDUL HALIM', 'SMP', 'SLTP HARDI YUANA', '2000', '02DI0283639', '02DI0283639', '', 'IJAZAH  HENI.jpg', '', 'HENI@GMAIL.COM', 'JAWA BARAT', 'SUKABUMI', '021', '', '24fbfa6401fb3aec4f565de2b6d7bbcb'),
('KSI00115006', 'KSI001', 'PK0004', 'EFFI LUTHFIANINGSI', 'Wanita', 'BREBES', '0000-00-00', 'Islam', 'TARYO SUGIONO', 'SMP', 'SMP NEGERI 4 TANJUNG', '2008', 'DN.03.DI0524102', 'DN-03DI0950989', 'iyang molen.jpg', 'IJAZAH EFFI.jpg', '', 'EFFI@GMAIL.COM', 'JAWA BARAT', 'BREBES', '021', '', 'ac671d1b8241036bd5ed1d843da9f514'),
('KSI00115007', 'KSI001', 'PK0004', 'JAELANI', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'TIDAK ADA', 'SMP', 'SMP NEGERI 108', '2011', 'DN 01 DI 0040683', 'DN 01 DI 0040683', '', '', 'IJAZAH JAELANI.jpg', 'JAELANI@GMAIL.COM', 'JAWA BARAT', 'JAKARTA', '081', '', '42dfb8bd79ac1063a4894d28aa959b97'),
('KSI00115008', 'KSI001', 'PK0004', 'AHMAD FAUZAN ABDULLOH', 'Pria', 'TULUNGAGUNG', '0000-00-00', 'Islam', 'TUMIRAN', 'SMP', 'PKBM KAIYISAH SMART INFORMATIKA', '2014', 'DN 01 PB 0005512', 'DN 01 PB 0005512', '', '', '', 'AHMAD@GMAIL.COM', 'JAWA TENGAH', 'TULUNGAGUNG', '081', '', '5eec50b8baa128e5bae4003a2830829d'),
('KSI00115009', 'KSI001', 'PK0004', 'NGATINO', 'Pria', 'SERAGEN', '0000-00-00', 'Islam', 'GIYANTI', 'SMP', 'SMP MUHAMMADIYAH 7 SUMBERLAWANG', '2010', 'DN 03 DI 0993459', 'DN 03 DI 0214144', '', '', '', 'NGATINO@GMAIL.COM', 'JAWA TENGAH', 'SERAGEN', '081', '', 'ab5d9f40d290d52671d06051e59ecf17'),
('KSI00115010', 'KSI001', 'PK0004', 'TRI NOVIANI', 'Wanita', 'JAKARTA', '0000-00-00', 'Islam', 'BODO', 'SMP', 'SMP TERBUKA', '2011', 'DN 01 DI 0044652', 'DN 01 DI 0044652', '', 'ijazah tri.jpg', '', 'TRI@GMAIL.COM', 'JAKARTA', 'JAKARTA BARAT', '085921356592', '', '8f6e12ada7af2d610b527b8babb137d7'),
('KSI00115011', 'KSI001', 'PK0004', 'BANGUN PANDIANGAN', 'Pria', 'GUNUNG KELAMBU', '0000-00-00', 'Islam', 'WILMAN PANDIANGAN', 'SMP', 'SMP NEGERI 3 LUMUT', '1991', '05 0A OB 0306814', '05 0A OB 0306814', '', '', '', 'BANGUN@GMAIL.COM', 'SUMATRA UTARA', 'LUMUT', '08192312312', '', 'dfb118a79545ca98eff8ee6a5b4be01f'),
('KSI00115012', 'KSI001', 'PK0004', 'ACHMAD BUKHORI', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'PARDI', 'SMP', 'PKBM KARTINI', '2013', 'DN 02 PB 0004084', 'DN 02 PB 0004084', 'achmad bukhori.jpg', 'ijazah achmad.jpg', '', 'ACHMAD@GMAIL.COM', 'JAKARTA', 'JAKARTA BARAT', '0817772671777', '', '2e58db4e37cc6f2bd737bbd6ad35190d'),
('KSI00115013', 'KSI001', 'PK0004', 'JOKO SUSILO', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'SUPARDI', 'SMP', 'SDN CENGKARENG TIMUR 01 PAGI', '2014', 'DN 01 DD 0053779', 'DN 01 DD 0053779', 'joko susilo.jpg', 'ijazah joko.jpg', '', 'JOKO@GMAIL.COM', 'JAKARTA', 'JAKARTA BARAT', '089681408538', '', '88ff858bd0b28a5c058a6e298d647a40'),
('KSI00115014', 'KSI001', 'PK0004', 'FAUZIANA HAJAR GUSTIANI', 'Wanita', 'JAKARTA', '0000-00-00', 'Islam', 'PARNO', 'SMP', 'SMP SYAHID 1', '2010', 'DN 01 DI 0019732', 'DN 01 DI 0019732', '', '', '', 'FAUZIAH@GMAIL.COM', 'JAKARTA', 'JAKARTA BARAT', '081', '', 'e5ba319bada6806cb356341cefc2aaa4'),
('KSI00115015', 'KSI001', 'PK0002', 'SITI MARYANI', 'Wanita', 'KLATEN', '0000-00-00', 'Islam', 'NURSIDI', 'SD', 'NEGERI DANGURAN', '1990', 'NO 03 OA 0202989', 'NO 03 OA 0202989', 'siti maryani.jpg', 'ijazah siti maryani.jpg', '', 'SITI@GMAIL.COM', 'JAWA TENGAH', 'KLATEN', '083807502731', '', '7f0bd0ea687bddd9b1197e79a2a1aee9'),
('KSI00115016', 'KSI001', 'PK0004', 'ILYAS ILYASA  HIKMATIYAR', 'Pria', 'TANGERANG', '0000-00-00', 'Islam', 'ADE MAULIDIN HIKMAT', 'SD', 'NEGERI CENGKARENG TIMUR 09 PAGI', '2012', 'DN 01 DD 0055807', 'DN 01 DD 0055807', 'ilyas.jpg', 'ijazah ilyas.jpg', '', 'ILYAS@GMAIL.COM', 'JAKARTA', 'TANGERANG', '081', '', 'e23a12ea1a53c285068fc114f5697237'),
('KSI00115017', 'KSI001', 'PK0004', 'AKHMAD  NOVI MUDZAKKIR', 'Pria', 'BEKASI', '0000-00-00', 'Islam', 'CHAERUL ACHMAD', 'SMP', 'SMP NEGERI 18 BEKASI', '2010', 'DN 02 DI 0268418', 'DN 02 DI 0176621', '', 'ijazah akhmad.jpg', '', 'AKHMAD@GMAIL.COM', 'JAWA BARAT', 'BEKASI', '081', '', '8022f60e0517ab4a0bc979cf9732aff8'),
('KSI00115018', 'KSI001', 'PK0004', 'ERI YANTO SUBANA', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'RAHAYU SUBANA', 'SMP', 'SMP AL HUDA', '2010', 'DN 01 DI 0043275', 'DN 01 DI 0043275', '', 'skhu eri.jpg', '', 'ERI@GMAIL.COM', 'JAKARTA', 'JAKARTA BARAT', '089502955105', '', '35ce9197ce70f1395acdac4c79b23917'),
('KSI00115019', 'KSI001', 'PK0004', 'SITI HALIMAH', 'Wanita', 'CIHAYAM', '0000-00-00', 'Islam', 'TIDAK ADA', 'SMP', 'MTS Al-islam bunut', '2002', 'NO 12  DI 2365722', 'NO 12  DI 2365722', '', '', '', 'SITII@GMail.COM', 'LAMPUNG SELATAN', 'LAMPUNG', '085777843611', '', 'f1ce2ad44e23cd0781dd5c0849e30f16'),
('KSI00115020', 'KSI001', 'PK0004', 'LINGGA WAHYU PRATAMA', 'Pria', 'JAKARTA', '0000-00-00', 'Islam', 'TIDAK ADA', 'SD', 'SDN CENGKARENG TIMUR 01 PAGI', '2014', 'DN 01 DD 0055153', 'DN 01 DD 0055153', '', '', '', 'LINGGA@GMAIL.COM', 'JAKARTA BARAT', 'JAKARTA', '089681408609', '', 'ada4c4eda624443b4fba27848f474f8c'),
('KSI00115021', 'KSI001', 'PK0004', 'MUHAMMAD AHYARUL UMAM', 'Pria', 'BANDUNG', '0000-00-00', 'Islam', 'RIDWAN R', 'SMP', 'DARUL ULUM', '2009', 'MTS 28040283', 'MTS 28040283', '', '', '', 'MUHAMMAD@GMAIL.COM', 'JAWA BARAT', 'BANDUNG', '082153265421', '', '18e8bf76d22f1b36c5bc493cc02fbf77'),
('KSI00115022', 'KSI001', 'PK0004', 'IMAM FAJAR LIAN', 'Pria', 'CILACAP', '0000-00-00', 'Islam', 'SUPRIADI', 'SMP', 'SMP TERBUKA MOOS', '', 'DN 03 DI 0537164', 'DN 03 DI 0537164', '', '', '', 'IMAM@GMAIL.COM', 'JAWA BARAT', 'CILACAP', '085779909417', '', '3b404664bb4a15d2f1c2eabad02542f3'),
('KSI00115023', 'KSI001', 'PK0002', 'ISNA ALFIANA SABILA', 'Wanita', 'SIMPANG TIGA', '0000-00-00', 'Islam', 'EKO FAUZI', 'SD', 'SD CIIMPAKA', '2009', 'DN 02 DD 0040896', 'DN 02 DD 0040896', '', '', '', 'ISNA@GMAIL.COM', 'JAKARTA BARAT', 'CEMPAKA', '081', '', '25d55ad283aa400af464c76d713c07ad'),
('KSI00115024', 'KSI001', 'PK0004', 'HASANUDIN', 'Pria', 'PEKALONGAN', '0000-00-00', 'Islam', 'LASIM', 'SMP', 'SMP PGRI', '1991', '04 OA OB 1088733', '04 OA OB 1088733', 'hasanudin.jpg', 'IJAZAH HASANUDIN.jpg', '', 'HASANUDIN@GMAIL.COM', 'JAWA TIMUR', 'PEKALONGAN', '081', '', '4bce589f0a99d477a4bbef3f1fda798f'),
('KSI00315001', 'KSI003', 'PK0004', 'RIA SEFI NURHAENI', 'Wanita', 'TULUNGAGUNG', '0000-00-00', 'Islam', 'RAIS', 'SMP', 'SMP NEGERI  1 PAKEL', '2006', 'DN-05DI1201139', 'DN-05DI1201139', '', '', '', 'RIA@GMAIL.COM', 'JAWA  TENGAH', 'TULUNGAGUNG', '021', '', '18efdf3e78279693a55d690d91e3f651'),
('KSI00315002', 'KSI003', 'PK0004', 'ISTIQOMAH', 'Wanita', 'BATANG', '0000-00-00', 'Islam', 'DARMAN', 'SMP', 'SMP NEGERI 1 REBAN', '2010', 'DN-03DI0327189', 'DN-03DI0327189', '', '', '', 'ISTIQOMAH@GMAIL.COM', 'JAWA  TENGAH', 'BATANG', '021', '', '4d95e002fc9af41c424b943e48831a41'),
('KSI00315003', 'KSI003', 'PK0004', 'NURUL INDAH KARTIKA', 'Wanita', 'CILACAP', '0000-00-00', 'Islam', 'AHMAD NURDIN', 'SMP', 'SMP PURNAMA SAMPANG', '2012', 'DN-03DI0098391', 'DN-03DI0098391', '', '', '', 'NURUL@GMAIL.COM', 'JAWA TENGAH', 'CILACAP', '021', '', '91761e21e1466ec25f032fec27e3bcbb'),
('KSI00315004', 'KSI003', 'PK0002', 'ISNA ALFIANI SABILA', 'Wanita', 'SIMPANG TIGA KASUI', '0000-00-00', 'Islam', 'EKO FAUZI', 'SD', 'SD NEGERI CEMPAKA', '2009', 'DN-02Dd0040896', 'DN-02Dd0040896', '', '', '', 'ISNA@GMAIL.COM', 'SUMATRA SELATAN', 'PALEMBANG', '085777267177', '', 'c09d0a7dbdb598819643dd072f27dfcb');

-- --------------------------------------------------------

--
-- Table structure for table `soal_modul`
--

CREATE TABLE IF NOT EXISTS `soal_modul` (
`id_soal_modul` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `soal` text NOT NULL,
  `no` int(11) NOT NULL,
  `pa` text NOT NULL,
  `pb` text NOT NULL,
  `pc` text NOT NULL,
  `pd` text NOT NULL,
  `kunci` char(1) NOT NULL,
  `tgl` varchar(15) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `soal_modul`
--

INSERT INTO `soal_modul` (`id_soal_modul`, `id_modul`, `soal`, `no`, `pa`, `pb`, `pc`, `pd`, `kunci`, `tgl`) VALUES
(3, 1, '<p>Penyebab kecelakaan lalu lintas di jalan raya terutama kesalahan para pengemudi biasa kurang sabar. Mereka sering mengebut dan ingin mendahului. Mengantuk juga sering menjadi penyebab kecelakaan. Jarak yang ditempuh kendaraan terlalu jauh akan mengakibatkan sopir lelah dan mengantuk sehingga mudah tabrakan dengan kendaraan lain.<br />\r\nKalimat tanggapan yang sesuai dengan isi paragraf tersebut adalah&hellip;..</p>\r\n', 1, 'asdsadsa', 'dsadas', 'sadsa', 'sadasd', 'A', '20-09-2015'),
(4, 1, '<p>Penyebab kecelakaan lalu lintas di jalan raya terutama kesalahan para pengemudi biasa kurang sabar. Mereka sering mengebut dan ingin mendahului. Mengantuk juga sering menjadi penyebab kecelakaan. Jarak yang ditempuh kendaraan terlalu jauh akan mengakibatkan sopir lelah dan mengantuk sehingga mudah tabrakan dengan kendaraan lain.<br />\r\nKalimat tanggapan yang sesuai dengan isi paragraf tersebut adalah&hellip;..</p>\r\n', 4, 'denjaka', 'kopassus', 'taifib', 'xcxcxcxcxcxcx', 'D', '20-09-2015'),
(5, 1, '<p>Siapa yang jomblo ?&nbsp;</p>\r\n', 3, 'Aku', 'Saya', 'Diriku', 'semua benar', 'D', '20-09-2015'),
(9, 1, '<p>window.location.href=&#39;?ubah-soal=$idsoal&#39;&lt;/script&gt;</p>\r\n', 5, 'window.location.href=''?ubah-soal=$idsoal''</script>', 'window.location.href=''?ubah-soal=$idsoal''</script>', 'window.location.href=''?ubah-soal=$idsoal''</script>', 'window.location.href=''?ubah-soal=$idsoal''</script>', 'A', '20-09-2015'),
(10, 6, '<p>TESTING SOAL 1</p>\r\n', 1, 'ASDFG', 'QWERRYY', 'XCCVXC', 'OPOPO', 'A', '21-09-2015'),
(11, 22, '<h2 style="font-style:italic;"><tt>Siapakah yang membacakan teks proklamasi kemerdekaan&nbsp;Indonesia</tt></h2>\r\n', 1, 'moh. hatta', 'moh. yamin', 'Soekarno', 'Soeharto', 'A', '03-10-2015'),
(12, 10, '<p>Bagian muka bumi yang paling cocok<br />\r\ndigunakan untuk pertanian, pemukiman,<br />\r\ndan kawasan industri adalah &hellip;.</p>\r\n', 1, 'dataran rendah', 'dataran tinggi', 'perbukitan', 'pegunungan', 'A', '28-10-2015'),
(13, 10, '<p>Aktivitas gunung berapi berupa letusan<br />\r\ndan lelehan yang terjadi secara bergantian<br />\r\nakan membentuk gunung berapi tipe .&hellip;</p>\r\n', 2, 'maar', 'strato', 'perisei', 'kubah', 'B', '28-10-2015'),
(14, 10, '<p>Batubara merupakan batuan metamorf<br />\r\nyang terjadi karena .&hellip;</p>\r\n', 3, 'perubahan suhu yang tinggi', 'perubahan tekanan yang tinggi', 'perubahan suhu dan tekanan yang bekerja bersama-sama', 'perubahan suhu dan tekanan yang bekerja bergantian', 'A', '28-10-2015'),
(15, 16, '<p>pesan yang tersirat dalam bacaan tersebut adalah</p>\r\n', 1, 'jangan menganggap diri lebih pintar dari orang lain', 'syukuri apa yang kita peroleh', 'jangan terlalu bangga dengan apa yang kita dapat', 'syukuri apa pun yang dilarang untuk kita', 'B', '18-11-2015'),
(16, 16, '<p>&nbsp;Cermati urutan kalimat berikut!</p>\r\n\r\n<p>1) Sepi sekali</p>\r\n\r\n<p>2) Di tengah perjalanan, di dekat sungai, tepatnya di bawah pohon kelapa yang rindang,tiba-tiba angin berhembus kencang dan membawa hawa dingin.</p>\r\n\r\n<p>3) Tak ada siapa-siapa.</p>\r\n\r\n<p>4) Aku melihat di sekelilingku mencari asal suara itu.</p>\r\n\r\n<p>5) Aneh, aku teruskan langkahku, tapi tiba-tiba ada suara yang memanggilku, &ldquo;Ika,Ika,Ika&rdquo;</p>\r\n\r\n<p>Urutan yang tepat kalimat tersebut agar menjadi paragraf narasi yang padu adalah ....&nbsp;</p>\r\n', 2, '( 1 ), ( 4 ), ( 5 ), ( 3 ), dan ( 1 )', '( 2 ), ( 5 ), ( 4 ), ( 3 ), dan ( 1 )', '( 3 ), ( 4 ), ( 1 ), ( 5 ), dan ( 2 )', '( 4 ), ( 1 ), ( 5 ), ( 2 ), dan ( 3 )', 'B', '18-11-2015'),
(17, 16, '<p><strong>Teks berikut untuk soal nomor 1 s.d 3. </strong></p>\r\n\r\n<p><strong>Bacalah teks berikut dengan saksama!</strong></p>\r\n\r\n<p>(1) Setiap orang nyaris tidak mempunyai waktu istirahat pada hari &ndash; hari kerjanya karena hampir semua aktivitas dikejar oleh tenggang waktu dan dituntut hasil kerja yang cepat dan tepat. (2) Pada akhir pecan mereka menghabiskan waktu untuk beristirahat, berekreasi, dan bersantap kuliner dengan keluarga atau teman. (3) Sejumlah perilaku seperti mengonsumsi makanan siap saji, merokok, minum-minuman beralkohol, kerja berlebihan, kurang berolahraga, dan stres telah menjadi bagian hidup masyarakat. (4) Maka tidak heran, beragam penyakit diderita oleh masyarakat yang hidup dengan pola makan tidak sehat dan tidak teratur. (5) Gaya hidup masyarakat modern dilengkapi kenyamanan serba ada, bersifat praktis, dan cepat, walaupun tidak memenuhi standard kesehatan.&nbsp;</p>\r\n\r\n<p>1. Kalimat utama dalam paragraph tersebut terdapat pada nomor ....&nbsp;</p>\r\n', 3, '(1)', '(2)', '(3)', '(4)', 'A', '18-11-2015'),
(18, 16, '<p>2. Kalimat sumbang dalam paragraph tersebut adalah ....&nbsp;</p>\r\n', 4, '(1)', '(2)', '(3)', '(4)', 'A', '18-11-2015'),
(19, 16, '<p>3. Makna &ldquo;nyaris&rdquo; dalam kutipan teks tersebut adalah ....&nbsp;</p>\r\n', 5, 'mungkin saja terjadi', 'tidak pernah terjadi', 'hampir saja terjadi', 'sudah pernah terjadi', 'A', '18-11-2015'),
(20, 16, '<p>3. Makna &ldquo;nyaris&rdquo; dalam kutipan teks tersebut adalah ....&nbsp;</p>\r\n', 6, 'mungkin saja terjadi', 'tidak pernah terjadi', 'hampir saja terjadi', 'sudah pernah terjadi', 'A', '18-11-2015'),
(21, 17, 'Pertanyaan Bahasa Inggris ... ', 1, 'Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D', 'A', '13-08-2016'),
(22, 17, 'Pertanyaan Bahasa Inggris 2 ... ', 2, 'Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D', 'B', '13-08-2016'),
(23, 17, '<p>Pertanyaan Bahasa Inggris 3....</p>\r\n', 3, 'Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D', 'C', '13-08-2016'),
(24, 17, 'Pertanyaan 4', 4, 'Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D', 'A', '13-08-2016'),
(25, 17, 'Pertanyaan Bahasa Inggris 5 ... ', 5, 'Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D', 'A', '13-08-2016'),
(26, 18, 'Pertanyaan 1', 1, '1', '2', '3', '4', 'A', '16-08-2016'),
(27, 18, 'Pertanyaan 2', 2, '1', '2', '3', '4', 'B', '16-08-2016'),
(28, 18, '<p>Pertanyaan 3</p>\r\n', 3, 'A', 'B', 'C', 'D', 'B', '16-08-2016'),
(29, 18, 'PERTANYAAN 4', 4, 'A', 'B', 'C', 'D', 'A', '16-08-2016'),
(30, 18, 'PERTANYAAN 5', 5, '1', '2', '3', '4', 'A', '16-08-2016'),
(31, 36, 'PERTANYAAN 1', 1, '1', '2', '3', '4', 'A', '16-08-2016'),
(32, 36, 'PERTANYAAN 2', 2, '1', '2', '3', '4', 'B', '16-08-2016'),
(33, 36, '<p>PERTANYAAN 3</p>\r\n', 3, '1', '2', '3', '4', 'C', '16-08-2016'),
(34, 36, '<p>PERTANYAAN 4</p>\r\n', 4, '1', '2', '3', '4', 'D', '16-08-2016'),
(35, 36, 'PERTANYAN 5', 5, '1', '2', '3', '4', 'A', '16-08-2016');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
 ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `detail_absensi`
--
ALTER TABLE `detail_absensi`
 ADD PRIMARY KEY (`id_detail_absensi`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
 ADD PRIMARY KEY (`id_email_log`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
 ADD PRIMARY KEY (`id_employer`);

--
-- Indexes for table `kategori_lowongan`
--
ALTER TABLE `kategori_lowongan`
 ADD PRIMARY KEY (`id_kat_lowongan`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
 ADD PRIMARY KEY (`id_lowongan`);

--
-- Indexes for table `matpel`
--
ALTER TABLE `matpel`
 ADD PRIMARY KEY (`id_matpel`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
 ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `nilai_soal`
--
ALTER TABLE `nilai_soal`
 ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
 ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pelamar`
--
ALTER TABLE `pelamar`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjab`
--
ALTER TABLE `penjab`
 ADD PRIMARY KEY (`id_penjab`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
 ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
 ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
 ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `soal_modul`
--
ALTER TABLE `soal_modul`
 ADD PRIMARY KEY (`id_soal_modul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `detail_absensi`
--
ALTER TABLE `detail_absensi`
MODIFY `id_detail_absensi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
MODIFY `id_email_log` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kategori_lowongan`
--
ALTER TABLE `kategori_lowongan`
MODIFY `id_kat_lowongan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
MODIFY `id_lowongan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
MODIFY `id_modul` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `nilai_soal`
--
ALTER TABLE `nilai_soal`
MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pelamar`
--
ALTER TABLE `pelamar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
MODIFY `id_perusahaan` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `soal_modul`
--
ALTER TABLE `soal_modul`
MODIFY `id_soal_modul` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

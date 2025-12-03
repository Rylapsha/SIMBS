-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 12:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `tanggal_input` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul`, `deskripsi`, `penulis`, `penerbit`, `tahun_terbit`, `tanggal_input`) VALUES
(1, 1, 'Seporsi Mie Ayam Sebelum Mati', 'Buku ini berisi kisah Ale, seorang pria yang menghadapi kesepian, trauma masa kecil, dan depresi. Dengan narasi yang emosional dan jujur, buku ini mengajak pembaca menelusuri pergulatan batin seseorang yang mencari arti hidup dan penerimaan di tengah dunia yang menolaknya.', 'Brian Khrisna', 'Gramedia Widiasarana Indonesia', '2025', '2025-11-02'),
(2, 2, 'Akasha: Black Paradox', 'Buku ini berisi Black Paradox karya Junji ITO, tentang empat orang yang saling mengenal lewat situs bunuh diri dan menelusuri jalan menuju kematian yang sempurna. Cerita ini memadukan horor dan fiksi ilmiah, menghadirkan ketegangan sekaligus empati terhadap pergulatan batin tokohnya, sambil menegaskan bahwa bunuh diri bukanlah jawaban.', 'Ito Junji', 'm&c!', '2024', '2025-11-04'),
(3, 2, 'Level Comic: Jojo`s Bizarre Adventure 11 - Part 3 Stardust Crusaders', 'Buku ini berisi kelanjutan perjalanan Jotaro dan kelompoknya setelah mengalahkan pengguna Stand \"Justice\", Nek Enya. Joseph mencoba memanfaatkan \"Hermit Purple\" untuk mendapatkan informasi penting tentang kemampuan Stand Dio, namun rencana itu terhenti ketika Steely Dan muncul dan menghabisi Nek Enya. Dalam volume ini, pembaca diperkenalkan pada Stand \"The Lovers\", Stand berukuran kecil yang dianggap paling lemah, namun memiliki kekuatan unik yang mampu menyerang dari dalam tubuh manusia, menjadikannya ancaman berbahaya bagi tim Jotaro.', 'Hirohiko Araki', 'Elex Media Komputindo', '2024', '2025-10-06'),
(4, 1, 'Gadis Kretek', 'Buku ini berisi kisah tentang cinta, pencarian jati diri, dan sejarah yang berkelindan dengan perkembangan industri kretek Indonesia. Berlatarkan Kota M, Kudus, dan Jakarta dari masa penjajahan Belanda hingga awal kemerdekaan, cerita ini memperkenalkan pembaca pada dunia perkretekan yang kaya tradisi, dibalut aroma tembakau serta romansa yang hangat dan menyentuh.', 'Ratih Kumala', 'Gramedia Pustaka Utama', '2012', '2025-10-08'),
(5, 3, 'Anne Frank: The Diary Of Young Girl', 'Buku ini berisi catatan harian Anne Frank, seorang gadis Yahudi berusia tiga belas tahun yang bersembunyi bersama keluarganya selama pendudukan Nazi di Belanda. Selama dua tahun hidup di \"Lampiran Rahasia\", Anne menggambarkan keseharian mereka yang penuh ketakutan, keterbatasan, dan harapan yang tetap dijaga. Melalui tulisannya yang jujur, peka, dan penuh refleksi, Anne menghadirkan potret kuat tentang keberanian, kemanusiaan, dan ketabahan seorang remaja yang mimpinya terhenti oleh kekejaman perang.', 'Yosihumi', 'Sinar Star Books', '2012', '2025-12-20'),
(13, 4, 'Kamu Gak Sendiri: Kamu Lagi Terbentuk', 'Buku ini berisi refleksi tentang kecemasan, rasa lelah, ketakutan, serangan panik, dan proses memahami kondisi mental diri sendiri. Melalui pengalaman pribadi penulis, buku ini mengajak pembaca untuk jujur terhadap perasaannya, memberi ruang bagi emosi yang terabaikan, serta belajar melepaskan beban yang lama disimpan. Dengan bahasa yang hangat dan menenangkan, buku ini menjadi teman untuk melihat ke dalam diri, mengenali luka, dan mulai merawat diri dengan lebih penuh kasih.', 'Syahid Muhammad', 'Kawah Media', '2019', '2025-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tanggal_input` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tanggal_input`) VALUES
(1, 'Fiksi/Novel', '2024-01-06'),
(2, 'Fiksi/Komik/Manga', '2024-02-03'),
(3, 'NonFiksi/Autobiografi', '2024-01-09'),
(4, 'NonFiksi/Self Improvement', '2024-03-12'),
(5, 'NonFiksi/Sejarah', '2026-02-01'),
(8, 'Fiksi/Sejarah', '2030-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(1, 'spice', 'ice@gmail.com', '$2y$10$xC9Xx1jyOYv1vTQnH9FUNeKTMeY6NIowHNbj48IOqcp5e7tC8gWx.'),
(2, 'iya', 'iay@dah', '$2y$10$no2CTsrraPzdS.07sQ.5vuLxq9It2vSIGRlw3AmjfjkVPiLIz64wy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_buku_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_buku_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 5.1.41 - Source distribution
-- OS Server:                    Win32
-- HeidiSQL Versi:               11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Membuang data untuk tabel fin_pro.att_log: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `att_log` DISABLE KEYS */;
INSERT INTO `att_log` (`sn`, `scan_date`, `pin`, `verifymode`, `inoutmode`, `reserved`, `work_code`, `att_id`) VALUES
	('616272019121456', '2020-04-16 10:31:41', '1', 1, 1, 0, 0, '160420201031416162720191214561'),
	('616272019121456', '2020-04-16 20:09:26', '2', 1, 1, 0, 0, '160420202009266162720191214562'),
	('616272019121456', '2020-04-16 20:15:40', '1', 1, 1, 0, 0, '160420202015406162720191214561'),
	('616272019121456', '2020-04-16 20:16:59', '1', 1, 1, 0, 0, '160420202016596162720191214561'),
	('616272019121456', '2020-04-16 20:34:37', '1', 1, 1, 0, 0, '160420202034376162720191214561'),
	('616272019121456', '2020-05-13 20:02:58', '1', 1, 1, 0, 0, '130520202002586162720191214561');
/*!40000 ALTER TABLE `att_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

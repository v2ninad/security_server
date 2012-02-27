-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2012 at 06:55 PM
-- Server version: 5.1.49
-- PHP Version: 5.2.10-2ubuntu6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cc_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `credit_detail_keys`
--

CREATE TABLE IF NOT EXISTS `credit_detail_keys` (
  `id` char(36) NOT NULL COMMENT 'uuid',
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_detail_keys`
--

INSERT INTO `credit_detail_keys` (`id`, `key`) VALUES
('1', 'KL0y78W8J9PJh9kXVPv1uZn1h6PyfvBy'),
('6', 'QxtP3uKrshBtWKLF1L09OVdTCw2grPHr'),
('7', 'zzXhZ3Cco1WhexeUzw4rhMF7OJrwAKBw'),
('8', '7rgOTKYDPY7RfCqKLPvXx0PlRZ9m2f8m'),
('9', 'hEvJdPYWCpSwlrA3JevvgQrpH5gUmnbM'),
('10', 'Z14JwfMfPrhDCQE8gm6YLCWUsGLYX35d'),
('11', 'GxycqHpe6GzbSSLkfFqCDjkyvCd2SES8'),
('4f475099-9de0-4259-8fe6-3c63cbdd56cb', 'g6fBgZ2DG5SXF537Jc1fnBD60kxrv34Q'),
('4f4754ac-0aac-4520-abf1-233acbdd56cb', 'Cu6Af6iTMuM8OFBWUZoMMm1bZn4seuke'),
('13', 'dFigK7u2aR1SOs60wqf40VqiJxBI3gHh'),
('4f475660-3d50-4f4f-ac96-233acbdd56cb', 'M4QODgcjuX4paQ2ZcHKMXlC9kLMAF4IE'),
('4f475676-9ec8-4399-a12b-3c6fcbdd56cb', '3CBjmU6SWpSYwhURP3yRiawLexIK1GIx'),
('4f475ad8-29e4-4f34-9748-3c63cbdd56cb', 'MOfSXVv8DeBPRj6NafekgonzseYXFuJN'),
('4f475ae3-c5a8-4fdb-85e8-1f26cbdd56cb', 'E4d4CHInIZGYiMxRZkU8O5z7oFgInaeg'),
('4f475af3-f050-420f-85fa-1ed4cbdd56cb', 'DKokEqrqhuCeT19m6G3l2GWwTQYyBmgY'),
('4f475b03-e62c-428d-aac2-233acbdd56cb', 'pxTML54GSjsXaOup6IDWCWyC3cKvZrQD'),
('4f475d56-15dc-4cc3-9fe3-233acbdd56cb', 'e29G8TkmSaLfM9v5Hp0MF5XlAUf60Loe'),
('4f478c9c-1960-4ab2-ab6b-499ac0a81e44', '6bCxtvcVMgZh1Cw0QeeQZ1kmnRRLzvkd'),
('4f4b7023-bd60-4e81-b3ad-5637c0a81e44', 'KzUPltdBOTjAkJM2GxAYJgF2FMIWuv7G'),
('4f4b7032-f5c4-4836-9aca-5beec0a81e44', 'NjSg7FhUe3H8HPAMrc7bTCGxFZ6yFDBQ'),
('4f4b7067-1cac-491a-b22e-5beec0a81e44', 'Wdngo52dL2GMduA39Dha46sCDRQJnodn'),
('4f4b70ee-55a4-43c9-a94a-626ec0a81e44', 'We3LiI8jOn6OJ3jud3SOo05luljiEWbe'),
('4f4b7143-1d54-4974-bed6-626fc0a81e44', 'G46pm6p3aGKnvJZijX1wON7NDmTHxvVS'),
('4f4b7158-22b8-4847-aa78-6270c0a81e44', 'fd6Ff0LPeEVC9a8sn84eclsJZViNsNwp'),
('4f4b7177-bf4c-4a9d-a6d8-626cc0a81e44', 'OP4WQeRYBkVSbmN48m891tZV4baAJpO7'),
('4f4b71fa-4dec-4adf-9793-5beec0a81e44', 'j1BF4pIeMJENwuRR07ecbrUUi49CyHJZ'),
('4f4b7216-7e90-4c21-8f92-5634c0a81e44', 'iQfe2PM4o5qHE1PdVI4Xhx5rc8eWv6By'),
('4f4b722d-60c0-4401-8d9b-626ec0a81e44', 'juGTbBc6ODeZTvMsMNvoW5RGmBhd09iF'),
('4f4b7263-550c-4aaa-89a9-626fc0a81e44', 'BjTGgvVuXCYBL1vc8lqiEEJ54Ym3ID6a'),
('4f4b7332-6284-4ae5-80b5-5637cbdd56cb', '2YGhrBw6CluuWz9lNJozIJgxbpZ3G5h9'),
('4f4b7350-3b78-48da-ba76-5634cbdd56cb', 'jqlUBDzkvYHjHvBqgQ7BtTfK8yMuvuwB'),
('4f4b735a-5908-45ab-999e-5635cbdd56cb', 'rLMCwUE0cBumCb3k4RXbxDvVVCjtsW8V'),
('4f4b7377-a668-4cc5-8705-626ecbdd56cb', 'kgg3uXW7gzWr3yzbBoLbT5Mt325CjiJB'),
('4f4b7394-eac4-492f-978f-626ccbdd56cb', 'uwj2NOBBWAzXlT4IPRAhCCQ3VGRpNnHD'),
('4f4b73bb-6908-47a2-8627-5637cbdd56cb', 'v1CMsLCxb1SRrv4j5dNevnmupY0czs31'),
('4f4b74fb-8db0-432b-a699-5beec0a81e44', '68Ly8VuC460PqwOY0yAiqIGHRsAo8e8D'),
('4f4b7518-e034-4adf-99f3-5634c0a81e44', 'TFnomggxBJFmAeNBuFTOIbGcnZ9u4Leq'),
('4f4b7528-8e40-45e8-9faa-5635c0a81e44', '4K3D7glkqiLiR6notmiaDkYxrw5HGIwe'),
('4f4b7565-af34-4492-b55d-5636c0a81e44', 'Sc8Xqxvdber4Wcl0hqvBjtjXnOCpVNJw'),
('4f4b7587-4350-4e12-908a-626ec0a81e44', 'jAnim6q5T4SyZ9NTJnugWT64KR7he1N5'),
('4f4b75a1-c518-446c-8ba2-5633c0a81e44', 'OoDNSkzEnm1N5KvqkKEIidhckCdcsXzO'),
('4f4b7a2e-eadc-4285-89a3-626cc0a81e44', 'L9BpDCUUOkxiOps9dzEzihP2mFr17M02'),
('4f4b7a31-85fc-4ae2-bea1-626fc0a81e44', 'ENnRSQ6PbcsRYiA1hUd35YTudMDlLKFS');

-- --------------------------------------------------------

--
-- Table structure for table `masked_fields`
--

CREATE TABLE IF NOT EXISTS `masked_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `masked_pattern` varchar(255) NOT NULL COMMENT '''X'' for mask, 0 for visbility i.e. 0000-XXXX-XXXX-XX00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `masked_fields`
--

INSERT INTO `masked_fields` (`id`, `field_name`, `masked_pattern`) VALUES
(1, 'cc_number', '00XX---XXX--XXXX---X0000');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail_keys`
--

CREATE TABLE IF NOT EXISTS `user_detail_keys` (
  `id` char(36) NOT NULL COMMENT 'uuid',
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail_keys`
--


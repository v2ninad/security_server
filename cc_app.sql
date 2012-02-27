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
-- Database: `cc_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `credit_cards`
--

CREATE TABLE IF NOT EXISTS `credit_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `credit_detail_id` int(11) NOT NULL,
  `key_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `credit_cards`
--

INSERT INTO `credit_cards` (`id`, `user_id`, `credit_detail_id`, `key_id`) VALUES
(1, 1, 2, '4f475099-9de0-4259-8fe6-3c63cbdd56cb'),
(4, 1, 20, '4f475d56-15dc-4cc3-9fe3-233acbdd56cb'),
(3, 1, 19, '4f475b03-e62c-428d-aac2-233acbdd56cb');

-- --------------------------------------------------------

--
-- Table structure for table `credit_details`
--

CREATE TABLE IF NOT EXISTS `credit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(255) NOT NULL,
  `cc_number` varchar(255) NOT NULL,
  `cc_exp_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `credit_details`
--

INSERT INTO `credit_details` (`id`, `cc_name`, `cc_number`, `cc_exp_date`) VALUES
(1, 'udWE8DCJKF2icebiCFUUAFJLU1x07tUy4nVlIRmmucc=|h2QPUFTBEx1KZTY1u6YY2i6xG121Gh+lFonKiMaxPFk=', 'pfrI0eW2dr9pkc0HAsis9dVkhkIMX8vAXL5mUAC+/tM=|GSgl13aX3GstZcLr/GH8UAmBHb1Phm4siH/EI1IdlYc=', 'v9ZwgByZ+yppcgILz48k64fN1oZ7izIfFkNJ42DSfT4=|mWfsguaivavIWVkB1+IQ4yDKK8rdQBcCthJ6ypPsrOQ='),
(2, '', 'JQEqh0OCe1dFzVE+mqay6VC+n2YQVqK9HxmE6bq7/p0=|cc6OoBvx8DfcvDntmcIpj0jpg321rQh9+kxH3Mgz80A=', ''),
(3, '/DR0KoitOrfv3VOhQBypTqJBayluF+PSyT9agdHMYtI=|Dh2QT03RqcohYAaD9c3BhHNWC2ZhwDcOolr3EMWSnZY=', 'qsXv0L1bY02dN/fxeGjheNFTRZtMo3dIbYwf/SGb4dk=|urPg7czgHvYwK7fTRv+q6DE//H1Mab8A1EO/59rzpmU=', 'GnimQntxzFDoHhYwLTfciva/36gcnjzyMCUPXVrOAtc=|T2fZMQxux5tnQ6yw/9VvlQnMBuU7i8OWsnOMB0KABZI='),
(4, 'B1zyQcpj3IkwifJvVZtVcCdDoaT0QZZNIFGfed+1m8U=|2ObU9U5n5lx2xQPWBAM2sSgZX0/YqlPtw20qZR99TZc=', 'kY5kQDNSlr80VxnjdBLNgU1fDacgRaymcOjdGiQMYFA=|9R/Cpjqvkv2gmiZU8Qu+HbsrDC3o0gDPyJOlnIE+Kio=', 'FYPehnyCkzu3MF0t/tM5j36dOQ529WvQACk5sgjnE44=|9mUiZ1HpzOWy/yMooJny4M9FOVCxc55YCb90jZosTIc='),
(5, 'adsp0pWR3uUjVUV57FicoKbUwSQZARyl79VnwBrTSJY=|9O2dsKyMdg3mvI22zJj1ATaU8O3vfl4dL+BAAz9xTUs=', 'RZfzr22IoKho69xLsMfegbvACHIRRT0vu5N3g42vopU=|WcNDHeJDCAQy2hS2dbpapaPA8WcIsDd2djDncXsLYDE=', 'Fuk7o39feavI58zixHacSohErOac1yV3vSNbGDOEr3I=|8a4fuGu5ETynqW3ajxrtljy2t9bz8d6tkFGvh6bkWQY='),
(6, 'GmHT/F4LTE9YICAscHOU/H4t5rfEpSvt4jxQL8Oo5h0=|DjkrSYk+S7U1IOu/oh8jD8zqMVQD/Jo++GWMuazNMMU=', 'AsewD7IsLyuuq5dz82cVxmdBjNbB7Zyzd6ZIpqUebPI=|yp7XYjlGCWlwW4Az0I/RSH0j7XtYsHW+h/MPWCAxoTw=', '8FEjNjbBYThiVusS/Mrx0Fl9O1z9DnRGSc4bW+reCro=|lcBybYtIr2VUfxZVlKyo9P0CYTh1etkb0fgrqxcLpEU='),
(7, 'Qn9cQI6i6YuoavovBwSyz3aomfRv8pci1AisPvTC2QE=|2/gkQ1YQHotoIm6xNtGC5N0ohxVd3SCJ4mjNlejXUh4=', '77lWAvl/kHhi9nw3jAk1gTmlXUwdjnSWE+hj89Egqe0=|tOWilCvPDYLArDf6vuJV9qyk2B+sp9b02nhFBz1QtKQ=', '7YrdtkheWQfPthxDDrBI3alDKtnMgT/XEktA73U3Qjc=|s8aHpB5i1OlePojCOBnXejbWAvFd8SGJanQu/vvrBp8='),
(8, 'kYRRw43eZYKB8LPI/EWJtaAyO96fN7pXvNq8Kpj6vM0=|+vNjnW5gpparY6VPWCsCukApIpXNVrF05g/LLaHaE98=', '9XJeClxzzbjybj9HpFZ5wJEDJEd63pmSQsFtygRJbus=|WZR/+xjF9EpJXUxqU3YrGTtbkFcUxfvpm33xeZKo0/k=', 'fMvPbTlLG3W9PBA7uR6G8CFBZ2qfNS/AlfYFPTkqfw8=|dNA7Yz0HR0894VraU/lOVGqb9Lsfenb/gtUKqwYzhvQ='),
(9, 'ACD3H3mEAfMAbkwyJAO94IoBuVVSRWeBer7biOO3198=|S3HKOM7bnUFvu7gXO6v+OyAoIpt3x7Ajeah7dSXiueA=', 'pnIdhYSSpsxKSHNCeLwmNa507M/KqKTw2iOwAxFkwiE=|CyLe4WVTiOVoVcWjsDl/8SikmZ09AUsjl+Yf1BMKplo=', 'yWrJ+GmpAUowe0g8e9nuSbXritNhiBkMNtOjtFnj2M8=|/kiQPd8Su72GxBXRyDEPzr410OgA9AjyujYexzKqe1k='),
(10, '7CBbHvGZcxJ8kZwpqZGAwtEIWFrLar5/xNcfqsUgGs0=|kNY+bTdA+YCL1kLAcXzzRoKRKnrakcRPqHd7s5hKKro=', 'LsCq3h3gdFLnCqjlv3hpdjztm0yk5V8ZEf2P9vFZI04=|0XfWhTuEKArz77VsietegpmT1RmvWTna3NeMGfG+66Q=', 'SirM0z2rdx653KqnXxkKNm54tKulq1JL3+eLYCKzQHY=|KR2bSkPHoX8ynm0jauDuMbB0qJ15dgiwTPpmzG+NuJY='),
(11, 'WOeKy1XyNVXMF1stxLzz88OpcDiwe9Nj82Bf5dacQIw=|Z6e2Pi+1rEskDw8Ron1MlNIiCX9rf7bpNwNT4N2LKck=', 'kZaV/iUe+J9RnjjQ90qDi/j0ZE2GcwMOiMKkSgqo9ZE=|92fX6QhshipbbBEc7NBuWdeu8zKi3Q9F4A+Rst9brWM=', '3LwREWQphpjSk2J8xUsgmIVio5Gd+CFkSKWQ5LAvhMo=|zl4xT+RrfF6JhLy8YDG+slXT17YfC/0eiOtoEiCOs64='),
(12, 'lbFYFCaKw8muxJAI/BnEbgXXywLn8/HJdmDnVs0VqoA=|7Jk4cO5Ma6W1Q0jgvwTHTfeSJ2swI3XPrPGSfiLqNg8=', 'is1QXNv9OKXHdkOOFOyiAu7WDx58keEgktKqTInbMC4=|NxU1Rymnser/ae3PTpMvFybcCvy8iV+CtsV2YgjoGHs=', 'njQNm51bQog0tsNqCP7Z/gG/OpG6YsW3edDErlpjxgM=|CQ5FgwWJQKk9TC4ltdAakBfqRtvF04TR8NbrwJ4JnKs='),
(13, 'g7+7P+Ig7D9FZfa85Jrjl5n7tZnhJF90AtqWULCmREQ=|IgOcpL6xE7l5t/kPD3657zh6sjb+E86zxvEEGSegb4g=', '3JpRotqHSIeAXNhNAOfgABmQOWwig92xKu4LbMmo8Tk=|h4WFwWBCX4BWLIAHTjO2jAvBmTfEjZhkWsWwdSf+LSA=', 'FsIbFj9bWf53ORE38qtANsakUS8LVXhwclMQ/VA1ZwA=|yfDjw6bem0o5sIyofSFYe4dw0RrAAtWOr7FZXh2nh44='),
(14, 'KygITd4wCWr2+ANZhvb+nSBceLTCUyMoL1HInTvL0dw=|O5WmNgzNqBTJyYFpBgfSD1tmZBNQm616HYILeMaa5Xk=', 'SNdEdDgQZ5xxC1ro1aIka5klkZkk0F+RFvzKXYL4mNM=|E8UdDB1c1hNkb/rOtRQL1xkQQYssOGEL3/sjqEzE2Jw=', 'bRYfker1iZwXWJOsYZqpBxOxB3WRqfvb5qi4vXhn89o=|F+QHukzNs6fFdivhVTEOr/EAR85Ivx2Nhl4y3iCcMGE='),
(15, 'C2hfJ1HWPL1mFUYMLSsMRIZGbRtzQ+7X32iMqu2X7uM=|nt9sQvL8iF4Ap7uef5qVBOulerqgW+l7V1jFqiqjDsE=', 'FofpknAndlnnG/7no8XVa9EqK5tjhUo0evO7CoFn+IM=|s+nSormnrg1d48snD+nY9aoKZ6CSnLQLc2nISqJboeo=', 'KIXg2Hl3eVEmoRRnOv0gLdD0IYtt2R1SZtlijvn5AU4=|bPN/xm22Prrn1BFXDp7cSAoogq7rS/zWK0lADcHohmk='),
(16, '/EBLaUg9dmBoZA34JLpK97hyLY8io1ppT1Hl6uak3pI=|K+GsyxBrnyHMPJVb2qaw3c9yBAzk3aaXoNkN7NAPg+Q=', '9w3y5tQRU28/Ua0sAdfJKE+JNbdUCINkaUALVKzRnhA=|0uz9kC8Btsd0SyUkQjCq1lWeJdFS3NUNJ3W5nKqXa1w=', 'LZiOAppOtjAFeLmjEFSWFy/ayzchWQmQNmQ2yxXk5So=|s9Xrp7EA+Q0XgkoQzkEhjK5D74jTRP8JSuxXjs2+SkA='),
(17, '3ejRRd2sR/UJWMETUCHsnbihY+niNh8Nk22B5NR8K5c=|xoVOfmjN+EwWIrKPmQAPUGhDBGxAg+9lX0qZ55ZJXJI=', 'CyT856PuM/UHoCaxZ0o6zb0sytWhsIuumAS4PHAHmiM=|v3CV+Im07bdh44cQ6ernfdZUCjbAZTZHK8w6k85Oj3Y=', 'BMOGBeWcMqC+hFnIewEGZ6/jehIr2K5A9Hcg5+KyZv0=|W04MotDT0kV0VYF9lJdHuQjCrWB+kgGJz8kQaTO8tXw='),
(18, 'IOcMDh8rZNvqlRNPtpsSeZAZfhy4gB4pP16lG8NWoxI=|mxscjOzI0cI9pWTekQ7DjwIsI9St5VS0HqMVLKbv/Vk=', 'yOCpQj/NyJvddz09C/f6c2D8/Y9BvoIkmk52sY3BZ4U=|Kw/ySW9kn5N0SC4IyMMvPzfwj4YoZGuCdIsrVMmPaDE=', 'GGakZka7WjicLtO/Qz2r8oUQ4Ax+xoxhDgxD5MvjP7A=|tCmAavU00n4N29EwYQsvqb7J7g8F97qcgD4eGheUlWs='),
(19, 'wbWAX8PHeuZ9rCnFymGWhbHB065OvVbhuq99LprDnmI=|lJmvDF3Yd3SAub0Z50iL4LXGRkuhjLamLSn8DFtbGdk=', '8Lfj3ErMvbfhxi5Er9SwAnMWWGsCpWSMFLmPN9HlfRQ=|7saj7PvhxjDmHlb5oqqA3eB98W6rlKlf9YFU2GBThVA=', 'LzeyD3T8jhU4xZlQR+wngSHE6ZsTKMZj2QkN9k1deR8=|3Hk6hS37MRjdOkMC8FwHbO0Osj8H0o/CPRwhB9XcVhU='),
(20, 'Uq65Z0JJEgMJ8nbYSeY3tI9buonHrqu1w5KPdIyQ7Ok=|LC1l4SwOlN0oqiWfqdRiKca43dzcKkwHMFTyf3EH/Bg=', 'bG9VP0AeizCpjqGTVtr4BZIM3RHpGCZOBf2GoSR9lCw=|9BgAnSnvKmCrtQBgd+8DMWEvyTNNb+RB3flVZUIz5bs=', 'cAuKyLfbDk+Zwz2Wukog4QA4qUuoTo8eheByzh3fP6c=|UW2nYMW1IaMk2szSek1nYE8vwOPXK3SH5uwZq0GxruQ='),
(21, 'TrIA9yYojOz5s2TV8A7pcykt8phj4A/M+tKss5f5+lY=|Feax7xwAQxkr2gkg8bLGxZeO56hkvnfPwJPQOzaD6cw=', 'i9dqOS7YhyTBVup85LyAj8kRiZXlOx9GO7G4QG0j61I=|gWEaCO4djOd8Za9wlMq1n09f7F5QmH3HSKghR9tz5HM=', 'm23Fnx8TnifsdZn+euWapPOLuYBii43IJ6u5WrDmrfs=|g7q6CETaF+uQ7LBjBqYjtkNjs1w63O+GfmixnDQ08po='),
(22, 'xfHaJFSyKUQ9VEdbSJiTaZeOeUPWAuLeqj66VkuYXqA=|E6RDgtMSCCCKbKgu+lahd/Vki1xfdMG9ORa9GjtjqSs=', 'nSj6D3XT/OAMrcbdAQXvU7d2YPZXoyNU8SL3qvo1pY4=|ibDd6hjn/2ZczSmF/4wVNB0B0133h7EL/uY7cojpI/s=', 'gtR7SA+Jbek1ucDvfGunICIOjLd2/D4zJjtQRo8Rizk=|SLLW34LIps6JaO8PKp8j9o1fhzYgy+btynyFYY2Dpr8='),
(23, 'trEPPhllvqpv99xo0cFwc1J8+yxT7NPLZGdihqxTf3c=|mD76hAoCUX/7dWTfMLI5MRWpHVmk1utgYDYaCYeiVD4=', 'mKl/bfXGzQYlGvdebvN2JigOV4aIa2jcug4HNbrV9yo=|p6Aeajli+GozumbNtBAApX5sxTLAYRl0yNzWHlY9AQE=', 'VVg2xaCDtWJqUKK+4Krhd9ggB2TMiWigNnrLaRZkBo4=|MqEpPE7TvjRjbhvSF+4sXaHEjTPiGRqc0bCNpb/9e80='),
(24, 'MTqTOx6nAz4SI5RC5G8oCLRgz7l4QqAKjaihPn7DV/Q=|yv4dpo+5YYUlsQH5KtKiDlCGYId/BM5I+09DY8E9Gt4=', 'HOo43pXfqM8+JRnbucc4+eaNGG6z92dPKtzliKZrvDw=|NVJyN2AdqW0uv3iuKE1NERoKIEOPbBJOhXqZKmEL/mE=', 'K04GPxzKq9+sA9xu8LnYrtNphcq0Jfr6q7dZoSqv/us=|tm5XYRr79zGSBV28284Yv7KE0zZhMjl0YwbSh0YsuUA='),
(25, 'Kp8qyEAw2QljgY5XySTGEzRnS3ngZFAilTXLbvqZoGA=|OL2dqol3UNKcGRt2F/7y0jOrcwfH4p8JTkl19JIffUo=', 'XvnuNsxYegu2ao+171/HuYXmKb3NGlYmOjHMmTqlcSc=|d9V8XUl6Ma/gBU/IVbE+QjZ+3YP9gtfYaxyf6Hrzv2s=', 'G673ToNYI7oY8t8Oj15/OJRacYAmCTWrKNBbBTslOcs=|LjPfQKRBoshNOLW3TtOZyu4HYdfkjQhToEYUR3UNb94='),
(26, 'Y4EURsBsT5Hq7vrETWV6mppVyCQ4NA6hAflJwW+IXh0=|6CZBXHFlbJIvhx/yDmoqRcPnpxNBWNg1IBKnORPsSu8=', 'v6b1L4FglSaglUqxySTRdhyUFZYyFFc/ir9iUci3JpA=|IW6J8X+xsJbI1gjV+1txR7pgTn9Mx4yZBMQMBxfAZ6Q=', 'pwnTNKRRH16PsQ79xR4CAdCbhjUBMGzb9zfNVTXTC3M=|rxwEXhJEAWC1L8md1k/YOd3voLxO/2Obhl7MBKoyGsY='),
(27, 'w5exldQe9C9PStdTspdAvdDIKa1+49DqQnPJB5wbNS4=|/mGeZCooZuphX2skprFQgFCdXH6mJu4jatR0Tn9X3Pw=', 'wZKfpc6pVvqWQBPzxnaUIkpE3JKhXSE71a3QbViijRw=|N1U1u6r4C/aFBW+fhXpIUIiNrncyZBOkAYjnQkHHwkY=', 'TkoyZoWatO/ElfqVRbC88fwlsT9U5xWlaDHUfe1hsuY=|9AMXextAkxl1KTmR79z0ihyCvOoinfWrpJp9TbvqSTE='),
(28, 'VkEwD0dMOrh6efxUyzoDJ3WscEDoVCLwqrJ9gTMuzEY=|vrh/fB3TIMfIM0Ql44tM+pYL39eVMXpxdN/HNIZKL08=', '+OLUjtHAuiWswlGjw1W2NMIbHvepbnMofk607DXocWo=|tTj3UnsxVHQnZqtLjMRlGe9uwEn3QlIgg0Rt1Huwrog=', 'wQCSxKlQlJkISF5PzeRReBgXdfCgyH9f3io97X+KcPw=|2hCXMlbVgiFj6XCcB0J+4naeLvO5nsFjetfWZ+1D2gQ='),
(29, '0to5RZl/tl/wdiuiU8EAEQVhrLezAUS0Kzo7IOXnEYw=|omf11TCG6fTcyr02GAq66nZYwXOooDCO0v7r7MHUyIU=', 'QLmNOo0/NE0iaKFBu55kTa2qc/3VCXgKVFMPWKdW/QU=|NboRMozqyUv+cXP9BOxgsuDCqT0sae3axcacSY+56DE=', 'Y/O4GCHd3dpEXiPjbKy4yVj2yEbwZ5g4s5bz/mu5wks=|Rf/6oDQsNakv5SPpbYBnwWbjy/62u/9ekiMprje7VQU='),
(30, 'Pa21q/WAkyk3ApRb2DShXo44LHRaMnd/aExtdAWM35A=|gETC3SF6gED45VbLBGPAzp+GdX2hGr0cXxqSVCMdtN4=', 'tzUYy0iQlNspYLh6pWgxGt34+9nJKhLyRt+UdNSpeOo=|HnraNhH99H2VmmDJVXoWTNX+a44HpxsI/acALihFXEA=', 'voykKE/1cqIA8Q/VuQxAXjILu9N8g6cIKXSPqAtDO5U=|9OrI6/bUsU2Sd5b8g0OYzI2u7mRBiWnEP3Yysi9BrXw='),
(31, 'Wvmv4nCIQRl7Tbq93rQlKsZ/V+dq4oiNBIQjpqfBfnY=|6L3gV37yfCGrX/Hk+j6go4aUyXAmJ26rcGaalA6v4JM=', 'iSehVgzyXrxuBZiz7KTS3hVzXtveBGpd3GAnMDhW1DI=|kLgnK0nCXGN6pLeN074+N3Zane2lJ7aBQrh2eN7eJCk=', 'Ie638ZO9Qa9MuG4yPCB3fUHBWBb52L4SbdqI39UDvC8=|iN3xOsoENZTsqf2OsVRepG5w2xMINsUnuma6vX6G5s0='),
(32, 'tDPjEXWISpjVjo9Xd9f3v7BLF4hkjGJ/09cgUE/yOaM=|COFxTOW46yrHd858Ew0Kn05UjLUk/MaYmIUXZF/Clks=', 'vFrF3LG7CX0Wtl63JqyoKOWJJuS4iV6CiC0WqzXd3N8=|uPqz+2GErbT/HBrN5chtTHR/9WKrLeOZlxmXpOJQBZs=', 'KL8lCgrwJvh7na3ixh9Sb6Z6duXIK85AxkLdR20FJh0=|gpdfV35pvlFKIxvUVftsHsGhczlJ7G3QGS2l6g784hE='),
(33, 'WHyBDa/uqOrfGqIameLBBFkkL78Dxs4DgOyQ8oIbpEs=|JcKOW2blOTF30qkKadFeGHagnCS7r+aPeMxGc6L5Zfk=', 'zJFjxA6OSMV/vliViZ3TmCBo7/5F4HKManRON04T5gc=|OF5z63PlnSsY9IVM/I7ZFBE59aNpzbCAb3tS9wx0wdI=', 'rFtThQLVBPMlFEo6MzCXGJazVpFZMWKYLZvJKRrbmCY=|faEpq8WbpBvO/HnU0LwVv1dGGGBDViS8CIIJ4hUFRec='),
(34, 'lG+pOOpQq0a2rUZG/jxI8zM89wDqCA73SyfAY70OJFw=|akMdQ4vt5yEBw1rVSldNa9dE3oeWEH9w9S3BF2p9cyc=', 'hFiLo5n9/nCtCfwLCQv6MlHu8fK75TbnabI/YInK0N8=|V8d/5sKAR5sitsEr1eRxJKXuI8OrYOBjfwj6Ds2E7zE=', 'cJvjoQZz98yIpiBC73L6qXO9YH6KI4aJN357PzJTfs0=|aAVt4mvsu216nCGIkRPvAUgL71a+tlIBnrsekHWYl9s='),
(35, 'zNext3nqGecLVqOohBb8JFhyvpAUxdRzYmFjKjRUQhU=|Dmw91c8QIJYvWf1xpcki2a1xqJ/NRDDTnUEu5lNu/P0=', 'XsWekd7BRGHQjKtgvYllxl73u59icxA4LA7mH/V7dss=|bByVo2NIFs7FlnXPaboQkRMLPGYj1JutFQcfspDeghQ=', '0aYZ3NhAKyHFPwjcM7A5iSsjjAfKGUg5BYFjkB8CLfQ=|j8Zu8irnUac5es+xTz9T84z+8zGDdO6c6R3OqXL/Czc='),
(36, 'emV31za2KHwYaHtrPDgBwEJPtH/byTPlIKpIjB2EuKE=|cyQFdVhCIrZlFf3zj9P2/3Z/Q+91jQaGZQg4kBMFoGU=', 'L7+uuJ2/AKsrQmp69bAMwnPqS/SpiJySjcPTe1X38XU=|3/Iu8tEEHgctcbHlllGZI6CihkHPZ9rc1beSKRP4a60=', 'LEAK+sWjg+xszMTvs1tzRx86Rl329ad3Gt1DNL2X6jA=|y1nvC1zhw/nZYDGSMs7huOFNzzy7cPjmJ78bifO0Qms='),
(37, 'JbBTGTyVmcuZG+1kRWHDCt1rLqrgN8jQWf02bNNlAAs=|dYL9SE7Tt7Sjay8lNvqPOm/uIUOQICb9WCFBsfnxkXU=', 'c71/cPp+3DXUjKA7g1fbM4n14RDcyZnrKdBsyPBCigM=|YxgKMpaRKs6tGHwL37xyZFGVNZwfTES641Uf+qd2GOY=', 'bcdVGKKkxIhnLu6ak9KrL4xKa4JrAFPAHhz2TMH4FlQ=|A6SPV+EBRWH/NLxm6j/AlGZw1K8L9Na3gumqkgQ1bGQ='),
(38, 'n47WqNVy6Qq5h5GHJ+9ZvHRAnDNZrYmMVZQVj/jPLPU=|XPlsMUJA7gVrjGpfc+J1pPsZxfPsSFf0ZSVZOS1hJ1M=', 'uGS9y7didzJfoC1qexkfQOXuqMxX9HbFm0RiAhfGN+w=|EkGTlBTpSOA7gtP6c4FRCDqIlizzN8e45GTU9NGyr4I=', 'hdRUgjTEqoruOJ/kfhhS9e9hmzPrW5a4AecudJKZXwM=|F4qXU2XSnV3eI31DfzWoDqUkw9UD9Snivr3oKhlHDoA='),
(39, 'XCw6THDm6TD3fKohMAMpv5+PciFi0lwBi45oirI4IxA=|ihuzfR3028BAXTCw7lLPuQemaCEPNjQZP9fQBnUYbfU=', 'u1JhP+5thdVLpvdwYplMfSyfxGFHzJcA2zBnonvPrXw=|XFjci6Dvz7xqC5VDvtQcGq1ASJiOqwCzQC3pT96bl68=', 'iL46KmEN7hWcBypsDqzB63y9wrseM0j7z3WfzegQZV4=|M2oC5+RbrlpaMrmwG8mxmoCmQr+rjb8JUml81b8PoRk='),
(40, 'Sge/u0YUHOfXGG4+Gmic6uqj26+aQHA7Ge89cPpiTo4=|JLpL313f8r9nzsm2lUo4FmaYy7QUpI1bHBKukJi0ioc=', 'v6ufXTsDeZj8BqAvfPgOOgiaPl4ngP2n9Nkha6Gi7mI=|aZ/CwKegHHQGXPKqzXYt4F+YSB5rIGryGwQZj/WPkyo=', 'u/hSrK1K6/EE19Ub/r2rwKJDI7dYftqn45k2p39FaQ8=|sryuzlRmE3QjUm+8mDQo9w/7/EvCtwOK+o+LDYm52Z4='),
(41, 'MtZOPSPw8bVlTWG3gU411wDyNpDjRVtfgElowwKLT/Q=|E1skKUqAOkvP23wCVX9Z8IwkDvrhs8mkepttm88TW8M=', 's11LbIqkU63KE4GpTUKhbw7vNYPDEfa8RtxzDdfwqEY=|Dq1vPg92zN23E0hAZYM/L1M331iyli58i2sBSAK5aMk=', 'NmrOlzf2SfjTVwce8bm8OjduBF5tESjbLOJ/y2E1Yp0=|SvaAK+Uib6Cm4bF8p96pVwW1v7/0crcq9yVE+zd5Pfc='),
(42, 'X7Jx8V/R0Jwg7FKPwmt0NhOsBx/TmlzsryaMWxi8QGw=|29v+xHvQwlky1+xuXcpweu0jGmIse5kQP0+8n7urBLw=', 'U54hwbDiSpAq5RqLWMcu8tdswuXqNWBTDc4bqmmgS5A=|qAsppPbqEVwVfRzcUlhhPky9a1tcz6kQt0aCI97YklU=', 'iGuf1QzrZBmMkUjucVqb4Jcva2Ecvln76r2f/A54cLE=|8QwaXUhhU3YjsGSdEARWVtq+VvsL49M4hmGl6Ooepow='),
(43, '3K6P/XCY+CjMNen9N1CyJyQ02+dp7B/nHZGsq/to4d0=|NNq+4afUfKmWWGwKI6UVv04b5WS5JN3BPeQjDNR5XjA=', 'PvYFSMrDPc79mEsQLH1KO8ntx4HOjTpxlUTIHSrq2PQ=|yz1XR7la32Qbc7Iqgrivs+MtFfEI2CIDh4v55jpoLNs=', 'ZnAc8pJsYpP7yZrT/GXp/S6YSwd0FyuLrD1rxB/YF3I=|5vkMQKjNclztahHO/NNuvg68O8nsCAH2V0gw9hMA7qs='),
(44, '+4CIvsorTHTucIZi8aN0VaUd8rnjLscnXtKSrWipPzw=|W1T+UnZ73fW6k7z5mEk/uX0JFETA0P34CtrIicDPUG8=', 'tVxxVjzb7Ix94uyb/Fdi6zjD8LzO9JSwauduK/LhyV8=|NUF8JTelQhkBjO/yk0g7bzNFFhwnxb8lawTLfL7w4s0=', 'LLlMY7zK2f0ArrCLvkAFXE1g5va6yQQA5NQ4vXZkK8c=|G3++ufZ0DEDD2GXcRWIPZpoW3LAcCOtEkrknbLUItpQ='),
(45, 'k142aBW0ADmgYbKkZdBu8ldnb3nzv0ewnGDY/OQBsSo=|HEMs/GC+4i2ZU9nEzrDgVQIKjmnf/kV/u+JRuiH4xNA=', 'SIFn2xSehvr64DZxeQeC3XKvMUMi5tafetZLubgvwWs=|fPJh7CQnPkiAL+wN8ZJZ1OpPKuUBW7p/UCZGHZ+GPm8=', '0Gsl59bGsW6w+213WwzDtabyR7Ka3kMh6oPYOeV4YOc=|fJhZwDDpo4RlzSGaatVyk7aqKLZbPE87dQg6I8lABmA='),
(46, 'uJ9LK2EfY28bXKIiX8dPXWkaCOys0sOvRBYqmzHPwow=|4TYCul7nfucfSu4hzCjZG9D4JQ0/DW1vN8P8uRp1jlQ=', 'PSzG8AQHy/j72tECXjRUe2w1KPyOrYWn41nYo5KWxUs=|/2RGPaszs2WnZHiIOOb5rGOhDgby9R3fY8Zrdaq8TSQ=', 'HC75DXRawEn3oeWHhYnjYykcFMuy+MLES+8AmqrpcA8=|EcBwufj+UTt544ClNhH6b1F3rup4nNkyUe+a+adClAw=');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `is` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`is`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `photos`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1, 'Ninad', 'ninad@ninad'),
(2, 'desai', 'desai@desai'),
(3, 'john', 'john@john'),
(4, 'prasad', 'prasad@prasad');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `social_id` varchar(255) NOT NULL,
  `license_id` varchar(255) NOT NULL,
  `insurance_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_details`
--


-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2015 at 10:30 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jeopardy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_before`(IN `endpoint` DATE)
    NO SQL
select s.fname, s.lname, s.number, 
t.points, t.name as 'team name', g.Id as 'game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_before_from_game`(IN `endpoint` DATE)
    NO SQL
IF (select team from Games where playedDate <= endpoint) = 1 THEN 
select s.fname, s.lname, s.number, t.name, t.points
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
where t.fk_game = game;

ELSE 
select s.fname, s.lname, s.number, t.points
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
where t.fk_game = game;

END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_before_from_professor`(IN `endpoint` DATE, IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, 
t.points, t.name 'team name', g.Id as 'game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint and g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_before_solo`(IN `endpoint` DATE)
    NO SQL
select s.fname, s.lname, s.number, t.points, g.Id
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_before_solo_from_professor`(IN `endpoint` DATE, IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, t.name, g.Id as 'Game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint and g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_before_team`(IN `endpoint` DATE)
    NO SQL
select s.fname, s.lname, s.number, t.points, t.name, g.Id
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_before_team_from_professor`(IN `endpoint` DATE, IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, t.name, g.Id as 'Game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.playedDate <= endpoint and g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_categories_from_class`(IN `class` INT)
    NO SQL
    COMMENT 'Returns all the categories of the given class.'
Select * from Categories where fk_class = class$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_from_professor`(IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, 
t.points, t.name as 'team name', 
g.Id as 'game', s.Id
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_groups_from_professor`(IN `professor` INT)
    NO SQL
    COMMENT 'Select all groups from a certain professor.'
select * from Groups where fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_records_solo_from_student_number`(IN `num` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, g.playedDate, g.fk_prof
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on g.Id = t.fk_game
where s.number = num$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_records_team_from_student_number`(IN `num` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, g.playedDate, t.name, g.fk_prof
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on g.Id = t.fk_game
where s.number = num$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_solo_from_professor`(IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, g.Id as 'Game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_squares_from_category`(IN `category` INT)
    NO SQL
    COMMENT 'Select all the squares that belong to a certain category.'
select * from Squares where fk_category = category$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_squares_from_class`(IN `class` INT)
    NO SQL
    COMMENT 'Gets all the squares of a given class.'
select * from Squares where fk_category in
	(select Id from Categories where fk_class = class)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_students_from_games`(IN `game` INT)
    NO SQL
IF (select team from Games where Id = game) = 1 THEN 
select s.fname, s.lname, s.number, t.name, t.points
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
where t.fk_game = game;

ELSE 
select s.fname, s.lname, s.number, t.points
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
where t.fk_game = game;

END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_students_from_professor`(IN `professor` INT)
    NO SQL
    COMMENT 'Given a valid professor id, returns all students under him.'
select s.fname, s.lname, s.number, g.name
from Students as s
join group_student as gs on s.Id = gs.fk_student
join Groups as g on g.Id = gs.fk_group
where g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_from_professor`(IN `professor` INT)
    NO SQL
select s.fname, s.lname, s.number, t.points, t.name, g.Id as 'Game'
from Students as s
join student_team as st on s.Id = st.fk_student
join Teams as t on t.Id = st.fk_team
join Games as g on t.fk_game = g.Id
where g.fk_prof = professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `return_classes`()
    NO SQL
    COMMENT 'Returns all classes from the database.'
Select * from Classes$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `return_professor_row`(IN `emai` VARCHAR(30), IN `pass` VARCHAR(20))
    COMMENT 'Finds the corresponding professor giving the email and password.'
select * from Professors where email = emai and password = pass$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fk_class` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`Id`, `name`, `fk_class`) VALUES
(1, 'Arithmetic', 1),
(2, 'Trigonometry', 1),
(3, 'Biology', 2),
(4, 'Algebra', 1),
(5, 'Geometry', 1),
(6, 'Calculus', 1),
(7, 'Differential Calculus', 1),
(8, 'Integral Calculus', 1),
(9, 'Basic Math', 1),
(11, 'Otro', 2),
(12, 'Otro1', 2),
(13, 'Otro2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE IF NOT EXISTS `Classes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Classes`
--

INSERT INTO `Classes` (`Id`, `name`) VALUES
(1, 'Mathematics'),
(2, 'Sciences'),
(3, 'French'),
(6, 'DataBase');

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE IF NOT EXISTS `Games` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `playedDate` date NOT NULL,
  `team` int(11) NOT NULL,
  `fk_prof` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`Id`, `playedDate`, `team`, `fk_prof`) VALUES
(1, '2015-04-01', 1, 1),
(2, '2015-04-02', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `fk_prof` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`Id`, `name`, `fk_prof`) VALUES
(1, '4a', 1),
(2, '4b', 1),
(4, '4c', 2),
(49, 'Red Team', 22),
(50, 'Blue Team', 22),
(51, 'Green Team', 22),
(52, 'Black Team', 22),
(53, 'Eq1', 22),
(54, 'Eq2', 22),
(55, 'Eq3', 22),
(56, 'Windows', 22),
(57, 'Mac', 22),
(58, 'Linux', 22);

-- --------------------------------------------------------

--
-- Table structure for table `group_student`
--

CREATE TABLE IF NOT EXISTS `group_student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_student` int(11) NOT NULL,
  `fk_group` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `group_student`
--

INSERT INTO `group_student` (`Id`, `fk_student`, `fk_group`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 4),
(5, 1, 49),
(6, 2, 50),
(7, 3, 51),
(8, 4, 52),
(9, 1, 53),
(10, 2, 53),
(11, 3, 54),
(12, 4, 54),
(13, 5, 55),
(14, 6, 55),
(15, 1, 56),
(16, 2, 56),
(17, 5, 57),
(18, 6, 58);

-- --------------------------------------------------------

--
-- Table structure for table `Histories`
--

CREATE TABLE IF NOT EXISTS `Histories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `playedDate` date NOT NULL,
  `fk_prof` int(11) NOT NULL,
  `fk_group` int(11) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Histories`
--

INSERT INTO `Histories` (`Id`, `playedDate`, `fk_prof`, `fk_group`, `type`, `points`) VALUES
(1, '2015-04-28', 22, 1, 1, 200),
(2, '2015-04-28', 22, 2, 1, 300),
(3, '2015-04-28', 22, 3, 1, 400),
(4, '2015-04-28', 22, 4, 1, 1000),
(5, '2015-04-28', 22, 56, 0, 1000),
(6, '2015-04-28', 22, 57, 0, 2000),
(7, '2015-04-28', 22, 58, 0, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `Professors`
--

CREATE TABLE IF NOT EXISTS `Professors` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `tries` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `Professors`
--

INSERT INTO `Professors` (`Id`, `fname`, `lname`, `password`, `status`, `tries`, `email`) VALUES
(1, 'fn', 'ln', 'okok', 2, 0, 'em'),
(2, 'johny', 'guitar', 'spurs', 2, 0, 'emi'),
(22, 'Alfredo', 'Hinojosa', 'hinojosa', 2, 0, 'alfhh4@gmail.com'),
(24, 'Enrique', 'Hernandez', 'okok', 2, 0, 'enriqueohernandez@gmail.com'),
(26, 'Sergio', 'Cordero', 'xFDCu1EabQ', 1, 0, 'mrquorr@yahoo.com.mc'),
(27, 'Sergio', 'Cordero', 'blamblam', 2, 0, 'mrquorr@yahoo.com.mx');

-- --------------------------------------------------------

--
-- Table structure for table `Squares`
--

CREATE TABLE IF NOT EXISTS `Squares` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `hint` varchar(100) NOT NULL,
  `points` int(11) NOT NULL,
  `fk_category` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `Squares`
--

INSERT INTO `Squares` (`Id`, `question`, `hint`, `points`, `fk_category`) VALUES
(1, 'what is 1?', 'x=4-3', 200, 1),
(2, 'what is 9?', 'x=3*3', 300, 1),
(3, 'what is sine?', 'It is the opposite divided by the hypothenuse in a', 200, 2),
(4, '2 + 2', '4', 400, 1),
(5, '6 * 5', '30', 500, 1),
(6, '2-1*4', '-2', 1000, 1),
(7, 'Trig 300', 'Ans 300', 300, 2),
(8, 'Trig 400', 'Ans 400', 400, 2),
(9, 'Trig 500', 'Ans 5001', 500, 2),
(10, 'Trig 1000', 'Ans 1000', 1000, 2),
(11, 'Algebra 200', 'Algebra 200', 200, 4),
(12, 'Algebra 300', 'Algebra 300', 300, 4),
(13, 'Algebra 400', 'Algebra 400', 400, 4),
(14, 'Algebra 500', 'Algebra 500', 500, 4),
(15, 'Algebra 1000', 'Algebra 1000', 1000, 4),
(16, 'Geometry 200', 'Geometry 200', 200, 5),
(17, 'Geometry 300', 'Geometry 300', 300, 5),
(18, 'Geometry 400', 'Geometry 400', 400, 5),
(19, 'Geometry 500', 'Geometry 500', 500, 5),
(20, 'Geometry 1000', 'Geometry 1000', 1000, 5),
(21, 'Calculus 200', 'Calculus 200', 200, 6),
(22, 'Calculus 300', 'CalculusA 300', 300, 6),
(23, 'Calculus 400', 'CalculusA 400', 400, 6),
(24, 'Calculus 500', 'CalculusA 500', 500, 6),
(25, 'Calculus 1000', 'CalculusA 1000', 1000, 6),
(26, 'DCalculus 200', 'DCalculusA 200', 200, 7),
(27, 'DCalculus 300', 'DCalculusA 300', 300, 7),
(28, 'DCalculus 400', 'DCalculusA 400', 400, 7),
(29, 'DCalculus 500', 'DCalculusA 500', 500, 7),
(30, 'DCalculus 1000', 'DCalculusA 1000', 1000, 7),
(31, 'Integral', 'moreintegral', 300, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE IF NOT EXISTS `Students` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`Id`, `fname`, `lname`, `number`) VALUES
(1, 'stu1', 'den1', 111),
(2, 'stu2', 'den2', 222),
(3, 'stu3', 'den3', 333),
(4, 'stu4', 'den4', 444),
(5, 'stu5', 'den5', 555),
(6, 'ocho', 'ocholast', 888);

-- --------------------------------------------------------

--
-- Table structure for table `student_team`
--

CREATE TABLE IF NOT EXISTS `student_team` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_student` int(11) NOT NULL,
  `fk_team` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `student_team`
--

INSERT INTO `student_team` (`Id`, `fk_student`, `fk_team`) VALUES
(1, 2, 1),
(2, 1, 1),
(3, 3, 2),
(4, 4, 2),
(5, 2, 4),
(6, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE IF NOT EXISTS `Teams` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `fk_game` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`Id`, `name`, `members`, `points`, `fk_game`) VALUES
(1, 'equipo a1', 2, 1400, 1),
(2, 'equipo a2', 2, 1800, 1),
(3, 'equipo b1', 1, 400, 2),
(4, 'equipo b2', 1, 1000, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2024 at 11:18 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_course_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE IF NOT EXISTS `assignments` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `title`, `description`, `due_date`) VALUES
(1, 'c progrmmig', 'basic declarations, initializations', '2024-11-10'),
(2, 'c progrmmig', 'basic declarations, initializations', '2024-11-10'),
(3, 'loops', 'loops ', '2024-11-11'),
(4, 'python basic declaration', '1.print hello world', '2024-11-14'),
(5, 'database table creatations', 'create a table with 5 feilds and insert the 10 record ', '2024-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE IF NOT EXISTS `certificates` (
  `certificate_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(50) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `start_date` varchar(30) NOT NULL,
  `end_date` varchar(30) NOT NULL,
  PRIMARY KEY (`certificate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`certificate_id`, `student_id`, `student_name`, `course_name`, `duration`, `start_date`, `end_date`) VALUES
(1, 'null', 'null', 'null', 'null', 'null', 'null'),
(2, 'null', 'null', 'null', 'null', 'null', 'null'),
(3, 'null', 'null', 'null', 'null', 'null', 'null'),
(4, '12', 'bhuvi d', 'asp.net', '2 months', '2024-10-29', '2024-12-05'),
(5, '10', 'nandini ganapati naik', 'java full stack course with internship letter', '1 year', '2023-10-15', '2024-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fees` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_name` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `description`, `duration`, `fees`, `teacher_name`) VALUES
(1, 'Java Full Stack Development', 'Learn full-stack development with Java, covering both front-end and back-end development.', '6 months', '5000', 'John Doe'),
(2, 'Python for Data Science', 'A comprehensive course on Python for data science, including data analysis and machine learning.', '4 months', '4000', 'Jane Smith'),
(3, 'Web Development with HTML, CSS, and JavaScript', 'A beginner-friendly course covering web development technologies like HTML, CSS, and JavaScript.', '3 months', '3000', 'Robert Brown'),
(4, 'Android App Development', 'Build Android apps using Java and Android Studio. Learn from basics to advanced concepts.', '5 months', '4500', 'Emily Johnson'),
(5, 'Machine Learning with Python', 'Learn machine learning concepts using Python, including supervised and unsupervised learning techniques.', '6 months', '5500', 'Michael White'),
(6, 'Digital Marketing', 'A complete guide to digital marketing, including SEO, SEM, social media marketing, and analytics.', '2 months', '2000', 'Sarah Lee'),
(7, 'Database Management with MySQL', 'Learn how to design and manage databases using MySQL. Topics include queries, indexes, and normalization.', '4 months', '3500', 'David Harris'),
(8, 'DevOps and Cloud Computing', 'Understand the principles of DevOps and Cloud Computing, focusing on continuous integration and delivery.', '6 months', '6000', 'Chris Taylor');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE IF NOT EXISTS `grades` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `grade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `student_name`, `assignment_id`, `grade`) VALUES
(1, '2', 2, 'a'),
(2, '2', 2, 'a'),
(3, '1', 2, 'B+'),
(4, '1', 2, 'a+'),
(5, '2', 1, 'A'),
(6, 'swati', 2, 'A'),
(7, 'nandini', 12, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`) VALUES
('nandu@gmail.com', 'nandu@123', 'admin'),
('raju@gmail.com', 'raju123', 'student'),
('mahi@gmail.com', 'mahi@12345', 'student'),
('manju@gmail.com', '1212', 'student'),
('sheetal@gmail.com', 'sheetal123', 'teacher'),
('vikram@gmail.com', 'vikram@123', 'admin'),
('divya@gmail.com', 'divya@123', 'student'),
('krishna@gmail.com', 'krishna@123', 'teacher'),
('vijay@gmail.com', 'vijay@123', 'student'),
('rakshu@email.com', '123', 'staff'),
('swati@mail.com', '123', 'staff'),
('swati@mail', '123', 'student'),
('null', 'c', 'student'),
('gaju@g', '12', 'student'),
('gaju@h', '123', 'admin'),
('gagan@gmail.com', '123', 'student'),
('vb@gmai.com', '12', 'student'),
('rajat@gmail.com', '123', 'teacher'),
('ganesh@g', '123', 'student'),
('viju@gmail.com', '123', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `username`, `amount`, `payment_date`, `payment_method`, `payment_status`) VALUES
(1, 'swati', '5000.00', '2024-11-21 00:00:00', 'cash', 'balance 5000');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `firstname`, `lastname`, `address`, `email`, `password`, `role`) VALUES
(1, 'mahi', 'd', 'hubli', 'mahi@gmail.com', '123mahi', 'student'),
(2, 'vikram', 'm', 'hubli', 'vikram@gmail.com', 'vikram@123', 'admin'),
(3, 'vijay', 'g', 'dharwad', 'vijay@gmail.com', 'vijay@123', 'student'),
(4, 'rakshita', 'n', 'siddapur', 'rakshu@email.com', '123', 'staff'),
(5, 'swati', 'a', 'cbt', 'swati@mail.com', '123', 'staff'),
(6, 'swati', 'a', 'cbt', 'swati@mail', '123', 'student'),
(14, 'sanju', 'g', 'hubli', 'sanj@gmail.com', '12', 'staff'),
(15, 'gagan', 'ga', 'hubli', 'gagan@gmail.com', '123', 'student'),
(16, 'gowri', 'g', 'nbv', 'vb@gmai.com', '12', 'student'),
(17, 'rajat', 'b', 'hu', 'rajat@gmail.com', '123', 'teacher'),
(18, 'ganesh', 'g', 'kumta', 'ganesh@g', '123', 'student'),
(19, 'viju', 'g', 'kumta', 'viju@gmail.com', '123', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `email`, `password`, `course`, `year`) VALUES
(3, 'harsha', 'harsh@gmail.com', '123', 'python and django', '3'),
(4, 'manju', 'manju@gmail.com', '1212', 'c programing', '2'),
(5, 'gaju', 'gaju@g', '123', 'full stack', '2'),
(6, 'gagan', 'gagan@gmail.com', '123', 'fullstack', '2'),
(7, 'gowri', 'vb@gmai.com', '12', 'c', '1'),
(8, 'ganesh', 'ganesh@g', '123', 'pyhton', '2');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE IF NOT EXISTS `student_courses` (
  `student_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`student_course_id`, `student_id`, `course_id`) VALUES
(1, 12, 2),
(2, 2, 1),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE IF NOT EXISTS `submissions` (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `assignment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`submission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`submission_id`, `student_id`, `assignment_name`, `file_path`) VALUES
(1, 1, '2', 'apply-bg.jpg'),
(2, 120, 'basic declarations', 'notes.docx'),
(3, 90, 'cprograming', 'img1.jpeg'),
(4, 67, 'java', 'img6.jpeg'),
(5, 78, 'python', 'img3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `name`, `email`, `password`, `department`, `designation`) VALUES
(2, 'krishna sir', 'krishna@gmail.com', 'krishna@123', 'computer science', 'senior teacher and team head'),
(3, 'gaju', 'gaju@gmail.com', '2', 'cs', NULL),
(5, 'gajanan', 'gajunandu@gmail.com', '124', 'computer', 'project'),
(7, 'gajanan', 'gajunau@gmail.com', '124', 'computer', 'project'),
(9, 'sandhya', 'sandhya@gmail.com', '123123', 'ec', 'teacher'),
(10, 'divya', 'sivya@gmail.com', '90', 'cs', 'project'),
(13, 'rajat', 'rajat@gmail.com', '123', 'cs', 'v'),
(14, 'viju', 'viju@gmail.com', '123', 'cs', 'trainee');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `video_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`video_id`, `course_id`, `assignment_id`, `video_title`, `video_url`, `description`) VALUES
(1, 1, 0, 'Java Full Stack Overview', 'https://www.youtube.com/watch?v=video1', 'Introduction to Java Full Stack Development'),
(2, 1, 0, 'Spring Boot Introduction', 'https://www.youtube.com/watch?v=video2', 'Learn the basics of Spring Boot'),
(3, 2, 0, 'Python Basics', 'https://www.youtube.com/watch?v=video3', 'Introduction to Python programming'),
(4, 2, 0, 'Data Science with Python', 'https://www.youtube.com/watch?v=video4', 'Data analysis and machine learning with Python'),
(5, 3, 0, 'HTML and CSS Basics', 'https://www.youtube.com/watch?v=video5', 'Learn HTML and CSS for web development'),
(6, 3, 0, 'JavaScript for Beginners', 'https://www.youtube.com/watch?v=video6', 'Introduction to JavaScript programming'),
(7, 4, 0, 'Android App Development Tutorial', 'https://www.youtube.com/watch?v=video7', 'Build Android apps with Java'),
(8, 5, 0, 'Machine Learning with Python', 'https://www.youtube.com/watch?v=video8', 'Introduction to machine learning concepts');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

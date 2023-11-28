-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 07:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic_approval`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic-semester_details`
--

CREATE TABLE `academic-semester_details` (
  `Academic_year` varchar(15) NOT NULL,
  `semester` int(11) NOT NULL,
  `semester_start_date` date NOT NULL,
  `semester_end_date` date NOT NULL,
  `registration_start_date` date NOT NULL,
  `registration_close_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `academic-semester_details`
--

INSERT INTO `academic-semester_details` (`Academic_year`, `semester`, `semester_start_date`, `semester_end_date`, `registration_start_date`, `registration_close_date`) VALUES
('2018/2019', 2, '2023-07-03', '2023-11-10', '2023-07-04', '2023-07-10'),
('2018/2019', 3, '2022-12-08', '2023-03-16', '2022-11-09', '2022-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `academic_staff_details`
--

CREATE TABLE `academic_staff_details` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(15) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `Department_id` varchar(15) NOT NULL,
  `Position` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `academic_staff_details`
--

INSERT INTO `academic_staff_details` (`staff_id`, `staff_name`, `nic`, `Department_id`, `Position`) VALUES
(1, 'Miss.M.Mala', '925553496V', 'D1', 'Senior'),
(2, 'Miss.M.Kamala', '915593496V', 'D2', 'Junior'),
(3, 'Mr.K.Ajith', '905597496V', 'D1', 'Senior');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_Code` varchar(15) NOT NULL,
  `Course_Name` varchar(30) NOT NULL,
  `semester` int(11) NOT NULL,
  `Credit` int(11) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Coordinator_id` int(11) NOT NULL,
  `Offered_Dept_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_Code`, `Course_Name`, `semester`, `Credit`, `Type`, `Coordinator_id`, `Offered_Dept_id`) VALUES
('EC4050', 'ECD', 4, 3, 'Core', 3, 'D2'),
('EC6060', 'Software Engineering', 6, 3, 'Core', 2, 'D1');

-- --------------------------------------------------------

--
-- Table structure for table `course_registration`
--

CREATE TABLE `course_registration` (
  `student_id` varchar(15) NOT NULL,
  `Course_Code` varchar(15) NOT NULL,
  `Attempt` int(11) NOT NULL,
  `Academic_year` varchar(15) NOT NULL,
  `course_register_Date` date NOT NULL,
  `advisor_Status` varchar(15) NOT NULL,
  `registration_approved_date` date DEFAULT NULL,
  `Observation` text DEFAULT NULL,
  `coordinator_observation_date` date DEFAULT NULL,
  `Coordinator_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_registration`
--

INSERT INTO `course_registration` (`student_id`, `Course_Code`, `Attempt`, `Academic_year`, `course_register_Date`, `advisor_Status`, `registration_approved_date`, `Observation`, `coordinator_observation_date`, `Coordinator_status`) VALUES
('2019/E/047', 'EC4050', 2, '2018/2019', '2023-07-12', 'Pending', NULL, NULL, NULL, 'Pending'),
('2019/E/047', 'EC6060', 1, '2018/2019', '2023-07-12', 'Approved', '2023-07-17', NULL, NULL, 'No Need');

-- --------------------------------------------------------

--
-- Table structure for table `department_deatils`
--

CREATE TABLE `department_deatils` (
  `Department_id` varchar(15) NOT NULL,
  `Department_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_deatils`
--

INSERT INTO `department_deatils` (`Department_id`, `Department_name`) VALUES
('D1', 'Computer Engineering'),
('D2', 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `student_id` varchar(15) NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Attempt` int(11) NOT NULL,
  `Result` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_registration`
--

CREATE TABLE `student_registration` (
  `Nic` varchar(15) NOT NULL,
  `RegNo` varchar(15) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Nationality` varchar(15) NOT NULL,
  `Phone_Number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_registration`
--

INSERT INTO `student_registration` (`Nic`, `RegNo`, `Name`, `Address`, `Nationality`, `Phone_Number`) VALUES
('990658148V', '2019/E/035', 'Chris Woakes', '2nd lane, main street, Matara', 'Sri Lanka', '0771365289'),
('990782148V', '2019/E/047', 'Ben Stokes', '2nd lane, main street, Colombo', 'Sri Lanka', '0771485695');

-- --------------------------------------------------------

--
-- Table structure for table `student_uni_details`
--

CREATE TABLE `student_uni_details` (
  `RegNo` varchar(15) NOT NULL,
  `Department_id` varchar(15) DEFAULT NULL,
  `Academic_Year` varchar(10) NOT NULL,
  `Semester` int(11) NOT NULL,
  `Batch_Miss` int(11) NOT NULL,
  `Advisor_id` int(11) NOT NULL,
  `Advisor_Start_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_uni_details`
--

INSERT INTO `student_uni_details` (`RegNo`, `Department_id`, `Academic_Year`, `Semester`, `Batch_Miss`, `Advisor_id`, `Advisor_Start_Date`) VALUES
('2019/E/035', 'D1', '2018/19', 6, 0, 1, '2023-07-10'),
('2019/E/047', 'D2', '2018/19', 6, 0, 1, '2023-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_name` varchar(20) NOT NULL,
  `passoword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_name`, `passoword`) VALUES
('Adam@gmail.com', '202cb962ac59075b964b07152d234b70'),
('John@gmail.com', '900150983cd24fb0d6963f7d28e17f72');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic-semester_details`
--
ALTER TABLE `academic-semester_details`
  ADD PRIMARY KEY (`Academic_year`,`semester`);

--
-- Indexes for table `academic_staff_details`
--
ALTER TABLE `academic_staff_details`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `Department_id` (`Department_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_Code`),
  ADD KEY `Coordinator_id` (`Coordinator_id`),
  ADD KEY `Offered_Dept_id` (`Offered_Dept_id`);

--
-- Indexes for table `course_registration`
--
ALTER TABLE `course_registration`
  ADD PRIMARY KEY (`student_id`,`Course_Code`,`Attempt`),
  ADD KEY `Course_Code` (`Course_Code`),
  ADD KEY `Academic_year` (`Academic_year`);

--
-- Indexes for table `department_deatils`
--
ALTER TABLE `department_deatils`
  ADD PRIMARY KEY (`Department_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`student_id`,`Course_Code`,`Attempt`),
  ADD KEY `Course_Code` (`Course_Code`);

--
-- Indexes for table `student_registration`
--
ALTER TABLE `student_registration`
  ADD PRIMARY KEY (`Nic`),
  ADD UNIQUE KEY `RegNo` (`RegNo`),
  ADD UNIQUE KEY `RegNo_2` (`RegNo`);

--
-- Indexes for table `student_uni_details`
--
ALTER TABLE `student_uni_details`
  ADD PRIMARY KEY (`RegNo`),
  ADD KEY `Department_id` (`Department_id`),
  ADD KEY `Advisor_id` (`Advisor_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_staff_details`
--
ALTER TABLE `academic_staff_details`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_staff_details`
--
ALTER TABLE `academic_staff_details`
  ADD CONSTRAINT `academic_staff_details_ibfk_1` FOREIGN KEY (`Department_id`) REFERENCES `department_deatils` (`Department_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Coordinator_id`) REFERENCES `academic_staff_details` (`staff_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`Offered_Dept_id`) REFERENCES `department_deatils` (`Department_id`);

--
-- Constraints for table `course_registration`
--
ALTER TABLE `course_registration`
  ADD CONSTRAINT `course_registration_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_uni_details` (`RegNo`),
  ADD CONSTRAINT `course_registration_ibfk_2` FOREIGN KEY (`Course_Code`) REFERENCES `courses` (`Course_Code`),
  ADD CONSTRAINT `course_registration_ibfk_3` FOREIGN KEY (`Academic_year`) REFERENCES `academic-semester_details` (`Academic_year`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_uni_details` (`RegNo`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`Course_Code`) REFERENCES `courses` (`Course_Code`);

--
-- Constraints for table `student_uni_details`
--
ALTER TABLE `student_uni_details`
  ADD CONSTRAINT `student_uni_details_ibfk_1` FOREIGN KEY (`Department_id`) REFERENCES `department_deatils` (`Department_id`),
  ADD CONSTRAINT `student_uni_details_ibfk_3` FOREIGN KEY (`Advisor_id`) REFERENCES `academic_staff_details` (`staff_id`),
  ADD CONSTRAINT `student_uni_details_ibfk_5` FOREIGN KEY (`RegNo`) REFERENCES `student_registration` (`RegNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

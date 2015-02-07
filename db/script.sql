USE [master]
GO
/****** Object:  Database [tsuat_db]    Script Date: 02/08/2015 00:33:53 ******/
CREATE DATABASE [tsuat_db] ON  PRIMARY 
( NAME = N'tsuat_db', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\tsuat_db.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tsuat_db_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\tsuat_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tsuat_db] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tsuat_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tsuat_db] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [tsuat_db] SET ANSI_NULLS OFF
GO
ALTER DATABASE [tsuat_db] SET ANSI_PADDING OFF
GO
ALTER DATABASE [tsuat_db] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [tsuat_db] SET ARITHABORT OFF
GO
ALTER DATABASE [tsuat_db] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [tsuat_db] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [tsuat_db] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [tsuat_db] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [tsuat_db] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [tsuat_db] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [tsuat_db] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [tsuat_db] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [tsuat_db] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [tsuat_db] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [tsuat_db] SET  DISABLE_BROKER
GO
ALTER DATABASE [tsuat_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [tsuat_db] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [tsuat_db] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [tsuat_db] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [tsuat_db] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [tsuat_db] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [tsuat_db] SET  READ_WRITE
GO
ALTER DATABASE [tsuat_db] SET RECOVERY SIMPLE
GO
ALTER DATABASE [tsuat_db] SET  MULTI_USER
GO
ALTER DATABASE [tsuat_db] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [tsuat_db] SET DB_CHAINING OFF
GO
USE [tsuat_db]
GO
/****** Object:  Table [dbo].[surveydata_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveydata_tbl](
	[surveydata_idpk] [int] IDENTITY(1,1) NOT NULL,
	[survey_idfk] [int] NOT NULL,
	[surveyquestion_idfk] [int] NOT NULL,
	[surveyoption_idfk] [int] NOT NULL,
	[account_idfk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[announcements_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[announcements_tbl](
	[announcement_idpk] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[datetime] [datetime] NOT NULL,
	[account_idfk] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[announcements_tbl] ON
INSERT [dbo].[announcements_tbl] ([announcement_idpk], [description], [datetime], [account_idfk]) VALUES (3, N'hi guys!', CAST(0x0000A436017B25B8 AS DateTime), 1)
INSERT [dbo].[announcements_tbl] ([announcement_idpk], [description], [datetime], [account_idfk]) VALUES (4, N'Shutang ina mers!', CAST(0x0000A43700A2DCF8 AS DateTime), 1)
INSERT [dbo].[announcements_tbl] ([announcement_idpk], [description], [datetime], [account_idfk]) VALUES (5, N'Was!', CAST(0x0000A43700A38234 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[announcements_tbl] OFF
/****** Object:  Table [dbo].[sms_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sms_tbl](
	[sms_idpk] [int] IDENTITY(1,1) NOT NULL,
	[sms_sender] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGraduates]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGraduates](
	[graduate_idpk] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [varchar](50) NOT NULL,
	[birthday] [datetime] NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[middlename] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[date_graduated] [datetime] NOT NULL,
	[course_idfk] [int] NOT NULL,
	[course_major] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblGraduates] ON
INSERT [dbo].[tblGraduates] ([graduate_idpk], [student_id], [birthday], [lastname], [firstname], [middlename], [gender], [date_graduated], [course_idfk], [course_major]) VALUES (1, N'001', CAST(0x000084CB00000000 AS DateTime), N'Santiago', N'Edmark', N'Belo', N'Male', CAST(0x000084CB00000000 AS DateTime), 1, N'Tambay')
SET IDENTITY_INSERT [dbo].[tblGraduates] OFF
/****** Object:  Table [dbo].[tblColleges]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblColleges](
	[college_idpk] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblColleges] ON
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (1, N'COLLEGE OF ARTS AND SOCIAL SCIENCE')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (2, N'COLLEGE OF HUMAN KINETICS')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (3, N'COLLEGE OF BUSINESS AND ACCOUNTANCY')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (4, N'COLLEGE OF ENGINEERING')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (5, N'COLLEGE OF COMPUTER STUDIES')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (6, N'COLLEGE OF PUBLIC ADMINISTRATION')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (7, N'COLLEGE OF SCIENCE')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (8, N'COLLEGE OF NURSING')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (9, N'COLLEGE OF EDUCATION')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (10, N'COLLEGE OF ARCHITECTURE AND FINE ARTS')
INSERT [dbo].[tblColleges] ([college_idpk], [description]) VALUES (11, N'COLLEGE OF TECHNOLOGY')
SET IDENTITY_INSERT [dbo].[tblColleges] OFF
/****** Object:  Table [dbo].[pollsdata_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pollsdata_tbl](
	[pollsdata_idpk] [int] IDENTITY(1,1) NOT NULL,
	[polls_idfk] [int] NOT NULL,
	[pollsoption_idfk] [int] NOT NULL,
	[account_idfk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coordinatoraccount_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coordinatoraccount_tbl](
	[coordinatoracc_idpk] [int] IDENTITY(1,1) NOT NULL,
	[coordinator_username] [nvarchar](50) NOT NULL,
	[coordinator_password] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[coordinatoraccount_tbl] ON
INSERT [dbo].[coordinatoraccount_tbl] ([coordinatoracc_idpk], [coordinator_username], [coordinator_password], [status]) VALUES (2, N'College of Engineering', N'kahitanonalang', 0)
INSERT [dbo].[coordinatoraccount_tbl] ([coordinatoracc_idpk], [coordinator_username], [coordinator_password], [status]) VALUES (3, N'College of Agriculture', N'kahitanonalang', 1)
INSERT [dbo].[coordinatoraccount_tbl] ([coordinatoracc_idpk], [coordinator_username], [coordinator_password], [status]) VALUES (4, N'COLLEGE OF NURSING', N'kahitanonalang', 0)
INSERT [dbo].[coordinatoraccount_tbl] ([coordinatoracc_idpk], [coordinator_username], [coordinator_password], [status]) VALUES (5, N'COLLEGE OF EDUCATION', N'kahitanonalang', 1)
SET IDENTITY_INSERT [dbo].[coordinatoraccount_tbl] OFF
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[account_idpk] [int] IDENTITY(1,1) NOT NULL,
	[userlevel_idfk] [int] NOT NULL,
	[course_idfk] [int] NOT NULL,
	[student_id] [nvarchar](50) NULL,
	[password] [nvarchar](50) NOT NULL,
	[family_name] [nvarchar](50) NOT NULL,
	[given_name] [nvarchar](50) NOT NULL,
	[middle_name] [nvarchar](50) NOT NULL,
	[maiden_name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NOT NULL,
	[telephone_number] [nvarchar](50) NOT NULL,
	[email_address] [nvarchar](50) NOT NULL,
	[birthday] [datetime] NOT NULL,
	[citizenship] [nvarchar](50) NOT NULL,
	[religion] [nvarchar](50) NOT NULL,
	[marital_status] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[account_status] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccounts] ON
INSERT [dbo].[tblAccounts] ([account_idpk], [userlevel_idfk], [course_idfk], [student_id], [password], [family_name], [given_name], [middle_name], [maiden_name], [address], [telephone_number], [email_address], [birthday], [citizenship], [religion], [marital_status], [gender], [account_status]) VALUES (13, 1, 6, N'109888', N'roowako', N'Bergonia', N'ruther', N'Mariano', N'', N'Lupao', N'0936', N'jpanlilio06@gmail.com', CAST(0x0000845900000000 AS DateTime), N'Filipino', N'Christian', N'Single', N'Male', 1)
INSERT [dbo].[tblAccounts] ([account_idpk], [userlevel_idfk], [course_idfk], [student_id], [password], [family_name], [given_name], [middle_name], [maiden_name], [address], [telephone_number], [email_address], [birthday], [citizenship], [religion], [marital_status], [gender], [account_status]) VALUES (14, 2, 6, N'', N'roowako', N'Bergonia', N'ruther', N'Mariano', N'', N'Lupao', N'0936', N'jpanlilio06@gmail.com', CAST(0x0000845900000000 AS DateTime), N'Filipino', N'Christian', N'Single', N'Male', 1)
INSERT [dbo].[tblAccounts] ([account_idpk], [userlevel_idfk], [course_idfk], [student_id], [password], [family_name], [given_name], [middle_name], [maiden_name], [address], [telephone_number], [email_address], [birthday], [citizenship], [religion], [marital_status], [gender], [account_status]) VALUES (16, 2, 6, N' 4566577', N'asdfg', N'filocio', N'Portacio', N'Ganisio', N'', N'Tarlac', N'09363630126', N'sampleceo@gmail.com', CAST(0x000063DF00000000 AS DateTime), N'Filipino', N'Satanismo', N'Widowed', N'Male', 1)
INSERT [dbo].[tblAccounts] ([account_idpk], [userlevel_idfk], [course_idfk], [student_id], [password], [family_name], [given_name], [middle_name], [maiden_name], [address], [telephone_number], [email_address], [birthday], [citizenship], [religion], [marital_status], [gender], [account_status]) VALUES (15, 2, 6, N' 970454542', N'roowako', N'pogi', N'harmone', N'gwapo', N'', N'Lupao', N'0936', N'sampleceo@gmail.com', CAST(0x0000845900000000 AS DateTime), N'Filipino', N'Christian', N'Single', N'Male', 1)
SET IDENTITY_INSERT [dbo].[tblAccounts] OFF
/****** Object:  Table [dbo].[tblEmployment]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployment](
	[account_idfk] [int] NOT NULL,
	[employment_status] [nvarchar](50) NOT NULL,
	[q1] [nvarchar](50) NULL,
	[q2] [nvarchar](50) NULL,
	[q3] [nvarchar](50) NULL,
	[q4] [nvarchar](50) NULL,
	[q5] [nvarchar](50) NULL,
	[q6] [nvarchar](50) NULL,
	[q7] [nvarchar](50) NULL,
	[unemployed_status] [nvarchar](50) NULL,
	[selfemployed_status] [nvarchar](50) NULL,
	[further_study] [nvarchar](50) NULL,
	[highest_educ_attainment] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (1, N'employed_yes', N'1 to 3 months ', N'Yes', N'Abroad', N'Private', N'self_emp_opt', N'Rank and File', N'1 to 6 months', N'undefined', N'Business', N'fu_opt_yes', N'Doctoral')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (2, N'employed_yes', N'1 to 3 months ', N'Yes', N'Abroad', N'Private', N'self_emp_opt', N'Rank and File', N'1 to 6 months', N'undefined', N'Business', N'fu_opt_yes', N'Doctoral')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (4, N'employed_no', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'Not employed and not intending to be employed ', N'undefined', N'undefined', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (5, N'employed_yes', N'1 to 3 months ', N'Yes', N'Abroad', N'Private', N'self_emp_opt', N'Rank and File', N'1 to 6 months', N'Not employed and not intending to be employed ', N'Business', N'undefined', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (6, N'employed_no', N'1 to 3 months ', N'Yes', N'Abroad', N'Private', N'self_emp_opt', N'Rank and File', N'1 to 6 months', N'Not employed and not intending to be employed ', N'Business', N'fu_opt_yes', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (9, N'employed_no', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'Not employed and not intending to be employed ', N'undefined', N'undefined', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (12, N'employed_no', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'Not employed but seeking employment', N'undefined', N'undefined', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (14, N'employed_no', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'Not employed and not intending to be employed ', N'undefined', N'undefined', N'undefined')
INSERT [dbo].[tblEmployment] ([account_idfk], [employment_status], [q1], [q2], [q3], [q4], [q5], [q6], [q7], [unemployed_status], [selfemployed_status], [further_study], [highest_educ_attainment]) VALUES (15, N'employed_no', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'undefined', N'Not employed and not intending to be employed ', N'undefined', N'undefined', N'undefined')
/****** Object:  Table [dbo].[polls_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[polls_tbl](
	[polls_idpk] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[question] [nvarchar](max) NULL,
	[status] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[polls_tbl] ON
INSERT [dbo].[polls_tbl] ([polls_idpk], [description], [question], [status]) VALUES (1, N'Alumni Home coming', N'When would you want to celebrate your alumni home coming?', 1)
INSERT [dbo].[polls_tbl] ([polls_idpk], [description], [question], [status]) VALUES (2, N'Poll 2', N'Asl?', 1)
INSERT [dbo].[polls_tbl] ([polls_idpk], [description], [question], [status]) VALUES (3, N'Poll 3', N'aaga', 1)
SET IDENTITY_INSERT [dbo].[polls_tbl] OFF
/****** Object:  Table [dbo].[tblCourses]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourses](
	[course_idpk] [int] IDENTITY(1,1) NOT NULL,
	[college_idfk] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCourses] ON
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (1, 1, N'Bachelor of Arts in Communication Arts')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (2, 1, N'Bachelor of Arts in English')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (3, 1, N' Bachelor of Science in Criminology	 	')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (6, 2, N'Bachelor of Physical Education')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (7, 3, N'Bachelor of Science in Accountancy')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (8, 3, N'Bachelor of Science in Accounting Technology')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (9, 3, N'Bachelor of Science in Entrepreneurship')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (10, 3, N'Bachelor of Science in Hotel and Restaurant Management')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (11, 3, N'Bachelor of Science in Business Administration')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (12, 4, N'Bachelor of Science in Civil Engineering')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (13, 4, N'Bachelor of Science in Electrical Engineering')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (14, 4, N'Bachelor of Science in Electronics Engineering')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (15, 4, N'Bachelor of Science in Industrial Engineering')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (16, 4, N'Bachelor of Science in Mechanical Engineering')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (17, 5, N'Bachelor of Science in Computer Science')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (19, 5, N'Bachelor of Science in Information Systems')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (20, 5, N'Bachelor of Science in Information Technology')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (21, 5, N'*Associate in Information Technology')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (22, 6, N'Bachelor in Public Administration')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (23, 7, N'Bachelor of Science in Chemistry')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (24, 8, N'Bachelor of Science in Nursing')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (27, 9, N'Bachelor of Science in Elementary Education Specialized in General Curriculum')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (28, 9, N'Bachelor of Science in Elementary Education Specialized in Pre-School Education')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (29, 9, N'Bachelor of Science in Industrial Education Major in Industrial Arts')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (31, 9, N'Bachelor of Science in Secondary Education')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (32, 9, N'Technology and Livelihood Education')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (33, 10, N'Bachelor of Fine Arts major in Advertising')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (34, 10, N'Bachelor of Science in Architecture')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (35, 11, N'Bachelor of Science in Nutrition and Food Technology')
INSERT [dbo].[tblCourses] ([course_idpk], [college_idfk], [description]) VALUES (36, 11, N'Bachelor of Science in Industrial Technology')
SET IDENTITY_INSERT [dbo].[tblCourses] OFF
/****** Object:  Table [dbo].[tblTokens]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTokens](
	[token_idpk] [int] IDENTITY(1,1) NOT NULL,
	[college_idfk] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTokens] ON
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (1, 2, N'R5JTO', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (2, 2, N'krw5N', 1)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (3, 2, N'3any2', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (4, 2, N'Mdm2H', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (5, 2, N'E8w71', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (6, 2, N'14x4n', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (7, 2, N'l66aK', 1)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (8, 2, N'V0f1r', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (9, 2, N'y3sC9', 1)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (10, 2, N't3o55', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (11, 2, N'k314H', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (12, 2, N'135g2', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (13, 2, N'l26dk', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (14, 2, N'8n85q', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (15, 2, N'dWV71', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (16, 2, N'byT19', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (17, 2, N'7BgxX', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (18, 2, N'R48J5', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (19, 2, N'pG53k', 0)
INSERT [dbo].[tblTokens] ([token_idpk], [college_idfk], [description], [status]) VALUES (20, 2, N'8R6n8', 0)
SET IDENTITY_INSERT [dbo].[tblTokens] OFF
/****** Object:  Table [dbo].[tblSms]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSms](
	[sms_idpk] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pollsoption_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pollsoption_tbl](
	[pollsoption_idpk] [int] IDENTITY(1,1) NOT NULL,
	[polls_idfk] [int] NOT NULL,
	[option_description] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[pollsoption_tbl] ON
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (1, 1, N'January')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (2, 1, N'February')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (3, 1, N'March')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (4, 2, N'Asa')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (5, 6, N'sasa')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (6, 7, N'fdf')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (7, 10, N'dd')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (8, 1, N'January')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (9, 1, N'February')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (10, 1, N'March')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (11, 1, N'April')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (12, 1, N'May')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (13, 1, N'June')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (14, 1, N'July')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (15, 1, N'August')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (16, 1, N'September')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (17, 1, N'October')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (18, 1, N'November')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (19, 1, N'December')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (20, 2, N'age')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (21, 2, N'sex')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (22, 2, N'location')
INSERT [dbo].[pollsoption_tbl] ([pollsoption_idpk], [polls_idfk], [option_description]) VALUES (23, 3, N'rttrt')
SET IDENTITY_INSERT [dbo].[pollsoption_tbl] OFF
/****** Object:  Table [dbo].[surveyoption_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveyoption_tbl](
	[surveyoptions_idpk] [int] IDENTITY(1,1) NOT NULL,
	[surveys_idfk] [int] NOT NULL,
	[surveyquestion_idfk] [int] NOT NULL,
	[survey_option] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[surveyoption_tbl] ON
INSERT [dbo].[surveyoption_tbl] ([surveyoptions_idpk], [surveys_idfk], [surveyquestion_idfk], [survey_option]) VALUES (1, 1, 1, N'Yes')
INSERT [dbo].[surveyoption_tbl] ([surveyoptions_idpk], [surveys_idfk], [surveyquestion_idfk], [survey_option]) VALUES (2, 1, 1, N'No')
SET IDENTITY_INSERT [dbo].[surveyoption_tbl] OFF
/****** Object:  Table [dbo].[surveyquestions_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveyquestions_tbl](
	[surveyquestion_idpk] [int] IDENTITY(1,1) NOT NULL,
	[survey_idfk] [int] NOT NULL,
	[survey_question] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[surveyquestions_tbl] ON
INSERT [dbo].[surveyquestions_tbl] ([surveyquestion_idpk], [survey_idfk], [survey_question]) VALUES (1, 1, N'rgfgfg')
SET IDENTITY_INSERT [dbo].[surveyquestions_tbl] OFF
/****** Object:  Table [dbo].[surveys_tbl]    Script Date: 02/08/2015 00:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveys_tbl](
	[survey_idpk] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[surveys_tbl] ON
INSERT [dbo].[surveys_tbl] ([survey_idpk], [description], [status]) VALUES (1, N'Survey 1', 0)
SET IDENTITY_INSERT [dbo].[surveys_tbl] OFF
/****** Object:  Default [DF_tblEmployment_q1]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q1]  DEFAULT ('N/A') FOR [q1]
GO
/****** Object:  Default [DF_tblEmployment_q2]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q2]  DEFAULT ('N/A') FOR [q2]
GO
/****** Object:  Default [DF_tblEmployment_q3]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q3]  DEFAULT ('N/A') FOR [q3]
GO
/****** Object:  Default [DF_tblEmployment_q4]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q4]  DEFAULT ('N/A') FOR [q4]
GO
/****** Object:  Default [DF_tblEmployment_q5]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q5]  DEFAULT ('N/A') FOR [q5]
GO
/****** Object:  Default [DF_tblEmployment_q6]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q6]  DEFAULT ('N/A') FOR [q6]
GO
/****** Object:  Default [DF_tblEmployment_q7]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q7]  DEFAULT ('N/A') FOR [q7]
GO
/****** Object:  Default [DF_tblEmployment_unemployed_status]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_unemployed_status]  DEFAULT ('N/A') FOR [unemployed_status]
GO
/****** Object:  Default [DF_tblEmployment_selfemployed_status]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_selfemployed_status]  DEFAULT ('N/A') FOR [selfemployed_status]
GO
/****** Object:  Default [DF_tblEmployment_further_study]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_further_study]  DEFAULT ('N/A') FOR [further_study]
GO
/****** Object:  Default [DF_tblEmployment_highest_educ_attainment]    Script Date: 02/08/2015 00:33:54 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_highest_educ_attainment]  DEFAULT ('N/A') FOR [highest_educ_attainment]
GO

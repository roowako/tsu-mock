USE [master]
GO
/****** Object:  Database [tsuat_db]    Script Date: 02/06/2015 03:01:49 ******/
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
/****** Object:  Table [dbo].[surveydata_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[announcements_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[sms_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblGraduates]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblColleges]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[pollsdata_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[coordinatoraccount_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblEmployment]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[polls_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblCourses]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblTokens]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[tblSMS]    Script Date: 02/06/2015 03:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSMS](
	[sms_idpk] [int] NOT NULL,
	[recipient] [nvarchar](max) NOT NULL,
	[message] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pollsoption_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[surveyoption_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[surveyquestions_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Table [dbo].[surveys_tbl]    Script Date: 02/06/2015 03:01:51 ******/
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
/****** Object:  Default [DF_tblEmployment_q1]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q1]  DEFAULT ('N/A') FOR [q1]
GO
/****** Object:  Default [DF_tblEmployment_q2]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q2]  DEFAULT ('N/A') FOR [q2]
GO
/****** Object:  Default [DF_tblEmployment_q3]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q3]  DEFAULT ('N/A') FOR [q3]
GO
/****** Object:  Default [DF_tblEmployment_q4]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q4]  DEFAULT ('N/A') FOR [q4]
GO
/****** Object:  Default [DF_tblEmployment_q5]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q5]  DEFAULT ('N/A') FOR [q5]
GO
/****** Object:  Default [DF_tblEmployment_q6]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q6]  DEFAULT ('N/A') FOR [q6]
GO
/****** Object:  Default [DF_tblEmployment_q7]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_q7]  DEFAULT ('N/A') FOR [q7]
GO
/****** Object:  Default [DF_tblEmployment_unemployed_status]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_unemployed_status]  DEFAULT ('N/A') FOR [unemployed_status]
GO
/****** Object:  Default [DF_tblEmployment_selfemployed_status]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_selfemployed_status]  DEFAULT ('N/A') FOR [selfemployed_status]
GO
/****** Object:  Default [DF_tblEmployment_further_study]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_further_study]  DEFAULT ('N/A') FOR [further_study]
GO
/****** Object:  Default [DF_tblEmployment_highest_educ_attainment]    Script Date: 02/06/2015 03:01:51 ******/
ALTER TABLE [dbo].[tblEmployment] ADD  CONSTRAINT [DF_tblEmployment_highest_educ_attainment]  DEFAULT ('N/A') FOR [highest_educ_attainment]
GO

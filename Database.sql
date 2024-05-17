USE [master]
GO
/****** Object:  Database [Insurance_Sokxay]    Script Date: 3/15/2021 9:40:02 PM ******/
CREATE DATABASE [Insurance_Sokxay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Insurance_Sokxay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Insurance_Sokxay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Insurance_Sokxay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Insurance_Sokxay_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Insurance_Sokxay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Insurance_Sokxay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Insurance_Sokxay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Insurance_Sokxay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Insurance_Sokxay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Insurance_Sokxay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Insurance_Sokxay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET RECOVERY FULL 
GO
ALTER DATABASE [Insurance_Sokxay] SET  MULTI_USER 
GO
ALTER DATABASE [Insurance_Sokxay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Insurance_Sokxay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Insurance_Sokxay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Insurance_Sokxay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Insurance_Sokxay] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Insurance_Sokxay', N'ON'
GO
ALTER DATABASE [Insurance_Sokxay] SET QUERY_STORE = OFF
GO
USE [Insurance_Sokxay]
GO
/****** Object:  User [IIS APPPOOL\Test]    Script Date: 3/15/2021 9:40:02 PM ******/
CREATE USER [IIS APPPOOL\Test] FOR LOGIN [IIS APPPOOL\Test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\Test]
GO
/****** Object:  Table [dbo].[agency]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency](
	[id] [int] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[agency_name] [nvarchar](450) NOT NULL,
	[description] [ntext] NOT NULL,
	[fk_commission_id] [int] NOT NULL,
	[rate] [decimal](18, 2) NOT NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_agency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreement_laon]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreement_laon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agreement_no] [nvarchar](20) NOT NULL,
	[ref_no] [int] NOT NULL,
	[contract_no] [nvarchar](50) NULL,
	[period_year] [int] NOT NULL,
	[period_month] [int] NOT NULL,
	[effect_date] [date] NOT NULL,
	[expired_date] [date] NOT NULL,
	[isgroup] [bit] NOT NULL,
	[laon_amount] [decimal](18, 2) NOT NULL,
	[netpremium] [decimal](18, 2) NOT NULL,
	[vat] [decimal](18, 2) NOT NULL,
	[registry_fee] [decimal](18, 2) NOT NULL,
	[total_amount] [decimal](18, 2) NOT NULL,
	[commission] [numeric](3, 2) NOT NULL,
	[fk_usergroup_id] [int] NOT NULL,
	[issuedby] [int] NOT NULL,
	[check_agreement] [bit] NOT NULL,
	[check_agreementby] [int] NOT NULL,
	[approve_date] [datetime] NOT NULL,
	[approveby] [int] NOT NULL,
	[agreementstate] [int] NOT NULL,
	[paid] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_agreement_laon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreement_laon_detail]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreement_laon_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_agreement_id] [int] NOT NULL,
	[fk_people_id] [int] NOT NULL,
	[fk_benifit_id] [int] NOT NULL,
	[age] [int] NOT NULL,
	[is_cliam] [bit] NOT NULL,
	[laon_amount] [decimal](18, 2) NOT NULL,
	[netpremium] [decimal](18, 2) NOT NULL,
	[vat] [decimal](18, 2) NOT NULL,
	[registry_fee] [decimal](18, 2) NOT NULL,
	[total_amount] [decimal](18, 2) NOT NULL,
	[perfectliy] [bit] NOT NULL,
	[health] [nvarchar](250) NOT NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_agreement_laon_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[beneficiary]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[beneficiary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](250) NULL,
	[lastname] [nvarchar](250) NULL,
	[age] [int] NULL,
	[relationship] [nvarchar](250) NULL,
	[phone] [nvarchar](50) NULL,
	[benefit] [numeric](18, 0) NULL,
	[fk_agreement_detail_id] [int] NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
 CONSTRAINT [PK_benefit_credotlife] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliams]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliam_date] [datetime] NULL,
	[fk_coverage_condition_id] [int] NULL,
	[fk_agreement_id] [int] NULL,
	[fk_agreement_detail_id] [int] NULL,
	[rate] [decimal](3, 2) NULL,
	[ciam_amount] [decimal](18, 2) NULL,
	[approveby] [int] NULL,
	[approvedate] [datetime] NULL,
 CONSTRAINT [PK_cliams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commission]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_product_id] [int] NULL,
	[fk_people_id] [int] NULL,
	[value] [decimal](5, 2) NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
 CONSTRAINT [PK_commission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coverage_conditions]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coverage_conditions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[fk_plan_id] [int] NULL,
	[description] [ntext] NULL,
	[rate] [decimal](18, 2) NULL,
	[fk_producttype_id] [int] NULL,
	[fk_covertype_id] [int] NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_coverage_conditions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coverage_type]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coverage_type](
	[id] [int] NOT NULL,
	[covertypename] [nvarchar](250) NULL,
 CONSTRAINT [PK_coverage_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [int] NOT NULL,
	[fk_province_id] [int] NOT NULL,
	[engname] [nvarchar](255) NOT NULL,
	[laoname] [nvarchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[fk_users_id] [int] NOT NULL,
	[dels] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_provincedistrict_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[health_creditlife]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[health_creditlife](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perfectliy] [bit] NOT NULL,
	[remark] [ntext] NULL,
	[fk_people_id] [int] NOT NULL,
	[fk_agreement_laon_detail_id] [int] NOT NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
 CONSTRAINT [PK_health_creditlife] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modules]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modules](
	[id] [int] NOT NULL,
	[modulename] [nvarchar](250) NULL,
	[moduletype] [int] NULL,
 CONSTRAINT [PK_modules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[number_control]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[number_control](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[fk_usergroup_id] [int] NULL,
	[run_number] [int] NULL,
 CONSTRAINT [PK_number_control] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peoples]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peoples](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](255) NOT NULL,
	[lastname] [nvarchar](255) NOT NULL,
	[gender] [int] NOT NULL,
	[dateofbirth] [datetime] NOT NULL,
	[cardno] [nvarchar](50) NOT NULL,
	[passportno] [nvarchar](50) NOT NULL,
	[house_hold_no] [nvarchar](20) NOT NULL,
	[issued_date] [datetime] NOT NULL,
	[issuedby] [nvarchar](450) NOT NULL,
	[nationality] [nvarchar](250) NOT NULL,
	[job] [nvarchar](250) NOT NULL,
	[phonenumber] [nvarchar](255) NOT NULL,
	[mobilenumber] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[cur_address] [nvarchar](255) NOT NULL,
	[village] [nvarchar](250) NOT NULL,
	[fk_district_id] [int] NOT NULL,
	[fk_province_id] [int] NOT NULL,
	[zip] [nvarchar](255) NOT NULL,
	[country] [nvarchar](255) NOT NULL,
	[p_status] [bit] NOT NULL,
	[fk_users_id] [int] NOT NULL,
	[dels] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
 CONSTRAINT [PK_people_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plans]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[planname] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_plans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[productname] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[fk_producttype_id] [int] NULL,
	[fk_plan_id] [int] NULL,
	[rate] [decimal](18, 2) NULL,
	[additional_min] [int] NULL,
	[additional_max] [int] NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producttype]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producttype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[producttypename] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_producttype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[id] [int] NOT NULL,
	[engname] [nvarchar](255) NOT NULL,
	[laoname] [nvarchar](255) NOT NULL,
	[shortcode] [nvarchar](20) NOT NULL,
	[status] [bit] NOT NULL,
	[fk_users_id] [int] NOT NULL,
	[dels] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_province_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_product_id] [int] NULL,
	[rate] [decimal](18, 2) NULL,
	[fk_level_id] [int] NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_recipe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipelevel]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipelevel](
	[id] [int] NOT NULL,
	[recipe_level] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_recipelevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registryfee]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registryfee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[registryname] [nvarchar](250) NULL,
	[value] [decimal](18, 0) NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [nchar](10) NOT NULL,
 CONSTRAINT [PK_registryfee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permission]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_module_id] [int] NULL,
	[modulename] [nvarchar](250) NULL,
	[fk_role_id] [int] NULL,
	[isview] [bit] NOT NULL,
	[isadd] [bit] NOT NULL,
	[isupdate] [bit] NOT NULL,
	[isdelete] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
 CONSTRAINT [PK_role_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usergroup]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroup](
	[id] [int] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[user_group] [nvarchar](250) NOT NULL,
	[fk_agency_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[del] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
	[createby] [int] NOT NULL,
	[updateby] [int] NOT NULL,
 CONSTRAINT [PK_usergroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(590,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[userid] [nvarchar](25) NOT NULL,
	[displayname] [nvarchar](200) NULL,
	[img] [nvarchar](1000) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[pwdresetdate] [datetime2](0) NULL,
	[access_type] [nvarchar](10) NULL,
	[fk_people_id] [int] NULL,
	[fk_usersrole_id] [int] NULL,
	[group_id] [int] NULL,
	[fk_level_id] [int] NULL,
	[language_code] [nvarchar](7) NULL,
	[address] [nvarchar](2000) NULL,
	[zipcode] [nvarchar](7) NULL,
	[country] [nvarchar](70) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](15) NOT NULL,
	[status] [bit] NOT NULL,
	[islogin] [datetime2](0) NOT NULL,
	[islogout] [datetime2](0) NOT NULL,
	[dels] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersrole]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersrole](
	[id] [int] IDENTITY(91,1) NOT NULL,
	[rolename] [varchar](500) NOT NULL,
	[login_type] [varchar](10) NOT NULL,
	[status] [bit] NOT NULL,
	[fk_users_id] [int] NOT NULL,
	[dels] [bit] NOT NULL,
	[cdate] [datetime] NOT NULL,
	[mdate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_usersrole_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_type]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vehicletype] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_vehicle_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_using_type]    Script Date: 3/15/2021 9:40:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_using_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usingtype] [nvarchar](250) NULL,
	[status] [bit] NULL,
	[del] [bit] NULL,
	[cdate] [datetime] NULL,
	[mdate] [datetime] NULL,
	[createby] [int] NULL,
	[updateby] [int] NULL,
 CONSTRAINT [PK_vehicle_using_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[agency] ([id], [code], [agency_name], [description], [fk_commission_id], [rate], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'001', N'ບໍລິສັດ ໂຊກໄຊ ປະກັນໄພ ຈຳກັດ  Sokxay Insurance Co.m Ltd', N' ', 1, CAST(30.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[agreement_laon] ON 
GO
INSERT [dbo].[agreement_laon] ([id], [agreement_no], [ref_no], [contract_no], [period_year], [period_month], [effect_date], [expired_date], [isgroup], [laon_amount], [netpremium], [vat], [registry_fee], [total_amount], [commission], [fk_usergroup_id], [issuedby], [check_agreement], [check_agreementby], [approve_date], [approveby], [agreementstate], [paid], [status], [del], [cdate], [mdate], [updateby]) VALUES (24, N'CLI-001-0000044', 0, N'', 1, 0, CAST(N'2021-03-01' AS Date), CAST(N'2022-02-28' AS Date), 0, CAST(10000000.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(48500.00 AS Decimal(18, 2)), CAST(0.00 AS Numeric(3, 2)), 1, 594, 0, 0, CAST(N'2021-03-01T14:58:05.433' AS DateTime), 0, 1, 0, 0, 0, CAST(N'2021-03-01T14:58:05.433' AS DateTime), CAST(N'2021-03-01T15:13:46.923' AS DateTime), 594)
GO
INSERT [dbo].[agreement_laon] ([id], [agreement_no], [ref_no], [contract_no], [period_year], [period_month], [effect_date], [expired_date], [isgroup], [laon_amount], [netpremium], [vat], [registry_fee], [total_amount], [commission], [fk_usergroup_id], [issuedby], [check_agreement], [check_agreementby], [approve_date], [approveby], [agreementstate], [paid], [status], [del], [cdate], [mdate], [updateby]) VALUES (29, N'CLI-001-0000050', 0, N'', 1, 0, CAST(N'2021-03-01' AS Date), CAST(N'2022-02-28' AS Date), 1, CAST(90000000.00 AS Decimal(18, 2)), CAST(314999.99 AS Decimal(18, 2)), CAST(31499.99 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(376499.98 AS Decimal(18, 2)), CAST(0.00 AS Numeric(3, 2)), 1, 594, 0, 0, CAST(N'2021-03-01T15:37:15.440' AS DateTime), 0, 1, 0, 0, 0, CAST(N'2021-03-01T15:37:15.440' AS DateTime), CAST(N'2021-03-01T16:44:28.207' AS DateTime), 594)
GO
SET IDENTITY_INSERT [dbo].[agreement_laon] OFF
GO
SET IDENTITY_INSERT [dbo].[agreement_laon_detail] ON 
GO
INSERT [dbo].[agreement_laon_detail] ([id], [fk_agreement_id], [fk_people_id], [fk_benifit_id], [age], [is_cliam], [laon_amount], [netpremium], [vat], [registry_fee], [total_amount], [perfectliy], [health], [status], [del], [cdate], [mdate], [updateby]) VALUES (5, 29, 62, 3, 26, 0, CAST(35000000.00 AS Decimal(18, 2)), CAST(122499.99 AS Decimal(18, 2)), CAST(12249.99 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(144750.00 AS Decimal(18, 2)), 0, N'', 0, 0, CAST(N'2021-03-01T08:36:43.000' AS DateTime), CAST(N'2021-03-01T16:44:28.237' AS DateTime), 0)
GO
INSERT [dbo].[agreement_laon_detail] ([id], [fk_agreement_id], [fk_people_id], [fk_benifit_id], [age], [is_cliam], [laon_amount], [netpremium], [vat], [registry_fee], [total_amount], [perfectliy], [health], [status], [del], [cdate], [mdate], [updateby]) VALUES (6, 29, 64, 5, 27, 0, CAST(40000000.00 AS Decimal(18, 2)), CAST(140000.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(164000.00 AS Decimal(18, 2)), 0, N'', 0, 0, CAST(N'2021-03-01T09:09:31.363' AS DateTime), CAST(N'2021-03-01T16:44:28.237' AS DateTime), 0)
GO
INSERT [dbo].[agreement_laon_detail] ([id], [fk_agreement_id], [fk_people_id], [fk_benifit_id], [age], [is_cliam], [laon_amount], [netpremium], [vat], [registry_fee], [total_amount], [perfectliy], [health], [status], [del], [cdate], [mdate], [updateby]) VALUES (7, 29, 65, 6, 39, 0, CAST(15000000.00 AS Decimal(18, 2)), CAST(52499.99 AS Decimal(18, 2)), CAST(5249.99 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(67750.00 AS Decimal(18, 2)), 0, N'', 0, 0, CAST(N'2021-03-01T09:43:53.390' AS DateTime), CAST(N'2021-03-01T16:44:28.237' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[agreement_laon_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[beneficiary] ON 
GO
INSERT [dbo].[beneficiary] ([id], [firstname], [lastname], [age], [relationship], [phone], [benefit], [fk_agreement_detail_id], [status], [del], [cdate], [mdate], [createby]) VALUES (2, NULL, NULL, 0, N'', N'', NULL, 0, 0, 0, CAST(N'2021-03-01T14:58:05.437' AS DateTime), CAST(N'2021-03-01T14:58:05.437' AS DateTime), 0)
GO
INSERT [dbo].[beneficiary] ([id], [firstname], [lastname], [age], [relationship], [phone], [benefit], [fk_agreement_detail_id], [status], [del], [cdate], [mdate], [createby]) VALUES (3, NULL, NULL, 0, N'', N'', NULL, 0, 0, 0, CAST(N'2021-03-01T15:37:15.440' AS DateTime), CAST(N'2021-03-01T15:37:15.440' AS DateTime), 0)
GO
INSERT [dbo].[beneficiary] ([id], [firstname], [lastname], [age], [relationship], [phone], [benefit], [fk_agreement_detail_id], [status], [del], [cdate], [mdate], [createby]) VALUES (5, NULL, NULL, 0, N'', N'', NULL, 0, 0, 0, CAST(N'2021-03-01T16:30:07.900' AS DateTime), CAST(N'2021-03-01T16:30:07.900' AS DateTime), 0)
GO
INSERT [dbo].[beneficiary] ([id], [firstname], [lastname], [age], [relationship], [phone], [benefit], [fk_agreement_detail_id], [status], [del], [cdate], [mdate], [createby]) VALUES (6, NULL, NULL, 0, N'', N'', NULL, 0, 0, 0, CAST(N'2021-03-01T16:44:28.207' AS DateTime), CAST(N'2021-03-01T16:44:28.207' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[beneficiary] OFF
GO
SET IDENTITY_INSERT [dbo].[commission] ON 
GO
INSERT [dbo].[commission] ([id], [fk_product_id], [fk_people_id], [value], [status], [del], [cdate], [mdate], [createby]) VALUES (1, 1, 2, CAST(30.00 AS Decimal(5, 2)), 1, 1, CAST(N'2020-10-17T09:38:39.880' AS DateTime), CAST(N'2020-10-17T09:38:39.880' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[commission] OFF
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (1, 1, N'Chanthabuly District', N'ເມືອງຈັນທະບູລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (2, 1, N'Sikhottabong District', N'ເມືອງສີໂຄດຕະບອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (3, 1, N'Xaysetha District', N'ເມືອງໄຊເສດຖາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (4, 1, N'Sisattanak District', N'ເມືອງສີສັດຕະນາກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (5, 1, N'Naxaithong District', N'ເມືອງນາຊາຍທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (6, 1, N'Xaythany District', N'ເມືອງໄຊທານີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (7, 1, N'Hadxayfong District', N'ເມືອງຫາດຊາຍຟອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (8, 1, N'Sangthong District', N'ເມືອງສັງທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (9, 1, N'Mayparkngum District', N'ເມືອງປາກງື່ມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (10, 2, N'Phongsaly District', N'ເມືອງຜົ້ງສາລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (11, 2, N'May District', N'ເມືອງໃໝ່', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (12, 2, N'Khoua District', N'ເມືອງຂວາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (13, 2, N'Samphanh District', N'ເມືອງສຳພັນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (14, 2, N'Boun Neua District', N'ເມືອງບຸນເໜືອ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (15, 2, N'Yot Ou District', N'ເມືອງຍອດອູ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (16, 2, N'Boun Tay District', N'ເມືອງບຸນໃຕ້', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (17, 3, N'Namtha District', N'ເມືອງຫຼວງນໍ້າທາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (18, 3, N'Sing District', N'ເມືອງສີງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (19, 3, N'Long District', N'ເມືອງລອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (20, 3, N'Viengphoukha District', N'ເມືອງວຽງພູຄາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (21, 3, N'Na Le District', N'ເມືອງນາແລ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (22, 4, N'Xay District', N'ເມືອງໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (23, 4, N'La District', N'ເມືອງຫຼາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (24, 4, N'Na Mo District', N'ເມືອງນາໝໍ້', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (25, 4, N'Nga District', N'ເມືອງງາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (26, 4, N'Beng District', N'ເມືອງແບ່ງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (27, 4, N'Houne District', N'ເມືອງຮຸນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (28, 4, N'Pak Beng District', N'ເມືອງປາກແບ່ງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (29, 5, N'Houay Xay District', N'ເມືອງຫ້ວຍຊາຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (30, 5, N'Ton Pheung District', N'ເມືອງຕົ້ນເຜິ້ງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (31, 5, N'Meung District', N'ເມືອງເມິງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (32, 5, N'Pha Oudom District', N'ເມືອງຜາອຸດົມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (33, 5, N'Pak Tha District', N'ເມືອງປາກທາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (34, 5, N'Nam Nhou Special District', N'ນາມ Nhou ຈໍາພິເສດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (35, 6, N'Luang Prabang District', N'ເມືອງຫຼວງພະບາງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (36, 6, N'Xiengngeun District', N'ເມືອງຊຽງເງິນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (37, 6, N'Nane District', N'ເມືອງນານ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (38, 6, N'Pak Ou District', N'ເມືອງປາກອູ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (39, 6, N'Nam Bak District', N'ເມືອງນ້ຳບາກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (40, 6, N'Ngoy District', N'ເມືອງງອຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (41, 6, N'Pak Seng District', N'ເມືອງປາກແຊງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (42, 6, N'Phonxay District', N'ເມືອງໂພນໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (43, 6, N'Chomphet District', N'ເມືອງຈອມເພັດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (44, 6, N'Viengkham District', N'ເມືອງວຽງຄຳ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (45, 6, N'Phoukhoune District', N'ເມືອງພູຄູນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (46, 6, N'Phonthong District', N'ເມືອງໂພນທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (47, 7, N'Xam Neua District', N'ເມືອງຊຳເໜືອ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (48, 7, N'Xiengkho District', N'ເມືອງຊຽງຄໍ້', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (49, 7, N'Hiam District', N'ເມືອງວຽງທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (50, 7, N'Viengxay District', N'ເມືອງວຽງໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (51, 7, N'Houameuang District', N'ເມືອງຫົວເມືອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (52, 7, N'Samtay District', N'ເມືອງຊຳໃຕ້', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (53, 7, N'Sop Bao District', N'ເມືອງສົບເບົາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (54, 7, N'Et District', N'ເມືອງແອດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (55, 7, N'Kone District', N'ເມືອງກອັນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (56, 7, N'Xon District', N'ເມືອງຊ່ອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (57, 8, N'Sainyabuli District', N'ເມືອງໄຊຍະບູລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (58, 8, N'Khop District', N'ເມືອງຄອບ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (59, 8, N'Hongsa District', N'ເມືອງຫົງສາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (60, 8, N'Ngeun District', N'ເມືອງເງິນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (61, 8, N'Xienghone District', N'ເມືອງຊຽງຮ່ອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (62, 8, N'Phiang District', N'ເມືອງພຽງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (63, 8, N'Parklai District', N'ເມືອງປາກລາຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (64, 8, N'Kenethao District', N'ເມືອງແກ່ນທ້າວ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (65, 8, N'Botene District', N'ເມືອງບໍ່ແຕນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (66, 8, N'Thongmyxay District', N'ເມືອງທົ່ງມີໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (67, 8, N'Xaisathan District', N'ເມືອງໄຊສະຖານ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (68, 9, N'Pek District', N'ເມືອງແປກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (69, 9, N'Kham District', N'ເມືອງຄຳ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (70, 9, N'Nong Het District', N'ເມືອງໜອງແຮດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (71, 9, N'Khoune District', N'ເມືອງຄູນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (72, 9, N'Mok May District', N'ເມືອງໝອກໃໝ່', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (73, 9, N'Phou Kout District', N'ເມືອງພູກູດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (74, 9, N'Phaxay District', N'ເມືອງຜາໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (75, 10, N'Phonhong District', N'ເມືອງໂພນໂຮງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (76, 10, N'Thoulakhom District', N'ເມືອງທຸລະຄົມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (77, 10, N'Keo Oudom District', N'ເມືອງແກ້ວອຸດົມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (78, 10, N'Kasy District', N'ເມືອງກາສີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (79, 10, N'Vangvieng District', N'ເມືອງວັງວຽງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (80, 10, N'Feuang District', N'ເມືອງເຟືອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (81, 10, N'Xanakharm District', N'ເມືອງຊະນະຄາມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (82, 10, N'Mad District', N'ເມືອງແມດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (83, 10, N'Viengkham District', N'ເມືອງວຽງຄໍາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (84, 10, N'Hinhurp District', N'ເມືອງຫີນເຫີບ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (85, 10, N'Meun District', N'ໝື່ນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (86, 11, N'Paksane District', N'ເມືອງປາກຊັນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (87, 11, N'Thaphabat District', N'ເມືອງທ່າພະບາດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (88, 11, N'Pakkading District', N'ເມືອງປາກກະດິງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (89, 11, N'Borikhane District', N'ເມືອງບໍລິຄັນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (90, 11, N'Khamkeut District', N'ເມືອງຄຳເກີດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (91, 11, N'Viengthong District', N'ເມືອງວຽງທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (92, 12, N'Thakhek District', N'ເມືອງທ່າແຂກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (93, 12, N'Mahaxay District', N'ເມືອງມະຫາໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (94, 12, N'Nong Bok District', N'ເມືອງໜອງບົກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (95, 12, N'Hineboune District', N'ເມືອງຫີນບູນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (96, 12, N'Yommalath District', N'ເມືອງຍົມມະລາດ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (97, 12, N'Boualapha District', N'ເມືອງບົວລະພາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (98, 12, N'Nakai District', N'ມືອງນາກາຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (99, 12, N'Sebangphay District', N'ເມືອງເຊບັ້ງໄຟ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (100, 12, N'Saybouathong District', N'ເມືອງໄຊບົວທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (101, 12, N'Kounkham District', N'ເມືອງຄູນຄຳ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (102, 13, N'Kaysone Phomvihane District', N'ເມືອງໄກສອນ ພົມວິຫານ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (103, 13, N'Outhoumphone District', N'ເມືອງອຸທຸມພອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (104, 13, N'Atsaphangthong District', N'ເມືອງອາດສະພັງທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (105, 13, N'Phine District', N'ເມືອງພີນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (106, 13, N'Seponh District', N'ເມືອງເຊໂປນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (107, 13, N'Nong District', N'ເມືອງນອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (108, 13, N'Thapangthong District', N'ເມືອງທ່າປາງທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (109, 13, N'Songkhone District', N'ເມືອງສອງຄອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (110, 13, N'Champhone District', N'ເມືອງຈຳພອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (111, 13, N'Khanthaboury District', N'ເມືອງຊົນນະບູລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (112, 13, N'Xayboury District', N'ເມືອງໄຊບູລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (113, 13, N'Viraboury District', N'ເມືອງວີລະບຸລີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (114, 13, N'Assaphone District', N'ເມືອງອາດສະພອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (115, 13, N'Xonboury District', N'ເມືອງໄຊພູທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (116, 13, N'Thaphalanxay District', N'ເມືອງພະລານໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (117, 14, N'Saravane District', N'ເມືອງສາລະວັນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (118, 14, N'Ta Oy District', N'ເມືອງຕະໂອ້ຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (119, 14, N'Toumlane District', N'ເມືອງຕຸ້ມລານ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (120, 14, N'Lakhonepheng District', N'ເມືອງລະຄອນເພັງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (121, 14, N'Vapy District', N'ເມືອງວາປີ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (122, 14, N'Khongsedone District', N'ເມືອງຄົງເຊໂດນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (123, 14, N'Lao Ngam District', N'ເມືອງເລົ່າງາມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (124, 14, N'Sa Mouay District', N'ເມືອງສະມ້ວຍ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (125, 15, N'La Mam District', N'ເມືອງລະມາມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (126, 15, N'Kaleum District', N'ເມືອງກະເລິມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (127, 15, N'Dak Cheung District', N'ເມືອງດາກຈຶງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (128, 15, N'Tha Teng District', N'ເມືອງທ່າແຕງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (129, 16, N'Pak Sé District', N'ເມືອງປາກເຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (130, 16, N'Sanasomboun District', N'ເມືອງຊະນະສົມບູນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (131, 16, N'Batiengchaleunsouk District', N'ເມືອງບາຈຽງຈະເລີນສຸກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (132, 16, N'Paksong District', N'ເມືອງປາກຊ່ອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (133, 16, N'Pathouphone District', N'ເມືອງປະທຸມພອນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (134, 16, N'Phonthong District', N'ເມືອງໂພນທອງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (135, 16, N'Champassack District', N'ເມືອງຈຳປາສັກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (136, 16, N'Soukhoumma District', N'ເມືອງສຸຂຸມາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (137, 16, N'Mounlapamok District', N'ເມືອງມູນລະປະໂມກ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (138, 16, N'Khong District', N'ເມືອງໂຂງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (139, 17, N'Saysetha District', N'ເມືອງໄຊເຊດຖາ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (140, 17, N'Samakkhixay District', N'ເມືອງສາມັກຄີໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (141, 17, N'Sanamxay District', N'ເມືອງສະໜາມໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (142, 17, N'Sanxay District', N'ເມືອງສານໄຊ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (143, 17, N'Phouvong District', N'ເມືອງພູວົງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (144, 18, N'Anouvong District', N'ເມືອງອະນຸວົງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (145, 18, N'Longchaeng District', N'ເມືອງລ້ອງແຈ້ງ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (146, 18, N'Longxan District', N'ເມືອງລ້ອງຊານ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (147, 18, N'Hom District', N'ເມືອງເມືອງໝື່ນ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[district] ([id], [fk_province_id], [engname], [laoname], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (148, 18, N'Thathom District', N'ເມືອງທ່າໂທມ', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[number_control] ON 
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (1, N'CLI', 1, 1)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (2, N'CLI', 1, 2)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (3, N'CLI', 1, 3)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (4, N'CLI', 1, 4)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (5, N'CLI', 1, 5)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (6, N'CLI', 1, 6)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (7, N'CLI', 1, 7)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (8, N'CLI', 1, 8)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (9, N'CLI', 2, 1)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (10, N'CLI', 2, 2)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (11, N'CLI', 2, 3)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (12, N'CLI', 1, 9)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (13, N'CLI', 1, 10)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (14, N'CLI', 1, 11)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (15, N'CLI', 1, 12)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (16, N'CLI', 1, 13)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (17, N'CLI', 1, 14)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (18, N'CLI', 1, 15)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (19, N'CLI', 1, 16)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (20, N'CLI', 1, 17)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (21, N'CLI', 1, 18)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (22, N'CLI', 1, 19)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (23, N'CLI', 1, 20)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (24, N'CLI', 1, 21)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (25, N'CLI', 1, 22)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (26, N'CLI', 1, 23)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (27, N'CLI', 1, 24)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (28, N'CLI', 1, 25)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (29, N'CLI', 1, 26)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (30, N'CLI', 1, 27)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (31, N'CLI', 1, 28)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (32, N'CLI', 1, 29)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (33, N'CLI', 1, 30)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (34, N'CLI', 1, 31)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (35, N'CLI', 1, 32)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (36, N'CLI', 1, 33)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (37, N'CLI', 1, 34)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (38, N'CLI', 1, 35)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (39, N'CLI', 1, 36)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (40, N'CLI', 1, 37)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (41, N'CLI', 1, 38)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (42, N'CLI', 1, 39)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (43, N'CLI', 1, 40)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (44, N'CLI', 1, 41)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (45, N'CLI', 1, 42)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (46, N'CLI', 1, 43)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (47, N'CLI', 1, 44)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (48, N'CLI', 1, 45)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (49, N'CLI', 1, 46)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (50, N'CLI', 1, 47)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (51, N'CLI', 1, 48)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (52, N'CLI', 1, 49)
GO
INSERT [dbo].[number_control] ([id], [Code], [fk_usergroup_id], [run_number]) VALUES (53, N'CLI', 1, 50)
GO
SET IDENTITY_INSERT [dbo].[number_control] OFF
GO
SET IDENTITY_INSERT [dbo].[peoples] ON 
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (2, N'admin', N'admin', 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'NA', N'NA', N'NA', CAST(N'2020-11-11T09:28:46.967' AS DateTime), N'NA', N'NA', N'NA', N'020', N'NA', N'NA', N'office', N'office', 1, 1, N'NA', N'NA', 1, 1, 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (4, N'string', N'string', 0, CAST(N'2020-11-11T09:28:46.967' AS DateTime), N'string', N'string', N'string', CAST(N'2020-11-11T09:28:46.967' AS DateTime), N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'string', 0, 0, N'string', N'string', 1, 0, 1, CAST(N'2020-11-11T09:28:46.967' AS DateTime), CAST(N'2020-11-11T09:28:46.967' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (11, N'Bounmixay', N'BOUAPHANTHAVONG', 0, CAST(N'1993-04-04T00:00:00.000' AS DateTime), N'22123-123', N'NA', N'NA', CAST(N'2020-11-12T03:22:24.000' AS DateTime), N'Khammouane', N'Laos', N'Programmer', N'02098999445', N'NA', N'boun_mo@hotmail.com', N'11 -0212', N'Thongkang', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-12T10:39:06.747' AS DateTime), CAST(N'2020-11-12T10:39:06.747' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (12, N'Nithnoy', N'DUANGPANYA', 0, CAST(N'1996-11-12T00:00:00.000' AS DateTime), N'1231', N'NA', N'NA', CAST(N'2020-11-12T06:29:46.000' AS DateTime), N'', N'Laos', N'Admin', N'0209989918', N'NA', N'Nith', N'122', N'Nongtha', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-12T13:31:55.350' AS DateTime), CAST(N'2020-11-12T13:31:55.350' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (13, N'Nithnoy', N'DUANGPANYA', 0, CAST(N'1996-11-12T00:00:00.000' AS DateTime), N'12312', N'NA', N'NA', CAST(N'2020-11-12T06:33:21.000' AS DateTime), N'', N'Laos', N'Admin', N'020223232323', N'NA', N'm', N'123', N'Nongtha', 60, 8, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-12T13:34:15.570' AS DateTime), CAST(N'2020-11-12T13:34:15.570' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (14, N'Bounmixay', N'BOUAPHANTHAVONG', 0, CAST(N'1991-11-13T00:00:00.000' AS DateTime), N'12312', N'NA', N'NA', CAST(N'2020-11-13T03:07:40.000' AS DateTime), N'', N'LAOS', N'PROGRAMMER', N'020123122', N'NA', N'D', N'11 9293', N'THONGKANG', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-13T10:10:58.737' AS DateTime), CAST(N'2020-11-13T10:10:58.577' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (15, N'Bounmixay', N'BOUAPHANTHAVONG', 0, CAST(N'1991-11-13T00:00:00.000' AS DateTime), N'12312', N'NA', N'NA', CAST(N'2020-11-13T03:07:40.000' AS DateTime), N'', N'LAOS', N'PROGRAMMER', N'020123122', N'NA', N'D', N'11 9293', N'THONGKANG', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-13T10:28:44.760' AS DateTime), CAST(N'2020-11-13T10:28:44.760' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (16, N'Bounmixay', N'BOUAPHANTHAVONG', 0, CAST(N'1991-11-13T00:00:00.000' AS DateTime), N'12312', N'NA', N'NA', CAST(N'2020-11-13T03:07:40.000' AS DateTime), N'', N'LAOS', N'PROGRAMMER', N'020123122', N'NA', N'D', N'11 9293', N'THONGKANG', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-13T10:36:58.767' AS DateTime), CAST(N'2020-11-13T10:36:58.767' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (24, N'Vat', N'', 0, CAST(N'1994-10-27T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T09:26:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T16:27:50.297' AS DateTime), CAST(N'2020-11-20T16:27:50.297' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (25, N'aad', N'', 0, CAST(N'1997-02-26T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T11:46:45.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T18:47:21.860' AS DateTime), CAST(N'2020-11-20T18:47:21.860' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (26, N'aad', N'', 0, CAST(N'1997-02-26T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T11:46:45.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T18:50:34.493' AS DateTime), CAST(N'2020-11-20T18:50:34.493' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (27, N's', N'', 0, CAST(N'1992-06-09T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T11:57:49.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T18:58:21.610' AS DateTime), CAST(N'2020-11-20T18:58:21.610' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (28, N's', N'', 0, CAST(N'1992-06-09T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T11:57:49.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T19:02:38.640' AS DateTime), CAST(N'2020-11-20T19:02:38.637' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (29, N'a', N'', 0, CAST(N'1991-06-04T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T12:08:18.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T19:08:51.023' AS DateTime), CAST(N'2020-11-20T19:08:51.023' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (30, N'', N'', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:17:12.667' AS DateTime), CAST(N'2020-11-20T21:17:12.667' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (31, N'', N'', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:27:32.497' AS DateTime), CAST(N'2020-11-20T21:27:32.497' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (32, N'', N'', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:29:34.857' AS DateTime), CAST(N'2020-11-20T21:29:34.857' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (33, N'', N'', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:31:07.493' AS DateTime), CAST(N'2020-11-20T21:31:07.493' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (34, N'Nithnoy', N'DUANGPANYA', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 1, 1, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:33:02.947' AS DateTime), CAST(N'2020-11-20T21:33:02.947' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (35, N'', N'', 0, CAST(N'1983-06-14T00:00:00.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2020-11-20T14:16:15.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 1, 0, CAST(N'2020-11-20T21:35:37.537' AS DateTime), CAST(N'2020-11-20T21:35:37.537' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (36, N'vatsatana', N'xayyalath', 0, CAST(N'1994-10-27T00:00:00.000' AS DateTime), N'123', N'NA', N'NA', CAST(N'2020-12-18T09:19:28.000' AS DateTime), N'khammuaon', N'laos', N'sale', N'020', N'NA', N'vat', N'NA', N'thongkang', 1, 1, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:21:01.527' AS DateTime), CAST(N'2020-12-18T16:21:01.527' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (37, N'vatsatana', N'xayyalath', 0, CAST(N'1994-10-27T00:00:00.000' AS DateTime), N'123', N'NA', N'NA', CAST(N'2020-12-18T09:19:28.000' AS DateTime), N'khammuaon', N'laos', N'sale', N'020', N'NA', N'vat', N'NA', N'thongkang', 1, 1, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:30:25.083' AS DateTime), CAST(N'2020-12-18T16:30:25.083' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (38, N'mr jai', N'singthaya', 0, CAST(N'1990-03-01T00:00:00.000' AS DateTime), N'222', N'NA', N'NA321', CAST(N'2020-12-18T09:33:54.000' AS DateTime), N'redt', N'jhg', N'jgfrtd', N'23232323', N'NA', N'', N'NA', N'phon', 14, 2, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:40:51.170' AS DateTime), CAST(N'2020-12-18T16:40:51.170' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (39, N'ms nitnoiy', N'duangpanya', 0, CAST(N'1996-10-12T00:00:00.000' AS DateTime), N'2344', N'NA', N'NA123', CAST(N'2020-12-18T09:33:46.000' AS DateTime), N'dfg', N'lao', N'fghj', N'02096977494', N'NA', N'bghffff@gmail.com', N'NA', N'kharm', 75, 10, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:40:51.170' AS DateTime), CAST(N'2020-12-18T16:40:51.170' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (40, N'mr jai', N'singthaya', 0, CAST(N'1990-03-01T00:00:00.000' AS DateTime), N'222', N'NA', N'NA321', CAST(N'2020-12-18T09:33:54.000' AS DateTime), N'redt', N'jhg', N'jgfrtd', N'23232323', N'NA', N'', N'NA', N'phon', 14, 2, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:46:02.540' AS DateTime), CAST(N'2020-12-18T16:46:02.540' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (41, N'ms nitnoiy', N'duangpanya', 0, CAST(N'1996-10-12T00:00:00.000' AS DateTime), N'2344', N'NA', N'NA123', CAST(N'2020-12-18T09:33:46.000' AS DateTime), N'dfg', N'lao', N'fghj', N'02096977494', N'NA', N'bghffff@gmail.com', N'NA', N'kharm', 75, 10, N'NA', N'NA', 0, 594, 0, CAST(N'2020-12-18T16:46:02.540' AS DateTime), CAST(N'2020-12-18T16:46:02.540' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (50, N'asdf', N'asd', 0, CAST(N'1998-12-18T00:00:00.000' AS DateTime), N'123', N'NA', N'NA', CAST(N'2020-12-18T10:23:33.000' AS DateTime), N'123', N'123', N'123', N'123', N'NA', N'123', N'NA', N'asdf', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2020-12-18T17:33:07.650' AS DateTime), CAST(N'2020-12-18T17:33:07.650' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (51, N'', N'', 0, CAST(N'2021-01-25T02:50:58.000' AS DateTime), N'', N'NA', N'NA', CAST(N'2021-01-25T02:50:58.000' AS DateTime), N'', N'', N'', N'', N'NA', N'', N'NA', N'', 0, 0, N'NA', N'NA', 0, 0, 0, CAST(N'2021-01-25T09:51:46.957' AS DateTime), CAST(N'2021-01-25T09:51:46.957' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (52, N'michael', N'boua', 0, CAST(N'1993-04-04T00:00:00.000' AS DateTime), N'12212', N'NA', N'NA', CAST(N'2021-01-25T02:58:57.000' AS DateTime), N'', N'Laos', N'Programer', N'20', N'NA', N'@', N'NA', N'thongkang', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-01-25T10:00:43.533' AS DateTime), CAST(N'2021-01-25T10:00:43.533' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (53, N'1', N'1', 0, CAST(N'1991-01-25T00:00:00.000' AS DateTime), N'1', N'NA', N'NA', CAST(N'2021-01-25T05:53:14.000' AS DateTime), N'', N'1', N'1', N'12', N'NA', N'12', N'NA', N'1', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-01-25T12:54:07.557' AS DateTime), CAST(N'2021-01-25T12:54:07.557' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (54, N'a', N'a', 0, CAST(N'2005-01-25T00:00:00.000' AS DateTime), N'12', N'NA', N'NA', CAST(N'2021-01-25T06:27:42.000' AS DateTime), N'', N'a', N'a', N'a', N'NA', N'a', N'NA', N'a', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-01-25T13:28:17.677' AS DateTime), CAST(N'2021-01-25T13:28:17.677' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (55, N'aa', N'ad', 0, CAST(N'2005-01-25T00:00:00.000' AS DateTime), N'12', N'NA', N'NA', CAST(N'2021-01-25T06:27:42.000' AS DateTime), N'', N'a', N'a', N'a', N'NA', N'a', N'NA', N'a', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-02-23T15:44:47.830' AS DateTime), CAST(N'2021-02-23T15:44:47.830' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (56, N'ka', N'ak', 0, CAST(N'1988-03-01T00:00:00.000' AS DateTime), N'1', N'NA', N'NA', CAST(N'2021-03-01T07:55:31.000' AS DateTime), N'1', N'1', N'1', N'1', N'NA', N'1', N'NA', N'1', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T14:56:10.983' AS DateTime), CAST(N'2021-03-01T14:56:10.983' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (57, N'ka', N'ak', 0, CAST(N'1988-03-01T00:00:00.000' AS DateTime), N'1', N'NA', N'NA', CAST(N'2021-03-01T07:55:31.000' AS DateTime), N'1', N'1', N'1', N'1', N'NA', N'1', N'NA', N'1', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T14:58:05.437' AS DateTime), CAST(N'2021-03-01T14:58:05.437' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (58, N'T', N'T', 0, CAST(N'1989-03-01T00:00:00.000' AS DateTime), N'1', N'NA', N'NA', CAST(N'2021-03-01T08:17:45.000' AS DateTime), N'1', N'1', N'1', N'1', N'NA', N'1', N'NA', N'T', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T15:19:16.187' AS DateTime), CAST(N'2021-03-01T15:19:16.187' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (59, N'ba', N'ba', 0, CAST(N'1991-03-01T00:00:00.000' AS DateTime), N'12', N'NA', N'NA', CAST(N'2021-03-01T08:20:12.000' AS DateTime), N'12', N'12', N'12', N'1231', N'NA', N'123', N'NA', N'adf', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T15:20:55.693' AS DateTime), CAST(N'2021-03-01T15:20:55.693' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (60, N'12', N'12', 0, CAST(N'2000-03-01T00:00:00.000' AS DateTime), N'12', N'NA', N'NA', CAST(N'2021-03-01T08:21:58.000' AS DateTime), N'12', N'12', N'12', N'12', N'NA', N'12', N'NA', N'12', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T15:22:25.733' AS DateTime), CAST(N'2021-03-01T15:22:25.733' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (61, N't', N't', 0, CAST(N'1990-01-30T00:00:00.000' AS DateTime), N'123', N'NA', N'NA', CAST(N'2021-03-01T08:33:42.000' AS DateTime), N'123', N'1', N'123', N'123', N'NA', N'123', N'NA', N'd', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T15:34:43.237' AS DateTime), CAST(N'2021-03-01T15:34:43.237' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (62, N'asdfjl', N'a;lsjdflk', 0, CAST(N'1995-03-01T00:00:00.000' AS DateTime), N'123', N'NA', N'NA', CAST(N'2021-03-01T08:36:43.000' AS DateTime), N'123', N'123', N'123', N'123', N'NA', N'123', N'NA', N'123', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T15:37:15.440' AS DateTime), CAST(N'2021-03-01T15:37:15.440' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (64, N'ba', N'bs', 0, CAST(N'1994-03-01T00:00:00.000' AS DateTime), N'21', N'NA', N'NA', CAST(N'2021-03-01T09:09:31.000' AS DateTime), N'3', N'12', N'21', N'12', N'NA', N'12', N'NA', N'12', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T16:30:07.900' AS DateTime), CAST(N'2021-03-01T16:30:07.900' AS DateTime))
GO
INSERT [dbo].[peoples] ([id], [firstname], [lastname], [gender], [dateofbirth], [cardno], [passportno], [house_hold_no], [issued_date], [issuedby], [nationality], [job], [phonenumber], [mobilenumber], [email], [cur_address], [village], [fk_district_id], [fk_province_id], [zip], [country], [p_status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (65, N'l', N'l', 0, CAST(N'1982-03-01T00:00:00.000' AS DateTime), N'l', N'NA', N'NA', CAST(N'2021-03-01T09:43:53.000' AS DateTime), N'l', N'l', N'l', N'l', N'NA', N'l', N'NA', N'l', 1, 1, N'NA', N'NA', 0, 0, 0, CAST(N'2021-03-01T16:44:28.207' AS DateTime), CAST(N'2021-03-01T16:44:28.207' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[peoples] OFF
GO
SET IDENTITY_INSERT [dbo].[plans] ON 
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'PL', N'Plan A', 0, 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (2, N'PL', N'Plan B', 1, 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 591, 591)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (35, N'PL', N'Plan C', 1, NULL, CAST(N'2020-11-11T11:06:24.040' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (36, N'PLC', N'Plan C', 1, NULL, CAST(N'2020-11-11T11:08:41.527' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (37, N'PL', N'Plan C', 1, NULL, CAST(N'2020-11-11T11:11:14.987' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (38, N'PL', N'Plan c', 1, NULL, CAST(N'2020-11-11T11:13:55.557' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (39, N'PLC', N'PLAN C', 1, NULL, CAST(N'2020-11-11T11:14:51.330' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (40, N'PLC', N'PLAN C', 1, NULL, CAST(N'2020-11-11T11:21:21.800' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (41, N'000', N'0000', 1, NULL, CAST(N'2020-11-11T11:23:07.760' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (42, N'lll', N'lll', 1, NULL, CAST(N'2020-11-11T11:25:18.853' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (43, N'abc', N'ac', 1, NULL, CAST(N'2020-11-11T11:31:14.143' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[plans] ([id], [code], [planname], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (44, N'ttt', N'ttt', 1, NULL, CAST(N'2020-11-11T11:59:58.467' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[plans] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [code], [productname], [description], [fk_producttype_id], [fk_plan_id], [rate], [additional_min], [additional_max], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'VI01', N'Vehicle Plan A', NULL, 1, 1, CAST(1300000.00 AS Decimal(18, 2)), 0, 0, 1, 0, CAST(N'2020-10-27T03:49:45.037' AS DateTime), CAST(N'2020-10-27T03:49:45.037' AS DateTime), 0, 0)
GO
INSERT [dbo].[products] ([id], [code], [productname], [description], [fk_producttype_id], [fk_plan_id], [rate], [additional_min], [additional_max], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (9, N'LI01', N'ປະກັນໄພສິນເສື່ອ / Laon Insurance from 15-60', NULL, 2, 2, CAST(0.00 AS Decimal(18, 2)), 15, 60, 1, 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 591, 591)
GO
INSERT [dbo].[products] ([id], [code], [productname], [description], [fk_producttype_id], [fk_plan_id], [rate], [additional_min], [additional_max], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (10, N'LI02', N'ປະກັນໄພສິນເສື່ອ / Laon Insurance from 61-65', NULL, 2, 2, CAST(0.00 AS Decimal(18, 2)), 61, 65, 1, 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 591, 591)
GO
INSERT [dbo].[products] ([id], [code], [productname], [description], [fk_producttype_id], [fk_plan_id], [rate], [additional_min], [additional_max], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (11, N'LI03', N'ປະກັນໄພສິນເສື່ອ / Laon Insurance from 66-70', NULL, 2, 2, CAST(0.00 AS Decimal(18, 2)), 66, 70, 1, 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 591, 591)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[producttype] ON 
GO
INSERT [dbo].[producttype] ([id], [code], [producttypename], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'VI', N'Vehicle Insurance', 1, 0, CAST(N'2020-10-27T03:49:45.163' AS DateTime), CAST(N'2020-10-27T03:49:45.163' AS DateTime), 0, 0)
GO
INSERT [dbo].[producttype] ([id], [code], [producttypename], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (2, N'LI', N'Laon Insurance', 1, 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-01T00:00:00.000' AS DateTime), 596, 596)
GO
SET IDENTITY_INSERT [dbo].[producttype] OFF
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (1, N'Vientiane Capital Province', N'ນະຄອນຫລວງວຽງຈັນ', N'VCH', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (2, N'Phongsaly Province', N'ຜົ້ງສາລີ', N'PHO', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (3, N'Luang Namtha Province', N'ຫລວງນ້ຳທາ', N'LNA', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (4, N'Oudomxay Province', N'ອູດົມໄຊ', N'LPB', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (5, N'Bokeo Province', N'ບໍ່ແກ້ວ', N'BOK', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (6, N'Luang Prabang Province', N'ຫລວງພະບາງ', N'LPB', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (7, N'Houaphanh Province', N'ຫົວພັນ', N'HPH', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (8, N'xayaburi Province', N'ໄຊຍະບູລີ', N'XBR', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (9, N'Xiangkhouang Province', N'ຊຽງຂວາງ', N'XKH', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (10, N'Vientiane Province', N'ວຽງຈັນ', N'VCH', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (11, N'Bolikhamsai Province', N'ບໍລິຄຳໄຊ', N'BKX', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (12, N'Khammouane Province', N'ຄຳມ່ວນ', N'KHA', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (13, N'Savannakhet Province', N'ສະຫວັນນະເຂດ', N'SAV', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (14, N'Salavan Province', N'ສາລະວັນ', N'SAR', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (15, N'Sekong Province', N'ເຊກອງ', N'SEK', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (16, N'Champasak Province', N'ຈຳປາສັກ', N'CHA', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (17, N'Attapeu Province', N'ອັດຕະປື', N'ATT', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[province] ([id], [engname], [laoname], [shortcode], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (18, N'Xaisomboun Province', N'ໄຊສົມບູນ', N'XSB', 1, 1, 0, CAST(N'2017-05-04T00:00:00.000' AS DateTime), CAST(N'2017-05-04T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[recipe] ON 
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, 9, CAST(0.35 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (2, 10, CAST(0.50 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (3, 11, CAST(1.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (4, 9, CAST(0.40 AS Decimal(18, 2)), 2, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (5, 10, CAST(0.55 AS Decimal(18, 2)), 2, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (6, 11, CAST(1.05 AS Decimal(18, 2)), 2, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (7, 9, CAST(0.45 AS Decimal(18, 2)), 3, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (8, 10, CAST(0.60 AS Decimal(18, 2)), 3, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipe] ([id], [fk_product_id], [rate], [fk_level_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (9, 11, CAST(1.10 AS Decimal(18, 2)), 3, 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
SET IDENTITY_INSERT [dbo].[recipe] OFF
GO
INSERT [dbo].[recipelevel] ([id], [recipe_level], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'Level 1', 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipelevel] ([id], [recipe_level], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (2, N'Level 2', 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[recipelevel] ([id], [recipe_level], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (3, N'Level 3', 1, 0, CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), 594, 594)
GO
INSERT [dbo].[usergroup] ([id], [code], [user_group], [fk_agency_id], [status], [del], [cdate], [mdate], [createby], [updateby]) VALUES (1, N'001', N'Sokxay', 1, 1, 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [fullname], [userid], [displayname], [img], [username], [password], [pwdresetdate], [access_type], [fk_people_id], [fk_usersrole_id], [group_id], [fk_level_id], [language_code], [address], [zipcode], [country], [email], [phone], [status], [islogin], [islogout], [dels], [cdate], [mdate]) VALUES (594, N'admin', N'1', N'admin', NULL, N'admin', N'admin', CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), N'1', 2, 91, 1, 1, N'1', N'1', N'1', N'1', N'1', N'1', 1, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[usersrole] ON 
GO
INSERT [dbo].[usersrole] ([id], [rolename], [login_type], [status], [fk_users_id], [dels], [cdate], [mdate]) VALUES (91, N'SuperUser', N'Admin', 0, 1, 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[usersrole] OFF
GO
ALTER TABLE [dbo].[agreement_laon_detail]  WITH CHECK ADD  CONSTRAINT [FK_agreement_laon_detail_agreement_laon] FOREIGN KEY([fk_agreement_id])
REFERENCES [dbo].[agreement_laon] ([id])
GO
ALTER TABLE [dbo].[agreement_laon_detail] CHECK CONSTRAINT [FK_agreement_laon_detail_agreement_laon]
GO
ALTER TABLE [dbo].[agreement_laon_detail]  WITH CHECK ADD  CONSTRAINT [FK_agreement_laon_detail_beneficiary] FOREIGN KEY([fk_benifit_id])
REFERENCES [dbo].[beneficiary] ([id])
GO
ALTER TABLE [dbo].[agreement_laon_detail] CHECK CONSTRAINT [FK_agreement_laon_detail_beneficiary]
GO
ALTER TABLE [dbo].[agreement_laon_detail]  WITH CHECK ADD  CONSTRAINT [FK_agreement_laon_detail_peoples] FOREIGN KEY([fk_people_id])
REFERENCES [dbo].[peoples] ([id])
GO
ALTER TABLE [dbo].[agreement_laon_detail] CHECK CONSTRAINT [FK_agreement_laon_detail_peoples]
GO
ALTER TABLE [dbo].[cliams]  WITH CHECK ADD  CONSTRAINT [FK_cliams_coverage_conditions] FOREIGN KEY([fk_agreement_detail_id])
REFERENCES [dbo].[coverage_conditions] ([id])
GO
ALTER TABLE [dbo].[cliams] CHECK CONSTRAINT [FK_cliams_coverage_conditions]
GO
ALTER TABLE [dbo].[coverage_conditions]  WITH CHECK ADD  CONSTRAINT [FK_coverage_conditions_coverage_type] FOREIGN KEY([fk_covertype_id])
REFERENCES [dbo].[coverage_type] ([id])
GO
ALTER TABLE [dbo].[coverage_conditions] CHECK CONSTRAINT [FK_coverage_conditions_coverage_type]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_modules] FOREIGN KEY([fk_module_id])
REFERENCES [dbo].[modules] ([id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_modules]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_usersrole] FOREIGN KEY([fk_role_id])
REFERENCES [dbo].[usersrole] ([id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_usersrole]
GO
USE [master]
GO
ALTER DATABASE [Insurance_Sokxay] SET  READ_WRITE 
GO

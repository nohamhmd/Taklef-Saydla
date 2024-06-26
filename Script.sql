USE [TaklefSaydlaFinal_3]
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateTalbCode]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GenerateTalbCode]()
RETURNS NVARCHAR(10)
BEGIN
	DECLARE @TalbCode nvarchar(10);
	DECLARE @Year nvarchar(5);
	DECLARE @Month nvarchar(3);
	DECLARE @Day nvarchar(3);
	DECLARE @First nvarchar(2);
	DECLARE @Second nvarchar(2);
	DECLARE @Num int;
	DECLARE @YearDigits nvarchar(2);
	DECLARE @Temp int;
	DECLARE @Count int;
	SET @Year = YEAR(GETDATE());
	SET @MONTH = MONTH(GETDATE());
	SET @DAY = DAY(GETDATE());
	SET @First = @Year % 10;
	SET @Num = @Year / 10;
	SET @Second = @Num % 10;
	SET @YearDigits = @Second + @First;
	IF @Month < 10 AND @Day < 10
		SET @TalbCode = @YearDigits + '0'+@Month + '0'+@Day;
	ELSE IF @Month < 10 
		SET @TalbCode = @YearDigits + '0'+@Month + @Day;
	ELSE IF @Day < 10 
		SET @TalbCode = @YearDigits + @Month + '0'+@Day;
	ELSE
		SET @TalbCode = @YearDigits + @Month + @Day;
	SET @Temp = (SELECT [Value] FROM [Counter] WHERE ID = 1);
	SET @Count = @Temp + 1;
	
	SET @TalbCode = @TalbCode + Cast(@Count AS nvarchar(10));
	RETURN (@TalbCode)
END
GO
/****** Object:  Table [dbo].[AssignedTalbat]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedTalbat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[NumOfTasks] [int] NULL,
	[AssignDate] [date] NULL,
	[NumOfTasksDone] [int] NULL,
	[DoneDate] [date] NULL,
 CONSTRAINT [PK_AssignedTalbat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counter]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counter](
	[ID] [int] NULL,
	[Value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaysCapacity]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaysCapacity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_DaysCapacity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBOperations]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBOperations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[Operation] [nvarchar](50) NULL,
	[RecordName] [nvarchar](60) NULL,
	[TableName] [nvarchar](50) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_DBOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[E3adetTaklefTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E3adetTaklefTalb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QrarNo] [int] NULL,
	[QrarDate] [date] NULL,
	[Reason] [nvarchar](max) NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_E3adetTaklefTalb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[E3faaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E3faaTalb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_E3faaTalb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[El8aaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[El8aaTalb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QrarNo] [int] NULL,
	[QrarDate] [date] NULL,
	[Reason] [nvarchar](max) NULL,
	[PID] [int] NOT NULL,
 CONSTRAINT [PK_El8aaTalb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[SSD] [char](14) NULL,
	[NameAR] [nvarchar](60) NULL,
	[Address] [nvarchar](max) NULL,
	[Tele1] [char](11) NULL,
	[Tele2] [char](11) NULL,
	[Gender] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[DoB] [date] NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Employees] UNIQUE NONCLUSTERED 
(
	[SSD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Est5ragBayan7alaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Est5ragBayan7alaTalb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QrarNo] [int] NULL,
	[QrarDate] [date] NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_Est5ragBayan7alaTalb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [tinyint] NOT NULL,
	[Name] [nvarchar](5) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Governments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governments](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Governments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[ID] [tinyint] NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartHolidayDate] [date] NULL,
	[EndHolidayDate] [date] NULL,
	[PTID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[RID] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[IsBlocked] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[EmpID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offline_Attachments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offline_Attachments](
	[PID] [int] NOT NULL,
	[AID] [tinyint] NOT NULL,
	[TalbID] [int] NOT NULL,
	[Approved] [bit] NULL,
	[ApproveDate] [date] NULL,
 CONSTRAINT [PK_Offline_Attachments] PRIMARY KEY CLUSTERED 
(
	[PID] ASC,
	[AID] ASC,
	[TalbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacist]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacist](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[SSD] [char](14) NULL,
	[NameAR] [nvarchar](60) NULL,
	[NameEN] [nvarchar](60) NULL,
	[Address] [nvarchar](max) NULL,
	[GovBirth] [tinyint] NULL,
	[GovStay] [tinyint] NULL,
	[EMail] [nvarchar](60) NULL,
	[Tele1] [char](11) NULL,
	[Tele2] [char](11) NULL,
	[Gender] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[DoB] [date] NULL,
	[Uni] [tinyint] NULL,
	[Section] [tinyint] NULL,
	[Dof3a] [smallint] NULL,
	[Doar] [nvarchar](40) NULL,
	[TotalGrade] [float] NULL,
	[SumE3tbary] [float] NULL,
	[Grade] [tinyint] NULL,
	[TTID] [tinyint] NULL,
	[UserID] [int] NULL,
	[UPID] [int] NULL,
 CONSTRAINT [PK_Pharmacist] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacistTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacistTaklef](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartTaklefDate] [date] NULL,
	[EndTaklefDate] [date] NULL,
	[UniID] [int] NULL,
 CONSTRAINT [PK_PharmacistTaklef] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sa7bQrarT3delTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sa7bQrarT3delTaklef](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sa7bQrarNo] [int] NULL,
	[Sa7bQrarYear] [smallint] NULL,
	[Sa7bQrarFrom] [nvarchar](max) NULL,
	[Sa7bQrarTo] [nvarchar](max) NULL,
	[PreviousTaklefQrarNo] [int] NULL,
	[PreviousTaklefQrarYear] [smallint] NULL,
	[PreviousTaklefTo] [nvarchar](max) NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_Sa7bQrarT3delTaklef] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[ID] [tinyint] NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [tinyint] NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T3delTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T3delTalb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[From] [nvarchar](max) NULL,
	[To] [nvarchar](max) NULL,
	[Reason] [nvarchar](max) NULL,
	[ActuallDateOfWork] [date] NULL,
	[QrarNo] [int] NULL,
	[QrarDate] [date] NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_EditBdal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TalbatInfo]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TalbatInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalbCode] [varchar](10) NOT NULL,
	[PID] [int] NULL,
	[TTID] [tinyint] NULL,
	[RecordE3faaID] [int] NULL,
	[RecordTa3delID] [int] NULL,
	[RecordEl8aaID] [int] NULL,
	[RecordE3adetTaklefID] [int] NULL,
	[RecordSa7bQrarT3deIID] [int] NULL,
	[RecordEst5ragBayan7alaID] [int] NULL,
	[TalbDate] [date] NULL,
	[AssignedDate] [date] NULL,
	[Result] [varchar](30) NULL,
	[ResultDate] [date] NULL,
	[IsLagna3lya] [bit] NULL,
	[LagnaNo] [date] NULL,
	[Notes] [nvarchar](max) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_TalbatInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TalbatInfo] UNIQUE NONCLUSTERED 
(
	[TalbCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TalbatOnline]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TalbatOnline](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[SSD] [char](14) NULL,
	[NameAR] [nvarchar](60) NULL,
	[NameEN] [nvarchar](60) NULL,
	[Address] [nvarchar](max) NULL,
	[GovBirth] [tinyint] NULL,
	[GovStay] [tinyint] NULL,
	[EMail] [nvarchar](60) NULL,
	[Tele1] [char](11) NULL,
	[Tele2] [char](11) NULL,
	[Gender] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[DoB] [date] NULL,
	[Uni] [tinyint] NULL,
	[Section] [tinyint] NULL,
	[Dof3a] [smallint] NULL,
	[Doar] [nvarchar](40) NULL,
	[TotalGrade] [float] NULL,
	[SumE3tbary] [float] NULL,
	[Grade] [tinyint] NULL,
	[TTID] [tinyint] NULL,
	[IsLagna3lya] [bit] NULL,
	[EditFrom] [nvarchar](max) NULL,
	[EditTo] [nvarchar](max) NULL,
	[TalbDate] [date] NULL,
	[Reason] [nvarchar](max) NULL,
	[ActuallDateOfWork] [date] NULL,
	[QrarNo] [int] NULL,
	[QrarDate] [date] NULL,
	[Sa7bQrarNo] [int] NULL,
	[Sa7bQrarYear] [smallint] NULL,
	[Sa7bQrarFrom] [nvarchar](max) NULL,
	[Sa7bQrarTo] [nvarchar](max) NULL,
	[PreviousTaklefQrarNo] [int] NULL,
	[PreviousTaklefQrarYear] [smallint] NULL,
	[PreviousTaklefTo] [nvarchar](max) NULL,
	[AppointmentDate] [date] NULL,
	[TalbCode] [varchar](10) NULL,
	[IsRecived] [bit] NULL,
	[UPID] [int] NULL,
 CONSTRAINT [PK_Pharmacist1] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TalbatOnline_1] UNIQUE NONCLUSTERED 
(
	[TalbCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TalbatTypes]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TalbatTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TalbatTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UniPharmasist]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UniPharmasist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SSD] [char](14) NOT NULL,
	[NameAR] [nvarchar](60) NULL,
	[NameEN] [nvarchar](60) NULL,
	[Address] [nvarchar](max) NULL,
	[EMail] [nvarchar](60) NULL,
	[GovBirth] [tinyint] NULL,
	[GovStay] [tinyint] NULL,
	[Tele1] [char](11) NULL,
	[Tele2] [char](11) NULL,
	[Gender] [tinyint] NULL,
	[Nationality] [nvarchar](40) NULL,
	[DoB] [date] NULL,
	[Uni] [tinyint] NULL,
	[Section] [tinyint] NULL,
	[Dof3a] [smallint] NULL,
	[Doar] [nvarchar](40) NULL,
	[Religion] [nvarchar](max) NULL,
	[SumE3tbary] [float] NULL,
	[TotalGrade] [float] NULL,
	[StdGrade] [float] NULL,
	[Grade] [tinyint] NULL,
	[MkanTaklef] [nvarchar](max) NULL,
	[NoOfQrar] [int] NULL,
	[QrarDate] [date] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_UniPharmasist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_UniPharmasist] UNIQUE NONCLUSTERED 
(
	[SSD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universtiy]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universtiy](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Universtiy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignedTalbat] ADD  CONSTRAINT [DF_AssignedTalbat_NumOfTasksDone]  DEFAULT ((0)) FOR [NumOfTasksDone]
GO
ALTER TABLE [dbo].[DBOperations] ADD  CONSTRAINT [DF_DBOperations_Date]  DEFAULT (CONVERT([date],getdate())) FOR [Date]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_IsBlocked]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Offline_Attachments] ADD  CONSTRAINT [DF_Offline_Attachments_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[TalbatInfo] ADD  CONSTRAINT [DF_TalbatInfo_TalbDate]  DEFAULT (CONVERT([date],getdate())) FOR [TalbDate]
GO
ALTER TABLE [dbo].[TalbatOnline] ADD  CONSTRAINT [DF_TalbatOnline_Date]  DEFAULT (getdate()) FOR [TalbDate]
GO
ALTER TABLE [dbo].[TalbatOnline] ADD  CONSTRAINT [DF_TalbatOnline_IsRecived]  DEFAULT ((0)) FOR [IsRecived]
GO
ALTER TABLE [dbo].[AssignedTalbat]  WITH CHECK ADD  CONSTRAINT [FK_AssignedTalbat_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EID])
GO
ALTER TABLE [dbo].[AssignedTalbat] CHECK CONSTRAINT [FK_AssignedTalbat_Employees]
GO
ALTER TABLE [dbo].[DBOperations]  WITH CHECK ADD  CONSTRAINT [FK_DBOperations_Login] FOREIGN KEY([UID])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[DBOperations] CHECK CONSTRAINT [FK_DBOperations_Login]
GO
ALTER TABLE [dbo].[E3adetTaklefTalb]  WITH CHECK ADD  CONSTRAINT [FK_E3adetTaklefTalb_Pharmacist] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[E3adetTaklefTalb] CHECK CONSTRAINT [FK_E3adetTaklefTalb_Pharmacist]
GO
ALTER TABLE [dbo].[E3faaTalb]  WITH CHECK ADD  CONSTRAINT [FK_E3faaTalb_E3faaTalb] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[E3faaTalb] CHECK CONSTRAINT [FK_E3faaTalb_E3faaTalb]
GO
ALTER TABLE [dbo].[El8aaTalb]  WITH CHECK ADD  CONSTRAINT [FK_El8aaTalb_El8aaTalb] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[El8aaTalb] CHECK CONSTRAINT [FK_El8aaTalb_El8aaTalb]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Status]
GO
ALTER TABLE [dbo].[Est5ragBayan7alaTalb]  WITH CHECK ADD  CONSTRAINT [FK_Est5ragBayan7alaTalb_Pharmacist] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Est5ragBayan7alaTalb] CHECK CONSTRAINT [FK_Est5ragBayan7alaTalb_Pharmacist]
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD  CONSTRAINT [FK_Holidays_PharmacistTaklef] FOREIGN KEY([PTID])
REFERENCES [dbo].[PharmacistTaklef] ([ID])
GO
ALTER TABLE [dbo].[Holidays] CHECK CONSTRAINT [FK_Holidays_PharmacistTaklef]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Employees]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Login] FOREIGN KEY([RID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Login]
GO
ALTER TABLE [dbo].[Offline_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Offline_Attachments_Attachments] FOREIGN KEY([AID])
REFERENCES [dbo].[Attachments] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offline_Attachments] CHECK CONSTRAINT [FK_Offline_Attachments_Attachments]
GO
ALTER TABLE [dbo].[Offline_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Offline_Attachments_Offline_Attachments] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offline_Attachments] CHECK CONSTRAINT [FK_Offline_Attachments_Offline_Attachments]
GO
ALTER TABLE [dbo].[Offline_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Offline_Attachments_TalbatInfo] FOREIGN KEY([TalbID])
REFERENCES [dbo].[TalbatInfo] ([ID])
GO
ALTER TABLE [dbo].[Offline_Attachments] CHECK CONSTRAINT [FK_Offline_Attachments_TalbatInfo]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Gender]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Governments] FOREIGN KEY([GovBirth])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Governments]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Governments1] FOREIGN KEY([GovStay])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Governments1]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Grades] FOREIGN KEY([Grade])
REFERENCES [dbo].[Grades] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Grades]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Section] FOREIGN KEY([Section])
REFERENCES [dbo].[Section] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Section]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Status]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_TalbatTypes] FOREIGN KEY([TTID])
REFERENCES [dbo].[TalbatTypes] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_TalbatTypes]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_UniPharmasist] FOREIGN KEY([UPID])
REFERENCES [dbo].[UniPharmasist] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_UniPharmasist]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacist_Universtiy] FOREIGN KEY([Uni])
REFERENCES [dbo].[Universtiy] ([ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [FK_Pharmacist_Universtiy]
GO
ALTER TABLE [dbo].[PharmacistTaklef]  WITH CHECK ADD  CONSTRAINT [FK_PharmacistTaklef_UniPharmasist] FOREIGN KEY([UniID])
REFERENCES [dbo].[UniPharmasist] ([ID])
GO
ALTER TABLE [dbo].[PharmacistTaklef] CHECK CONSTRAINT [FK_PharmacistTaklef_UniPharmasist]
GO
ALTER TABLE [dbo].[Sa7bQrarT3delTaklef]  WITH CHECK ADD  CONSTRAINT [FK_Sa7bQrarT3delTaklef_Pharmacist] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sa7bQrarT3delTaklef] CHECK CONSTRAINT [FK_Sa7bQrarT3delTaklef_Pharmacist]
GO
ALTER TABLE [dbo].[T3delTalb]  WITH CHECK ADD  CONSTRAINT [FK_EditBdal_TalbatOffline] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T3delTalb] CHECK CONSTRAINT [FK_EditBdal_TalbatOffline]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_Results_Results] FOREIGN KEY([PID])
REFERENCES [dbo].[Pharmacist] ([PID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_Results_Results]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_Results_TalbatTypes] FOREIGN KEY([TTID])
REFERENCES [dbo].[TalbatTypes] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_Results_TalbatTypes]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_TalbatInfo_E3adetTaklefTalb] FOREIGN KEY([RecordE3adetTaklefID])
REFERENCES [dbo].[E3adetTaklefTalb] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_TalbatInfo_E3adetTaklefTalb]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_TalbatInfo_E3faaTalb] FOREIGN KEY([RecordE3faaID])
REFERENCES [dbo].[E3faaTalb] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_TalbatInfo_E3faaTalb]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_TalbatInfo_El8aaTalb] FOREIGN KEY([RecordEl8aaID])
REFERENCES [dbo].[El8aaTalb] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_TalbatInfo_El8aaTalb]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_TalbatInfo_Sa7bQrarT3delTaklef] FOREIGN KEY([RecordSa7bQrarT3deIID])
REFERENCES [dbo].[Sa7bQrarT3delTaklef] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_TalbatInfo_Sa7bQrarT3delTaklef]
GO
ALTER TABLE [dbo].[TalbatInfo]  WITH CHECK ADD  CONSTRAINT [FK_TalbatInfo_T3delTalb] FOREIGN KEY([RecordTa3delID])
REFERENCES [dbo].[T3delTalb] ([ID])
GO
ALTER TABLE [dbo].[TalbatInfo] CHECK CONSTRAINT [FK_TalbatInfo_T3delTalb]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Gender]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Governments] FOREIGN KEY([GovBirth])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Governments]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Governments1] FOREIGN KEY([GovStay])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Governments1]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Grades] FOREIGN KEY([Grade])
REFERENCES [dbo].[Grades] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Grades]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Section] FOREIGN KEY([Section])
REFERENCES [dbo].[Section] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Section]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Status]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_TalbatTypes] FOREIGN KEY([TTID])
REFERENCES [dbo].[TalbatTypes] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_TalbatTypes]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_UniPharmasist] FOREIGN KEY([UPID])
REFERENCES [dbo].[UniPharmasist] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_UniPharmasist]
GO
ALTER TABLE [dbo].[TalbatOnline]  WITH CHECK ADD  CONSTRAINT [FK_TalbatOnline_Universtiy] FOREIGN KEY([Uni])
REFERENCES [dbo].[Universtiy] ([ID])
GO
ALTER TABLE [dbo].[TalbatOnline] CHECK CONSTRAINT [FK_TalbatOnline_Universtiy]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Gender]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Governments] FOREIGN KEY([GovBirth])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Governments]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Governments1] FOREIGN KEY([GovStay])
REFERENCES [dbo].[Governments] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Governments1]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Grades] FOREIGN KEY([Grade])
REFERENCES [dbo].[Grades] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Grades]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Section] FOREIGN KEY([Section])
REFERENCES [dbo].[Section] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Section]
GO
ALTER TABLE [dbo].[UniPharmasist]  WITH CHECK ADD  CONSTRAINT [FK_UniPharmasist_Universtiy] FOREIGN KEY([Uni])
REFERENCES [dbo].[Universtiy] ([ID])
GO
ALTER TABLE [dbo].[UniPharmasist] CHECK CONSTRAINT [FK_UniPharmasist_Universtiy]
GO
/****** Object:  StoredProcedure [dbo].[AttachmentsApprove]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AttachmentsApprove]
	@TalbCode nvarchar(10)
AS
BEGIN
	UPDATE Offline_Attachments 
	SET Approved = 1, 
	    ApproveDate = GetDate()
	WHERE TalbID = (SELECT ID 
					FROM TalbatInfo 
					WHERE TalbCode = @TalbCode);
END
GO
/****** Object:  StoredProcedure [dbo].[AttachmentsNotApprove]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AttachmentsNotApprove]
	@TalbCode nvarchar(10)
AS
BEGIN
	UPDATE Offline_Attachments 
	SET Approved = 0, 
	    ApproveDate = GetDate()
	WHERE TalbID = (SELECT ID 
					FROM TalbatInfo 
					WHERE TalbCode = @TalbCode);
END
GO
/****** Object:  StoredProcedure [dbo].[CheckDate]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckDate]
	@Date DATE
AS
BEGIN
	SELECT [Date], Capacity 
	FROM DaysCapacity
	WHERE [Date] = Date;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLastMkanTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLastMkanTaklef]
@SSN nvarchar(max)
AS
BEGIN
	select[MkanTaklef] from [dbo].[UniPharmasist]
	where [SSD]=@SSN
END
GO
/****** Object:  StoredProcedure [dbo].[CheckResultWithSSN]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckResultWithSSN]
@SSN nvarchar(14)
AS
BEGIN
	Declare @d int
	set @d=(SELECT TOP 1([PID])
	FROM [dbo].[Pharmacist]
	WHERE [SSD] = @SSN
	ORDER BY [PID] DESC)
	Declare @r nvarchar(max)
	select [Result] 
	from [dbo].[TalbatInfo] 
	where [PID]=@d
END
GO
/****** Object:  StoredProcedure [dbo].[ConcateAttahcments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConcateAttahcments]
	@TalbCode nvarchar(10),
	@STR nvarchar(max) output
AS
BEGIN
	DECLARE @TalbID int;
	SELECT @TalbID = ID 
	FROM TalbatInfo
	WHERE TalbCode = @TalbCode;
	SELECT (SELECT [Name] FROM Attachments WHERE ID = Offline_Attachments.AID) AS AttachmentName INTO #Temp
	FROM TalbatInfo
	INNER JOIN Offline_Attachments
	ON  Offline_Attachments.TalbID = TalbatInfo.ID
	WHERE (TalbatInfo.TalbDate = GetDate() ) 
	AND (Offline_Attachments.TalbID = @TalbID);
	SELECT @STR = SUBSTRING( 
			(
				SELECT ',' + AttachmentName AS 'data()'
				FROM #Temp FOR XML PATH('')
			), 2 , 9999);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssignedTalbat]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssignedTalbat]
@ID INT
AS
BEGIN
	DELETE FROM AssignedTalbat
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAssignedTalbat]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAssignedTalbat]
	@NumOfTasks INT,
	@EmpName NVARCHAR(60)
AS
BEGIN
	INSERT INTO [dbo].[AssignedTalbat] ([EmpID],[NumOfTasks],[AssignDate])
	VALUES ((SELECT EID from Employees where Employees.NameAR = @EMPName),
	@NumOfTasks, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAttachments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAttachments]
	@PID int,
	@TalbID int,
	@Attachments nvarchar(max)
AS 
BEGIN 
	DECLARE @Val nvarchar(max);
	SELECT [value] INTO #Temp 
	FROM STRING_SPLIT(@Attachments, ',');
	-------------------
	WHILE (EXISTS(SELECT * FROM #Temp))
	BEGIN
		SELECT TOP 1 @Val = [value] 
		FROM #Temp;
		------------------
		INSERT INTO Offline_Attachments(PID, AID, TalbID)
		VALUES (@PID,
			   (SELECT CONVERT(int, @Val)),
			   @TalbID);
		----------------
		DELETE FROM #Temp
		WHERE [value] = @Val;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDateAndCapacity]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDateAndCapacity]
	@Date date
AS
BEGIN
	INSERT INTO DaysCapacity ([Date], Capacity)
	VALUES (@Date , 1);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertE3adetTaklefTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertE3adetTaklefTalb]
@QrarNo INT,
@QrarDate DATE,
@Reason NVARCHAR(MAX),
@PID INT
AS
BEGIN
INSERT INTO E3adetTaklefTalb([QrarNo],[QrarDate],[Reason],[PID])
VALUES(@QrarNo,@QrarDate,@Reason,@PID)
RETURN (SELECT IDENT_CURRENT('E3adetTaklefTalb'))
END
GO
/****** Object:  StoredProcedure [dbo].[InsertE3faaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertE3faaTalb]
	@Reason nvarchar(MAX),
	@PID int
AS
BEGIN
	insert into [dbo].[E3faaTalb] ([Reason],[PID])
	values(@Reason, @PID);
	return (SELECT IDENT_CURRENT ('[dbo].[E3faaTalb]'));

END
GO
/****** Object:  StoredProcedure [dbo].[InsertEl8aaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  inserted El8aaTalb
CREATE PROCEDURE [dbo].[InsertEl8aaTalb]
	@QrarNo int,
	@QrarDate date,
	@Reason nvarchar(MAX),
	@PID int
AS
BEGIN

	insert into [dbo].[El8aaTalb] ([QrarNo],[QrarDate],[Reason],[PID])
	values(@QrarNo,@QrarDate,@Reason,@PID)
	return (SELECT IDENT_CURRENT ('[dbo].[El8aaTalb]'));
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee]
	@SSD char(14),
	@NameAR nvarchar(60),
	@Address nvarchar(MAX),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@UserID INT
AS
BEGIN
	INSERT INTO Employees (SSD, NameAR, [Address], Tele1, Tele2,
						  Gender, [Status], DoB, UserID)
	VALUES (@SSD, @NameAR, @Address, @Tele1, @Tele2,
		    @Gender, @Status, @DoB, @UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEst5ragBayan7alaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEst5ragBayan7alaTalb]
@QrarNo INT,
@QrarDate DATE,
@PID INT
AS
BEGIN
INSERT INTO [Est5ragBayan7alaTalb]([QrarNo],[QrarDate],[PID])
VALUES(@QrarNo,@QrarDate,@PID)
RETURN (SELECT IDENT_CURRENT ('Est5ragBayan7alaTalb'))
END
GO
/****** Object:  StoredProcedure [dbo].[InsertHolidays]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHolidays]
	@StartHolidayDate Date, 
	@EndHolidayDate Date,
	@UniID int,
	@UserID int
AS
BEGIN
	INSERT INTO Holidays (StartHolidayDate, EndHolidayDate, PTID, UserID)
	VALUES (@StartHolidayDate, @EndHolidayDate, 
	(SELECT ID FROM PharmacistTaklef WHERE UniID = @UniID),
	@UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertLogin]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLogin]
	@UserName nvarchar(20),
	@Password nvarchar(20),
	@RoleID tinyint,
	@EMPName nvarchar(50),
	@UserID int
	--@IsDeleted bit
AS
BEGIN
	INSERT INTO Login ( UserName, [Password], RID, EmpID, UserID)
	VALUES (@UserName, @Password, @RoleID
		   ,(SELECT EID from Employees where Employees.NameAR=@EMPName),
		   @UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOfflineAttachmentsPart1]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOfflineAttachmentsPart1]
	@PID int,
	@AID tinyint,
	@TalbID int
AS
BEGIN
	INSERT INTO [dbo].[Offline_Attachments] (PID, AID, TalbID)
	VALUES (@PID, @AID, @TalbID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrUpdateCapacity]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrUpdateCapacity]
	@Date DATE
AS
BEGIN
	IF NOT EXISTS(SELECT [Date], Capacity 
				  FROM DaysCapacity
				  WHERE [Date] = @Date )
		EXEC InsertDateAndCapacity @Date
	ELSE 
		EXEC UpdateCapacity @Date
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPharmacist]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPharmacist]
	@SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),
	@Address nvarchar(MAX),
	@GovBirth tinyint,
	@GovStay tinyint,
	@EMail nvarchar(60),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@TotalGrade float,
	@SumE3tbary float,
	@Grade tinyint,
	@TTName tinyint,
	@UserID int,
	@UPID int
AS
BEGIN
	INSERT INTO [dbo].[Pharmacist](SSD, NameAR, NameEN, [Address], GovBirth, GovStay,
							 EMail, Tele1, Tele2, Gender, [Status],
							 DoB, Uni, Section, Dof3a, Doar, TotalGrade, SumE3tbary,
							 Grade, [TTID], UserID, UPID)
	VALUES(@SSD, @NameAR, @NameEN, @Address, 
	       @GovBirth, @GovStay, @EMail, @Tele1, @Tele2, @Gender,
		   @Status, @DoB, @Uni, @Section,
		   @Dof3a, @Doar, @TotalGrade, @SumE3tbary, @Grade,@TTName,
		   @UserID, @UPID)
		   return(SELECT IDENT_CURRENT ('[dbo].[Pharmacist]'));
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPharmacistTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPharmacistTaklef]
	@StartTaklefDate date,
	@EndTaklefDate date,
	@UniID int
AS
BEGIN
	INSERT INTO [dbo].[PharmacistTaklef](StartTaklefDate,EndTaklefDate,UniID)
	VALUES(@StartTaklefDate,@EndTaklefDate,@UniID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPharmcist3Tables]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPharmcist3Tables]
	@SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),   
	@Address nvarchar(MAX),
	@GovBirth tinyint,
	@GovStay tinyint,
	@EMail nvarchar(60),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@TotalGrade float,
	@SumE3tbary float,
	@Grade tinyint,
	@TTID tinyint,
	@From nvarchar(MAX) = NULL,
	@To nvarchar(MAX) = NULL,
	@Reason nvarchar(MAX) = NULL,
	@ActuallDateOfWork date = NULL,
	@QrarNo int = NULL,
	@QrarDate date = NULL,
	@Sa7bQrarNo INT,
	@Sa7bQrarYear SMALLINT,
    @Sa7bQrarFrom NVARCHAR(MAX),
	@Sa7bQrarTo NVARCHAR(MAX),
	@PreviousTaklefQrarNo INT,
	@PreviousTaklefQrarYear SMALLINT,
	@PreviousTaklefTo NVARCHAR(MAX),
	@TalbCode varchar(10),
	@AssignedDate date,
	@IsLagna3lya bit,
	@Attachments nvarchar(max),
	@UserID int,
	@UPID int
AS
BEGIN
	DECLARE @PID int;     -- Pharmacist ID
	DECLARE @RecordID int;-- ID from one of 3 Tables (E-E-T)
	--DECLARE @TTID int;    -- TalbType ID
	DECLARE @TalbID int;  -- TalbatInfo ID
	---------- If Ta3del --------------
	IF(@TTID IN (1,2,7,5,8,10,11))
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into Ta3delTalb -------
			Execute @RecordID = InsertT3delTalb 
						  @From, @To, @Reason,
						  @ActuallDateOfWork, @QrarNo,
						  @QrarDate, @PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
							  @TalbCode, @PID,
							  @TTID, NULL, @RecordID, NULL,NULL,NULL,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments; 
		END
	ELSE IF(@TTID = 6)
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into El8aaTalb -------
			Execute @RecordID = InsertEl8aaTalb 
								@QrarNo, @QrarDate, @Reason, @PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
					          @TalbCode, @PID,
					          @TTID, NULL, NULL, @RecordID,NULL,NULL,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
	ELSE IF(@TTID =3)
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into E3faaTalb -------
			Execute @RecordID =  InsertE3faaTalb
			                     @Reason, @PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
					          @TalbCode, @PID,
					          @TTID, @RecordID, NULL, NULL,NULL,NULL,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
	ELSE IF(@TTID =12)
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into E3adetTaklef -------
			Execute @RecordID =  [InsertE3adetTaklefTalb]
			                     @QrarNo, @QrarDate,@Reason,@PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
					          @TalbCode, @PID,
					          @TTID, NULL, NULL,NULL,@RecordID,NULL,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
		ELSE IF(@TTID =13)
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into Sa7bQrarT3delTaklef -------
			Execute @RecordID =  [InsertSa7bQrarT3delTaklef]
			                    @Sa7bQrarNo,@Sa7bQrarYear,@Sa7bQrarFrom,
								@Sa7bQrarTo,@PreviousTaklefQrarNo,@PreviousTaklefQrarYear,
								@PreviousTaklefTo,@PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
					          @TalbCode, @PID,
					          @TTID, NULL, NULL, NULL,NULL,@RecordID,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
		ELSE IF(@TTID =14)
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into Est5ragBayan7alaTalb -------
			Execute @RecordID = [InsertEst5ragBayan7alaTalb]
			                    @QrarNo,@QrarDate,@PID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
					          @TalbCode, @PID,
					          @TTID, NULL, NULL, NULL,NULL,NULL,@RecordID,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
	ELSE
		BEGIN
			------ Insert Into Pharmacists -------
			Execute @PID = InsertPharmacist 
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB, @Uni, @Section, 
						   @Dof3a, @Doar, @TotalGrade,
						   @SumE3tbary, @Grade, @TTID, @UserID, @UPID;
			------ Insert Into TalbatInfo -------
			Execute @TalbID = InsertTalbatInfoPart1 
							  @TalbCode, @PID,
							  @TTID, NULL, NULL, NULL,NULL,NULL,NULL,@AssignedDate,@IsLagna3lya;
			------ Insert Into Offline_Attahcments -------
			Execute InsertAttachments @PID, @TalbID, @Attachments;
		END
END



GO
/****** Object:  StoredProcedure [dbo].[InsertResult]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertResult]
	@TalbCode nvarchar(max),
	@Result nvarchar(30),
	@Notes nvarchar(max),
	@UserID int
AS 
BEGIN
	DECLARE @ValT nvarchar(10);
	SELECT [value] INTO #TempT 
	FROM STRING_SPLIT(@TalbCode, ',');
	------------------------
	CREATE TABLE #TempN
	(
		[ID] [INT] IDENTITY(1,1) NOT NULL,
		[Value] Nvarchar(max)
	)
	DECLARE @ValN nvarchar(max);
	INSERT INTO #TempN ([Value])
	(SELECT [Value]
		   FROM STRING_SPLIT(@Notes, ','));

	DECLARE @I int;
	SET @I = 1;
	------------------------
	WHILE (EXISTS(SELECT * FROM #TempT) OR EXISTS(SELECT * FROM #TempN))
	BEGIN
		SELECT TOP 1 @ValT = [value] 
		FROM #TempT;
		SELECT TOP 1 @ValN = [value] 
		FROM #TempN;
		-------------------
		UPDATE TalbatInfo
		SET Result = @Result,
			ResultDate = (CONVERT([date],getdate())),
			Notes = @ValN, 
			UserID = @UserID
		WHERE TalbCode = @ValT;
		--------------------
		DELETE FROM #TempT
		WHERE [value] = @ValT;
		DELETE FROM #TempN
		WHERE [ID] = @I;
		SET @I = @I + 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSa7bQrarT3delTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSa7bQrarT3delTaklef]
@Sa7bQrarNo INT,
@Sa7bQrarYear SMALLINT,
@Sa7bQrarFrom NVARCHAR(MAX),
@Sa7bQrarTo NVARCHAR(MAX),
@PreviousTaklefQrarNo INT,
@PreviousTaklefQrarYear SMALLINT,
@PreviousTaklefTo NVARCHAR(MAX),
@PID INT
AS
BEGIN
INSERT INTO Sa7bQrarT3delTaklef([Sa7bQrarNo],[Sa7bQrarYear],[Sa7bQrarFrom],[Sa7bQrarTo],[PreviousTaklefQrarNo],[PreviousTaklefQrarYear],[PreviousTaklefTo],[PID])
VALUES(@Sa7bQrarNo,@Sa7bQrarYear,@Sa7bQrarFrom,@Sa7bQrarTo,@PreviousTaklefQrarNo,@PreviousTaklefQrarYear,@PreviousTaklefTo,@PID)
RETURN (SELECT IDENT_CURRENT('Sa7bQrarT3delTaklef'))
END
GO
/****** Object:  StoredProcedure [dbo].[InsertT3delTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertT3delTalb]
	@From nvarchar(MAX),
	@To nvarchar(MAX),
	@Reason nvarchar(MAX),
	@ActuallDateOfWork date,
	@QrarNo int,
	@QrarDate date,
	@PID int
AS
BEGIN
	insert into [dbo].[T3delTalb] 
	([From],[To],[Reason],
	[ActuallDateOfWork],[QrarNo],
	[QrarDate],[PID])
	values(@From,@To,@Reason,
	@ActuallDateOfWork,@QrarNo,
	@QrarDate,@PID)
	return (SELECT IDENT_CURRENT ('[dbo].[T3delTalb]'));
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTalbatInfoPart1]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTalbatInfoPart1]
	@TalbCode varchar(10),
	@PID int,
	@TTID tinyint,
	@E3faaID int,
	@Ta3delID int,
	@El8aaID int,
	@E3adetTaklefID int,
	@Sa7bQrarID int,
	@Est5ragBayan7alaID int,
	@AssignedDate date,
	@IsLagna3lya bit
AS
BEGIN
	insert into [dbo].[TalbatInfo] ([TalbCode], [PID], [TTID], [RecordE3faaID], 
				[RecordTa3delID], [RecordEl8aaID],[RecordE3adetTaklefID],[RecordSa7bQrarT3deIID],
				[RecordEst5ragBayan7alaID],[AssignedDate],[IsLagna3lya])
	values(@TalbCode, @PID, @TTID, @E3faaID, @Ta3delID, @El8aaID,@E3adetTaklefID,@Sa7bQrarID,
			@Est5ragBayan7alaID,@AssignedDate,@IsLagna3lya);
	RETURN (SELECT IDENT_CURRENT('TalbatInfo'));
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTalbOnline]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTalbOnline]
	@SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),   
	@Address nvarchar(MAX),
	@GovBirth tinyint,
	@GovStay tinyint,
	@EMail nvarchar(60),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@TotalGrade float,
	@SumE3tbary float,
	@Grade tinyint,
	@TTID tinyint,
	@From nvarchar(MAX) = NULL,
	@To nvarchar(MAX) = NULL,
	@Reason nvarchar(MAX) = NULL,
	@ActuallDateOfWork date = NULL,
	@QrarNo int = NULL,
	@QrarDate date = NULL,
	@Sa7bQrarNo INT,
	@Sa7bQrarYear SMALLINT,
    @Sa7bQrarFrom NVARCHAR(MAX),
	@Sa7bQrarTo NVARCHAR(MAX),
	@PreviousTaklefQrarNo INT,
	@PreviousTaklefQrarYear SMALLINT,
	@PreviousTaklefTo NVARCHAR(MAX),
	@AppointmentDate Date,
	@IsLagna3lya bit,
	@UPID int
AS
BEGIN 
	INSERT INTO TalbatOnline(SSD, NameAR, NameEN, [Address], GovBirth, GovStay,
							 EMail, Tele1, Tele2, Gender, [Status],
							 DoB, Uni, Section, Dof3a, Doar, TotalGrade, SumE3tbary,
							 Grade, TTID, EditFrom, EditTo, Reason,
							 ActuallDateOfWork, QrarNo, QrarDate,
							 [Sa7bQrarNo],[Sa7bQrarYear],[Sa7bQrarFrom],[Sa7bQrarTo],
							 [PreviousTaklefQrarNo],[PreviousTaklefQrarYear],[PreviousTaklefTo],
							 AppointmentDate,[IsLagna3lya], UPID)
	VALUES(@SSD, @NameAR, @NameEN, @Address, 
	       @GovBirth,@GovStay, @EMail, @Tele1, @Tele2,
		   @Gender, @Status, @DoB, @Uni, @Section,
		   @Dof3a, @Doar, @TotalGrade, @SumE3tbary, @Grade,
		   @TTID, @From, @To, @Reason,
		   @ActuallDateOfWork, @QrarNo, @QrarDate, @Sa7bQrarNo,
		   @Sa7bQrarYear,@Sa7bQrarFrom,@Sa7bQrarTo,@PreviousTaklefQrarNo,
		   @PreviousTaklefQrarYear,@PreviousTaklefTo,
		   @AppointmentDate,@IsLagna3lya,
		   @UPID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUniPharmacists]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUniPharmacists]
	@SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),
	@Address nvarchar(max),
	@EMail nvarchar(60),
	@GovBirth tinyint,
	@GovStay tinyint,
	@Tele1 char(11),
	@Tele2 char(11), 
	@Gender tinyint,
	@Nationality nvarchar(40),
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@Religion nvarchar(max),
	@SumE3tbary float,
	@TotalGrade float,
	@StdGrade float,
	@Grade tinyint,
	@MkanTaklef nvarchar(max),
	@NoOfQrar int,
	@QrarDate Date,
	@UserID int
AS
BEGIN
	INSERT INTO UniPharmasist (SSD, NameAR, NameEN, [Address],
							  EMail, GovBirth, GovStay, Tele1,
							  Tele2, Gender, Nationality, DoB, 
							  Uni, Section, Dof3a, Doar, Religion, SumE3tbary, TotalGrade,
							  StdGrade, Grade, MkanTaklef, NoOfQrar,QrarDate, UserID)
	VALUES(@SSD, @NameAR, @NameEN, @Address,
		   @EMail, @GovBirth, @GovStay,
		   @Tele1, @Tele2, @Gender,
		   @Nationality, @DoB, @Uni, @Section, 
		   @Dof3a, @Doar, @Religion, @SumE3tbary, @TotalGrade, @StdGrade,
		   @Grade, @MkanTaklef, @NoOfQrar, @QrarDate, @UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateLagnaNo]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUpdateLagnaNo]
	@TalbCode NVARCHAR(MAX),
	@LagnaNo DATE,
	@UserID INT
AS
Begin
	DECLARE @ValT nvarchar(10);
	SELECT [value] INTO #TempT 
	FROM STRING_SPLIT(@TalbCode, ',');
	--------------------
	WHILE (EXISTS(SELECT * FROM #TempT))
	BEGIN
		SELECT TOP 1 @ValT = [value] 
		FROM #TempT;
		--------------
		UPDATE TalbatInfo
		SET LagnaNo = @LagnaNo
		WHERE TalbCode = @ValT;
		--------------
		DELETE FROM #TempT
		WHERE [value] = @ValT;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedE3adetTaklefTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedE3adetTaklefTalb] 
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, QrarNo, QrarDate, Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN  E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo );
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedE3faa]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedE3faa]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved ,ApproveDate, TalbDate, Result , 
		   CAST(ResultDate AS DATE) AS ResultDate,
		   LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedEl8aa]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedEl8aa]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, QrarNo, QrarDate, Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE TalbatInfo.Result = 'مقبول' 
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedEst5ragBayan7alaTalb]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedEst5ragBayan7alaTalb]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN  Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedSa7bQrarT3delTaklef]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedSa7bQrarT3delTaklef]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, Sa7bQrarNo, Sa7bQrarYear, 
		   Sa7bQrarFrom, Sa7bQrarTo, PreviousTaklefQrarNo, 
		   PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN  Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAcceptedT3del]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAcceptedT3del]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes,
		   [From], [To], Reason, ActuallDateOfWork, QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllEmpByRole]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllEmpByRole]
	@RoleID tinyint
AS
BEGIN
	SELECT DISTINCT EID, SSD, NameAR, Address, Tele1, Tele2, 
	       Gender, Status, DoB, (SELECT [Name] FROM [dbo].[Roles] 
		   WHERE [dbo].[Login].RID = [dbo].[Roles].ID) AS RoleName
	FROM Employees 
	LEFT JOIN [dbo].[Login]
	ON  [dbo].[Employees].EID = [dbo].[Login].[EmpID]
	WHERE (@RoleID = [dbo].[Login].RID)
		   AND ([dbo].[Employees].[IsDeleted] = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAssignedTalbat]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAssignedTalbat]
@EmpName NVARCHAR(60)
AS
BEGIN
	SELECT 	[ID],[NumOfTasks],[AssignDate], [NumOfTasksDone],[DoneDate]
	FROM [dbo].[AssignedTalbat]
		WHERE [EmpID] = (SELECT EID FROM [Employees] WHERE NameAR = @EmpName)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAttachments]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAttachments]
AS
BEGIN
	SELECT [Name] FROM Attachments;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAttachmentsByTalbCode]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAttachmentsByTalbCode]
	@TalbCode nvarchar(10)
AS
BEGIN
	DECLARE @STR nvarchar(max);
	CREATE Table #TalbAttach(
		TalbCode nvarchar(10),
		Attachment nvarchar(max)
	)
	
	---- Concat
	EXEC ConcateAttahcments @TalbCode, @STR output
	---- Insert TalbAttach
	INSERT INTO #TalbAttach (TalbCode, Attachment)
	VALUES(@TalbCode, @STR);
	
	--- Join with TempAttach
	SELECT #TalbAttach.TalbCode, (SELECT NameAR FROM Pharmacist WHERE PID = TalbatInfo.PID) AS [Name], 
	(SELECT [Name] FROM TalbatTypes WHERE ID = TalbatInfo.TTID) AS TTID
	,TalbDate, Attachment
	FROM TalbatInfo
	INNER JOIN #TalbAttach
	ON #TalbAttach.TalbCode = TalbatInfo.TalbCode COLLATE DATABASE_DEFAULT
	WHERE TalbatInfo.TalbDate = GetDate();
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByDeletedOperation]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByDeletedOperation]
AS
BEGIN
	SELECT ID,(SELECT UserName from Login WHERE Login.ID = DBOperations.UID) 
	as UserName,Operation,RecordName,TableName,Date FROM DBOperations
	WHERE Operation = 'حذف';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByInsertedOperation]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByInsertedOperation]
AS
BEGIN
	SELECT ID,
	(SELECT UserName from Login WHERE Login.ID = DBOperations.UID) 
	as UserName,Operation,RecordName,TableName,Date FROM DBOperations
	WHERE Operation = 'إضافة';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByLagnaNo]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByLagnaNo]
@LagnaNo DATE
AS
BEGIN
---------------
	 SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result , 
		   ResultDate, LagnaNo, ISNULL(Notes, 'لا يوجد') AS Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		   
		   ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)), CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   WHERE TalbatInfo.LagnaNo = @LagnaNo;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByPhNameAR]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByPhNameAR]
	@NameAR NVARCHAR(60)
AS
BEGIN
	SELECT SSD, NameAR, NameEN,[Address],
	(SELECT [NAME] FROM Governments WHERE ID = [dbo].[Pharmacist].GovBirth) AS GovBirth,
	(SELECT [NAME] FROM Governments WHERE ID = [dbo].[Pharmacist].GovStay) AS GovStay,
	EMail, [Tele1], [Tele2],
	(SELECT [NAME] FROM Gender WHERE ID = [dbo].[Pharmacist].Gender) AS Gender,
	(SELECT [NAME] FROM [dbo].[Status] WHERE ID = [dbo].[Pharmacist].[Status]) AS [Status],
	[DoB],
	(SELECT [NAME] FROM Universtiy WHERE ID = [dbo].[Pharmacist].[Uni])AS Uni,
	(SELECT [NAME] FROM Section WHERE ID = [dbo].[Pharmacist].Section) AS Section ,
	[Dof3a], [Doar], [TotalGrade], [SumE3tbary],
	(SELECT [NAME] FROM Grades WHERE ID = [dbo].[Pharmacist].Grade) AS Grade,
	(SELECT [NAME] FROM [dbo].[TalbatTypes] WHERE ID = [dbo].[Pharmacist].TTID) AS TTID,
	[UserID]
	FROM  [dbo].[Pharmacist]
	WHERE (NameAR LIKE '%%'+@NameAR+'%%');
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByPhNameEN]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByPhNameEN]
	@NameEN NVARCHAR(60)
AS
BEGIN
	SELECT SSD, NameAR, NameEN,[Address],
	(SELECT [NAME] FROM Governments WHERE ID = [dbo].[Pharmacist].GovBirth) AS GovBirth,
	(SELECT [NAME] FROM Governments WHERE ID = [dbo].[Pharmacist].GovStay) AS GovStay,
	EMail, [Tele1], [Tele2],
	(SELECT [NAME] FROM Gender WHERE ID = [dbo].[Pharmacist].Gender) AS Gender,
	(SELECT [NAME] FROM [dbo].[Status] WHERE ID = [dbo].[Pharmacist].[Status]) AS [Status],
	[DoB],
	(SELECT [NAME] FROM Universtiy WHERE ID = [dbo].[Pharmacist].[Uni])AS Uni,
	(SELECT [NAME] FROM Section WHERE ID = [dbo].[Pharmacist].Section) AS Section ,
	[Dof3a], [Doar], [TotalGrade], [SumE3tbary],
	(SELECT [NAME] FROM Grades WHERE ID = [dbo].[Pharmacist].Grade) AS Grade,
	(SELECT [NAME] FROM [dbo].[TalbatTypes] WHERE ID = [dbo].[Pharmacist].TTID) AS TTID,
	[UserID]
	FROM  [dbo].[Pharmacist]
	WHERE [NameEN] = @NameEN;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectByUpdatedOperation]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByUpdatedOperation]
AS
BEGIN
	SELECT ID,(SELECT UserName from Login WHERE Login.ID = DBOperations.UID)
	as UserName,Operation,RecordName,TableName,Date FROM DBOperations
	WHERE Operation = 'تعديل';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByAcceptedResult]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByAcceptedResult] 
@DateFrom Date,
@DateTo Date
AS
BEGIN
    SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , CAST(TalbDate AS DATE) AS TalbDate , Result , 
		   CAST(ResultDate AS DATE) AS ResultDate , LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE TalbatInfo.Result = 'مقبول'
		   AND (TalbDate >= CAST(@DateFrom AS DATE) AND TalbDate <= CAST(@DateTo AS DATE));
END

GO
/****** Object:  StoredProcedure [dbo].[SelectDataByLagnaNoAndAcceptedResult]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByLagnaNoAndAcceptedResult]
@LagnaNo DATE
AS
BEGIN
    SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result, ResultDate, LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE TalbatInfo.LagnaNo = @LagnaNo  AND Result='مقبول';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByLagnaNoAndNotAcceptedResult]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByLagnaNoAndNotAcceptedResult]
	@LagnaNo DATE
AS
BEGIN
    SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate, LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE TalbatInfo.LagnaNo = @LagnaNo  AND Result='غير مقبول';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByName]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByName]
	@Name NVARCHAR(60)
AS
BEGIN
SELECT DISTINCT
		TOP 1   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , CAST(TalbDate AS DATE) AS TalbDate , Result , 
		   CAST(ResultDate AS DATE) AS ResultDate , LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE (NameAR = @Name)
		   ORDER BY PID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByNotAcceptedResult]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByNotAcceptedResult]
	@DateFrom Date,
	@DateTo Date
AS
BEGIN
----------------
	   SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , CAST(TalbDate AS DATE) AS TalbDate , Result , 
		   CAST(ResultDate AS DATE) AS ResultDate , LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
	
	 

GO
/****** Object:  StoredProcedure [dbo].[SelectDataBySSD]    Script Date: 4/23/2024 10:32:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataBySSD]
	@SSD CHAR(14)
AS
BEGIN
SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , CAST(TalbDate AS DATE) AS TalbDate , Result , 
		   CAST(ResultDate AS DATE) AS ResultDate , LagnaNo, Notes,
		   ISNULL([From], 'غير مطلوب لهذا الطلب') AS [From], ISNULL([To], 'غير مطلوب لهذا الطلب') AS [To], 
		    ISNULL(ISNULL(ISNULL(ISNULL([dbo].[T3delTalb].Reason, [dbo].[El8aaTalb].Reason),
		   [dbo].[E3faaTalb].Reason),[dbo].[E3adetTaklefTalb].Reason), 'غير مطلوب لهذا الطلب') AS Reason,
		   ISNULL(CAST(ActuallDateOfWork AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS ActualDateOfWork, 
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarNo AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarNo AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarNo AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarNo,
		   ISNULL(ISNULL(ISNULL(CAST([dbo].[El8aaTalb].QrarDate AS nvarchar(max)),CAST([dbo].[T3delTalb].QrarDate AS nvarchar(max))),CAST([dbo].[E3adetTaklefTalb].QrarDate AS nvarchar(max))), 'غير مطلوب لهذا الطلب') AS QrarDate,
		   ISNULL(CAST(Sa7bQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarNo,
		   ISNULL(CAST(Sa7bQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarYear,
		   ISNULL(CAST(Sa7bQrarFrom AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarFrom,
		   ISNULL(CAST(Sa7bQrarTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS Sa7bQrarTo,
		   ISNULL(CAST(PreviousTaklefQrarNo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefQrarYear AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefQrarNo,
		   ISNULL(CAST(PreviousTaklefTo AS nvarchar(max)), 'غير مطلوب لهذا الطلب') AS PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist ON  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo ON TalbID = ID
		   LEFT JOIN T3delTalb ON T3delTalb.PID = Pharmacist.PID
		   LEFT JOIN El8aaTalb ON El8aaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3faaTalb ON E3faaTalb.PID = Pharmacist.PID
		   LEFT JOIN E3adetTaklefTalb ON E3adetTaklefTalb.PID = Pharmacist.PID
		   LEFT JOIN Est5ragBayan7alaTalb ON Est5ragBayan7alaTalb.PID = Pharmacist.PID
		   LEFT JOIN Sa7bQrarT3delTaklef ON Sa7bQrarT3delTaklef.PID = Pharmacist.PID
		   WHERE Pharmacist.SSD = @SSD;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByTalbCode]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByTalbCode]
	@TalbCode nvarchar(50)
AS
BEGIN
---------------
	if ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode))=3)
	BEGIN
	SELECT DISTINCT
		  [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
-----------------------------------------------------
	ELSE IF ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode))= 6)
	BEGIN
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
	-----------------------------------------------------
	ELSE IF ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode))= 12)
	BEGIN
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
		-----------------------------------------------------
	ELSE IF ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode))= 13)
	BEGIN
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
			-----------------------------------------------------
	ELSE IF ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode))= 14)
	BEGIN
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes , QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
-----------------------------------------------------
	ELSE IF ((SELECT TTID FROM Pharmacist WHERE Pharmacist.PID =(SELECT PID FROM TalbatInfo WHERE TalbCode = @TalbCode)) in(1,2,5,7,8,10,11))
	BEGIN
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   [From],[To],Reason,ActuallDateOfWork,QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE TalbatInfo.TalbCode = @TalbCode;   
	END

-----------------------------------------------------
	ELSE
	SELECT DISTINCT
		    [dbo].[Pharmacist].PID,TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   WHERE TalbatInfo.TalbCode = @TalbCode;
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByTalbType]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByTalbType]
	@TalbID int
AS
BEGIN
----------------
	if ((@TalbID) =3)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID;

	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) in(1,2,5,7,8,10,11))
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes ,
		   [From],[To],Reason,ActuallDateOfWork,QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE (@TalbID) = pharmacist.TTID;

	END
	------------------------------------------------------
	ELSE IF ((@TalbID) = 12)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID;

	END
		-----------------------------------------------------
	ELSE IF ((@TalbID) = 13)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes ,
		   Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE (@TalbID) = pharmacist.TTID;
	END
			-----------------------------------------------------
	ELSE IF ((@TalbID) = 14)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , 
		   Notes , QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID;
	END
-----------------------------------------------------
	ELSE
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   WHERE (@TalbID) = pharmacist.TTID;
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByTalbTypeAndAcceptedResult]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByTalbTypeAndAcceptedResult]
	@DateFrom Date,
	@DateTo Date,
	@TalbID INT
AS
BEGIN
----------------
	if ((@TalbID) =3)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
-----------------------------------------------------
	ELSE IF ((@TalbID) = 6)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 12)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 13)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		  Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 14)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   Notes , QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
-----------------------------------------------------
	ELSE IF ((@TalbID) in(1,2,5,7,8,10,11))
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   [From],[To],Reason,ActuallDateOfWork,QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END

-----------------------------------------------------
	ELSE
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByTalbTypeAndDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByTalbTypeAndDate]
	@TalbID int,
	@DateFrom date,
	@DateTo date
AS
BEGIN
----------------
	if ((@TalbID) =3)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 6)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 12)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 13)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		    Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
	-----------------------------------------------------
	ELSE IF ((@TalbID) = 14)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   Notes , QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
-----------------------------------------------------
	ELSE IF ((@TalbID) in(1,2,5,7,8,10,11))
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes ,
		   [From],[To],Reason,ActuallDateOfWork,QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
	END
-----------------------------------------------------
	ELSE
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , LagnaNo, Notes
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   WHERE (@TalbID) = pharmacist.TTID
		   AND TalbDate >= @DateFrom AND  TalbDate <= @DateTo;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDataByTalbTypeAndNotAcceptedResult]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDataByTalbTypeAndNotAcceptedResult]
	@DateFrom Date,
	@DateTo Date,
	@TalbID int
AS
BEGIN
----------------
	if ((@TalbID) =3)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
-----------------------------------------------------
	ELSE IF ((@TalbID) = 6)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   QrarNo,QrarDate,Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
-----------------------------------------------------
	ELSE IF ((@TalbID) in(1,2,5,7,8,10,11))
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes ,
		   [From],[To],Reason,ActuallDateOfWork,QrarNo,QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
	
	 		-----------------------------------------------------
	ELSE IF ((@TalbID) = 13)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , Notes ,
		   Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
			-----------------------------------------------------
	ELSE IF ((@TalbID) = 14)
	BEGIN
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate , 
		   Notes , QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on Offline_Attachments.TalbID = TalbatInfo.ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
-----------------------------------------------------
	ELSE
	SELECT DISTINCT
		   TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],
			DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TalbType,
		   Approved , ApproveDate , TalbDate , Result , ResultDate ,LagnaNo, Notes
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   WHERE ((@TalbID) = pharmacist.TTID)
		   AND (Result='غير مقبول') AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectDateCapacity]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDateCapacity]
	@Date date
AS
BEGIN
	SELECT Capacity
	FROM DaysCapacity
	WHERE [Date] = @Date;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDeletedOperationByDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDeletedOperationByDate] 
	@From DATE,
	@TO   DATE
AS
BEGIN
	SELECT ID,(SELECT UserName from Login WHERE Login.ID = DBOperations.UID) 
	as UserName,Operation,RecordName,TableName, [dbo].[DBOperations].Date FROM DBOperations
	WHERE Operation = 'حذف' 
	AND (Date >= @From AND Date <= @TO)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmpByName]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectEmpByName]
	@NameAR nvarchar(60)
AS
BEGIN
	SELECT EID, SSD, NameAR, Address, Tele1, Tele2, 
		   Gender, Status, DoB, (SELECT [Name] FROM [dbo].[Roles] 
		   WHERE [dbo].[Login].RID = [dbo].[Roles].ID) AS RoleName
	FROM Employees 
	LEFT JOIN [dbo].[Login]
	ON  [dbo].[Employees].EID= [dbo].[Login].[ID]
	WHERE (NameAR LIKE '%%'+@NameAR+'%%')
	AND ([dbo].[Employees].[IsDeleted] = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmpBySSD]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectEmpBySSD]
	@SSN varchar(14)
AS
BEGIN
	SELECT EID, SSD, NameAR, Address, Tele1, Tele2, 
		   Gender, Status, DoB, (SELECT [Name] FROM [dbo].[Roles] 
		   WHERE [dbo].[Login].RID = [dbo].[Roles].ID) AS RoleName
	FROM Employees 
	LEFT JOIN [dbo].[Login]
	ON  [dbo].[Employees].EID= [dbo].[Login].[ID]
	WHERE (SSD = @SSN)
	AND ([dbo].[Employees].[IsDeleted] = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEndTaklefDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectEndTaklefDate]
	@SSD char(14)
AS
BEGIN
	SELECT EndTaklefDate FROM PharmacistTaklef
	WHERE UniID = (SELECT ID FROM UniPharmasist WHERE SSD = @SSD);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectGender]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectGender]
AS
BEGIN
	SELECT [Name] FROM Gender;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectGovernments]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectGovernments]
AS
BEGIN
	SELECT [Name] FROM Governments;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectGrades]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectGrades]
AS
BEGIN
	SELECT [Name] FROM Grades;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectInsertedOperationByDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectInsertedOperationByDate] 
@From DATE,
@TO DATE
AS
BEGIN
	SELECT ID,
	(SELECT UserName from Login WHERE Login.ID = DBOperations.UID) 
	as UserName,Operation,RecordName,TableName,Date FROM DBOperations
	WHERE (Operation = 'إضافة') 
	AND DATE >= @From AND  Date <= @TO ;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectLoginByUserNameAndPass]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectLoginByUserNameAndPass]
@UserName nvarchar(20),
@Password nvarchar(20)
AS
BEGIN
	SELECT [ID], [RID] FROM [dbo].[Login]
	WHERE [UserName] = @UserName 
	AND [Password] = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[SelectMaxCapacity]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectMaxCapacity]
AS
BEGIN
	SELECT [Value] 
	FROM Counter
	WHERE ID = 2;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNamesOfEmps]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNamesOfEmps]
AS
BEGIN
	SELECT EID, [NameAR] 
	FROM Employees;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedE3adetTaklefTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedE3adetTaklefTalb]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, QrarNo, QrarDate, Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN E3adetTaklefTalb on Pharmacist.PID = E3adetTaklefTalb.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedE3faa]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedE3faa]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS University,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes,
		   Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN E3faaTalb on Pharmacist.PID = E3faaTalb.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedEl8aa]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedEl8aa]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, 
		   CAST(ResultDate AS DATE) AS ResultDate, LagnaNo, Notes,
		   QrarNo, CAST(QrarDate AS DATE) AS QrarDate, Reason
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN El8aaTalb on Pharmacist.PID = El8aaTalb.PID
		   WHERE TalbatInfo.Result = 'غير مقبول' 
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedEst5ragBayan7alaTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedEst5ragBayan7alaTalb]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result, ResultDate,
		   LagnaNo, Notes, QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN Est5ragBayan7alaTalb on Pharmacist.PID = Est5ragBayan7alaTalb.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedSa7bQrarT3delTaklef]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedSa7bQrarT3delTaklef]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved , ApproveDate, TalbDate, Result ,ResultDate,
		   LagnaNo, Notes, Sa7bQrarNo, Sa7bQrarYear,
		   Sa7bQrarFrom, Sa7bQrarTo, 
		   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN Sa7bQrarT3delTaklef on Pharmacist.PID = Sa7bQrarT3delTaklef.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbDate >= @DateFrom AND TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNotAcceptedT3del]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNotAcceptedT3del]
@DateFrom Date,
@DateTo Date
AS
BEGIN
	SELECT DISTINCT
		   [dbo].[Pharmacist].PID, TalbCode,SSD, NameAR, NameEN, [Address],
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovBirth) AS GovBirth,
		   (SELECT [NAME] FROM Governments WHERE ID = pharmacist.GovStay) AS GovStay,
		   EMail, Tele1, Tele2,
		   (SELECT [NAME] FROM Gender WHERE ID = pharmacist.gender) AS Gender,
		   (SELECT [NAME] FROM [Status] WHERE ID = pharmacist.Status) AS [Status],DoB,
		   (SELECT [NAME] FROM Universtiy WHERE ID = pharmacist.uni) AS Uni,
		   (SELECT [NAME] FROM Section WHERE ID = pharmacist.section) AS Section,
		   Dof3a, Doar, TotalGrade, SumE3tbary,
		   (SELECT [NAME] FROM Grades WHERE ID = pharmacist.Grade) AS Grade,
		   (SELECT [NAME] FROM TalbatTypes WHERE ID = pharmacist.TTID) AS TTID,
		   Approved, ApproveDate, TalbDate, Result ,
		   CAST(ResultDate AS DATE) AS ResultDate, LagnaNo, Notes,
		   [From], [To], Reason, ActuallDateOfWork, QrarNo, QrarDate
		   FROM Offline_Attachments 
		   INNER JOIN pharmacist on  Offline_Attachments.PID = pharmacist.PID 
		   INNER JOIN TalbatInfo on TalbID = ID
		   INNER JOIN T3delTalb on T3delTalb.PID = Pharmacist.PID
		   WHERE TalbatInfo.Result = 'غير مقبول'
		   AND (TalbatInfo.TalbDate >= @DateFrom AND TalbatInfo.TalbDate <= @DateTo);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOnlineDataByName]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOnlineDataByName] 
@NameAR NVARCHAR(60)
AS
BEGIN
	IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%'))=3)
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID, 
			   TalbDate, Reason, 
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR =@NameAR);
	END
	---------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%'))=6)
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID, 
			   TalbDate, Reason, QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%'))=12)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID,
			   QrarNo, QrarDate, Reason, AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%'))=13)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID,
			   Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
			   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo,
			   			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
		-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%')) = 14)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID,
			   QrarNo, QrarDate, AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE (NameAR LIKE '%%'+@NameAR+'%%'))in(1,2,5,7,8,10,11))
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID, 
			   EditFrom, EditTo,
			   TalbDate, Reason, ActuallDateOfWork , QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
	ELSE
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Uni,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TTID, 
			   TalbDate, AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (NameAR LIKE '%%'+@NameAR+'%%');
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOnlineDataBySSD]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOnlineDataBySSD] 
@SSD CHAR(14)
AS
BEGIN
	IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD)=3)
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Reason, 
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
	---------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD)=6)
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Reason, QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD)=12)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType,
			   QrarNo, QrarDate, Reason, AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD)=13)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType,
			   Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
			   PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
			   			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
		-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD) = 14)
	BEGIN
	SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType,
			   QrarNo, QrarDate, AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
	-----------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE SSD =@SSD)in(1,2,5,7,8,10,11))
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   EditFrom, EditTo,
			   TalbDate, Reason, ActuallDateOfWork , QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
	ELSE
	BEGIN
		SELECT SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (SSD = @SSD);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOperationsOfEmpByDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOperationsOfEmpByDate] 
	@From DATE,
	@TO   DATE,
	@EmpID INT
AS
BEGIN
	SELECT ID,(SELECT UserName FROM [Login] WHERE [Login].ID = DBOperations.[UID]) 
	as UserName,Operation,RecordName,TableName, [dbo].[DBOperations].[Date] 
	FROM DBOperations
	WHERE ([Date] >= @From AND [Date] <= @TO) 
	AND (@EmpID = (SELECT EmpID FROM [Login] WHERE ID = DBOperations.[UID]));
END
GO
/****** Object:  StoredProcedure [dbo].[SelectResultForEmployee]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectResultForEmployee]
	@TALBCODE VARCHAR(10)
AS
BEGIN 
	SELECT TalbCode,
	(SELECT [NAMEAR] FROM Pharmacist WHERE Pharmacist.PID = TalbatInfo.PID) AS Name,
	(SELECT [NAME] FROM TalbatTypes WHERE TTID = ID) AS TalbType,
	Result, LagnaNo FROM TalbatInfo
	WHERE TalbCode = @TALBCODE;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectResultForPharmacist]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectResultForPharmacist]
	@TALBCODE VARCHAR(10)
AS
BEGIN 
	SELECT  TalbCode ,
	(SELECT [NAMEAR] FROM Pharmacist WHERE Pharmacist.PID = TalbatInfo.PID) AS Name,
	(SELECT SSD FROM Pharmacist WHERE Pharmacist.PID = TalbatInfo.PID) AS SSD,
	(SELECT [NAME] FROM TalbatTypes WHERE TalbatInfo.TTID = TalbatTypes.ID) AS TalbType,
	Result FROM TalbatInfo
	WHERE TalbCode = @TALBCODE;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectRoles]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectRoles]
AS
BEGIN
	SELECT [Name] FROM Roles;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectSection]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSection]
AS
BEGIN
	SELECT [Name] FROM Section;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStatus]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStatus]
AS
BEGIN
	SELECT [Name] FROM Status;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTalbatTypes]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTalbatTypes]
AS
BEGIN
	SELECT [Name] FROM TalbatTypes;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTalbOnlineByTalbCode]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTalbOnlineByTalbCode]
	@TalbCode varchar(10)
AS
BEGIN
	IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)=3)
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Reason, 
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
	------------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)=6)
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Reason, QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
	-------------------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)=12)
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Reason, QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
		-------------------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)=13)
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, Sa7bQrarNo, Sa7bQrarYear, Sa7bQrarFrom, Sa7bQrarTo,
		       PreviousTaklefQrarNo, PreviousTaklefQrarYear, PreviousTaklefTo
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
		-------------------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)=14)
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
	-------------------------------------------------------------------------------
	ELSE IF((SELECT TTID FROM [dbo].[TalbatOnline] WHERE TalbCode =@TalbCode)in(1,2,5,7,8,10,11))
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   EditFrom, EditTo,
			   TalbDate, Reason, ActuallDateOfWork , QrarNo, QrarDate,
			   AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
	ELSE
	BEGIN
		SELECT PID, SSD, NameAR, NameEN, [Address], 
			   (SELECT [Name] FROM Governments WHERE GovBirth = ID) AS GovBirth,
			   (SELECT [Name] FROM Governments WHERE GovStay = ID) AS GovStay,
			   EMail, Tele1, Tele2,
			   (SELECT [Name] FROM Gender WHERE Gender = ID) AS Gender,
			   (SELECT [Name] FROM [Status] WHERE [Status] = ID) AS [Status],
			    DoB,
			   (SELECT [Name] FROM Universtiy WHERE Uni = ID) AS Unversity,
			   (SELECT [Name] FROM Section WHERE Section = ID) AS Section,
			   Dof3a, Doar, TotalGrade, SumE3tbary,
			   (SELECT [Name] FROM Grades WHERE Grade = ID) AS Grade, 
			   (SELECT [Name] FROM TalbatTypes WHERE TTID = ID) AS TalbType, 
			   TalbDate, AppointmentDate, TalbCode, IsRecived 
		FROM TalbatOnline
		WHERE (TalbCode = @TalbCode);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTodayAttachments]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTodayAttachments]
AS
BEGIN
	DECLARE @STR nvarchar(max);
	DECLARE @Talb nvarchar(10);
	CREATE Table #TalbAttach(
		TalbCode nvarchar(10),
		Attachment nvarchar(max)
	)
	SELECT DISTINCT TalbCode INTO #TempTalb
	FROM TalbatInfo
	INNER JOIN Pharmacist 
	ON TalbatInfo.PID = Pharmacist.PID
	INNER JOIN Offline_Attachments
	ON TalbatInfo.ID = Offline_Attachments.TalbID
	WHERE TalbatInfo.TalbDate = GetDate();
	WHILE(EXISTS(SELECT * FROM #TempTalb))
	BEGIN
		---- Select TalbCode
		SELECT TOP 1 @Talb = TalbCode FROM #TempTalb;
		---- Concat
		EXEC ConcateAttahcments @Talb, @STR output
		---- Insert TalbAttach
		INSERT INTO #TalbAttach (TalbCode, Attachment)
		VALUES(@Talb, @STR);
		---- Delete TalbCode
		DELETE FROM #TempTalb
		WHERE TalbCode = @Talb;
	END
	--- Join with TempAttach
	SELECT #TalbAttach.TalbCode, (SELECT NameAR FROM Pharmacist WHERE PID = TalbatInfo.PID) AS [Name], 
	(SELECT [Name] FROM TalbatTypes WHERE ID = TalbatInfo.TTID) AS TalbType
	,TalbDate, Attachment
	FROM TalbatInfo
	INNER JOIN #TalbAttach
	ON #TalbAttach.TalbCode = TalbatInfo.TalbCode COLLATE DATABASE_DEFAULT
	WHERE TalbatInfo.TalbDate = GetDate();
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUniByQrarNo]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUniByQrarNo] 
@QrarNo int
AS
BEGIN
	SELECT [ID], [SSD], [NameAR], [NameEN], [Address], [EMail],[GovBirth], [GovStay],
	[Tele1], [Tele2], [Gender], [Nationality], [DoB], [Uni], [Section], [Dof3a],
	[Doar], [Religion], [SumE3tbary], [TotalGrade], [Grade], [MkanTaklef], [NoOfQrar],[QrarDate],[UserID]
	FROM [dbo].[UniPharmasist] WHERE [UniPharmasist].NoOfQrar= @QrarNo
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUniBySSD]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUniBySSD]
	@SSD NVARCHAR(14)
AS
BEGIN
	SELECT ID, SSD,NameAR,NameEN,[Address],EMail,
	(SELECT [NAME] FROM Governments WHERE ID = [UniPharmasist].GovBirth) AS GovBirth,
	(SELECT [NAME] FROM Governments WHERE ID = [UniPharmasist].GovStay) AS GovStay,
	[Tele1],[Tele2],
	(SELECT [NAME] FROM Gender WHERE ID = [UniPharmasist].Gender) AS Gender,
	[Nationality],[DoB],
	(SELECT [NAME] FROM Universtiy WHERE ID = [UniPharmasist].[Uni])AS Uni,
	(SELECT [NAME] FROM Section WHERE ID = [UniPharmasist].Section) AS Section ,
	[Dof3a],[Doar],[Religion],[SumE3tbary],[TotalGrade],[StdGrade] ,
	(SELECT [NAME] FROM Grades WHERE ID = [UniPharmasist].Grade) AS Grade,
	[MkanTaklef],[NoOfQrar],[QrarDate],[UserID]
	FROM UniPharmasist 
	WHERE SSD = @SSD;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUpdatedOperationByDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUpdatedOperationByDate] 
	@From DATE,
	@TO   DATE
AS
BEGIN
	SELECT ID,(SELECT UserName from Login WHERE Login.ID = DBOperations.UID) 
	as UserName,Operation,RecordName,TableName, [dbo].[DBOperations].Date FROM DBOperations
	WHERE Operation = 'تعديل' 
	AND (Date >= @From AND Date <= @TO)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssignedDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAssignedDate]
@AssignedDate DATE,
@PID INT
AS
BEGIN
	UPDATE [dbo].[TalbatInfo]
		SET [AssignedDate] = @AssignedDate
	WHERE PID = @PID

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssignedTalbat]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAssignedTalbat]
	@NumOfTasks INT,
	@EmpName NVARCHAR(60),
	@ID INT
AS
BEGIN
UPDATE [AssignedTalbat]
SET [NumOfTasks] = @NumOfTasks , 
	[AssignDate] = GETDATE(),
	[EmpID] = (SELECT EID from Employees where Employees.NameAR = @EMPName)
WHERE [ID] =  @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCapacity]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCapacity]
	@Date date
AS
BEGIN
	Update DaysCapacity 
	SET Capacity = Capacity + 1
	WHERE [Date] = @Date;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCounter]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCounter]
	@Count int
AS
BEGIN
	UPDATE [Counter] SET [Value] = @Count WHERE ID = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDeleteEmp]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDeleteEmp]
@EmpID INT
AS
BEGIN
UPDATE [dbo].[Employees]
set [IsDeleted] = 1
WHERE [EID] = @EmpID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDeleteLogin]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDeleteLogin]
@EmpID INT
AS
BEGIN
	UPDATE [dbo].[Login]
	SET [IsDeleted] = 1
	WHERE [dbo].[Login].[EmpID] = @EmpID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateE3adetTaklefTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateE3adetTaklefTalb]
@QrarNo INT,
@QrarDate DATE,
@Reason NVARCHAR(MAX),
@PID INT
AS
BEGIN
UPDATE E3adetTaklefTalb
SET [QrarNo] = @QrarNo,
	[QrarDate] = @QrarDate,
	[Reason] = @Reason
WHERE PID = @PID
RETURN (SELECT IDENT_CURRENT ('UpdateE3adetTaklefTalb'))
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateE3faaTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateE3faaTalb]
	@Reason nvarchar(MAX),
	@PID int
AS
BEGIN
	UPDATE [E3faaTalb]
	SET [Reason] = @Reason
	WHERE PID = @PID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEl8aaTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEl8aaTalb]
	@QrarNo int,
	@QrarDate date,
	@Reason nvarchar(MAX),
	@PID int
AS
BEGIN
	UPDATE [El8aaTalb]
	SET [QrarNo] = @QrarNo,
		[QrarDate] = @QrarDate,
		[Reason] = @Reason
	WHERE PID = @PID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
	@SSD char(14),
	@NameAR nvarchar(60),
	@Address nvarchar(MAX),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@UserID INT,
	@EmpID INT
AS
BEGIN

	UPDATE Employees  
	SET SSD = @SSD, NameAR= @NameAR, Address= @Address, 
		Tele1= @Tele1, Tele2= @Tele2,
		   Gender = @Gender, 
		  Status = @Status,
		   DoB = @DoB, UserID = @UserID
		   WHERE [dbo].[Employees].[EID]  = @EmpID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEst5ragBayan7alaTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEst5ragBayan7alaTalb]
@QrarNo INT,
@QrarDate DATE,
@PID INT
AS
BEGIN
UPDATE [Est5ragBayan7alaTalb]
SET [QrarNo] = @QrarNo,
	[QrarDate] = @QrarDate
WHERE [PID] = @PID
RETURN (SELECT IDENT_CURRENT ('Est5ragBayan7alaTalb'))
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsActive]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsActive] 
@ID int
AS
BEGIN
	UPDATE [dbo].[Login]
	SET [IsActive] = 1
	WHERE [dbo].[Login].ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsBlocked]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsBlocked]
@EmpName nvarchar(60)
AS
BEGIN
	UPDATE [dbo].[Login]
	SET IsBlocked = 1
	WHERE [dbo].[Login].[EmpID]=(SELECT [dbo].[Employees].EID FROM [dbo].[Employees] WHERE [NameAR]=@EmpName)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsLagna3lya]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsLagna3lya]
	@ID INT
AS
	BEGIN
	UPDATE [dbo].[TalbatInfo]
	SET [IsLagna3lya] = 1
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsNotActive]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsNotActive] 
@ID int
AS
BEGIN
	UPDATE [dbo].[Login]
	SET [IsActive] = 0
	WHERE [dbo].[Login].ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsNotBlocked]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsNotBlocked]
@EmpName nvarchar(60)
AS
BEGIN
	UPDATE [dbo].[Login]
	SET IsBlocked = 0
	WHERE [dbo].[Login].[EmpID]=(SELECT [dbo].[Employees].EID FROM [dbo].[Employees] WHERE [NameAR]=@EmpName)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsNotRecieved]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsNotRecieved]
	@ID INT
AS
BEGIN
UPDATE [dbo].[TalbatOnline]
SET [IsRecived] = 0
WHERE PID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsRecieved]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsRecieved]
	@ID INT
AS
BEGIN
UPDATE [dbo].[TalbatOnline]
SET [IsRecived] = 1
WHERE PID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLogin]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLogin]
	@UserName nvarchar(20),
	@pass nvarchar(20),
	@RoleID TINYINT,
	@EmpName nvarchar(60),
	@UserID int
AS
BEGIN
	UPDATE Login
	SET   [UserName] =  @UserName,
	Password = @pass,
	[RID] = @RoleID, UserID = @UserID
	WHERE [dbo].[Login].EmpID = (SELECT [EID] FROM [dbo].[Employees] WHERE [NameAR] = @EmpName)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMaxCapacity]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMaxCapacity]
	@Val int
AS
BEGIN
	UPDATE Counter
	SET [Value] = @Val
	WHERE ID = 2;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePharmacist]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePharmacist]
	@SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),
	@Address nvarchar(MAX),
	@GovBirth tinyint,
	@GovStay tinyint,
	@EMail nvarchar(60),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@UserID int,
	@PID int
AS
BEGIN
	UPDATE Pharmacist
	SET SSD=@SSD,
		NameAR = @NameAR,
		NameEN = @NameEN,
		[Address] = @Address,
		GovBirth = @GovBirth,
		GovStay = @GovStay,
		EMail = @EMail,
		Tele1 = @Tele1,
		Tele2 = @Tele2,
		Gender = @Gender,
		[Status] = @Status,
		DoB = @DoB,
		UserID = @UserID
		
    WHERE PID = @PID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePharmcist3Tables]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePharmcist3Tables]
    @SSD char(14),
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),   
	@Address nvarchar(MAX),
	@GovBirth tinyint,
	@GovStay tinyint,
	@EMail nvarchar(60),
	@Tele1 char(11),
	@Tele2 char(11),
	@Gender tinyint,
	@Status tinyint,
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@TotalGrade float,
	@SumE3tbary float,
	@Grade tinyint,
	@TTID tinyint,
	@From nvarchar(MAX) = NULL,
	@To nvarchar(MAX) = NULL,
	@Reason nvarchar(MAX) = NULL,
	@ActuallDateOfWork date = NULL,
	@QrarNo int = NULL,
	@QrarDate date = NULL,
	@Sa7bQrarNo INT,
	@Sa7bQrarYear SMALLINT,
    @Sa7bQrarFrom NVARCHAR(MAX),
	@Sa7bQrarTo NVARCHAR(MAX),
	@PreviousTaklefQrarNo INT,
	@PreviousTaklefQrarYear SMALLINT,
	@PreviousTaklefTo NVARCHAR(MAX),
	@TalbCode varchar(10),
	@AssignedDate date,
	@IsLagna3lya bit,
	@Attachments nvarchar(max),
	@UserID int,
	@PID INT
AS
BEGIN
	---------- If Ta3del --------------
	IF((SELECT TTID FROM Pharmacist WHERE PID = @PID)IN (1,2,7,5,8,10,11))
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into Ta3delTalb -------
			Execute [dbo].[UpdateT3delTalb]
						  @From, @To, @Reason,
						  @ActuallDateOfWork, @QrarNo,
						  @QrarDate, @PID;
			---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
		END
	ELSE IF((SELECT TTID FROM Pharmacist WHERE PID = @PID) = 6)
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into El8aaTalb -------
			Execute [dbo].[UpdateEl8aaTalb] 
						  @QrarNo, @QrarDate, @Reason, @PID;
			---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
			
		END
	ELSE IF((SELECT TTID FROM Pharmacist WHERE PID = @PID) = 3)
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into E3faaTalb -------
			Execute [dbo].[UpdateE3faaTalb]
			              @Reason, @PID;
			---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
			
		END
			ELSE IF((SELECT TTID FROM Pharmacist WHERE PID = @PID) = 12)
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into E3adetTaklef -------
			Execute [dbo].[UpdateE3adetTaklefTalb]
			              @QrarNo,@QrarDate,@Reason, @PID;
			 ---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
			
		END
			ELSE IF((SELECT TTID FROM Pharmacist WHERE PID = @PID) = 13)
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into Sa7bQrarT3delTaklef -------
			Execute [dbo].[UpdateSa7bQrarT3delTaklef]
			              @Sa7bQrarNo,@Sa7bQrarYear,@Sa7bQrarFrom,@Sa7bQrarTo,
						  @PreviousTaklefQrarNo,@PreviousTaklefQrarYear,@PreviousTaklefTo,@PID;
			---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
		END
			ELSE IF((SELECT TTID FROM Pharmacist WHERE PID = @PID) = 14)
		BEGIN
			------ Update Into Pharmacists -------
			Execute  [dbo].[UpdatePharmacist]
			               @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
						   @GovStay, @EMail, @Tele1, @Tele2,
		                   @Gender, @Status, @DoB,
						   @UserID,@PID;
			------ Update Into Est5ragBayan7alaTalb -------
			Execute [dbo].[UpdateEst5ragBayan7alaTalb]
			              @QrarNo,@QrarDate,@PID;
			---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
		END
	ELSE
		BEGIN
			------ Update Into Pharmacists -------
		Execute  [dbo].[UpdatePharmacist]
					   @SSD, @NameAR, @NameEN, @Address,  @GovBirth,
					   @GovStay, @EMail, @Tele1, @Tele2,
					   @Gender, @Status, @DoB,
					   @UserID,@PID;
		END
		---------- Update AssignedDate in TalbatInfo-------
			EXEC [UpdateAssignedDate] @AssignedDate,@PID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSa7bQrarT3delTaklef]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSa7bQrarT3delTaklef]
@Sa7bQrarNo INT,
@Sa7bQrarYear SMALLINT,
@Sa7bQrarFrom NVARCHAR(MAX),
@Sa7bQrarTo NVARCHAR(MAX),
@PreviousTaklefQrarNo INT,
@PreviousTaklefQrarYear SMALLINT,
@PreviousTaklefTo NVARCHAR(MAX),
@PID INT
AS
BEGIN
UPDATE Sa7bQrarT3delTaklef
SET [Sa7bQrarNo] = @Sa7bQrarNo,
	[Sa7bQrarYear] = @Sa7bQrarYear,
	[Sa7bQrarFrom] = @Sa7bQrarFrom,
	[Sa7bQrarTo] = @Sa7bQrarTo,
	[PreviousTaklefQrarNo] = @PreviousTaklefQrarNo,
	[PreviousTaklefQrarYear] = @PreviousTaklefQrarYear,
	[PreviousTaklefTo] = @PreviousTaklefTo
WHERE [PID] = @PID
RETURN (SELECT IDENT_CURRENT ('Sa7bQrarT3delTaklef'))
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateT3delTalb]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateT3delTalb]
	@From nvarchar(MAX),
	@To nvarchar(MAX),
	@Reason nvarchar(MAX),
	@ActuallDateOfWork date,
	@QrarNo int,
	@QrarDate date,
	@PID int
AS
BEGIN
	UPDATE [dbo].[T3delTalb]
	SET [From] = @From,
		[To] = @To,
		[Reason] = @Reason,
		[ActuallDateOfWork] = @ActuallDateOfWork,
		[QrarNo] = @QrarNo,
		[QrarDate] = @QrarDate
	WHERE PID = @PID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUniPH]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUniPH]
	@MkanTaklef NVARCHAR(MAX),
	@NoOfQrar INT,
    @QrarDate DATE,
	@SSD CHAR(14)
AS
BEGIN
	UPDATE [dbo].[UniPharmasist]
	SET [MkanTaklef] = @MkanTaklef,
		[NoOfQrar] = @NoOfQrar, 
		[QrarDate] = @QrarDate
		WHERE [SSD] = @SSD
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUniPharmacists]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUniPharmacists]
	@NameAR nvarchar(60),
	@NameEN nvarchar(60),
	@Address nvarchar(max),
	@EMail nvarchar(60),
	@GovBirth tinyint,
	@GovStay tinyint,
	@Tele1 char(11),
	@Tele2 char(11), 
	@Gender tinyint,
	@Nationality nvarchar(40),
	@DoB date,
	@Uni tinyint,
	@Section tinyint,
	@Dof3a smallint,
	@Doar nvarchar(40),
	@Religion nvarchar(max),
	@MkanTaklef nvarchar(max),
	@UserID int,
	@ID int
AS
BEGIN
	UPDATE UniPharmasist
	SET  NameAR = @NameAR
		,NameEN = @NameEN
		,[Address] = @Address
		,EMail = @EMail
		,GovBirth = @GovBirth
		,GovStay = @GovStay
		,Tele1 = @Tele1
		,Tele2 = @Tele2
		,Gender = @Gender
		,Nationality = @Nationality
		,DoB = @DoB
		,Uni = @Uni
		,Section = @Section
		,Dof3a = @Dof3a
		,Doar = @Doar
		,Religion = @Religion
		,MkanTaklef = @MkanTaklef
		,UserID = @UserID
		WHERE ID = @ID;
END
GO
/****** Object:  Trigger [dbo].[InsertDoneDate]    Script Date: 4/23/2024 10:32:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertDoneDate]
ON [dbo].[AssignedTalbat]
AFTER UPDATE
AS
BEGIN
	DECLARE @ID INT
	UPDATE [dbo].[AssignedTalbat]
	SET [DoneDate] = GETDATE()
	WHERE (([dbo].[AssignedTalbat].[NumOfTasks] = [dbo].[AssignedTalbat].[NumOfTasksDone])
		 AND (@ID = (SELECT [ID] FROM inserted)))	 
END
GO
ALTER TABLE [dbo].[AssignedTalbat] ENABLE TRIGGER [InsertDoneDate]
GO
/****** Object:  Trigger [dbo].[InsertEmpDBOperations]    Script Date: 4/23/2024 10:32:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertEmpDBOperations]
   ON [dbo].[Employees]
   AFTER INSERT
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'إضافة',
		(SELECT [NameAR] FROM inserted),
		'موظفين'
	);
END
GO
ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [InsertEmpDBOperations]
GO
/****** Object:  Trigger [dbo].[UpdateEmpDBOperations]    Script Date: 4/23/2024 10:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateEmpDBOperations]
   ON [dbo].[Employees]
   AFTER UPDATE
AS 
BEGIN
	IF (SELECT [IsDeleted] FROM deleted) !=
	   (SELECT [IsDeleted] FROM inserted)
		BEGIN 
			INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
			VALUES(
				(SELECT [UserID] FROM inserted),
				'حذف',
				(SELECT [NameAR] FROM inserted),
				'موظفين'
			);
		END
	ELSE
		BEGIN 
			INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
			VALUES(
				(SELECT [UserID] FROM inserted),
				'تعديل',
				(SELECT [NameAR] FROM inserted),
				'موظفين'
			);
		END
END
GO
ALTER TABLE [dbo].[Employees] ENABLE TRIGGER [UpdateEmpDBOperations]
GO
/****** Object:  Trigger [dbo].[InsertHolidayDBOperations]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertHolidayDBOperations]
   ON [dbo].[Holidays]
   AFTER INSERT
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'إضافة',
		(SELECT NameAR FROM UniPharmasist WHERE ID = 
		(SELECT UniID FROM [dbo].[PharmacistTaklef] WHERE ID = (SELECT PTID FROM inserted))),
		'إجازات'
	);
END
GO
ALTER TABLE [dbo].[Holidays] ENABLE TRIGGER [InsertHolidayDBOperations]
GO
/****** Object:  Trigger [dbo].[UpdateEndTaklefDate]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[UpdateEndTaklefDate]
   ON [dbo].[Holidays]
   AFTER INSERT
AS 
BEGIN
	DECLARE @NoOfDays int;
	DECLARE @OldDate Date;
	------ Calc NoOfDays To Add
	SELECT @NoOfDays = DATEDIFF(day, (SELECT EndHolidayDate FROM inserted)
									,(SELECT StartHolidayDate FROM inserted));

	------ Select OldTaklefDate
	SELECT @OldDate = EndTaklefDate FROM [dbo].[PharmacistTaklef]
	WHERE ID = (SELECT PTID FROM inserted);

	------ Update EndTaklefDate With New Value Added Holidays
	UPDATE [dbo].[PharmacistTaklef] 
	SET EndTaklefDate = CAST(DATEADD(day, ABS(@NoOfDays), @OldDate) AS DATE)
	WHERE ID = (SELECT PTID FROM inserted);
END
GO
ALTER TABLE [dbo].[Holidays] ENABLE TRIGGER [UpdateEndTaklefDate]
GO
/****** Object:  Trigger [dbo].[InsertLoginDBOperations]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertLoginDBOperations]
   ON [dbo].[Login]
   AFTER INSERT
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'إضافة',
		(SELECT [UserName]  FROM  inserted),
		'إدخال'
	);
END
GO
ALTER TABLE [dbo].[Login] ENABLE TRIGGER [InsertLoginDBOperations]
GO
/****** Object:  Trigger [dbo].[InsertPharmacistDBOperations]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertPharmacistDBOperations]
   ON [dbo].[Pharmacist]
   AFTER INSERT
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'إضافة',
		(SELECT [NameAR] FROM inserted),
		'الطلبات'
	);
END
GO
ALTER TABLE [dbo].[Pharmacist] ENABLE TRIGGER [InsertPharmacistDBOperations]
GO
/****** Object:  Trigger [dbo].[UpdatePharmacistDBOperations]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdatePharmacistDBOperations]
   ON [dbo].[Pharmacist]
   AFTER UPDATE
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'تعديل',
		(SELECT [NameAR] FROM inserted),
		'الطلبات'
	);
END
GO
ALTER TABLE [dbo].[Pharmacist] ENABLE TRIGGER [UpdatePharmacistDBOperations]
GO
/****** Object:  Trigger [dbo].[InsertNumOfTasks]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertNumOfTasks]
ON [dbo].[TalbatInfo]
AFTER INSERT 
AS 
BEGIN 
    DECLARE @Increment INT
	DECLARE @DATE DATE
	
    SET @Increment = 1
	UPDATE [dbo].[AssignedTalbat]
        SET  [NumOfTasksDone] = (SELECT NumOfTasksDone FROM [AssignedTalbat]) + @Increment
		WHERE @DATE = (SELECT [AssignedDate] FROM inserted)
END
GO
ALTER TABLE [dbo].[TalbatInfo] ENABLE TRIGGER [InsertNumOfTasks]
GO
/****** Object:  Trigger [dbo].[InsertTalbatInfoDBOperations]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertTalbatInfoDBOperations]
   ON [dbo].[TalbatInfo]
   AFTER UPDATE
AS 
BEGIN
	INSERT INTO DBOperations([UID], Operation, RecordName, TableName)
	VALUES(
		(SELECT [UserID] FROM inserted),
		'إضافة',
		(SELECT [TalbCode] FROM inserted),
		'النتائج'
	);
END
GO
ALTER TABLE [dbo].[TalbatInfo] ENABLE TRIGGER [InsertTalbatInfoDBOperations]
GO
/****** Object:  Trigger [dbo].[TR_UpdateMakanTaklef]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_UpdateMakanTaklef] 
ON [dbo].[TalbatInfo] 
AFTER UPDATE 
AS 
BEGIN 
 DECLARE @ID INT = NULL 
 DECLARE @Result NVARCHAR(50) 
 DECLARE @PID INT = NULL 
 SELECT @ID = (SELECT [RecordTa3delID] FROM inserted) 
 SELECT @Result = (SELECT [Result] FROM inserted WHERE Result = 'مقبول') 
 SELECT @PID=(SELECT [PID] FROM inserted) 

IF(@ID IS NOT NULL AND @Result IS NOT NULL )  
BEGIN
SELECT [dbo].[Pharmacist].SSD ,[dbo].[T3delTalb].[To] INTO #Temp_tbl
FROM [dbo].[Pharmacist] 
INNER JOIN [dbo].[TalbatInfo] 
ON [dbo].[Pharmacist].[PID]=@PID 
INNER JOIN [dbo].[T3delTalb] 
ON [dbo].[T3delTalb].[ID]=@ID 

UPDATE [dbo].[UniPharmasist]
SET [MkanTaklef]=(SELECT TOP 1 [To] FROM #Temp_tbl)
WHERE [dbo].[UniPharmasist].SSD=(SELECT TOP 1 SSD FROM #Temp_tbl) 
END
END
GO
ALTER TABLE [dbo].[TalbatInfo] ENABLE TRIGGER [TR_UpdateMakanTaklef]
GO
/****** Object:  Trigger [dbo].[InsertTalbCode]    Script Date: 4/23/2024 10:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsertTalbCode]
ON [dbo].[TalbatOnline] AFTER INSERT
AS
BEGIN 
	DECLARE @CODE NVARCHAR(10);
	EXEC @CODE = dbo.GenerateTalbCode 
	UPDATE [TalbatOnline]
	SET [TalbCode] = @CODE 
	WHERE PID = (SELECT PID FROM inserted);

	UPDATE Counter
	SET [Value] = [VALUE] + 1 
	WHERE ID = 1;
END
GO
ALTER TABLE [dbo].[TalbatOnline] ENABLE TRIGGER [InsertTalbCode]
GO

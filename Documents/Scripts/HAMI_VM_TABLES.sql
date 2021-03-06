USE [HAMI_VM]
GO
/****** Object:  Table [dbo].[acyear]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acyear](
	[cocode] [char](2) NOT NULL,
	[yfdate] [datetime] NOT NULL,
	[yldate] [datetime] NOT NULL,
	[yrcode] [char](1) NOT NULL,
	[yrstatus] [char](1) NULL,
	[data_base] [char](15) NULL,
	[ML_YEAR] [char](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[cocode] [char](2) NOT NULL,
	[coname] [char](50) NULL,
	[curcode] [char](4) NULL,
	[address] [varchar](500) NULL,
	[coscode] [char](7) NULL,
	[stkcode] [char](7) NULL,
	[sddage1] [int] NULL,
	[sddage2] [int] NULL,
	[sddage3] [int] NULL,
	[sddage4] [int] NULL,
	[sddage5] [int] NULL,
	[sdcage1] [int] NULL,
	[sdcage2] [int] NULL,
	[sdcage3] [int] NULL,
	[sdcage4] [int] NULL,
	[sdcage5] [int] NULL,
	[stkage1] [int] NULL,
	[stkage2] [int] NULL,
	[stkage3] [int] NULL,
	[stkage4] [int] NULL,
	[cldate] [datetime] NULL,
	[cashac] [char](7) NULL,
	[bankac] [char](7) NULL,
	[purac] [char](7) NULL,
	[salesac] [char](7) NULL,
	[purrtnac] [char](7) NULL,
	[salrtnac] [char](7) NULL,
	[division] [char](7) NULL,
	[stkloc] [char](7) NULL,
	[OVRCODE] [char](7) NULL,
	[WIPCODE] [char](7) NULL,
	[NWIPCODE] [char](7) NULL,
	[WIPTRFCODE] [char](7) NULL,
	[purtrans] [char](7) NULL,
	[LABOURAC] [char](7) NULL,
	[STKADJAC] [char](7) NULL,
	[MARGINAC] [char](7) NULL,
	[STKCHK] [char](1) NULL,
	[CSSALEAC] [char](7) NULL,
	[CRSALEAC] [char](7) NULL,
	[GITLOC] [char](10) NULL,
	[FPURACC] [char](7) NULL,
	[TEL] [varchar](50) NULL,
	[FAX] [varchar](50) NULL,
	[EMAIL] [varchar](100) NULL,
	[SALESTAX] [int] NULL,
	[stkage5] [int] NULL,
	[stkage6] [int] NULL,
	[TRACKING_PREFIX] [char](4) NULL,
	[INVOICE_PREFIX] [char](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grprgt]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grprgt](
	[cocode] [char](2) NULL,
	[groupid] [char](5) NOT NULL,
	[moduleid] [char](5) NOT NULL,
	[screenid] [char](6) NOT NULL,
	[addflag] [char](1) NOT NULL,
	[modflag] [char](1) NOT NULL,
	[CANCELflag] [char](1) NOT NULL,
	[delflag] [char](1) NOT NULL,
	[viewflag] [char](1) NOT NULL,
	[PRINTflag] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grprgt_bk]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grprgt_bk](
	[cocode] [char](2) NULL,
	[groupid] [char](5) NOT NULL,
	[moduleid] [char](5) NOT NULL,
	[screenid] [char](6) NOT NULL,
	[addflag] [char](1) NOT NULL,
	[modflag] [char](1) NOT NULL,
	[CANCELflag] [char](1) NOT NULL,
	[delflag] [char](1) NOT NULL,
	[viewflag] [char](1) NOT NULL,
	[PRINTflag] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gtprgt_0420]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gtprgt_0420](
	[cocode] [char](2) NULL,
	[groupid] [char](5) NOT NULL,
	[moduleid] [char](5) NOT NULL,
	[screenid] [char](6) NOT NULL,
	[addflag] [char](1) NOT NULL,
	[modflag] [char](1) NOT NULL,
	[CANCELflag] [char](1) NOT NULL,
	[delflag] [char](1) NOT NULL,
	[viewflag] [char](1) NOT NULL,
	[PRINTflag] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOV]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOV](
	[LOVTag] [char](10) NULL,
	[LOVlist] [varchar](100) NULL,
	[LOVTable] [varchar](50) NULL,
	[LOVFilter] [varchar](75) NULL,
	[LOVOrder] [varchar](50) NULL,
	[LOVCaption] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENUTREE]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENUTREE](
	[parent] [nvarchar](255) NULL,
	[child] [nvarchar](255) NULL,
	[menuid] [nvarchar](255) NULL,
	[screenid] [nvarchar](255) NULL,
	[addflag] [nvarchar](255) NULL,
	[modflag] [nvarchar](255) NULL,
	[cancelflag] [nvarchar](255) NULL,
	[delflag] [nvarchar](255) NULL,
	[viewflag] [nvarchar](255) NULL,
	[printflag] [nvarchar](255) NULL,
	[moduleid] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[SLNO] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MENUTREEold]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENUTREEold](
	[parent] [nvarchar](255) NULL,
	[child] [nvarchar](255) NULL,
	[menuid] [nvarchar](255) NULL,
	[screenid] [nvarchar](255) NULL,
	[addflag] [nvarchar](255) NULL,
	[modflag] [nvarchar](255) NULL,
	[cancelflag] [nvarchar](255) NULL,
	[delflag] [nvarchar](255) NULL,
	[viewflag] [nvarchar](255) NULL,
	[printflag] [nvarchar](255) NULL,
	[moduleid] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[SLNO] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParameterTable]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParameterTable](
	[PType] [char](10) NULL,
	[PValue] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RATIO]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RATIO](
	[CODE] [char](5) NULL,
	[DESCR] [varchar](50) NULL,
	[FORMULA] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESULTS]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESULTS](
	[PARENT] [nvarchar](9) NULL,
	[CHILD] [nvarchar](12) NULL,
	[MENUID] [nvarchar](50) NULL,
	[SCREENID] [nvarchar](5) NULL,
	[ADDFLAG] [nvarchar](1) NULL,
	[MODFLAG] [nvarchar](1) NULL,
	[CANCELFLAG] [nvarchar](1) NULL,
	[DELFLAG] [nvarchar](1) NULL,
	[VIEWFLAG] [nvarchar](1) NULL,
	[PRINTFLAG] [nvarchar](1) NULL,
	[MODULEID] [nvarchar](3) NULL,
	[NAME] [nvarchar](50) NULL,
	[SLNO] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tempuser_01]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempuser_01](
	[User_ID] [char](10) NOT NULL,
	[User_Name] [char](40) NOT NULL,
	[Group_ID] [char](5) NOT NULL,
	[Group_Name] [char](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRANLOG]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRANLOG](
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TRANLOG_DATE]  DEFAULT (getdate()),
	[TRCD] [char](4) NOT NULL,
	[TRNO] [char](20) NOT NULL,
	[USERID] [char](10) NOT NULL,
	[OPTAG] [char](1) NOT NULL,
	[moduleid] [char](3) NULL,
	[cocode] [char](2) NULL,
	[YRCD] [char](1) NULL,
	[REMARKS] [char](100) NULL,
	[ccode] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRANLOG_ARCHIVE]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRANLOG_ARCHIVE](
	[DATE] [datetime] NOT NULL CONSTRAINT [DF_TRANLOG_ARCHIVE_DATE]  DEFAULT (getdate()),
	[TRCD] [char](4) NOT NULL,
	[TRNO] [char](20) NOT NULL,
	[USERID] [char](10) NOT NULL,
	[OPTAG] [char](1) NOT NULL,
	[moduleid] [char](3) NULL,
	[cocode] [char](2) NULL,
	[YRCD] [char](1) NULL,
	[REMARKS] [char](100) NULL,
	[ccode] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usermast]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usermast](
	[userid] [char](10) NOT NULL,
	[name] [char](40) NOT NULL,
	[groupid] [char](5) NOT NULL,
	[password] [char](20) NULL,
	[cocode] [varchar](30) NULL,
	[division] [char](4) NULL,
	[allowcost] [char](1) NULL,
	[locode] [char](10) NULL,
	[enggcode] [char](10) NULL,
	[T] [timestamp] NULL,
	[allowdate] [char](1) NOT NULL CONSTRAINT [DF_usermast_allowdate]  DEFAULT ('0'),
	[allowloc] [char](1) NULL,
	[discper] [int] NULL,
	[loc] [varchar](5000) NULL,
	[eminstance] [char](1) NULL,
	[minstance] [char](1) NULL,
	[enggtype] [char](1) NULL,
	[enggtype1] [tinyint] NOT NULL CONSTRAINT [DF_usermast_enggtype1]  DEFAULT ((0)),
	[COSMOSUSERID] [char](15) NULL,
	[COSMOSENGCODE] [char](15) NULL,
	[emailID] [varchar](100) NULL,
	[MultiLocReport] [char](1) NULL CONSTRAINT [DF_usermast_MultiLocReport_1]  DEFAULT ((0)),
	[Block] [int] NULL,
	[CASHBACKPERC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usrgrp]    Script Date: 12/01/2019 06:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usrgrp](
	[groupid] [char](5) NULL,
	[name] [char](30) NULL,
	[cocode] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

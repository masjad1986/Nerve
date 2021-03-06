USE [HAMI_DATA]
GO
/****** Object:  Table [dbo].[accmst]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accmst](
	[accode] [char](7) NOT NULL CONSTRAINT [DF_accmst_accode_1__12]  DEFAULT (' '),
	[grpcd] [char](5) NOT NULL CONSTRAINT [DF_accmst_grpcd_19__12]  DEFAULT (' '),
	[ccode] [char](4) NULL CONSTRAINT [DF_accmst_ccode_8__12]  DEFAULT (' '),
	[name] [char](100) NOT NULL CONSTRAINT [DF_accmst_name_21__12]  DEFAULT (' '),
	[curcode] [char](4) NULL CONSTRAINT [DF_accmst_curcode_14__12]  DEFAULT (' '),
	[buyrate] [decimal](18, 4) NULL CONSTRAINT [DF_accmst_buyrate_7__12]  DEFAULT ((1)),
	[sellrate] [decimal](18, 4) NULL CONSTRAINT [DF_accmst_sellrate_22__12]  DEFAULT ((1)),
	[budget] [char](1) NULL CONSTRAINT [DF_accmst_budget_6__12]  DEFAULT ('N'),
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[bdgval] [char](1) NULL,
	[cperson] [char](35) NULL,
	[cdesg] [char](30) NULL,
	[add1] [varchar](120) NULL,
	[add2] [varchar](120) NULL,
	[add3] [varchar](120) NULL,
	[add4] [varchar](120) NULL,
	[tel] [char](20) NULL,
	[tel1] [char](20) NULL,
	[tel2] [char](50) NULL,
	[faX] [char](20) NULL,
	[crdays] [decimal](3, 0) NULL,
	[crlimit] [decimal](18, 2) NULL,
	[lcused] [decimal](18, 2) NULL,
	[adjmtd] [decimal](1, 0) NULL,
	[bmatch] [char](1) NULL,
	[stmac] [decimal](1, 0) NULL,
	[dramt] [decimal](18, 2) NULL,
	[fdamt] [decimal](18, 3) NULL,
	[cramt] [decimal](18, 2) NULL,
	[fcamt] [decimal](18, 3) NULL,
	[email] [varchar](50) NULL,
	[notes] [varchar](50) NULL,
	[REFAC] [char](7) NULL,
	[LBDAMT] [decimal](18, 2) NULL,
	[dcflag] [char](1) NULL,
	[block] [char](1) NOT NULL CONSTRAINT [DF_accmst_block]  DEFAULT ((0)),
	[brand] [char](20) NULL,
	[margin] [numeric](18, 2) NULL CONSTRAINT [DF_accmst_margin]  DEFAULT ((0)),
	[country] [char](15) NULL,
	[TACCODE] [varchar](500) NULL,
	[TACGROUP] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[LedgerName] [varchar](500) NULL,
	[ServiceCenter] [varchar](100) NULL,
	[Credit] [int] NULL,
	[PMType] [char](25) NULL,
	[SLCODE] [char](6) NULL,
	[nameP] [nvarchar](500) NULL,
	[localorimport] [char](1) NULL,
 CONSTRAINT [ACC1] PRIMARY KEY CLUSTERED 
(
	[accode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACGROUP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACGROUP](
	[GRPCD] [char](5) NOT NULL,
	[GPSNM] [char](30) NOT NULL,
	[BUDGSH] [char](1) NULL,
	[DIVISH] [char](1) NULL,
	[FCODE] [char](4) NULL,
	[TCODE] [char](4) NULL,
	[OPBAL] [decimal](18, 4) NULL,
	[BLTYPE] [char](1) NOT NULL CONSTRAINT [DF_ACGROUP_BLTYPE]  DEFAULT ('A'),
	[CRAMT] [decimal](18, 4) NULL,
	[DBAMT] [decimal](18, 4) NULL,
	[grporder] [int] NULL,
	[trbalgrp] [char](1) NOT NULL CONSTRAINT [DF_ACGROUP_trbalgrp]  DEFAULT ('N'),
 CONSTRAINT [ACG1] PRIMARY KEY NONCLUSTERED 
(
	[GRPCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Achead]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Achead](
	[accode] [char](10) NOT NULL,
	[acname] [char](50) NULL,
	[opbal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Achead] PRIMARY KEY NONCLUSTERED 
(
	[accode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AGEINGSUB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AGEINGSUB](
	[ITCODE] [char](20) NULL,
	[TRDATE] [smalldatetime] NULL,
	[TRNTYPE] [char](4) NULL,
	[LOCODE] [char](10) NULL,
	[TRNO] [char](15) NULL,
	[QTY] [numeric](12, 2) NULL,
	[MSLNO] [int] NULL,
	[SLNO] [int] NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[ordno] [char](8) NULL,
	[trackno] [char](20) NULL,
	[Rate] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AGEINGSUB1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AGEINGSUB1](
	[LOCODE] [char](10) NULL,
	[ITCODE] [char](20) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](10) NULL,
	[TRDATE] [smalldatetime] NULL,
	[INQTY] [numeric](18, 0) NULL,
	[OUTQTY] [numeric](18, 0) NULL,
	[Rate] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AGEINGSUB2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AGEINGSUB2](
	[LOCODE] [char](10) NULL,
	[ITCODE] [char](20) NULL,
	[OUTQTY] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgeingWeekly0]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgeingWeekly0](
	[ITCODE] [char](20) NULL,
	[ITDESC] [char](100) NULL,
	[ITBRND] [char](20) NULL,
	[TRDATE] [smalldatetime] NULL,
	[TRNTYPE] [char](4) NULL,
	[COUNTRY] [varchar](50) NULL,
	[LOCODE] [char](10) NULL,
	[LONAME] [char](50) NULL,
	[TRNO] [char](15) NULL,
	[QTY] [numeric](12, 2) NULL,
	[MSLNO] [int] NULL,
	[SLNO] [int] NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[ordno] [char](8) NULL,
	[trackno] [char](20) NULL,
	[Rate] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgeingWeekly1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgeingWeekly1](
	[LOCODE] [char](10) NULL,
	[ITCODE] [char](20) NULL,
	[ITDESC] [char](100) NULL,
	[ITBRND] [char](20) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](10) NULL,
	[TRDATE] [smalldatetime] NULL,
	[INQTY] [numeric](18, 0) NULL,
	[OUTQTY] [numeric](18, 0) NULL,
	[Rate] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgeingWeekly2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgeingWeekly2](
	[LOCODE] [char](10) NULL,
	[ITCODE] [char](20) NULL,
	[ITBRND] [char](20) NULL,
	[OUTQTY] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AVGFILE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AVGFILE](
	[LOCODE] [char](3) NULL,
	[ITCODE] [char](20) NULL,
	[OPBAL] [numeric](12, 3) NULL,
	[OPRATE] [numeric](12, 3) NULL,
	[OPVAL] [numeric](12, 3) NULL,
	[FDATE] [smalldatetime] NULL,
	[TDATE] [smalldatetime] NULL,
	[PVALUE] [numeric](12, 3) NULL,
	[PURC] [numeric](12, 3) NULL,
	[STKBAL] [numeric](12, 3) NULL,
	[AVGRATE] [numeric](12, 3) NULL,
	[STKVAL] [numeric](12, 3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BatchLogIn]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BatchLogIn](
	[RefNo] [int] NULL,
	[CustCode] [char](25) NULL,
	[BatchRef] [char](15) NULL,
	[ItemCode] [char](25) NULL,
	[IMEINo] [char](15) NULL,
	[ModelCode] [char](15) NULL,
	[Qty] [int] NULL,
	[Remarks] [varchar](200) NULL,
	[Tag] [char](1) NULL,
	[FaultCode] [char](15) NULL,
	[PhyCond] [char](30) NULL,
	[RecvdUnits] [char](10) NULL,
	[WarType] [char](20) NULL,
	[PrdMonth] [char](5) NULL,
	[Type] [char](1) NULL,
	[SlNo] [int] NULL,
	[RCRF] [varchar](20) NULL,
	[Version] [int] NULL,
	[MsnNo] [char](10) NULL,
	[PhoneType] [char](20) NULL,
	[Warr] [char](8) NULL,
	[Monitor] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BCGMAST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BCGMAST](
	[ITTAG] [char](1) NULL,
	[ITCODE] [char](30) NULL,
	[ITDESC] [varchar](250) NULL,
	[NOTES] [char](75) NULL,
	[TARGET] [numeric](18, 0) NULL,
	[TRGAMT] [numeric](18, 2) NULL,
	[ACCODE] [char](7) NULL CONSTRAINT [DF_BCGMAST_ACCODE]  DEFAULT (''),
	[DBCODE] [char](7) NULL CONSTRAINT [DF_BCGMAST_DBCODE]  DEFAULT (''),
	[ADD_TAG] [bit] NOT NULL CONSTRAINT [DF_BCGMAST_ADD_TAG]  DEFAULT ((1)),
	[SEQ] [char](1) NULL,
	[STOCKAC] [char](7) NULL CONSTRAINT [DF_BCGMAST_STOCKAC]  DEFAULT (''),
	[WIPAC] [char](7) NULL CONSTRAINT [DF_BCGMAST_WIPAC]  DEFAULT (''),
	[CSAC] [char](7) NULL CONSTRAINT [DF_BCGMAST_CSAC]  DEFAULT (''),
	[SLLOC] [char](8) NULL,
	[SUBCD] [char](10) NULL,
	[ITBRAND] [char](20) NULL,
	[ITCATE] [char](10) NULL,
	[RLTAG] [char](1) NULL,
	[RLUNIT] [char](5) NULL,
	[RLQTY] [numeric](18, 2) NULL,
	[LCHARGE] [numeric](18, 2) NULL,
	[PRODCODE] [char](30) NULL,
	[SelRate] [numeric](18, 2) NULL,
	[tier] [char](1) NULL,
	[Target_AvgTat] [numeric](18, 2) NULL,
	[Target_HitRate] [numeric](18, 2) NULL,
	[Target_BounceRate] [numeric](18, 2) NULL,
	[Target_AvgSpCons] [numeric](18, 2) NULL,
	[Target_AvgMatCost] [numeric](18, 2) NULL,
	[Target_AvgProd] [numeric](18, 2) NULL,
	[Target_AvgRevenue] [numeric](18, 2) NULL,
	[Target_totRevenue] [numeric](18, 2) NULL,
	[Target_EnggTime] [numeric](18, 2) NULL,
	[Target_TL_RSRevMonth] [numeric](18, 2) NULL,
	[Target_TL_RSGP] [numeric](18, 2) NULL,
	[Target_TL_WRevenue] [numeric](18, 2) NULL,
	[Target_TL_NWRevenue] [numeric](18, 2) NULL,
	[Target_TL_WTAT] [numeric](18, 0) NULL,
	[Target_TL_NWTAT] [numeric](18, 0) NULL,
	[Target_TL_DealerTAT] [numeric](18, 0) NULL,
	[Target_TL_BounceRate] [numeric](18, 0) NULL,
	[Target_TL_HITRate] [numeric](18, 0) NULL,
	[Target_TL_WRepairCost] [numeric](18, 2) NULL,
	[Target_TL_InvHoldCost] [numeric](18, 2) NULL,
	[Target_TL_SparesCost90] [numeric](18, 2) NULL,
	[Target_TL_CustIndex] [numeric](18, 0) NULL,
	[Location] [varchar](250) NULL,
	[PhotoPath] [varchar](50) NULL,
	[ProductType] [varchar](30) NULL,
	[Model] [varchar](50) NULL,
	[LevelCode] [char](10) NULL,
	[Sno] [int] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[T] [int] IDENTITY(1,1) NOT NULL,
	[Updated] [int] NULL,
	[MAINACCODE] [char](8) NULL CONSTRAINT [DF_BCGMAST_DBCODE1]  DEFAULT (''),
	[DeliveryCode] [nvarchar](25) NULL,
	[Description] [nvarchar](500) NULL,
	[Block] [int] NULL,
	[NDays] [tinyint] NULL,
	[FARSITEXT] [nvarchar](500) NULL,
	[RMANOReq] [bit] NULL,
	[VENDOR_PERC] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[binloc]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[binloc](
	[itcode] [char](25) NULL,
	[locode] [char](10) NULL,
	[bin] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BK_T_RTVAPR_DETAIL_2405]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BK_T_RTVAPR_DETAIL_2405](
	[DOCNO] [char](8) NOT NULL,
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NULL,
	[LONAME] [char](50) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RMANO] [char](50) NULL,
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](250) NULL,
	[IMEINO] [varchar](50) NULL,
	[STATUS] [nchar](10) NULL,
	[SLNO] [int] NULL,
	[ORDERED] [int] NULL,
	[RETURNED] [int] NULL,
	[RECEIVED] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BK_T_RTVCLAIMREQ_DETAIL_2405]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BK_T_RTVCLAIMREQ_DETAIL_2405](
	[DOCNO] [char](8) NULL,
	[TRACKINGNO] [char](20) NULL,
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NULL,
	[IMEINO] [varchar](50) NULL,
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](250) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[SLNO] [int] NULL,
	[TYPE] [nchar](10) NULL,
	[STATUS] [nchar](10) NULL,
	[RMANo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BrandwiseClaim]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BrandwiseClaim](
	[Locode] [char](10) NULL,
	[Locname] [varchar](100) NULL,
	[Itbrnd] [char](30) NULL,
	[Opstk] [numeric](18, 3) NULL,
	[Opstkval] [numeric](18, 3) NULL,
	[Purc] [numeric](18, 3) NULL,
	[Purcval] [numeric](18, 3) NULL,
	[Wcon] [numeric](18, 3) NULL,
	[Wconval] [numeric](18, 3) NULL,
	[Ncon] [numeric](18, 3) NULL,
	[Nconval] [numeric](18, 3) NULL,
	[Clstk] [numeric](18, 3) NULL,
	[Clstkval] [numeric](18, 3) NULL,
	[Bill] [numeric](18, 3) NULL,
	[Billval] [numeric](18, 3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUDGET]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUDGET](
	[CCODE] [char](4) NOT NULL,
	[ACCODE] [char](7) NOT NULL,
	[BDGPT] [numeric](10, 2) NULL,
	[APORTION] [bit] NOT NULL,
	[BDGP1] [numeric](10, 2) NULL,
	[BDGP2] [numeric](10, 2) NULL,
	[BDGP3] [numeric](10, 2) NULL,
	[BDGP4] [numeric](10, 2) NULL,
	[BDGP5] [numeric](10, 2) NULL,
	[BDGP6] [numeric](10, 2) NULL,
	[BDGP7] [numeric](10, 2) NULL,
	[BDGP8] [numeric](10, 2) NULL,
	[BDGP9] [numeric](10, 2) NULL,
	[BDGP10] [numeric](10, 2) NULL,
	[BDGP11] [numeric](10, 2) NULL,
	[BDGP12] [numeric](10, 2) NULL,
	[BDGCT] [numeric](10, 2) NULL,
	[APORTC] [numeric](10, 2) NULL,
	[BDGC1] [numeric](10, 2) NULL,
	[BDGC2] [numeric](10, 2) NULL,
	[BDGC3] [numeric](10, 2) NULL,
	[BDGC4] [numeric](10, 2) NULL,
	[BDGC5] [numeric](10, 2) NULL,
	[BDGC6] [numeric](10, 2) NULL,
	[BDGC7] [numeric](10, 2) NULL,
	[BDGC8] [numeric](10, 2) NULL,
	[BDGC9] [numeric](10, 2) NULL,
	[BDGC10] [numeric](10, 2) NULL,
	[BDGC11] [numeric](10, 2) NULL,
	[BDGC12] [numeric](10, 2) NULL,
	[BDGNT] [numeric](10, 2) NULL,
	[APORT] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ccmast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ccmast](
	[ccode] [char](4) NULL,
	[ccdes] [char](50) NULL,
	[MDCODE] [char](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHQDIS1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHQDIS1](
	[TRNO] [char](8) NULL,
	[TRDATE] [smalldatetime] NULL,
	[BANKCODE] [char](7) NULL,
	[PDCCODE] [char](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHQDIS2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHQDIS2](
	[TRNO] [char](8) NULL,
	[CHQNO] [char](10) NULL,
	[CHQDT] [smalldatetime] NULL,
	[PDCNO] [char](8) NULL,
	[CODE] [char](7) NULL,
	[AMOUNT] [numeric](12, 2) NULL,
	[REMARKS] [varchar](100) NULL,
	[SLNO] [int] NULL,
	[DESCR] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENT](
	[ACCODE] [numeric](7, 0) NOT NULL,
	[SUFIX] [char](3) NULL,
	[NAME] [varchar](50) NULL,
	[NAME1] [varchar](50) NULL,
	[ADD1] [varchar](100) NULL,
	[ADD2] [varchar](100) NULL,
	[ADD3] [varchar](50) NULL,
	[REMARKS] [varchar](100) NULL,
	[RESI] [varchar](20) NULL,
	[OFFICE] [varchar](20) NULL,
	[PAGER] [varchar](20) NULL,
	[MOBILE] [varchar](20) NULL,
	[FAX] [varchar](20) NULL,
	[EMAIL] [varchar](100) NULL,
	[MODEL] [varchar](15) NULL,
	[BRAND] [char](10) NULL,
	[LOCATION] [varchar](50) NULL,
	[ACNO] [varchar](50) NULL,
	[CRCHK] [char](1) NULL,
	[CRLIMIT] [numeric](13, 2) NULL,
	[TYPE] [char](1) NULL,
	[REGION] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL,
	[GENDER] [char](1) NULL,
	[STATE] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLSTK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLSTK](
	[ITCODE] [char](20) NULL,
	[CLDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[STOCK] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLWCARD]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLWCARD](
	[ACCODE] [numeric](7, 0) NULL,
	[WCARD] [char](20) NULL,
	[SLNO] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONFIRMED]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONFIRMED](
	[WTYClaim] [float] NULL,
	[LOCATION] [nvarchar](255) NULL,
	[MODEL] [nvarchar](255) NULL,
	[MSNNO] [nvarchar](255) NULL,
	[LOCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CURRENCY]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CURRENCY](
	[CURCODE] [char](4) NOT NULL,
	[CURNAME] [char](15) NOT NULL,
	[COIN] [char](10) NOT NULL,
	[FACTOR] [decimal](18, 0) NULL,
	[BUYRATE] [decimal](18, 0) NOT NULL,
	[SELLRATE] [decimal](18, 0) NOT NULL,
	[CURCUNT] [char](12) NULL,
	[LASTUPDATEDATE] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CURRENTSTOCK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CURRENTSTOCK](
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](250) NULL,
	[PRODUCTGROUP] [char](15) NULL,
	[BRAND] [char](20) NULL,
	[LOCODE] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[QTY] [numeric](18, 0) NULL,
	[RATE] [numeric](18, 2) NULL,
	[STKVAL] [numeric](18, 2) NULL,
	[GRADE] [nchar](10) NULL,
	[ITCATE] [char](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustMast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustMast](
	[Codeid] [int] IDENTITY(1,1) NOT NULL,
	[Company] [char](50) NULL,
	[CPerson] [char](50) NULL,
	[Phone1] [char](15) NULL,
	[Phone2] [char](15) NULL,
	[Phone3] [char](15) NULL,
	[Fax] [char](15) NULL,
	[Pager] [char](15) NULL,
	[Mobile] [char](15) NULL,
	[Email] [char](50) NULL,
	[WebSite] [char](50) NULL,
	[Address] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DAILYREVENUE1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DAILYREVENUE1](
	[Country] [varchar](3) NOT NULL,
	[Brand] [varchar](11) NOT NULL,
	[Type] [varchar](7) NOT NULL,
	[Location] [varchar](5) NOT NULL,
	[Category] [varchar](13) NOT NULL,
	[Warranty] [int] NOT NULL,
	[NonWarranty] [int] NOT NULL,
	[SWarranty] [int] NOT NULL,
	[Accessory] [decimal](38, 3) NOT NULL,
	[WarrantyRevenue] [numeric](38, 2) NOT NULL,
	[NWRevenue] [numeric](38, 2) NOT NULL,
	[SRevenue] [numeric](38, 2) NOT NULL,
	[AccessoryRevenue] [numeric](38, 2) NOT NULL,
	[Total] [decimal](38, 3) NOT NULL,
	[MWarranty] [int] NOT NULL,
	[MNonWarranty] [int] NOT NULL,
	[MSWarranty] [int] NOT NULL,
	[MWarrantyRevenue] [numeric](38, 2) NOT NULL,
	[MNWRevenue] [numeric](38, 2) NOT NULL,
	[MSRevenue] [numeric](38, 2) NOT NULL,
	[Month] [decimal](38, 3) NOT NULL,
	[MonthRevenue] [numeric](38, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DAILYREVENUE2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DAILYREVENUE2](
	[Country] [varchar](3) NOT NULL,
	[Brand] [varchar](10) NOT NULL,
	[Type] [varchar](7) NOT NULL,
	[Location] [varchar](11) NOT NULL,
	[Category] [varchar](13) NOT NULL,
	[Warranty] [int] NOT NULL,
	[NonWarranty] [int] NOT NULL,
	[SWarranty] [int] NOT NULL,
	[Accessory] [decimal](38, 3) NOT NULL,
	[WarrantyRevenue] [float] NOT NULL,
	[NWRevenue] [numeric](38, 2) NOT NULL,
	[SRevenue] [numeric](38, 2) NOT NULL,
	[AccessoryRevenue] [numeric](38, 2) NOT NULL,
	[Total] [decimal](38, 3) NOT NULL,
	[MWarranty] [int] NOT NULL,
	[MNonWarranty] [int] NOT NULL,
	[MSWarranty] [int] NOT NULL,
	[MWarrantyRevenue] [float] NOT NULL,
	[MNWRevenue] [numeric](38, 2) NOT NULL,
	[MSRevenue] [numeric](38, 2) NOT NULL,
	[Month] [decimal](38, 3) NOT NULL,
	[MonthRevenue] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dstfoot]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dstfoot](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[csamnt] [decimal](13, 2) NULL,
	[netamt] [decimal](13, 2) NULL,
	[stkval] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](12, 2) NULL,
	[ITEMDESC] [char](100) NOT NULL,
	[ccode] [char](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dsthead]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dsthead](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[otheramt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[refno] [char](15) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](14, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](14, 2) NULL,
	[othercrg] [numeric](12, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](12, 2) NULL,
	[DISCAMT] [numeric](14, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](12, 3) NULL,
	[noofbox] [numeric](5, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[errlog]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[errlog](
	[code] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ERRTABLE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ERRTABLE](
	[ITCODE] [char](20) NULL,
	[ITDESC] [char](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESTPARTS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESTPARTS](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CODE] [char](20) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[Row1] [char](30) NULL,
	[Row2] [char](30) NULL,
	[Row3] [char](30) NULL,
	[Row4] [char](30) NULL,
	[Row5] [char](30) NULL,
	[CCode] [char](10) NOT NULL,
	[Jobno] [numeric](5, 0) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NULL,
	[TrackingNo] [char](20) NULL,
	[IMEINo] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[Model] [varchar](50) NULL,
	[emailAlert] [bit] NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[glumast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[glumast](
	[locode] [char](10) NOT NULL,
	[loname] [char](50) NULL,
	[notes] [varchar](50) NULL,
	[ccode] [char](4) NULL,
	[whchk] [bit] NULL,
	[cmpcode] [char](10) NULL,
	[iriscode] [char](10) NULL,
	[custtype] [char](5) NULL,
	[partnername] [char](50) NULL,
	[servicepro] [char](50) NULL,
	[transport] [char](1) NULL,
	[check1] [char](1) NULL,
	[BRAND] [char](20) NULL,
	[LOC1] [varchar](250) NULL,
	[LOC2] [varchar](250) NULL,
	[CURCODE] [char](5) NULL,
	[CURRATE] [numeric](14, 3) NULL,
	[TAT] [int] NULL CONSTRAINT [DF_glumast_TAT]  DEFAULT ((0)),
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[DEFLOCODE] [char](10) NULL,
	[Country] [varchar](50) NULL,
	[ActiveLocation] [char](1) NULL,
	[Loc_Flag] [int] NULL,
	[LOCNAME] [char](50) NULL,
	[FEBE] [char](50) NULL,
	[CITY] [varchar](50) NULL,
	[LocPrefix] [char](5) NULL,
	[ADD1] [nvarchar](100) NULL,
	[ADD2] [nvarchar](100) NULL,
	[ADD3] [nvarchar](100) NULL,
	[ADD4] [nvarchar](100) NULL,
	[TEL] [nvarchar](100) NULL,
	[FAX] [nvarchar](100) NULL,
	[ADD5] [nvarchar](100) NULL,
	[ADD6] [nvarchar](100) NULL,
	[ADD7] [nvarchar](100) NULL,
	[GEOCODE] [nvarchar](100) NULL,
	[DOALOC] [char](10) NULL,
	[CPCODE] [nchar](10) NULL,
	[DELIVERYAGENT] [varchar](50) NULL,
	[SERVICECENTREID] [int] NULL,
	[DOALOCPREFIX] [nchar](10) NULL,
	[DOALONAME] [char](50) NULL,
	[blockloc] [bit] NULL,
	[BRINVOICE_PREFIX] [char](6) NULL,
 CONSTRAINT [PK_glumast] PRIMARY KEY NONCLUSTERED 
(
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITBIN]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITBIN](
	[ITCODE] [char](20) NULL,
	[BIN] [char](10) NULL,
	[SLNO] [numeric](5, 0) NULL,
	[Locode] [char](10) NULL,
	[TRDID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITBINMY]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITBINMY](
	[ITCODE] [char](20) NULL,
	[BIN] [char](10) NULL,
	[SLNO] [numeric](5, 0) NULL,
	[Locode] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemPrice]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemPrice](
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](100) NULL,
	[ITBRND] [char](20) NULL,
	[SPPER] [numeric](12, 2) NULL,
	[nwprice] [numeric](12, 2) NULL,
	[STOCK] [decimal](38, 3) NULL,
	[STKVAL] [numeric](38, 2) NULL,
	[RATE] [numeric](38, 6) NULL,
	[SP] [numeric](38, 6) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITMAST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITMAST](
	[ITCODE] [char](25) NOT NULL,
	[CCODE] [char](4) NULL,
	[SUPCODE] [char](7) NULL,
	[ITCATE] [char](8) NULL,
	[ITGRP] [char](15) NULL,
	[ITBRND] [char](20) NULL,
	[ITORGN] [char](8) NULL,
	[ITPRODCD] [char](15) NULL,
	[ITDESC] [char](250) NULL,
	[ITVOLU] [decimal](12, 2) NULL,
	[ITWGHT] [decimal](10, 3) NULL,
	[OPRTE] [decimal](12, 4) NULL,
	[WAVRG] [decimal](12, 4) NULL,
	[FCWAVRG] [numeric](12, 3) NULL,
	[LPUDT] [smalldatetime] NULL,
	[LPURT] [decimal](12, 4) NULL,
	[LSTDT] [smalldatetime] NULL,
	[LSTRT] [decimal](12, 4) NULL,
	[ITUNIT] [char](5) NULL,
	[OPSTK] [numeric](12, 2) NULL,
	[STOCK] [numeric](12, 2) NULL CONSTRAINT [DF_ITMAST_STOCK]  DEFAULT ((0)),
	[RESVSTK] [numeric](12, 2) NULL CONSTRAINT [DF_ITMAST_RESVSTK]  DEFAULT ((0)),
	[REOLV] [numeric](12, 2) NULL,
	[MNSTK] [numeric](12, 2) NULL,
	[SLTRGT] [numeric](12, 2) NULL,
	[TRPRD] [numeric](12, 2) NULL,
	[SLTRMT] [numeric](12, 2) NULL,
	[PUORD] [numeric](12, 2) NULL,
	[SLORD] [numeric](12, 2) NULL,
	[BATCHFLG] [bit] NOT NULL CONSTRAINT [DF_ITMAST_BATCHFLG]  DEFAULT ((0)),
	[ITVCH] [char](4) NULL,
	[ITDETDESC] [text] NULL,
	[PACKING] [char](25) NULL,
	[RATE] [numeric](14, 3) NULL,
	[ITSIZE] [char](50) NULL,
	[SIZEPRINT] [char](1) NULL,
	[BINCODE] [char](8) NULL,
	[OPVAL] [numeric](12, 2) NULL CONSTRAINT [DF_ITMAST_OPVAL]  DEFAULT ((0)),
	[ITREMARKS] [varchar](300) NULL,
	[ITLEVEL] [char](1) NULL,
	[ALTPART] [char](20) NULL,
	[LVL] [char](10) NULL,
	[BIN1] [char](8) NULL,
	[BIN2] [char](8) NULL,
	[BIN3] [char](8) NULL,
	[BIN4] [char](8) NULL,
	[FOC] [char](1) NULL,
	[FCOPRATE] [numeric](12, 2) NULL,
	[SPPER] [numeric](12, 2) NULL,
	[FOCPRICE] [numeric](12, 2) NULL,
	[BLOCK] [char](1) NULL,
	[WEBPRICE] [numeric](14, 4) NULL,
	[SWAP] [char](1) NULL,
	[MINORDQTY] [numeric](18, 0) NULL,
	[ALTPART1] [char](20) NULL,
	[ALTPART2] [char](20) NULL,
	[ALTPART3] [char](20) NULL,
	[ALTPART4] [char](20) NULL,
	[APPMODEL] [varchar](500) NULL,
	[NWPRICE] [numeric](12, 2) NULL CONSTRAINT [DF_ITMAST_NWPRICE]  DEFAULT ((0)),
	[NONWARRANTY] [bit] NULL,
	[EXTWARRANTY] [bit] NULL,
	[EWPERCENTAGE] [int] NULL CONSTRAINT [DF_ITMAST_EWPERCENTAGE]  DEFAULT ((0)),
	[PurRate] [numeric](18, 2) NULL,
	[EWAccPercentage] [int] NULL CONSTRAINT [DF_ITMAST_EWAccPercentage]  DEFAULT ((0)),
	[TITCODE] [varchar](250) NULL,
	[TITGRP] [varchar](50) NULL,
	[LEDGERNAME] [varchar](100) NULL,
	[InActive] [int] NULL,
	[ITMAINCATE] [char](20) NULL,
	[PurRateFC] [numeric](18, 4) NULL,
	[ITLOC] [varchar](50) NULL,
	[MAINGRP] [varchar](50) NULL,
	[PRGRP] [varchar](50) NULL,
	[VENDOR] [varchar](50) NULL,
	[PRCODE] [varchar](50) NULL,
	[NWCURCODE] [varchar](50) NULL,
 CONSTRAINT [PK_ITMAST] PRIMARY KEY NONCLUSTERED 
(
	[ITCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itmast_150818]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itmast_150818](
	[ITCODE] [char](25) NOT NULL,
	[CCODE] [char](4) NULL,
	[SUPCODE] [char](7) NULL,
	[ITCATE] [char](8) NULL,
	[ITGRP] [char](15) NULL,
	[ITBRND] [char](20) NULL,
	[ITORGN] [char](8) NULL,
	[ITPRODCD] [char](15) NULL,
	[ITDESC] [char](250) NULL,
	[ITVOLU] [decimal](12, 2) NULL,
	[ITWGHT] [decimal](10, 3) NULL,
	[OPRTE] [decimal](12, 4) NULL,
	[WAVRG] [decimal](12, 4) NULL,
	[FCWAVRG] [numeric](12, 3) NULL,
	[LPUDT] [smalldatetime] NULL,
	[LPURT] [decimal](12, 4) NULL,
	[LSTDT] [smalldatetime] NULL,
	[LSTRT] [decimal](12, 4) NULL,
	[ITUNIT] [char](5) NULL,
	[OPSTK] [numeric](12, 2) NULL,
	[STOCK] [numeric](12, 2) NULL,
	[RESVSTK] [numeric](12, 2) NULL,
	[REOLV] [numeric](12, 2) NULL,
	[MNSTK] [numeric](12, 2) NULL,
	[SLTRGT] [numeric](12, 2) NULL,
	[TRPRD] [numeric](12, 2) NULL,
	[SLTRMT] [numeric](12, 2) NULL,
	[PUORD] [numeric](12, 2) NULL,
	[SLORD] [numeric](12, 2) NULL,
	[BATCHFLG] [bit] NOT NULL,
	[ITVCH] [char](4) NULL,
	[ITDETDESC] [text] NULL,
	[PACKING] [char](25) NULL,
	[RATE] [numeric](14, 3) NULL,
	[ITSIZE] [char](50) NULL,
	[SIZEPRINT] [char](1) NULL,
	[BINCODE] [char](8) NULL,
	[OPVAL] [numeric](12, 2) NULL,
	[ITREMARKS] [varchar](300) NULL,
	[ITLEVEL] [char](1) NULL,
	[ALTPART] [char](20) NULL,
	[LVL] [char](10) NULL,
	[BIN1] [char](8) NULL,
	[BIN2] [char](8) NULL,
	[BIN3] [char](8) NULL,
	[BIN4] [char](8) NULL,
	[FOC] [char](1) NULL,
	[FCOPRATE] [numeric](12, 2) NULL,
	[SPPER] [numeric](12, 2) NULL,
	[FOCPRICE] [numeric](12, 2) NULL,
	[BLOCK] [char](1) NULL,
	[WEBPRICE] [numeric](14, 4) NULL,
	[SWAP] [char](1) NULL,
	[MINORDQTY] [numeric](18, 0) NULL,
	[ALTPART1] [char](20) NULL,
	[ALTPART2] [char](20) NULL,
	[ALTPART3] [char](20) NULL,
	[ALTPART4] [char](20) NULL,
	[APPMODEL] [varchar](500) NULL,
	[NWPRICE] [numeric](12, 2) NULL,
	[NONWARRANTY] [bit] NULL,
	[EXTWARRANTY] [bit] NULL,
	[EWPERCENTAGE] [int] NULL,
	[PurRate] [numeric](18, 2) NULL,
	[EWAccPercentage] [int] NULL,
	[TITCODE] [varchar](250) NULL,
	[TITGRP] [varchar](50) NULL,
	[LEDGERNAME] [varchar](100) NULL,
	[InActive] [int] NULL,
	[ITMAINCATE] [char](20) NULL,
	[PurRateFC] [numeric](18, 4) NULL,
	[ITLOC] [varchar](50) NULL,
	[MAINGRP] [varchar](50) NULL,
	[PRGRP] [varchar](50) NULL,
	[VENDOR] [varchar](50) NULL,
	[PRCODE] [varchar](50) NULL,
	[NWCURCODE] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITMAST_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITMAST_PREV](
	[ITCODE] [char](25) NOT NULL,
	[CCODE] [char](4) NULL,
	[SUPCODE] [char](7) NULL,
	[ITCATE] [char](8) NULL,
	[ITGRP] [char](15) NULL,
	[ITBRND] [char](20) NULL,
	[ITORGN] [char](8) NULL,
	[ITPRODCD] [char](15) NULL,
	[ITDESC] [char](250) NULL,
	[ITVOLU] [decimal](12, 2) NULL,
	[ITWGHT] [decimal](10, 3) NULL,
	[OPRTE] [decimal](12, 4) NULL,
	[WAVRG] [decimal](12, 4) NULL,
	[FCWAVRG] [numeric](12, 3) NULL,
	[LPUDT] [smalldatetime] NULL,
	[LPURT] [decimal](12, 4) NULL,
	[LSTDT] [smalldatetime] NULL,
	[LSTRT] [decimal](12, 4) NULL,
	[ITUNIT] [char](5) NULL,
	[OPSTK] [numeric](12, 2) NULL,
	[STOCK] [numeric](12, 2) NULL,
	[RESVSTK] [numeric](12, 2) NULL,
	[REOLV] [numeric](12, 2) NULL,
	[MNSTK] [numeric](12, 2) NULL,
	[SLTRGT] [numeric](12, 2) NULL,
	[TRPRD] [numeric](12, 2) NULL,
	[SLTRMT] [numeric](12, 2) NULL,
	[PUORD] [numeric](12, 2) NULL,
	[SLORD] [numeric](12, 2) NULL,
	[BATCHFLG] [bit] NOT NULL,
	[ITVCH] [char](4) NULL,
	[ITDETDESC] [text] NULL,
	[PACKING] [char](25) NULL,
	[RATE] [numeric](14, 3) NULL,
	[ITSIZE] [char](50) NULL,
	[SIZEPRINT] [char](1) NULL,
	[BINCODE] [char](8) NULL,
	[OPVAL] [numeric](12, 2) NULL,
	[ITREMARKS] [varchar](300) NULL,
	[ITLEVEL] [char](1) NULL,
	[ALTPART] [char](20) NULL,
	[LVL] [char](10) NULL,
	[BIN1] [char](8) NULL,
	[BIN2] [char](8) NULL,
	[BIN3] [char](8) NULL,
	[BIN4] [char](8) NULL,
	[FOC] [char](1) NULL,
	[FCOPRATE] [numeric](12, 2) NULL,
	[SPPER] [numeric](12, 2) NULL,
	[FOCPRICE] [numeric](12, 2) NULL,
	[BLOCK] [char](1) NULL,
	[WEBPRICE] [numeric](14, 4) NULL,
	[SWAP] [char](1) NULL,
	[MINORDQTY] [numeric](18, 0) NULL,
	[ALTPART1] [char](20) NULL,
	[ALTPART2] [char](20) NULL,
	[ALTPART3] [char](20) NULL,
	[ALTPART4] [char](20) NULL,
	[APPMODEL] [varchar](500) NULL,
	[NWPRICE] [numeric](12, 2) NULL,
	[NONWARRANTY] [bit] NULL,
	[EXTWARRANTY] [bit] NULL,
	[EWPERCENTAGE] [int] NULL,
	[PurRate] [numeric](18, 2) NULL,
	[EWAccPercentage] [int] NULL,
	[TITCODE] [varchar](250) NULL,
	[TITGRP] [varchar](50) NULL,
	[LEDGERNAME] [varchar](100) NULL,
	[InActive] [int] NULL,
	[ITMAINCATE] [char](20) NULL,
	[PurRateFC] [numeric](18, 4) NULL,
	[ITLOC] [varchar](50) NULL,
	[MAINGRP] [varchar](50) NULL,
	[PRGRP] [varchar](50) NULL,
	[VENDOR] [varchar](50) NULL,
	[PRCODE] [varchar](50) NULL,
	[NWCURCODE] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItMastTally]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItMastTally](
	[ITCODE] [char](25) NOT NULL,
	[TITCODE] [varchar](500) NULL,
	[TITGRP] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NOT NULL,
	[XMLEXPORT] [int] NULL,
 CONSTRAINT [PK_ItMastTally] PRIMARY KEY CLUSTERED 
(
	[ITCODE] ASC,
	[COUNTRY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITMODEL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITMODEL](
	[ITCODE] [char](25) NULL,
	[APPMODEL] [char](30) NULL,
	[SLNO] [int] IDENTITY(1,1) NOT NULL,
	[BRAND] [char](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITSTK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITSTK](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL CONSTRAINT [DF_ITSTK_BATCHNO]  DEFAULT (''),
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL CONSTRAINT [DF_ITSTK_OPRATE]  DEFAULT ((0)),
	[OPSTK] [decimal](30, 2) NULL CONSTRAINT [DF_ITSTK_OPSTK_2__13]  DEFAULT ((0)),
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL CONSTRAINT [DF_ITSTK_STOCK_4__13]  DEFAULT ((0)),
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL CONSTRAINT [DF_ITSTK_OPVAL]  DEFAULT ((0)),
	[RESVSTK] [numeric](30, 2) NULL CONSTRAINT [DF_ITSTK_RESVSTK]  DEFAULT ((0)),
	[SLNO] [int] NOT NULL,
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL CONSTRAINT [DF_ITSTK_WTD_AVG]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itstk_0408]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itstk_0408](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL,
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL,
	[OPSTK] [decimal](30, 2) NULL,
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL,
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL,
	[RESVSTK] [numeric](30, 2) NULL,
	[SLNO] [int] NOT NULL,
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itstk_0513]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itstk_0513](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL,
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL,
	[OPSTK] [decimal](30, 2) NULL,
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL,
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL,
	[RESVSTK] [numeric](30, 2) NULL,
	[SLNO] [int] NOT NULL,
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itstk_230618]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itstk_230618](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL,
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL,
	[OPSTK] [decimal](30, 2) NULL,
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL,
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL,
	[RESVSTK] [numeric](30, 2) NULL,
	[SLNO] [int] NOT NULL,
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITSTK_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITSTK_PREV](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL,
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL,
	[OPSTK] [decimal](30, 2) NULL,
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL,
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL,
	[RESVSTK] [numeric](30, 2) NULL,
	[SLNO] [int] NOT NULL,
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITSUB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITSUB](
	[ITCODE] [varchar](25) NULL,
	[PDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[REFNO] [char](15) NULL,
	[QTY] [numeric](12, 2) NULL,
	[MSLNO] [int] NULL,
	[SLNO] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITUNIT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITUNIT](
	[ITCODE] [char](25) NULL,
	[ITUNIT] [char](5) NULL,
	[FACTOR] [decimal](6, 2) NULL,
	[SLRTE] [decimal](12, 4) NULL,
	[MNSLR] [decimal](12, 4) NULL,
	[SLNO] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBFAULT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBFAULT](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[FTYPE] [char](8) NULL,
	[CODE] [char](20) NULL,
	[REMARKS] [varchar](100) NULL,
	[SLNO] [int] NULL,
	[CCODE] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBPARTS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBPARTS](
	[JOBNO] [numeric](8, 0) NOT NULL CONSTRAINT [DF_JBPARTS_JOBNO]  DEFAULT ((0)),
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](25) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL CONSTRAINT [DF_JBPARTS_COST]  DEFAULT ((0)),
	[SLNO] [int] NOT NULL CONSTRAINT [DF_JBPARTS_SLNO]  DEFAULT ((0)),
	[DOI] [smalldatetime] NULL CONSTRAINT [DF_JBPARTS_DOI]  DEFAULT (getdate()),
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](30) NULL,
	[ReturnQty] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[PREV_PARTAMT] [float] NULL DEFAULT ((0)),
	[PREV_ESTAMT] [float] NULL DEFAULT ((0)),
	[LOSS_APRVBY] [varchar](20) NULL,
	[LOSS_APRVDATE] [datetime] NULL,
	[LOSS_AMT] [float] NULL DEFAULT ((0)),
	[cost_prev] [float] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbparts_0416]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbparts_0416](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](20) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](25) NULL,
	[ReturnQty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbparts_0513]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbparts_0513](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](20) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](30) NULL,
	[ReturnQty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbparts_1306]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbparts_1306](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](25) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](30) NULL,
	[ReturnQty] [int] NULL,
	[EXPORTDATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbparts_230618]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbparts_230618](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](25) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](30) NULL,
	[ReturnQty] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[PREV_PARTAMT] [float] NULL,
	[PREV_ESTAMT] [float] NULL,
	[LOSS_APRVBY] [varchar](20) NULL,
	[LOSS_APRVDATE] [datetime] NULL,
	[LOSS_AMT] [float] NULL,
	[cost_prev] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBPARTS_CST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBPARTS_CST](
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NOT NULL CONSTRAINT [DF_JBPARTS_CST_JOBNO]  DEFAULT ((0)),
	[ITCODE] [char](25) NULL,
	[QTY] [int] NULL,
	[SLNO] [int] NULL,
	[RECEIVED] [bit] NULL CONSTRAINT [DF_JBPARTS_CST_RECEIVED]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBPARTS_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBPARTS_PREV](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[PTYPE] [char](1) NULL,
	[LOC] [char](10) NULL,
	[CODE] [char](20) NULL,
	[QTY] [numeric](5, 2) NULL,
	[FCRATE] [numeric](18, 3) NULL,
	[RATE] [numeric](18, 2) NULL,
	[FCAMT] [numeric](18, 3) NULL,
	[AMT] [numeric](18, 2) NULL,
	[COST] [numeric](18, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CAUSE] [char](3) NULL,
	[CLAIM] [char](3) NULL,
	[RequestRef] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[COST1] [numeric](18, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](25) NULL,
	[ReturnQty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBREPAIR]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBREPAIR](
	[YRCD] [char](1) NOT NULL CONSTRAINT [DF_JBREPAIR_yrcd]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL CONSTRAINT [DF_JBREPAIR_CCODE]  DEFAULT (''),
	[CCODE_TRF] [char](10) NULL CONSTRAINT [DF_JBREPAIR_CCODE_TRF]  DEFAULT ('01'),
	[TRF_REQ] [char](10) NULL CONSTRAINT [DF_JBREPAIR_TRF_REQ]  DEFAULT (''),
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL CONSTRAINT [DF_repair_RB1]  DEFAULT ((0)),
	[RB2] [bit] NOT NULL CONSTRAINT [DF_repair_RB2]  DEFAULT ((0)),
	[RB3] [bit] NOT NULL CONSTRAINT [DF_repair_RB3]  DEFAULT ((0)),
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL CONSTRAINT [DF_repair_RC1]  DEFAULT ((0)),
	[RC2] [bit] NOT NULL CONSTRAINT [DF_repair_RC2]  DEFAULT ((0)),
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL CONSTRAINT [DF_repair_RO1]  DEFAULT ((0)),
	[RO2] [bit] NOT NULL CONSTRAINT [DF_repair_RO2]  DEFAULT ((0)),
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL CONSTRAINT [DF_repair_RCMOBILE]  DEFAULT ((0)),
	[RCBATTERY] [bit] NOT NULL CONSTRAINT [DF_repair_RCBATTERY]  DEFAULT ((0)),
	[RCCHARGER] [bit] NOT NULL CONSTRAINT [DF_repair_RCCHARGER]  DEFAULT ((0)),
	[RCOTHERS] [bit] NOT NULL CONSTRAINT [DF_repair_RCOTHERS]  DEFAULT ((0)),
	[RCFPACK] [bit] NOT NULL CONSTRAINT [DF_JBREPAIR_RCFPACK]  DEFAULT ((0)),
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL CONSTRAINT [DF_repair_JBCOMPLETE]  DEFAULT ((0)),
	[REPAIR_STATUS] [int] NULL CONSTRAINT [DF_JBREPAIR_REPAIR_STATUS]  DEFAULT ((0)),
	[CLIENT_CALLED] [bit] NOT NULL CONSTRAINT [DF_JBREPAIR_CLIENT_CALLED]  DEFAULT ((0)),
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL CONSTRAINT [DF_JBREPAIR_QC_STATUS]  DEFAULT ((0)),
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL CONSTRAINT [DF_JBREPAIR_HLR_RM1]  DEFAULT (''),
	[HLR_RM2] [varchar](50) NULL CONSTRAINT [DF_JBREPAIR_HLR_RM2]  DEFAULT (''),
	[HLR_RM3] [varchar](50) NULL CONSTRAINT [DF_JBREPAIR_HLR_RM3]  DEFAULT (''),
	[HLR_RM4] [varchar](50) NULL CONSTRAINT [DF_JBREPAIR_HLR_RM4]  DEFAULT (''),
	[REPAIR_LEVEL] [char](10) NOT NULL CONSTRAINT [DF_JBREPAIR_REPAIR_LEVEL]  DEFAULT ((0)),
	[WRBLOCK] [bit] NOT NULL CONSTRAINT [DF_JBREPAIR_WRBLOCK]  DEFAULT ((0)),
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL CONSTRAINT [DF_JBREPAIR_LABCRG]  DEFAULT ('0'),
	[CUSTAPPR] [char](1) NULL CONSTRAINT [DF_JBREPAIR_CUSTAPPR]  DEFAULT ('0'),
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL CONSTRAINT [DF_JBREPAIR_CAUSEERROR]  DEFAULT ('0'),
	[CLAIM] [char](1) NULL CONSTRAINT [DF_JBREPAIR_CLAIM]  DEFAULT ('0'),
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL CONSTRAINT [DF_JBREPAIR_PMTAMT]  DEFAULT ((0)),
	[PMTAMTFC] [numeric](18, 3) NULL CONSTRAINT [DF_JBREPAIR_PMTAMTFC]  DEFAULT ((0)),
	[PMTAMT1] [numeric](18, 2) NULL CONSTRAINT [DF_JBREPAIR_PMTAMT1]  DEFAULT ((0)),
	[PMTAMT1FC] [numeric](18, 3) NULL CONSTRAINT [DF_JBREPAIR_PMTAMT1FC]  DEFAULT ((0)),
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL CONSTRAINT [DF_JBREPAIR_CANCELTAG]  DEFAULT ('0'),
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL CONSTRAINT [DF_JBREPAIR_DEFITCODE1]  DEFAULT (''),
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL CONSTRAINT [DF_JBREPAIR_REPTIME1]  DEFAULT ((0)),
	[CUSTTIME1] [numeric](2, 0) NULL CONSTRAINT [DF_JBREPAIR_CYCLETIME1]  DEFAULT ((0)),
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL CONSTRAINT [DF_JBREPAIR_WRTYPE2]  DEFAULT ((0)),
	[NOPRINT] [int] NULL CONSTRAINT [DF_JBREPAIR_NOPRINT]  DEFAULT ((0)),
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL CONSTRAINT [DF_JBREPAIR_SMSSENT]  DEFAULT ('0'),
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL CONSTRAINT [DF_JBREPAIR_ESTSMSAlert]  DEFAULT ((0)),
	[CashRecd] [int] NULL CONSTRAINT [DF_JBREPAIR_CashRecd]  DEFAULT ((0)),
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL CONSTRAINT [DF_JBREPAIR_Claimed]  DEFAULT ((0)),
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL CONSTRAINT [DF_JBREPAIR_BER]  DEFAULT ((0)),
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL CONSTRAINT [DF_JBREPAIR_WIP]  DEFAULT ((0)),
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL CONSTRAINT [DF_JBREPAIR_CashRecdAmtStat]  DEFAULT ((0)),
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL,
	[EXPORTDATE] [datetime] NULL,
	[LOSS_APPROVED] [char](1) NULL,
	[LOSS_APRVBY] [varchar](20) NULL,
	[LOSS_APRVDATE] [datetime] NULL,
	[LOSS_APRVNOTES] [varchar](200) NULL,
 CONSTRAINT [PK_JBREPAIR] PRIMARY KEY CLUSTERED 
(
	[JOBNO] ASC,
	[CCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_0105]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_0105](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_041018_SWAPLABOURUPDATE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_041018_SWAPLABOURUPDATE](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL,
	[EXPORTDATE] [datetime] NULL,
	[LOSS_APPROVED] [char](1) NULL,
	[LOSS_APRVBY] [varchar](20) NULL,
	[LOSS_APRVDATE] [datetime] NULL,
	[LOSS_APRVNOTES] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_0506]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_0506](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_0506_01]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_0506_01](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_121018]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_121018](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL,
	[EXPORTDATE] [datetime] NULL,
	[LOSS_APPROVED] [char](1) NULL,
	[LOSS_APRVBY] [varchar](20) NULL,
	[LOSS_APRVDATE] [datetime] NULL,
	[LOSS_APRVNOTES] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_170518_cprejectupdate]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_170518_cprejectupdate](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL,
	[EXPORTDATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_2804_01]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_2804_01](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_2804_02]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_2804_02](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_2804_03]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_2804_03](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jbrepair_2804_04]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_2804_04](
	[YRCD] [char](1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[REFNO] [char](8) NULL,
	[JOBTYPE] [char](1) NULL,
	[JOBCATE] [char](4) NULL,
	[CLCODE] [char](7) NULL,
	[CCODE] [char](10) NOT NULL,
	[CCODE_TRF] [char](10) NULL,
	[TRF_REQ] [char](10) NULL,
	[COLLECTIONLOC] [char](10) NULL,
	[COLLECTIONREF] [char](30) NULL,
	[TECHCD] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELDATE] [datetime] NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[SIMEINO] [varchar](20) NULL,
	[ESNNO] [varchar](15) NULL,
	[MSNNO] [varchar](18) NULL,
	[PREAMT] [numeric](18, 2) NULL,
	[PREAMTFC] [numeric](18, 3) NULL,
	[RBRAND] [char](4) NULL,
	[RB1] [bit] NOT NULL,
	[RB2] [bit] NOT NULL,
	[RB3] [bit] NOT NULL,
	[RBNAME] [varchar](50) NULL,
	[RMODEL] [varchar](10) NULL,
	[RC1] [bit] NOT NULL,
	[RC2] [bit] NOT NULL,
	[RIMEINO] [varchar](20) NULL,
	[RO1] [bit] NOT NULL,
	[RO2] [bit] NOT NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RCMOBILE] [bit] NOT NULL,
	[RCBATTERY] [bit] NOT NULL,
	[RCCHARGER] [bit] NOT NULL,
	[RCOTHERS] [bit] NOT NULL,
	[RCFPACK] [bit] NOT NULL,
	[RCDESCR] [varchar](50) NULL,
	[DPAMT] [numeric](18, 2) NULL,
	[DPAMTFC] [numeric](18, 3) NULL,
	[WRTYPE] [smallint] NULL,
	[WRTYNO] [char](15) NULL,
	[ISSDT] [smalldatetime] NULL,
	[EXPDT] [smalldatetime] NULL,
	[WRTYNO1] [smallint] NULL,
	[DOCNO] [char](8) NULL,
	[DOCFDT] [smalldatetime] NULL,
	[DOCTDT] [smalldatetime] NULL,
	[DOCREF] [varchar](50) NULL,
	[INDT] [datetime] NULL,
	[INTM] [char](5) NULL,
	[JBSDT] [datetime] NULL,
	[JBSTM] [char](5) NULL,
	[JBDT] [datetime] NULL,
	[JBTM] [char](5) NULL,
	[JBCOMPLETE] [bit] NOT NULL,
	[REPAIR_STATUS] [int] NULL,
	[CLIENT_CALLED] [bit] NOT NULL,
	[CALLED_REMARKS] [varchar](50) NULL,
	[JBNOTES] [varchar](250) NULL,
	[OUTDT] [datetime] NULL,
	[OUTTM] [char](5) NULL,
	[ITTOTAL] [numeric](18, 2) NULL,
	[ITTOTALFC] [numeric](18, 3) NULL,
	[SVTOTAL] [numeric](18, 2) NULL,
	[SVTOTALFC] [numeric](18, 3) NULL,
	[INVOICED] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE1] [char](4) NULL,
	[TOTAL] [numeric](18, 2) NULL,
	[TOTALFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[DPTRNO1] [char](8) NULL,
	[DPTRNO2] [char](8) NULL,
	[CCNO] [varchar](25) NULL,
	[CCEXPDT] [smalldatetime] NULL,
	[CCTYPE] [varchar](20) NULL,
	[CCACNAME] [varchar](50) NULL,
	[CCOTHERS] [varchar](50) NULL,
	[INVREF] [char](20) NULL,
	[VOFLT] [nvarchar](250) NULL,
	[HLREFNO] [varchar](20) NULL,
	[HLREFDT] [smalldatetime] NULL,
	[HLDLRNAME] [varchar](50) NULL,
	[HLDLRDT] [smalldatetime] NULL,
	[HLAMT] [numeric](18, 2) NULL,
	[HLDET] [varchar](50) NULL,
	[USER1] [char](10) NULL,
	[USER2] [char](10) NULL,
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[HLROUT] [smalldatetime] NULL,
	[HLROUT_C] [smalldatetime] NULL,
	[HLRDEL] [smalldatetime] NULL,
	[HLRDEL_C] [smalldatetime] NULL,
	[HLR_RM1] [varchar](50) NULL,
	[HLR_RM2] [varchar](50) NULL,
	[HLR_RM3] [varchar](50) NULL,
	[HLR_RM4] [varchar](50) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL,
	[WRBLOCK] [bit] NOT NULL,
	[BLOCKNOTES] [varchar](100) NULL,
	[YRCD1] [char](1) NULL,
	[VERSION] [char](10) NULL,
	[PHONETYPE] [char](1) NULL,
	[LABCRG] [char](1) NULL,
	[CUSTAPPR] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[WPTECH] [char](10) NULL,
	[WPDATE] [smalldatetime] NULL,
	[WPREMARKS] [varchar](100) NULL,
	[WAITFORPART] [numeric](1, 0) NULL,
	[CPTECH] [char](10) NULL,
	[CPDATE] [smalldatetime] NULL,
	[CPREMARKS] [varchar](250) NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[CAUSEERROR] [char](1) NULL,
	[CLAIM] [char](1) NULL,
	[MONTHPRD] [char](10) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[MONCODE] [char](25) NULL,
	[BUILTINCODE] [char](25) NULL,
	[TRANCODE] [char](25) NULL,
	[REPAIRCODE] [char](8) NULL,
	[WARRCLAIMREF] [char](10) NULL,
	[ESTDTECH] [char](10) NULL,
	[WCARDNO] [char](20) NULL,
	[WARRTYPE] [char](8) NULL,
	[WARRREM] [varchar](50) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[DATABAK] [char](1) NULL,
	[ESTREPAIRCRG] [numeric](18, 2) NULL,
	[ESTREPAIRCRGFC] [numeric](18, 3) NULL,
	[FULLUNIT] [char](1) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[JOBREM] [varchar](500) NULL,
	[estremarks] [varchar](250) NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[CUSTREM] [varchar](250) NULL,
	[WRTYPE1] [smallint] NULL,
	[PRODUCTCODE] [char](20) NULL,
	[CLAIMREF] [char](25) NULL,
	[NAME] [varchar](100) NULL,
	[PHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[CANCELTAG] [char](1) NULL,
	[CANCELREM] [varchar](250) NULL,
	[CANCELDATE] [smalldatetime] NULL,
	[CANCELUSERID] [char](10) NULL,
	[BINLOC] [char](10) NULL,
	[CALLEDTAG] [char](1) NULL,
	[CALLEDDATE] [smalldatetime] NULL,
	[CALLEDUSERID] [char](10) NULL,
	[CALLEDREM] [varchar](250) NULL,
	[CALLEDSTATUS] [int] NULL,
	[REPLEVEL] [char](10) NULL,
	[GDW] [int] NULL,
	[DEFITCODE] [char](20) NULL,
	[DEFITCODE1] [char](20) NULL,
	[DEFLOCODE] [char](10) NULL,
	[MOTCLAIMREF] [numeric](18, 0) NULL,
	[BATTDOOR] [char](1) NULL,
	[BASEUNIT] [char](1) NULL,
	[HANDSET] [char](1) NULL,
	[CHARGER] [char](1) NULL,
	[RFBOARD] [char](1) NULL,
	[ACCESS] [char](1) NULL,
	[FULLUT] [char](1) NULL,
	[IRISDUMMY] [char](20) NULL,
	[REPTIME] [char](8) NULL,
	[CUSTTIME] [char](8) NULL,
	[ACCDATECODE] [char](5) NULL,
	[REPTIME1] [numeric](2, 0) NULL,
	[CUSTTIME1] [numeric](2, 0) NULL,
	[REFDES] [char](10) NULL,
	[LOGIN] [char](1) NULL,
	[ISSUESTATUS] [char](1) NULL,
	[ESTSTARTDATE] [smalldatetime] NULL,
	[PINVREF] [char](10) NULL,
	[PDATE] [smalldatetime] NULL,
	[WRTYPE2] [smallint] NULL,
	[NOPRINT] [int] NULL,
	[LogCompletetotaltime] [numeric](10, 2) NULL,
	[TotalTime] [numeric](18, 2) NULL,
	[Estcptotaltime] [numeric](18, 2) NULL,
	[RepDeltotaltime] [numeric](18, 2) NULL,
	[logdeltotaltime] [numeric](18, 2) NULL,
	[DEALERREF] [char](20) NULL,
	[CUSTOMERREF] [char](20) NULL,
	[AWBNO] [char](20) NULL,
	[SMSSENT] [char](1) NULL,
	[ESTSMSSENT] [char](1) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[DELIVERY_AWBNO] [char](20) NULL,
	[DELIVERY_BATCHREF] [char](20) NULL,
	[EMAILSENT] [char](1) NULL,
	[ESTEMAILSENT] [char](1) NULL,
	[LogToStartRepair] [numeric](18, 2) NULL,
	[EstStartComplete] [numeric](18, 2) NULL,
	[EstApprComplete] [numeric](18, 2) NULL,
	[WPStart_JbComplete] [numeric](18, 2) NULL,
	[oldjbsdt] [smalldatetime] NULL,
	[oldtechcd] [char](10) NULL,
	[JBFAULTCODE] [char](15) NULL,
	[Dealer_CustomerName] [varchar](100) NULL,
	[Dealer_Mobile] [varchar](50) NULL,
	[Dealer_Telephone] [varchar](50) NULL,
	[Dealer_Email] [varchar](50) NULL,
	[TicketRef] [varchar](50) NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[UnitRecieved_TCDate] [smalldatetime] NULL,
	[ESTSMSAlert] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[Claimed] [int] NULL,
	[SagemOutRef] [char](20) NULL,
	[OutSWVer] [char](10) NULL,
	[SagemRepairLevel] [varchar](50) NULL,
	[ClaimPeriod] [varchar](25) NULL,
	[SagemConfirmFaultCode] [varchar](5) NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[EMSWARRANTY] [char](20) NULL,
	[BERCheck] [int] NULL,
	[Customer_Reference] [varchar](25) NULL,
	[consumptionDate] [smalldatetime] NULL,
	[ExpDelDate] [smalldatetime] NULL,
	[WIP] [int] NULL,
	[MSNOUT] [char](10) NULL,
	[EMSREPAIR] [int] NULL,
	[MotCFaultCode] [char](10) NULL,
	[ProdigyDeliveryDate] [smalldatetime] NULL,
	[Samsung_ServiceType] [char](2) NULL,
	[Samsung_IRISCode1] [char](4) NULL,
	[Samsung_IRISCode2] [char](4) NULL,
	[Samsung_IRISCode3] [char](4) NULL,
	[Samsung_IRISCode4] [char](4) NULL,
	[Samsung_WS] [int] NULL,
	[Samsung_WSText] [varchar](250) NULL,
	[Samsung_WSTechCD] [varchar](50) NULL,
	[Samsung_WSDate] [smalldatetime] NULL,
	[Service_Model] [char](20) NULL,
	[Refurbishment] [char](10) NULL,
	[Warranty] [int] NULL,
	[Part_No] [char](20) NULL,
	[DataValidated] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[CustNotApr] [nvarchar](50) NULL,
	[LTRReasonCode] [varchar](10) NULL,
	[Samsung_WIPStatus] [varchar](10) NULL,
	[Samsung_WIPDesc] [varchar](100) NULL,
	[TC_CollectedDate] [smalldatetime] NULL,
	[JobAll_Techcd] [char](30) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[Product] [char](30) NULL,
	[CashRecdAmtStat] [tinyint] NOT NULL,
	[CashRecdAmtRemark] [varchar](200) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[ASC_BILL_NO] [varchar](50) NULL,
	[SAMSUNG_BILL_NO] [varchar](50) NULL,
	[WBILL_CARD] [varchar](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[SERVICE] [int] NULL,
	[AdvanceAmt] [numeric](18, 2) NULL,
	[AdvanceAmtFC] [numeric](18, 2) NULL,
	[HTC_WIPStatus] [varchar](50) NULL,
	[HTC_WIPDesc] [varchar](500) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[QC_Startdate] [smalldatetime] NULL,
	[EstimatedDT] [smalldatetime] NULL,
	[USBCABLE] [char](1) NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[SamsungGSPNStatus] [varchar](50) NULL,
	[SamsungGSPNDesc] [varchar](500) NULL,
	[TRSTATUS] [varchar](50) NULL,
	[CPDis] [numeric](18, 2) NULL,
	[CPDisFC] [numeric](18, 3) NULL,
	[CPAppamt] [numeric](18, 2) NULL,
	[CPAppamtFC] [numeric](18, 3) NULL,
	[InvUser] [varchar](50) NULL,
	[InvPrint] [tinyint] NULL,
	[CashRecdAmtFC] [numeric](18, 2) NULL,
	[OpRequest] [int] NULL,
	[OpUserId] [varchar](50) NULL,
	[OpRequestDate] [smalldatetime] NULL,
	[OpAmount] [numeric](18, 2) NULL,
	[OpAmountFC] [numeric](18, 3) NULL,
	[OpRequestRemarks] [varchar](500) NULL,
	[OpApproval] [int] NULL,
	[OpApprovalUserId] [varchar](50) NULL,
	[OpApprovalDate] [smalldatetime] NULL,
	[OpApprovalAmount] [numeric](18, 2) NULL,
	[OpApprovalAmountFC] [numeric](18, 3) NULL,
	[OpApprovalRemarks] [varchar](500) NULL,
	[OpApprovalCM] [int] NULL,
	[OpApprovalUserIdCM] [varchar](50) NULL,
	[OpApprovalDateCM] [smalldatetime] NULL,
	[OpApprovalAmountCM] [numeric](18, 2) NULL,
	[OpApprovalAmountCMFC] [numeric](18, 3) NULL,
	[OpApprovalRemarksCM] [varchar](500) NULL,
	[CashRecdUser] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTJOB] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[WrchangeReq] [tinyint] NULL,
	[WrchangeReqBy] [char](50) NULL,
	[WrchangeReqDate] [smalldatetime] NULL,
	[WrchangeApp] [tinyint] NULL,
	[WrchangeAppBy] [char](50) NULL,
	[WrchangeAppDate] [smalldatetime] NULL,
	[XMLEXPORTADVANCE] [int] NULL,
	[PmtRecdType] [varchar](100) NULL,
	[LOC] [varchar](50) NULL,
	[KGTTYPE] [varchar](50) NULL,
	[ESTSALESTAX] [numeric](18, 2) NULL,
	[ESTSALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[PDocNo] [char](8) NULL,
	[PDate1] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL,
	[ReqAmt] [decimal](18, 2) NULL,
	[CLPARTS] [numeric](18, 2) NULL,
	[CLCHARGE] [numeric](18, 2) NULL,
	[TypeOfWarranty] [int] NULL,
	[WCLAIMDOCNO] [char](8) NULL,
	[WCLAIMDATE] [smalldatetime] NULL,
	[ESTAMT] [numeric](18, 2) NULL,
	[ESTAMTFC] [numeric](18, 3) NULL,
	[WrchangeRemarks] [varchar](500) NULL,
	[JOBREF] [nvarchar](15) NULL,
	[CashBack] [int] NULL,
	[CashReturn] [int] NULL,
	[Grade] [char](2) NULL,
	[UnitRequest] [int] NULL,
	[UnitRequestDate] [smalldatetime] NULL,
	[UnitRequestEng] [varchar](50) NULL,
	[UnitIssue] [int] NULL,
	[UnitIssueDate] [smalldatetime] NULL,
	[UnitIssueLGU] [varchar](50) NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[UnitReceiveEng] [varchar](50) NULL,
	[BinCode] [nvarchar](8) NULL,
	[OutRegion] [int] NULL,
	[IWChargeFC] [numeric](18, 3) NULL,
	[IWCharge] [numeric](18, 2) NULL,
	[EstIWChargeFC] [numeric](18, 3) NULL,
	[EstIWCharge] [numeric](18, 2) NULL,
	[CreditNote] [int] NULL,
	[SwapInvoiced] [int] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPREMARKS] [varchar](250) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[ADVANCERECDDATE] [smalldatetime] NULL,
	[SERVICEINVOICED] [int] NULL,
	[ESTAMT1] [numeric](18, 2) NULL,
	[ESTAMT1FC] [numeric](18, 3) NULL,
	[REESTDTECH] [char](10) NULL,
	[REESTREMARKS] [varchar](250) NULL,
	[REESTDATE] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL,
	[UNITSENDREQUIRED] [int] NULL,
	[UNITSENDTYPE] [int] NULL,
	[UNITSENDDETAILS] [varchar](250) NULL,
	[REFURBLOC] [int] NULL,
	[UNITSRECEIVEDVENDOR] [int] NULL,
	[RECEIVEDTYPE] [nvarchar](50) NULL,
	[RMAREF] [char](15) NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[P_CPAppamt] [numeric](18, 2) NULL,
	[P_CPAppamtFC] [numeric](18, 2) NULL,
	[P_CPAppRemarks] [nvarchar](100) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdAmt2] [numeric](18, 2) NULL,
	[CashRecdAmtFC2] [numeric](18, 2) NULL,
	[CashRecdUser2] [nvarchar](50) NULL,
	[CashRecdDate2] [datetime] NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[WARRANTYCLAIM] [int] NULL,
	[P_CPDate] [datetime] NULL,
	[P_CPTech] [char](10) NULL,
	[CUST_AMT_EMAIL] [int] NULL,
	[RTVREQUEST] [int] NULL,
	[CashBackRequest] [int] NULL,
	[LABOURCLAIM] [nvarchar](50) NULL,
	[LABOURCLAIMRECEIPT] [int] NULL,
	[RETURNTYPE] [int] NULL,
	[DOA_APPROVED] [int] NULL,
	[DOA_SP] [int] NULL,
	[S_REMARKS] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBREPAIR_ESTSMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBREPAIR_ESTSMS](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL CONSTRAINT [DF_JBREPAIR_ESTSMS_CCODE]  DEFAULT (''),
	[SMSSENT] [int] NULL,
	[SMSSENTDATE] [smalldatetime] NULL,
	[EMAILSENT] [int] NULL,
	[EMAILSENTDATE] [smalldatetime] NULL,
	[ESTIMATE] [int] NULL,
	[SMSSENT1] [int] NULL,
	[SMSSENTDATE1] [smalldatetime] NULL,
	[EMAILSENT1] [int] NULL,
	[EMAILSENTDATE1] [smalldatetime] NULL,
	[REESTIMATE] [int] NULL,
 CONSTRAINT [PK_JBREPAIR_ESTSMS] PRIMARY KEY CLUSTERED 
(
	[JOBNO] ASC,
	[CCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBREPAIR_MAIN]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBREPAIR_MAIN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBREF] [varchar](15) NULL,
	[INDT] [datetime] NULL,
	[DEALERREF] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JBSTATUS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JBSTATUS](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CODE] [char](4) NULL,
	[JBDT] [smalldatetime] NULL,
	[JBTM] [char](5) NULL,
	[JBTECH] [char](4) NULL,
	[JBTIMESPENT] [char](5) NULL,
	[SLNO] [int] NOT NULL CONSTRAINT [DF_JBSTATUS_SLNO]  DEFAULT (0),
	[CCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobTrf]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTrf](
	[DocNo] [numeric](8, 0) NULL,
	[DocDate] [smalldatetime] NULL,
	[CCode] [char](10) NULL,
	[CCode_To] [char](10) NULL,
	[IMEINo] [char](20) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[Remarks] [varchar](50) NULL,
	[slno] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOG_M_LCHARGE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOG_M_LCHARGE](
	[TRNID] [int] IDENTITY(1,1) NOT NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[BRAND] [nvarchar](50) NULL,
	[PRODUCT] [nvarchar](50) NULL,
	[WRTYPE] [smallint] NULL,
	[LCHARGE] [numeric](25, 2) NULL,
	[CURRENCY] [char](5) NULL,
	[CREATEDBY] [varchar](30) NULL,
	[CREATEDON] [smalldatetime] NULL,
	[ACTIVE] [int] NULL,
	[UPDATEDBY] [varchar](30) NULL,
	[UPDATEDON] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Account]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Account](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[Accode] [char](20) NULL,
	[ACNAME] [varchar](60) NULL,
	[Accode1] [char](20) NULL,
	[active] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Bank]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Bank](
	[BankName] [varchar](500) NOT NULL,
 CONSTRAINT [PK_MB] PRIMARY KEY CLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_BANKDETAILS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_BANKDETAILS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SLCODE] [nvarchar](50) NULL,
	[DL4] [nvarchar](50) NULL,
	[ACCNAME] [nvarchar](50) NULL,
	[BRANCH] [nvarchar](50) NULL,
	[PAYMENTTYPE] [nvarchar](50) NULL,
	[ACTIVE] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Budget]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Budget](
	[COUNTRY] [varchar](50) NULL,
	[BRAND] [char](20) NULL,
	[WRTYPE] [char](10) NULL,
	[YEAR] [char](10) NULL,
	[MONTH] [numeric](18, 0) NULL,
	[DAYS] [int] NULL,
	[BUDGET] [numeric](18, 0) NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_COUNTRY]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_COUNTRY](
	[CODE] [char](3) NULL,
	[CDESC] [char](50) NULL,
	[Prefix] [char](2) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CURRENCY]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CURRENCY](
	[DOCNO] [numeric](18, 0) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[CURCODE] [char](4) NOT NULL,
	[BUYRATE] [decimal](18, 0) NOT NULL,
	[SELLRATE] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_M_CURRENCY] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CustomerNotApproved]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CustomerNotApproved](
	[Code] [varchar](10) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_EMAIL_ALERT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_EMAIL_ALERT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMAIL_TYPE] [varchar](100) NULL,
	[EMAIL_FROM] [varchar](50) NULL,
	[EMAIL_TO] [varchar](500) NULL,
	[EMAIL_CC] [varchar](500) NULL,
	[EMAIL_BCC] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_EMIRATE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_EMIRATE](
	[CODE] [char](30) NULL,
	[CDESC] [char](50) NULL,
	[COUNTRY] [char](3) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_GSPNWIPStatus]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_GSPNWIPStatus](
	[Code] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[TRSTATUS] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_HTCWIPStatus]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_HTCWIPStatus](
	[Code] [varchar](100) NULL,
	[Description] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_LCHARGE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_LCHARGE](
	[SLNO] [int] IDENTITY(1,1) NOT NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[BRAND] [nvarchar](50) NULL,
	[PRODUCT] [nvarchar](50) NULL,
	[WRTYPE] [smallint] NULL,
	[LCHARGE] [numeric](25, 2) NULL,
	[CURRENCY] [char](5) NULL,
	[CREATEDBY] [varchar](30) NULL,
	[CREATEDON] [smalldatetime] NULL,
	[ACTIVE] [int] NULL,
	[UPDATEDBY] [varchar](30) NULL,
	[UPDATEDON] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_LCHARGETYPE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_LCHARGETYPE](
	[CODE] [char](3) NOT NULL,
	[CDESC] [char](30) NULL,
 CONSTRAINT [PK_M_LCHARGETYPE] PRIMARY KEY CLUSTERED 
(
	[CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_LCHARGETYPESUB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_LCHARGETYPESUB](
	[CODE] [char](3) NOT NULL,
	[LCTYPECODE] [char](3) NULL,
	[CDESC] [char](50) NULL,
 CONSTRAINT [PK_M_LCHARGETYPESUB] PRIMARY KEY CLUSTERED 
(
	[CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Level]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Level](
	[Code] [varchar](10) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_LOG]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_LOG](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[log1] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_LTRMaster]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_LTRMaster](
	[Code] [varchar](10) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_OtherRevenue]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_OtherRevenue](
	[COUNTRY] [varchar](50) NULL,
	[REVENUENAME] [varchar](100) NULL,
	[PROVISIONALAMT] [numeric](18, 0) NULL,
	[ACTUALAMT] [numeric](18, 0) NULL,
	[YEAR] [char](10) NULL,
	[MONTH] [numeric](18, 0) NULL,
	[DAYS] [int] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_PMTTERMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_PMTTERMS](
	[CODE] [char](3) NULL,
	[CDESC] [char](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_QC]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_QC](
	[qcid] [int] IDENTITY(1,1) NOT NULL,
	[Product] [varchar](50) NULL,
	[qcdesc] [varchar](200) NULL,
	[qcref] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_RepairLevel]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_RepairLevel](
	[Country] [char](15) NULL,
	[Brand] [char](20) NULL,
	[LevelCode] [char](10) NULL,
	[CostPerRepair] [numeric](12, 2) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Freight] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Samsung_IRIS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Samsung_IRIS](
	[Code] [varchar](10) NULL,
	[Name] [varchar](100) NULL,
	[Type] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Samsung_ServiceType]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Samsung_ServiceType](
	[STCode] [varchar](2) NULL,
	[STName] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Samsung_WtyStatus]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Samsung_WtyStatus](
	[Code] [varchar](10) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ServiceDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ServiceDetail](
	[SerCode] [char](7) NOT NULL,
	[RCCode] [int] NOT NULL,
	[RCName] [varchar](50) NULL,
	[SNo] [int] NOT NULL,
 CONSTRAINT [PK_SD1] PRIMARY KEY CLUSTERED 
(
	[SerCode] ASC,
	[RCCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ServiceMast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ServiceMast](
	[SerCode] [char](7) NOT NULL,
	[SerDesc] [varchar](50) NULL,
	[Country] [char](10) NULL,
	[CustCode] [char](7) NULL,
	[CostType] [int] NULL,
	[RC] [bit] NULL,
	[RCode] [char](10) NULL,
	[curcode] [char](4) NULL,
	[Cost] [numeric](18, 4) NULL,
	[InvDay] [int] NOT NULL,
	[XMLEXPORT] [int] NULL,
	[WI] [bit] NOT NULL,
 CONSTRAINT [PK_SM1] PRIMARY KEY CLUSTERED 
(
	[SerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ServiceType]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ServiceType](
	[Code] [varchar](2) NULL,
	[Description] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[Amount] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_TallyLedgerName]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_TallyLedgerName](
	[LEDGERNAME] [varchar](500) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_UNIT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_UNIT](
	[CODE] [char](3) NULL,
	[CDESC] [char](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_VOUCHERTYPE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_VOUCHERTYPE](
	[VOUCHERTYPE] [nchar](10) NOT NULL,
	[VOUCHERNAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_M_VOUCHERTYPE] PRIMARY KEY CLUSTERED 
(
	[VOUCHERTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_WarrantyCost]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_WarrantyCost](
	[COUNTRY] [char](3) NULL,
	[BRAND] [char](20) NULL,
	[TYPE] [varchar](50) NULL,
	[PRODUCT] [char](30) NULL,
	[LCHARGE] [numeric](25, 2) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [char](10) NULL,
	[MONTH] [numeric](18, 0) NULL,
	[DAYS] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_WIPStatus]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_WIPStatus](
	[Code] [varchar](10) NULL,
	[Description] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mdmast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mdmast](
	[mdcode] [char](2) NULL,
	[mddesc] [char](50) NULL,
	[customertag] [bit] NOT NULL,
	[WHLOC] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NegStock]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NegStock](
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[locode] [char](3) NULL,
	[itcode] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBSOPSTK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OBSOPSTK](
	[ITCODE] [char](20) NOT NULL,
	[QTY] [float] NULL,
	[VALUE] [float] NULL,
 CONSTRAINT [PK_OBSOPSTK] PRIMARY KEY CLUSTERED 
(
	[ITCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OOW]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OOW](
	[ITEM_CODE ] [nvarchar](255) NULL,
	[OW_PRICE] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORFOOT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORFOOT](
	[ORTYP] [char](1) NULL,
	[ORDNO] [char](8) NULL,
	[ITCODE] [char](25) NULL,
	[ITUNIT] [char](5) NULL,
	[PACK1] [char](15) NULL,
	[FACTOR] [numeric](18, 4) NULL,
	[ITQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_ITQTY]  DEFAULT ((0)),
	[ITRTE] [numeric](18, 5) NULL CONSTRAINT [DF_ORFOOT_ITRTE]  DEFAULT ((0)),
	[ITAMNT] [numeric](18, 5) NULL CONSTRAINT [DF_ORFOOT_ITAMNT]  DEFAULT ((0)),
	[BCAMNT] [numeric](18, 2) NULL CONSTRAINT [DF_ORFOOT_BCAMNT]  DEFAULT ((0)),
	[OPQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_OPQTY]  DEFAULT ((0)),
	[RCQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_RCQTY]  DEFAULT ((0)),
	[CNQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_CNQTY]  DEFAULT ((0)),
	[Slno] [int] NOT NULL,
	[ITEMDESC] [varchar](250) NOT NULL CONSTRAINT [DF_ORFOOT_ITEMDESC]  DEFAULT (''),
	[GITQTY] [numeric](18, 3) NOT NULL CONSTRAINT [DF_ORFOOT_GITQTY]  DEFAULT ((0)),
	[BOOKING] [bit] NOT NULL CONSTRAINT [DF_ORFOOT_BOOKING]  DEFAULT ((0)),
	[BOOKQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_BOOKQTY]  DEFAULT ((0)),
	[BOOKRCQTY] [numeric](18, 0) NULL CONSTRAINT [DF_ORFOOT_BOOKRCQTY]  DEFAULT ((0)),
	[TRCQTY] [numeric](18, 3) NULL CONSTRAINT [DF_ORFOOT_TRCQTY]  DEFAULT ((0)),
	[SIZEPRINT] [char](1) NOT NULL CONSTRAINT [DF_ORFOOT_SIZEPRINT]  DEFAULT ('N'),
	[tmpqty] [numeric](18, 3) NOT NULL CONSTRAINT [DF_ORFOOT_tmpqty]  DEFAULT ((0)),
	[t] [char](1) NULL,
	[PQTY] [numeric](18, 2) NULL,
	[PAMT] [numeric](18, 2) NULL,
	[Remarks] [varchar](100) NULL,
	[DetDesc] [varchar](250) NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[refno] [char](15) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[CONSDQTY] [numeric](18, 2) NULL,
	[MINQTY] [numeric](18, 2) NULL,
	[ACTREQQTY] [numeric](18, 2) NULL,
	[CONS1] [numeric](18, 0) NULL,
	[CONS2] [numeric](18, 0) NULL,
	[CONS3] [numeric](18, 0) NULL,
	[SOQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_ORFOOT_SOQTY]  DEFAULT ((0)),
	[ADDLQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_ORFOOT_ADDLQTY]  DEFAULT ((0)),
	[MINORDQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_ORFOOT_MINORDQTY]  DEFAULT ((0)),
	[STKQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_ORFOOT_STKQTY]  DEFAULT ((0)),
	[LESSQTY] [numeric](18, 0) NULL,
	[STOCKQTY] [numeric](18, 0) NULL,
	[POADDLQTY] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL,
	[LOCSTK] [numeric](18, 0) NULL,
	[REMARKS1] [varchar](100) NULL,
	[CSQTY] [numeric](18, 0) NULL,
	[SUBSTKQTY] [numeric](18, 0) NULL,
	[STKRATE] [numeric](18, 2) NULL,
	[LOCCONS] [numeric](18, 0) NULL,
	[CSCONS] [numeric](18, 0) NULL,
	[ACTORDQTY] [numeric](18, 0) NULL,
	[OBSLOCQTY] [numeric](18, 0) NULL,
	[SAMSUNG_JOBREF] [varchar](10) NULL,
	[SAMSUNG_WPSLNO] [int] NULL,
	[UNITSWAITING] [numeric](18, 2) NULL,
	[GIT] [numeric](18, 2) NULL,
	[CONSAVGQTY] [numeric](18, 2) NULL,
	[CONS1QTY] [numeric](18, 2) NULL,
	[CONS2QTY] [numeric](18, 2) NULL,
	[CONS3QTY] [numeric](18, 2) NULL,
	[CONS4QTY] [numeric](18, 2) NULL,
	[CONS5QTY] [numeric](18, 2) NULL,
	[CONS6QTY] [numeric](18, 2) NULL,
	[REGVALUE] [numeric](18, 2) NULL,
	[FINALREGVALUE] [numeric](18, 2) NULL,
	[COSTMODIFIER] [numeric](18, 2) NULL,
	[COSTADJORDER] [numeric](18, 2) NULL,
	[TLQTY] [numeric](18, 2) NULL,
	[SYSSUGGQTY] [numeric](18, 2) NULL,
	[ETD_TW] [smalldatetime] NULL,
	[ETA_TC] [smalldatetime] NULL,
	[INTRANSITQTY] [numeric](18, 0) NULL CONSTRAINT [DF_ORFOOT_INTRANSITQTY]  DEFAULT ((0)),
	[SHIPPINGNO] [varchar](50) NULL,
	[RMANO] [char](20) NULL,
	[VendorRMANO] [char](50) NULL,
	[ordid] [int] IDENTITY(1,1) NOT NULL,
	[orhid] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orfoot_0906]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orfoot_0906](
	[ORTYP] [char](1) NULL,
	[ORDNO] [char](8) NULL,
	[ITCODE] [char](25) NULL,
	[ITUNIT] [char](5) NULL,
	[PACK1] [char](15) NULL,
	[FACTOR] [numeric](18, 4) NULL,
	[ITQTY] [numeric](18, 3) NULL,
	[ITRTE] [numeric](18, 5) NULL,
	[ITAMNT] [numeric](18, 5) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[OPQTY] [numeric](18, 3) NULL,
	[RCQTY] [numeric](18, 3) NULL,
	[CNQTY] [numeric](18, 3) NULL,
	[Slno] [int] NOT NULL,
	[ITEMDESC] [varchar](250) NOT NULL,
	[GITQTY] [numeric](18, 3) NOT NULL,
	[BOOKING] [bit] NOT NULL,
	[BOOKQTY] [numeric](18, 3) NULL,
	[BOOKRCQTY] [numeric](18, 0) NULL,
	[TRCQTY] [numeric](18, 3) NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[tmpqty] [numeric](18, 3) NOT NULL,
	[t] [char](1) NULL,
	[PQTY] [numeric](18, 2) NULL,
	[PAMT] [numeric](18, 2) NULL,
	[Remarks] [varchar](100) NULL,
	[DetDesc] [varchar](250) NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[refno] [char](15) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[CONSDQTY] [numeric](18, 2) NULL,
	[MINQTY] [numeric](18, 2) NULL,
	[ACTREQQTY] [numeric](18, 2) NULL,
	[CONS1] [numeric](18, 0) NULL,
	[CONS2] [numeric](18, 0) NULL,
	[CONS3] [numeric](18, 0) NULL,
	[SOQTY] [numeric](18, 0) NOT NULL,
	[ADDLQTY] [numeric](18, 0) NOT NULL,
	[MINORDQTY] [numeric](18, 0) NOT NULL,
	[STKQTY] [numeric](18, 0) NOT NULL,
	[LESSQTY] [numeric](18, 0) NULL,
	[STOCKQTY] [numeric](18, 0) NULL,
	[POADDLQTY] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL,
	[LOCSTK] [numeric](18, 0) NULL,
	[REMARKS1] [varchar](100) NULL,
	[CSQTY] [numeric](18, 0) NULL,
	[SUBSTKQTY] [numeric](18, 0) NULL,
	[STKRATE] [numeric](18, 2) NULL,
	[LOCCONS] [numeric](18, 0) NULL,
	[CSCONS] [numeric](18, 0) NULL,
	[ACTORDQTY] [numeric](18, 0) NULL,
	[OBSLOCQTY] [numeric](18, 0) NULL,
	[SAMSUNG_JOBREF] [varchar](10) NULL,
	[SAMSUNG_WPSLNO] [int] NULL,
	[UNITSWAITING] [numeric](18, 2) NULL,
	[GIT] [numeric](18, 2) NULL,
	[CONSAVGQTY] [numeric](18, 2) NULL,
	[CONS1QTY] [numeric](18, 2) NULL,
	[CONS2QTY] [numeric](18, 2) NULL,
	[CONS3QTY] [numeric](18, 2) NULL,
	[CONS4QTY] [numeric](18, 2) NULL,
	[CONS5QTY] [numeric](18, 2) NULL,
	[CONS6QTY] [numeric](18, 2) NULL,
	[REGVALUE] [numeric](18, 2) NULL,
	[FINALREGVALUE] [numeric](18, 2) NULL,
	[COSTMODIFIER] [numeric](18, 2) NULL,
	[COSTADJORDER] [numeric](18, 2) NULL,
	[TLQTY] [numeric](18, 2) NULL,
	[SYSSUGGQTY] [numeric](18, 2) NULL,
	[ETD_TW] [smalldatetime] NULL,
	[ETA_TC] [smalldatetime] NULL,
	[INTRANSITQTY] [numeric](18, 0) NULL,
	[SHIPPINGNO] [varchar](50) NULL,
	[RMANO] [char](20) NULL,
	[VendorRMANO] [char](50) NULL,
	[ordid] [int] IDENTITY(1,1) NOT NULL,
	[orhid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORFOOT_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORFOOT_PREV](
	[ORTYP] [char](1) NULL,
	[ORDNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITUNIT] [char](5) NULL,
	[PACK1] [char](15) NULL,
	[FACTOR] [numeric](18, 4) NULL,
	[ITQTY] [numeric](18, 3) NULL,
	[ITRTE] [numeric](18, 5) NULL,
	[ITAMNT] [numeric](18, 5) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[OPQTY] [numeric](18, 3) NULL,
	[RCQTY] [numeric](18, 3) NULL,
	[CNQTY] [numeric](18, 3) NULL,
	[Slno] [int] NOT NULL,
	[ITEMDESC] [varchar](250) NOT NULL,
	[GITQTY] [numeric](18, 3) NOT NULL,
	[BOOKING] [bit] NOT NULL,
	[BOOKQTY] [numeric](18, 3) NULL,
	[BOOKRCQTY] [numeric](18, 0) NULL,
	[TRCQTY] [numeric](18, 3) NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[tmpqty] [numeric](18, 3) NOT NULL,
	[t] [char](1) NULL,
	[PQTY] [numeric](18, 2) NULL,
	[PAMT] [numeric](18, 2) NULL,
	[Remarks] [varchar](100) NULL,
	[DetDesc] [varchar](250) NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[refno] [char](15) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[CONSDQTY] [numeric](18, 2) NULL,
	[MINQTY] [numeric](18, 2) NULL,
	[ACTREQQTY] [numeric](18, 2) NULL,
	[CONS1] [numeric](18, 0) NULL,
	[CONS2] [numeric](18, 0) NULL,
	[CONS3] [numeric](18, 0) NULL,
	[SOQTY] [numeric](18, 0) NOT NULL,
	[ADDLQTY] [numeric](18, 0) NOT NULL,
	[MINORDQTY] [numeric](18, 0) NOT NULL,
	[STKQTY] [numeric](18, 0) NOT NULL,
	[LESSQTY] [numeric](18, 0) NULL,
	[STOCKQTY] [numeric](18, 0) NULL,
	[POADDLQTY] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL,
	[LOCSTK] [numeric](18, 0) NULL,
	[REMARKS1] [varchar](100) NULL,
	[CSQTY] [numeric](18, 0) NULL,
	[SUBSTKQTY] [numeric](18, 0) NULL,
	[STKRATE] [numeric](18, 2) NULL,
	[LOCCONS] [numeric](18, 0) NULL,
	[CSCONS] [numeric](18, 0) NULL,
	[ACTORDQTY] [numeric](18, 0) NULL,
	[OBSLOCQTY] [numeric](18, 0) NULL,
	[SAMSUNG_JOBREF] [varchar](10) NULL,
	[SAMSUNG_WPSLNO] [int] NULL,
	[UNITSWAITING] [numeric](18, 2) NULL,
	[GIT] [numeric](18, 2) NULL,
	[CONSAVGQTY] [numeric](18, 2) NULL,
	[CONS1QTY] [numeric](18, 2) NULL,
	[CONS2QTY] [numeric](18, 2) NULL,
	[CONS3QTY] [numeric](18, 2) NULL,
	[CONS4QTY] [numeric](18, 2) NULL,
	[CONS5QTY] [numeric](18, 2) NULL,
	[CONS6QTY] [numeric](18, 2) NULL,
	[REGVALUE] [numeric](18, 2) NULL,
	[FINALREGVALUE] [numeric](18, 2) NULL,
	[COSTMODIFIER] [numeric](18, 2) NULL,
	[COSTADJORDER] [numeric](18, 2) NULL,
	[TLQTY] [numeric](18, 2) NULL,
	[SYSSUGGQTY] [numeric](18, 2) NULL,
	[ETD_TW] [smalldatetime] NULL,
	[ETA_TC] [smalldatetime] NULL,
	[INTRANSITQTY] [numeric](18, 0) NULL,
	[SHIPPINGNO] [varchar](50) NULL,
	[RMANO] [char](10) NULL,
	[VendorRMANO] [char](50) NULL,
	[ordid] [int] IDENTITY(1,1) NOT NULL,
	[orhid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORHEAD]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORHEAD](
	[ORTYP] [char](1) NOT NULL,
	[ORDNO] [char](8) NOT NULL,
	[ORDTE] [smalldatetime] NULL,
	[CCODE] [char](3) NULL,
	[REFNO] [char](20) NULL,
	[REFDT] [smalldatetime] NULL,
	[FORWARDER] [char](8) NULL,
	[PORT] [char](10) NULL,
	[DUEDATE] [smalldatetime] NULL,
	[PRICING] [char](8) NULL,
	[TRANSPORT] [varchar](50) NULL,
	[PMT_TERMS] [varchar](50) NULL,
	[CLSUP] [char](7) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](18, 4) NULL,
	[TRAMNT] [numeric](18, 5) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[ATTN] [varchar](40) NULL,
	[CC] [varchar](40) NULL,
	[FAX] [char](15) NULL,
	[SLMAN] [char](8) NULL,
	[REMARKS] [varchar](100) NULL,
	[TRNTAG] [char](1) NULL CONSTRAINT [DF_ORHEAD_TRNTAG]  DEFAULT ('0'),
	[REQDTAG] [bit] NOT NULL CONSTRAINT [DF_ORHEAD_REQDTAG]  DEFAULT ((0)),
	[ETD] [smalldatetime] NULL,
	[ETA] [smalldatetime] NULL,
	[LCNO] [char](20) NULL,
	[LCDT] [smalldatetime] NULL,
	[LCREF] [char](20) NULL,
	[LCREFDT] [smalldatetime] NULL,
	[LCTYP] [char](5) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[ORDTAG] [char](1) NULL,
	[PREBY] [char](50) NULL,
	[APPBY] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[USERNAME] [char](50) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[FINVNO] [char](15) NULL,
	[STONO] [char](15) NULL,
	[stino] [char](15) NULL,
	[SAMSUNG_JOBREF] [varchar](25) NULL,
	[CusPO_No] [char](20) NULL,
	[HTCPONO] [varchar](200) NULL,
	[HTCCONFIRMDATE] [smalldatetime] NULL,
	[REQUESTTYPE] [nchar](10) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[Approved_Stat] [tinyint] NULL,
	[Approved_By] [char](30) NULL,
	[Approved_Date] [smalldatetime] NULL,
	[CRDAYS] [char](4) NULL,
	[TRORDER] [datetime] NULL CONSTRAINT [DF_ORHEAD_TRORDER]  DEFAULT (getdate()),
	[APRDOCNO] [char](8) NULL,
	[REJREASON] [nvarchar](250) NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[orhid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orhead_0906]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orhead_0906](
	[ORTYP] [char](1) NOT NULL,
	[ORDNO] [char](8) NOT NULL,
	[ORDTE] [smalldatetime] NULL,
	[CCODE] [char](3) NULL,
	[REFNO] [char](20) NULL,
	[REFDT] [smalldatetime] NULL,
	[FORWARDER] [char](8) NULL,
	[PORT] [char](10) NULL,
	[DUEDATE] [smalldatetime] NULL,
	[PRICING] [char](8) NULL,
	[TRANSPORT] [varchar](50) NULL,
	[PMT_TERMS] [varchar](50) NULL,
	[CLSUP] [char](7) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](18, 4) NULL,
	[TRAMNT] [numeric](18, 5) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[ATTN] [varchar](40) NULL,
	[CC] [varchar](40) NULL,
	[FAX] [char](15) NULL,
	[SLMAN] [char](8) NULL,
	[REMARKS] [varchar](100) NULL,
	[TRNTAG] [char](1) NULL,
	[REQDTAG] [bit] NOT NULL,
	[ETD] [smalldatetime] NULL,
	[ETA] [smalldatetime] NULL,
	[LCNO] [char](20) NULL,
	[LCDT] [smalldatetime] NULL,
	[LCREF] [char](20) NULL,
	[LCREFDT] [smalldatetime] NULL,
	[LCTYP] [char](5) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[ORDTAG] [char](1) NULL,
	[PREBY] [char](50) NULL,
	[APPBY] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[USERNAME] [char](50) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[FINVNO] [char](15) NULL,
	[STONO] [char](15) NULL,
	[stino] [char](15) NULL,
	[SAMSUNG_JOBREF] [varchar](25) NULL,
	[CusPO_No] [char](20) NULL,
	[HTCPONO] [varchar](200) NULL,
	[HTCCONFIRMDATE] [smalldatetime] NULL,
	[REQUESTTYPE] [nchar](10) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[Approved_Stat] [tinyint] NULL,
	[Approved_By] [char](30) NULL,
	[Approved_Date] [smalldatetime] NULL,
	[CRDAYS] [char](4) NULL,
	[TRORDER] [datetime] NULL,
	[APRDOCNO] [char](8) NULL,
	[REJREASON] [nvarchar](250) NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[orhid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORHEAD_CANCEL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORHEAD_CANCEL](
	[ORTYP] [char](1) NOT NULL,
	[ORDNO] [char](8) NOT NULL,
	[ORDTE] [smalldatetime] NULL,
	[CCODE] [char](3) NULL,
	[REFNO] [char](20) NULL,
	[REFDT] [smalldatetime] NULL,
	[FORWARDER] [char](8) NULL,
	[PORT] [char](10) NULL,
	[DUEDATE] [smalldatetime] NULL,
	[PRICING] [char](8) NULL,
	[TRANSPORT] [varchar](50) NULL,
	[PMT_TERMS] [varchar](50) NULL,
	[CLSUP] [char](7) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](18, 4) NULL,
	[TRAMNT] [numeric](18, 3) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[ATTN] [varchar](40) NULL,
	[CC] [varchar](40) NULL,
	[FAX] [char](15) NULL,
	[SLMAN] [char](8) NULL,
	[REMARKS] [varchar](100) NULL,
	[TRNTAG] [char](1) NULL CONSTRAINT [DF_ORHEAD_CANCEL_TRNTAG]  DEFAULT ('0'),
	[REQDTAG] [bit] NOT NULL CONSTRAINT [DF_ORHEAD_CANCEL_REQDTAG]  DEFAULT ((0)),
	[ETD] [smalldatetime] NULL,
	[ETA] [smalldatetime] NULL,
	[LCNO] [char](20) NULL,
	[LCDT] [smalldatetime] NULL,
	[LCREF] [char](20) NULL,
	[LCREFDT] [smalldatetime] NULL,
	[LCTYP] [char](5) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[REF1] [char](15) NULL,
	[REF2] [char](15) NULL,
	[REF3] [char](15) NULL,
	[REF4] [char](15) NULL,
	[REF5] [char](15) NULL,
	[REF6] [char](15) NULL,
	[REF7] [char](15) NULL,
	[REF8] [char](15) NULL,
	[REF9] [char](15) NULL,
	[REF10] [char](15) NULL,
	[REF11] [char](15) NULL,
	[REF12] [char](15) NULL,
	[REF13] [char](15) NULL,
	[REF14] [char](15) NULL,
	[REF15] [char](15) NULL,
	[REF16] [char](15) NULL,
	[REF17] [char](15) NULL,
	[REF18] [char](15) NULL,
	[REF19] [char](15) NULL,
	[REF20] [char](15) NULL,
	[REF21] [char](15) NULL,
	[REF22] [char](15) NULL,
	[REF23] [char](15) NULL,
	[REF24] [char](15) NULL,
	[REF25] [char](15) NULL,
	[REF26] [char](15) NULL,
	[REF27] [char](15) NULL,
	[REF28] [char](15) NULL,
	[PJM1] [char](15) NULL,
	[PJM2] [char](15) NULL,
	[PJM3] [char](15) NULL,
	[PJM4] [char](15) NULL,
	[PJM5] [char](15) NULL,
	[PJM6] [char](15) NULL,
	[PJM7] [char](15) NULL,
	[PJM8] [char](15) NULL,
	[PJM9] [char](15) NULL,
	[PJM10] [char](15) NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[ORDTAG] [char](1) NULL,
	[PREBY] [char](50) NULL,
	[APPBY] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[USERNAME] [char](50) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[FINVNO] [char](15) NULL,
	[STONO] [char](15) NULL,
	[stino] [char](15) NULL,
	[SAMSUNG_JOBREF] [varchar](25) NULL,
	[CusPO_No] [char](20) NULL,
	[HTCPONO] [varchar](500) NULL,
	[HTCCONFIRMDATE] [smalldatetime] NULL,
	[REQUESTTYPE] [nchar](10) NULL,
	[ORDREF] [char](8) NULL,
	[APRDOCNO] [char](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORHEAD_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORHEAD_PREV](
	[ORTYP] [char](1) NOT NULL,
	[ORDNO] [char](8) NOT NULL,
	[ORDTE] [smalldatetime] NULL,
	[CCODE] [char](3) NULL,
	[REFNO] [char](20) NULL,
	[REFDT] [smalldatetime] NULL,
	[FORWARDER] [char](8) NULL,
	[PORT] [char](10) NULL,
	[DUEDATE] [smalldatetime] NULL,
	[PRICING] [char](8) NULL,
	[TRANSPORT] [varchar](50) NULL,
	[PMT_TERMS] [varchar](50) NULL,
	[CLSUP] [char](7) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](18, 4) NULL,
	[TRAMNT] [numeric](18, 5) NULL,
	[BCAMNT] [numeric](18, 2) NULL,
	[ATTN] [varchar](40) NULL,
	[CC] [varchar](40) NULL,
	[FAX] [char](15) NULL,
	[SLMAN] [char](8) NULL,
	[REMARKS] [varchar](100) NULL,
	[TRNTAG] [char](1) NULL,
	[REQDTAG] [bit] NOT NULL,
	[ETD] [smalldatetime] NULL,
	[ETA] [smalldatetime] NULL,
	[LCNO] [char](20) NULL,
	[LCDT] [smalldatetime] NULL,
	[LCREF] [char](20) NULL,
	[LCREFDT] [smalldatetime] NULL,
	[LCTYP] [char](5) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[ORDTAG] [char](1) NULL,
	[PREBY] [char](50) NULL,
	[APPBY] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[USERNAME] [char](50) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[FINVNO] [char](15) NULL,
	[STONO] [char](15) NULL,
	[stino] [char](15) NULL,
	[SAMSUNG_JOBREF] [varchar](25) NULL,
	[CusPO_No] [char](20) NULL,
	[HTCPONO] [varchar](200) NULL,
	[HTCCONFIRMDATE] [smalldatetime] NULL,
	[REQUESTTYPE] [nchar](10) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[Approved_Stat] [tinyint] NULL,
	[Approved_By] [char](30) NULL,
	[Approved_Date] [smalldatetime] NULL,
	[CRDAYS] [char](4) NULL,
	[TRORDER] [datetime] NULL,
	[APRDOCNO] [char](8) NULL,
	[REJREASON] [nvarchar](250) NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[orhid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORSUB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORSUB](
	[ORTYP] [char](1) NULL,
	[ORDNO] [char](8) NULL,
	[CODE] [char](4) NULL,
	[NOTES] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_ITSTK_DESC_BK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_ITSTK_DESC_BK](
	[ITEM_CODE] [varchar](30) NULL,
	[QTY] [int] NULL,
	[LOCN_CODE] [varchar](12) NULL,
	[RATE] [float] NULL,
	[VALUE] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_ITSTK_DESCP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_ITSTK_DESCP](
	[ITEM_CODE] [varchar](30) NULL,
	[QTY] [int] NULL,
	[LOCN_CODE] [varchar](12) NULL,
	[RATE] [float] NULL,
	[VALUE] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_LABOURDATA]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_LABOURDATA](
	[finalwarranty] [int] NULL,
	[SWAPReq] [tinyint] NULL,
	[Brand] [char](20) NULL,
	[product] [char](30) NULL,
	[model] [char](30) NULL,
	[faultcode] [varchar](15) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_LABOURDATA_SWAP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_LABOURDATA_SWAP](
	[finalwarranty] [int] NULL,
	[SWAPReq] [tinyint] NULL,
	[Brand] [char](20) NULL,
	[product] [char](30) NULL,
	[model] [char](30) NULL,
	[faultcode] [varchar](15) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_LABOURUPDATE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_LABOURUPDATE](
	[finalwarranty] [int] NULL,
	[SWAPReq] [tinyint] NULL,
	[Brand] [char](20) NULL,
	[product] [char](30) NULL,
	[model] [char](30) NULL,
	[faultcode] [varchar](15) NULL,
	[LCTYPECODE] [char](3) NULL,
	[LCTYPESUBCODE] [char](3) NULL,
	[mlcharge] [float] NULL,
	[mlcurrency] [varchar](5) NULL,
	[jbdt] [datetime] NULL,
	[lcharge] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[docno] [varchar](20) NULL,
	[jobno] [varchar](10) NULL,
	[ccode] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_NEWITEM]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_NEWITEM](
	[OSU_ITEM_CODE] [char](30) NULL,
	[OSU_ITEM_DESC] [char](200) NULL,
	[OSU_BRAND] [char](50) NULL,
	[OSU_GROUP] [char](50) NULL,
	[OSU_CATEGORY] [char](50) NULL,
	[OSU_PRODUCT] [char](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OM_ITEM]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OM_ITEM](
	[ITEM_CODE] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OOW_DISP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OOW_DISP](
	[RMA_ID] [varchar](10) NULL,
	[SP_COST] [numeric](18, 0) NULL,
	[VAT_AMT] [numeric](18, 0) NULL,
	[TOT_AMT] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OOW_HUW_PRICE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OOW_HUW_PRICE](
	[ITEM_CODE] [varchar](30) NULL,
	[SP_PER] [numeric](5, 0) NULL,
	[NW_AMT] [numeric](12, 2) NULL,
	[IT_BRAND] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OOW_HUW_PRICE_bk]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OOW_HUW_PRICE_bk](
	[ITEM_CODE] [varchar](30) NULL,
	[SP_PER] [numeric](5, 0) NULL,
	[NW_AMT] [numeric](12, 2) NULL,
	[IT_BRAND] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OOW_HUW_PRICE_bk150818]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OOW_HUW_PRICE_bk150818](
	[ITEM_CODE] [varchar](30) NULL,
	[SP_PER] [numeric](5, 0) NULL,
	[NW_AMT] [numeric](12, 2) NULL,
	[IT_BRAND] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ow_oow_pl]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ow_oow_pl](
	[ITEM_CODE ] [nvarchar](255) NULL,
	[ITEM_RATE] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OW_OPENINGSPAREPARTSDELETE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OW_OPENINGSPAREPARTSDELETE](
	[Locode] [char](10) NOT NULL,
	[jobno] [char](10) NOT NULL,
	[itcode] [char](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_OPN_STK_UPD]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_OPN_STK_UPD](
	[OSU_ITEM_CODE] [char](30) NULL,
	[OSU_LOCN_CODE] [char](15) NULL,
	[OSU_QTY] [int] NULL,
	[OSU_RATE] [float] NULL,
	[OSU_VALUE] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_REF_NUM]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_REF_NUM](
	[RMA_ID] [char](15) NULL,
	[INVREF] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_STK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_STK](
	[TRNTYPE] [varchar](1) NULL,
	[JOBNO] [numeric](18, 0) NULL,
	[ITCODE] [varchar](20) NULL,
	[UNIT] [varchar](3) NULL,
	[FAC] [numeric](18, 0) NULL,
	[STOCK] [numeric](18, 0) NULL,
	[A] [numeric](18, 0) NULL,
	[B] [varchar](1) NULL,
	[SLNO] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_STKVAL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_STKVAL](
	[ITEM_CODE] [varchar](20) NULL,
	[ITEM_RATE] [numeric](18, 0) NULL,
	[ITEM_STK] [numeric](18, 0) NULL,
	[ORG_RATE] [numeric](18, 0) NULL,
	[LOCN] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_STKVAL1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_STKVAL1](
	[ITEM_CODE] [varchar](60) NULL,
	[ITEM_RATE] [numeric](18, 0) NULL,
	[ITEM_STK] [numeric](18, 0) NULL,
	[ORG_RATE] [numeric](18, 0) NULL,
	[LOCN] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_STOCKDIFF]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_STOCKDIFF](
	[ITCODE] [char](25) NULL,
	[LOCODE] [char](10) NULL,
	[INQTY] [float] NULL,
	[OUTQTY] [float] NULL,
	[INVAL] [float] NULL,
	[OUTVAL] [float] NULL,
	[WTD_AVG] [float] NULL,
	[ITSTOCK] [float] NULL,
	[LSTOCK] [float] NULL,
	[DIFFSTOCK] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_TAG]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_TAG](
	[ITEM_CODE] [varchar](60) NULL,
	[RACK] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OW_TEST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OW_TEST](
	[ITEM_CODE] [varchar](60) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PJM]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PJM](
	[ITCODE] [char](20) NULL,
	[ITUNIT] [char](5) NULL,
	[QTY] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POSTK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSTK](
	[ITCODE] [char](20) NULL,
	[LOCODE] [char](10) NULL,
	[STOCK] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICEMST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICEMST](
	[ITCODE] [char](20) NULL,
	[UNIT] [char](5) NULL,
	[PRICE] [numeric](12, 4) NOT NULL,
	[CUSTOMER] [char](7) NULL,
	[BRAND] [char](5) NULL,
	[SUPPLIER] [char](7) NULL,
	[type] [char](1) NULL,
	[COST] [numeric](12, 2) NULL,
	[PER] [numeric](5, 2) NULL,
	[DISCPER] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PW_LEDGER_DETIAL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PW_LEDGER_DETIAL](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [varchar](6) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](8) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PW_LEDGER_MASTER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PW_LEDGER_MASTER](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](20) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](14) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recon]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recon](
	[bkcode] [char](7) NULL,
	[trcd] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdt] [smalldatetime] NULL,
	[accode] [char](7) NULL,
	[chqno] [char](10) NULL,
	[chqdt] [smalldatetime] NULL,
	[descr] [varchar](300) NULL,
	[fcamt] [decimal](13, 2) NULL,
	[fdamt] [decimal](13, 2) NULL,
	[recondate] [smalldatetime] NULL,
	[slno] [decimal](4, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REF]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF](
	[YRCD] [char](1) NULL,
	[TRTYPE] [char](4) NULL,
	[CURRNO] [char](8) NULL,
	[MINNO] [char](8) NULL,
	[MAXNO] [char](8) NULL,
	[SLNO] [int] NOT NULL,
	[TEST] [char](8) NULL,
	[CCODE] [char](10) NULL,
	[ML_YEAR] [char](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REF_SPREQUEST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF_SPREQUEST](
	[YRCD] [char](1) NULL,
	[TRTYPE] [char](4) NULL,
	[CURRNO] [char](8) NULL,
	[MINNO] [char](8) NULL,
	[MAXNO] [char](8) NULL,
	[SLNO] [int] NOT NULL,
	[TEST] [char](8) NULL,
	[CCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REF1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF1](
	[YRCD] [char](1) NULL,
	[TRTYPE] [char](4) NULL,
	[CURRNO] [char](8) NULL,
	[MINNO] [char](8) NULL,
	[MAXNO] [char](8) NULL,
	[SLNO] [int] NOT NULL,
	[TEST] [char](8) NULL,
	[CCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMINDER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMINDER](
	[YRCD] [char](1) NULL,
	[TRCD] [char](4) NULL,
	[TRNO] [char](8) NULL,
	[REM_DATE] [datetime] NULL,
	[BYUSER] [char](10) NULL,
	[NARRATION] [varchar](255) NULL,
	[TOUSERS] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rep_ServiceRevenue]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rep_ServiceRevenue](
	[Country] [varchar](10) NULL,
	[Brand] [varchar](15) NULL,
	[LocationCode] [char](10) NULL,
	[LocationName] [varchar](50) NULL,
	[WarrantyType] [varchar](20) NULL,
	[Volume] [numeric](5, 0) NULL,
	[RepairedVolume] [numeric](5, 0) NULL,
	[Revenue] [numeric](18, 2) NULL,
	[CostPerRepair] [numeric](18, 2) NULL,
	[TotalDelivered] [numeric](5, 0) NULL,
	[TD_BelowThree] [numeric](5, 0) NULL,
	[TD_AboveThree] [numeric](5, 0) NULL,
	[Estimated] [numeric](5, 0) NULL,
	[Approved] [numeric](5, 0) NULL,
	[StkValue] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results](
	[ittag] [char](1) NULL,
	[itcode] [char](4) NULL,
	[itdesc] [char](20) NULL,
	[notes] [char](75) NULL,
	[target] [decimal](12, 3) NULL,
	[trgamt] [decimal](12, 3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SETTINGS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SETTINGS](
	[FORMNAME] [char](25) NULL,
	[COLOURVALUE] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[CODE] [nvarchar](255) NULL,
	[OOW Sales Price] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipDet]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipDet](
	[RectNo] [char](5) NULL,
	[ItemCode] [varchar](25) NULL,
	[Model] [char](15) NULL,
	[DespatchQty] [int] NULL,
	[RecdQty] [int] NULL,
	[Trn1Qty] [int] NULL,
	[Trn2Qty] [int] NULL,
	[LoginQty] [int] NULL,
	[Remarks] [varchar](200) NULL,
	[SlNo] [int] NULL,
	[Trn3Qty] [int] NULL,
	[Trn4Qty] [int] NULL,
	[IMEINo] [char](18) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipInvdet]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipInvdet](
	[Docno] [char](5) NULL,
	[Itemcode] [char](25) NULL,
	[Model] [char](15) NULL,
	[Imeino] [char](15) NULL,
	[Qty] [int] NULL,
	[Slno] [int] NULL,
	[Invoiced] [int] NULL,
	[Rate] [numeric](10, 2) NULL,
	[amt] [numeric](13, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipInvmast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipInvmast](
	[Docno] [char](5) NULL,
	[DocDate] [datetime] NULL,
	[Custcode] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[Remarks] [varchar](100) NULL,
	[Address] [char](300) NULL,
	[Phone] [char](20) NULL,
	[Email] [char](25) NULL,
	[Contact] [char](25) NULL,
	[Forwarder] [char](15) NULL,
	[DispatchMode] [char](15) NULL,
	[Lpono] [char](15) NULL,
	[LpoDate] [datetime] NULL,
	[AWBNo] [char](15) NULL,
	[GrWeight] [numeric](8, 2) NULL,
	[NetWeight] [numeric](8, 2) NULL,
	[BoxNo] [numeric](8, 2) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](9, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipMast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipMast](
	[RectNo] [char](5) NULL,
	[RectDate] [datetime] NULL,
	[CustCode] [char](15) NULL,
	[ShipRef] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[OurRef] [char](15) NULL,
	[Remarks] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipSub]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipSub](
	[RectNo] [char](5) NULL,
	[ItemCode] [char](25) NULL,
	[Model] [char](15) NULL,
	[Imeino] [char](15) NULL,
	[Qty] [int] NULL,
	[Trn1Qty] [int] NULL,
	[Trn2Qty] [int] NULL,
	[LoginRef] [char](15) NULL,
	[Remarks] [varchar](200) NULL,
	[SlNo] [int] NULL,
	[MSlno] [int] NULL,
	[ReadyforInv] [int] NULL,
	[Invoiced] [int] NULL,
	[BatchRef] [char](15) NULL,
	[InvRef] [char](5) NULL,
	[SentTo] [char](1) NULL,
	[CTagRef] [char](10) NULL,
	[Trn3Qty] [int] NULL,
	[Trn4Qty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipTdet]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipTdet](
	[Docno] [char](5) NULL,
	[DocType] [char](1) NULL,
	[Itemcode] [char](25) NULL,
	[Model] [char](15) NULL,
	[Imeino] [char](15) NULL,
	[Qty] [int] NULL,
	[Slno] [int] NULL,
	[InQty] [int] NULL,
	[DelType] [char](1) NULL,
	[newimeino] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipTmast]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipTmast](
	[Docno] [char](5) NULL,
	[DocType] [char](1) NULL,
	[DocDate] [datetime] NULL,
	[Custcode] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[Reference] [char](15) NULL,
	[Remarks] [varchar](100) NULL,
	[DelType] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Siemens_SerialNo]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Siemens_SerialNo](
	[SerialNo] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SP_AGEING1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_AGEING1](
	[VAL1] [numeric](18, 0) NULL,
	[VAL2] [numeric](18, 0) NULL,
	[VAL3] [numeric](18, 0) NULL,
	[VAL4] [numeric](18, 0) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SP_ConsumptionGraph]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SP_ConsumptionGraph](
	[MonthName] [varchar](10) NULL,
	[TotValue] [numeric](18, 2) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SP_StockValue]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SP_StockValue](
	[LocationCode] [char](10) NULL,
	[Stock] [numeric](18, 0) NULL,
	[StockValue] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STANDBY]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STANDBY](
	[IMEINo] [char](20) NULL,
	[Model] [char](10) NULL,
	[CCode] [char](2) NULL,
	[JobNo] [numeric](5, 0) NULL,
	[LOCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot](
	[yrcd] [char](1) NULL CONSTRAINT [DF_stfoot_yrcd]  DEFAULT (''),
	[trntype] [char](4) NULL CONSTRAINT [DF_stfoot_trntype]  DEFAULT (''),
	[trno] [char](8) NULL CONSTRAINT [DF_stfoot_trno]  DEFAULT (''),
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL CONSTRAINT [DF_stfoot_yrcd1]  DEFAULT (''),
	[billtype] [char](4) NULL CONSTRAINT [DF_stfoot_billtype]  DEFAULT (''),
	[billno] [char](20) NULL CONSTRAINT [DF_stfoot_billno]  DEFAULT (''),
	[itcode] [char](25) NULL CONSTRAINT [DF_stfoot_itcode]  DEFAULT (''),
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL CONSTRAINT [DF_stfoot_ITEMDESC]  DEFAULT (''),
	[SIZEPRINT] [char](1) NOT NULL CONSTRAINT [DF_stfoot_SIZEPRINT]  DEFAULT ('N'),
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL CONSTRAINT [DF_stfoot_TRORDER]  DEFAULT (getdate()),
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_011018]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_011018](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_0411]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_0411](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_0513]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_0513](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_2105]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_2105](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STFOOT_2302019]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STFOOT_2302019](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_230618]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_230618](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_230618_229351]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_230618_229351](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfoot_isrt0507]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfoot_isrt0507](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STFOOT_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STFOOT_PREV](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL,
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stfootpending]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stfootpending](
	[yrcd] [char](1) NULL CONSTRAINT [DFp_stfoot_yrcd]  DEFAULT (''),
	[trntype] [char](4) NULL CONSTRAINT [DFp_stfoot_trntype]  DEFAULT (''),
	[trno] [char](8) NULL CONSTRAINT [DFp_stfoot_trno]  DEFAULT (''),
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL CONSTRAINT [DFp_stfoot_yrcd1]  DEFAULT (''),
	[billtype] [char](4) NULL CONSTRAINT [DFp_stfoot_billtype]  DEFAULT (''),
	[billno] [char](16) NULL CONSTRAINT [DFp_stfoot_billno]  DEFAULT (''),
	[itcode] [char](25) NULL CONSTRAINT [DFp_stfoot_itcode]  DEFAULT (''),
	[itunit] [char](5) NULL,
	[factor] [numeric](30, 3) NULL,
	[itqty] [numeric](30, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [numeric](30, 5) NULL,
	[discper] [numeric](30, 2) NULL,
	[discamt] [numeric](30, 3) NULL,
	[itamnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 3) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[csamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[stkval] [numeric](30, 2) NULL,
	[slno] [numeric](30, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[ITEMDESC] [char](250) NOT NULL CONSTRAINT [DFp_stfoot_ITEMDESC]  DEFAULT (''),
	[SIZEPRINT] [char](1) NOT NULL CONSTRAINT [DFp_stfoot_SIZEPRINT]  DEFAULT ('N'),
	[ccode] [char](4) NULL,
	[binloc] [char](15) NULL,
	[ltrqty] [numeric](30, 2) NULL,
	[FCSTKVAL] [numeric](30, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[TRORDER] [datetime] NULL CONSTRAINT [DFp_stfoot_TRORDER]  DEFAULT (getdate()),
	[stkval1] [numeric](30, 2) NULL,
	[STKLOC] [char](10) NULL,
	[RMANO] [char](50) NULL,
	[RTVCLAIMREF] [char](10) NULL,
	[TRACKINGNO] [char](16) NULL,
	[RTVTYPE] [nvarchar](30) NULL,
	[costfactorST] [numeric](30, 5) NULL,
	[itrte1] [numeric](30, 5) NULL,
	[sthid] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sthead]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sthead](
	[yrcd] [char](1) NULL CONSTRAINT [DF_sthead_yrcd]  DEFAULT (''),
	[trntype] [char](4) NULL CONSTRAINT [DF_sthead_trntype]  DEFAULT (''),
	[trno] [char](8) NULL CONSTRAINT [DF_sthead_trno]  DEFAULT (''),
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL CONSTRAINT [DF_sthead_yrcd1]  DEFAULT (''),
	[billtype] [char](4) NULL CONSTRAINT [DF_sthead_billtype]  DEFAULT (''),
	[billno] [char](20) NULL CONSTRAINT [DF_sthead_billno]  DEFAULT (''),
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](30, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](30, 2) NULL,
	[tramnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[otheramt] [numeric](30, 2) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](30, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](30, 2) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL CONSTRAINT [DF_sthead_LPONO]  DEFAULT (''),
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](30, 2) NULL,
	[DISCAMT] [numeric](30, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](30, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](30, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](30, 2) NULL,
	[PAMT2] [numeric](30, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](30, 3) NULL,
	[PAMT2FC] [numeric](30, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](30, 2) NULL,
	[DISCAMTBC] [numeric](30, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](30, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](30, 2) NULL,
	[TRADEDISCBC] [numeric](30, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[EWBC] [numeric](30, 2) NULL,
	[CashRecdAmtBC] [numeric](30, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[LTRC] [char](30) NULL CONSTRAINT [DF_sthead_LPONO1]  DEFAULT (''),
	[ORDERTYPE] [nchar](10) NULL,
	[SALESTAX] [numeric](30, 2) NULL,
	[SALESTAXFC] [numeric](30, 4) NULL,
	[EW] [int] NULL,
	[EWACC] [int] NULL,
	[COUNTRY] [char](4) NULL,
	[BRAND] [char](20) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [numeric](30, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [numeric](30, 2) NULL,
	[ReqAmt] [numeric](30, 2) NULL,
	[LOC] [varchar](50) NULL,
	[REJREASON] [varchar](250) NULL,
	[BOE] [char](30) NULL,
	[trorder] [datetime] NULL CONSTRAINT [DF_sthead_trorder]  DEFAULT (getdate()),
	[RTVREF] [char](10) NULL,
	[Cost] [numeric](18, 2) NULL,
	[sthid] [int] IDENTITY(1,1) NOT NULL,
	[EXPORTDATE] [datetime] NULL,
	[adjac] [varchar](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sthead_0513]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sthead_0513](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](30, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](30, 2) NULL,
	[tramnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[otheramt] [numeric](30, 2) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](30, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](30, 2) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](30, 2) NULL,
	[DISCAMT] [numeric](30, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](30, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](30, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](30, 2) NULL,
	[PAMT2] [numeric](30, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](30, 3) NULL,
	[PAMT2FC] [numeric](30, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](30, 2) NULL,
	[DISCAMTBC] [numeric](30, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](30, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](30, 2) NULL,
	[TRADEDISCBC] [numeric](30, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[EWBC] [numeric](30, 2) NULL,
	[CashRecdAmtBC] [numeric](30, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[LTRC] [char](30) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[SALESTAX] [numeric](30, 2) NULL,
	[SALESTAXFC] [numeric](30, 4) NULL,
	[EW] [int] NULL,
	[EWACC] [int] NULL,
	[COUNTRY] [char](4) NULL,
	[BRAND] [char](20) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [numeric](30, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [numeric](30, 2) NULL,
	[ReqAmt] [numeric](30, 2) NULL,
	[LOC] [varchar](50) NULL,
	[REJREASON] [varchar](250) NULL,
	[BOE] [char](30) NULL,
	[trorder] [datetime] NULL,
	[RTVREF] [char](10) NULL,
	[Cost] [numeric](18, 2) NULL,
	[sthid] [int] IDENTITY(1,1) NOT NULL,
	[EXPORTDATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sthead_2105]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sthead_2105](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NULL,
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](30, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](30, 2) NULL,
	[tramnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[otheramt] [numeric](30, 2) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](30, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](30, 2) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](30, 2) NULL,
	[DISCAMT] [numeric](30, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](30, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](30, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](30, 2) NULL,
	[PAMT2] [numeric](30, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](30, 3) NULL,
	[PAMT2FC] [numeric](30, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](30, 2) NULL,
	[DISCAMTBC] [numeric](30, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](30, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](30, 2) NULL,
	[TRADEDISCBC] [numeric](30, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[EWBC] [numeric](30, 2) NULL,
	[CashRecdAmtBC] [numeric](30, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[LTRC] [char](30) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[SALESTAX] [numeric](30, 2) NULL,
	[SALESTAXFC] [numeric](30, 4) NULL,
	[EW] [int] NULL,
	[EWACC] [int] NULL,
	[COUNTRY] [char](4) NULL,
	[BRAND] [char](20) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [numeric](30, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [numeric](30, 2) NULL,
	[ReqAmt] [numeric](30, 2) NULL,
	[LOC] [varchar](50) NULL,
	[REJREASON] [varchar](250) NULL,
	[BOE] [char](30) NULL,
	[trorder] [datetime] NULL,
	[RTVREF] [char](10) NULL,
	[Cost] [numeric](18, 2) NULL,
	[sthid] [int] IDENTITY(1,1) NOT NULL,
	[EXPORTDATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STHEAD_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STHEAD_PREV](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](30, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](30, 2) NULL,
	[tramnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[otheramt] [numeric](30, 2) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](30, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](30, 2) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](30, 2) NULL,
	[DISCAMT] [numeric](30, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](30, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](30, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](30, 2) NULL,
	[PAMT2] [numeric](30, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](30, 3) NULL,
	[PAMT2FC] [numeric](30, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](30, 2) NULL,
	[DISCAMTBC] [numeric](30, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](30, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](30, 2) NULL,
	[TRADEDISCBC] [numeric](30, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[EWBC] [numeric](30, 2) NULL,
	[CashRecdAmtBC] [numeric](30, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[LTRC] [char](30) NULL,
	[ORDERTYPE] [nchar](10) NULL,
	[SALESTAX] [numeric](30, 2) NULL,
	[SALESTAXFC] [numeric](30, 4) NULL,
	[EW] [int] NULL,
	[EWACC] [int] NULL,
	[COUNTRY] [char](4) NULL,
	[BRAND] [char](20) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [numeric](30, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [numeric](30, 2) NULL,
	[ReqAmt] [numeric](30, 2) NULL,
	[LOC] [varchar](50) NULL,
	[REJREASON] [varchar](250) NULL,
	[BOE] [char](30) NULL,
	[trorder] [datetime] NULL,
	[RTVREF] [char](10) NULL,
	[Cost] [numeric](18, 2) NULL,
	[sthid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stheadpending]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stheadpending](
	[yrcd] [char](1) NULL CONSTRAINT [DFp_sthead_yrcd]  DEFAULT (''),
	[trntype] [char](4) NULL CONSTRAINT [DFp_sthead_trntype]  DEFAULT (''),
	[trno] [char](8) NULL CONSTRAINT [DFp_sthead_trno]  DEFAULT (''),
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL CONSTRAINT [DFp_sthead_yrcd1]  DEFAULT (''),
	[billtype] [char](4) NULL CONSTRAINT [DFp_sthead_billtype]  DEFAULT (''),
	[billno] [char](16) NULL CONSTRAINT [DFp_sthead_billno]  DEFAULT (''),
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](30, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](30, 2) NULL,
	[tramnt] [numeric](30, 5) NULL,
	[bcamnt] [numeric](30, 2) NULL,
	[netamt] [numeric](30, 2) NULL,
	[otheramt] [numeric](30, 2) NULL,
	[costfactor] [numeric](30, 5) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](30, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](30, 2) NULL,
	[othercrg] [numeric](30, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL CONSTRAINT [DFp_sthead_LPONO]  DEFAULT (''),
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](30, 2) NULL,
	[DISCAMT] [numeric](30, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](30, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](30, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](30, 2) NULL,
	[PAMT2] [numeric](30, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](30, 3) NULL,
	[PAMT2FC] [numeric](30, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](30, 2) NULL,
	[DISCAMTBC] [numeric](30, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](30, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](30, 2) NULL,
	[TRADEDISCBC] [numeric](30, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](30, 2) NULL,
	[EWBC] [numeric](30, 2) NULL,
	[CashRecdAmtBC] [numeric](30, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[LTRC] [char](30) NULL CONSTRAINT [DFp_sthead_LPONO1]  DEFAULT (''),
	[ORDERTYPE] [nchar](10) NULL,
	[SALESTAX] [numeric](30, 2) NULL,
	[SALESTAXFC] [numeric](30, 4) NULL,
	[EW] [int] NULL,
	[EWACC] [int] NULL,
	[COUNTRY] [char](4) NULL,
	[BRAND] [char](20) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [numeric](30, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [numeric](30, 2) NULL,
	[ReqAmt] [numeric](30, 2) NULL,
	[LOC] [varchar](50) NULL,
	[REJREASON] [varchar](250) NULL,
	[BOE] [char](30) NULL,
	[trorder] [datetime] NULL CONSTRAINT [DFp_sthead_trorder]  DEFAULT (getdate()),
	[RTVREF] [char](10) NULL,
	[Cost] [numeric](18, 2) NULL,
	[sthid] [int] IDENTITY(1,1) NOT NULL,
	[EXPORTDATE] [datetime] NULL,
	[adjac] [varchar](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCKDIFF]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCKDIFF](
	[ITCODE] [char](25) NULL,
	[BATCHNO] [char](10) NULL,
	[EXPDATE] [smalldatetime] NULL,
	[STKLOC] [char](10) NULL,
	[OPRATE] [numeric](30, 4) NULL,
	[OPSTK] [decimal](30, 2) NULL,
	[OPSTKFOC] [numeric](30, 2) NULL,
	[STOCK] [numeric](30, 2) NULL,
	[STOCKFOC] [numeric](30, 2) NULL,
	[OPVAL] [numeric](30, 2) NULL,
	[RESVSTK] [numeric](30, 2) NULL,
	[SLNO] [int] NULL CONSTRAINT [DF_STOCKDIFF_SLNO]  DEFAULT ((0)),
	[ManfDate] [smalldatetime] NULL,
	[AGE1] [numeric](30, 2) NULL,
	[AGE2] [numeric](30, 2) NULL,
	[AGE3] [numeric](30, 2) NULL,
	[AGE4] [numeric](30, 2) NULL,
	[WTD_AVG] [numeric](38, 4) NULL,
	[CURRSTOCK] [float] NULL CONSTRAINT [DF__STOCKDIFF__CURRS__7C71D41A]  DEFAULT ((0)),
	[CURRRATE] [float] NULL CONSTRAINT [DF__STOCKDIFF__CURRR__7D65F853]  DEFAULT ((0)),
	[CURRVALUE] [float] NULL CONSTRAINT [DF__STOCKDIFF__CURRV__7E5A1C8C]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoFoot]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoFoot](
	[DocNo] [int] NULL,
	[ItemCode] [varchar](25) NULL,
	[IMEINo] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[Tag] [int] NULL,
	[SlNo] [int] NULL,
	[JobNo] [char](10) NULL,
	[Model] [char](20) NULL,
	[rate] [numeric](13, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoHead]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoHead](
	[DocNo] [int] NULL,
	[DocDate] [datetime] NULL,
	[RefNo] [char](10) NULL,
	[BatchRef1] [char](15) NULL,
	[BatchRef2] [char](15) NULL,
	[BatchRef3] [char](15) NULL,
	[BatchRef4] [char](15) NULL,
	[BatchRef5] [char](15) NULL,
	[BatchRef6] [char](15) NULL,
	[BatchRef7] [char](15) NULL,
	[BatchRef8] [char](15) NULL,
	[BatchRef9] [char](15) NULL,
	[BatchRef10] [char](15) NULL,
	[Remarks] [varchar](200) NULL,
	[Forwarder] [char](10) NULL,
	[DespMode] [char](20) NULL,
	[AWBNo] [char](20) NULL,
	[GRossWt] [numeric](13, 2) NULL,
	[NetWt] [numeric](13, 2) NULL,
	[NoBoxs] [numeric](13, 2) NULL,
	[shipto] [char](7) NULL,
	[billto] [char](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoTrnFoot]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoTrnFoot](
	[DocNo] [int] NULL,
	[ItemCode] [varchar](25) NULL,
	[RQty] [int] NULL,
	[AQty] [int] NULL,
	[UQty] [int] NULL,
	[SlNo] [int] NULL,
	[IMEINo] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[TrDate] [datetime] NULL,
	[FPURREF] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoTrnHead]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoTrnHead](
	[DocNo] [int] NULL,
	[DocDate] [datetime] NULL,
	[RefNo] [varchar](10) NULL,
	[Remarks] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoTrnSub]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoTrnSub](
	[DocNo] [int] NULL,
	[ItemCode] [char](25) NULL,
	[IMEINo] [char](15) NULL,
	[BatchRef] [char](15) NULL,
	[DocDate] [datetime] NULL,
	[Tag] [char](1) NULL,
	[MslNo] [int] NULL,
	[SlNo] [int] NULL,
	[JobNo] [numeric](5, 0) NULL,
	[JobDate] [datetime] NULL,
	[CustCode] [char](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STSUB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STSUB](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITUNIT] [char](5) NULL,
	[LOCODE] [char](3) NULL,
	[REFNO] [char](10) NULL,
	[BATCHNO] [char](10) NULL,
	[MANFDATE] [smalldatetime] NULL,
	[EXPDATE] [smalldatetime] NULL,
	[QTY] [numeric](10, 3) NULL,
	[MSLNO] [numeric](5, 0) NULL,
	[SLNO] [numeric](5, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SwapUnit]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SwapUnit](
	[ImeiNo] [char](15) NULL,
	[Status] [char](1) NULL,
	[DocNo] [numeric](8, 0) NULL,
	[docDate] [smalldatetime] NULL,
	[ccode] [char](10) NULL,
	[Model] [char](20) NULL,
	[JobNo] [char](8) NULL,
	[Remarks] [varchar](50) NULL,
	[SlNo] [int] NOT NULL,
	[ScrapDate] [datetime] NULL,
	[ScrapUser] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceDetail](
	[yrcd1] [char](1) NULL CONSTRAINT [DF_T_Acc_InvoiceDetail_yrcd1]  DEFAULT (''),
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL CONSTRAINT [DF_T_Acc_InvoiceDetail_billtype]  DEFAULT (''),
	[billno] [char](20) NOT NULL CONSTRAINT [DF_T_Acc_InvoiceDetail_billno]  DEFAULT (''),
	[itcode] [char](20) NULL CONSTRAINT [DF_T_Acc_InvoiceDetail_itcode]  DEFAULT (''),
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [numeric](12, 2) NULL,
	[sizeprint] [nchar](1) NULL,
	[ewfc] [numeric](18, 2) NULL,
	[costfactorST] [decimal](10, 4) NULL,
	[ReturnQty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceDetail_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceDetail_prev](
	[yrcd1] [char](1) NULL,
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](20) NOT NULL,
	[itcode] [char](20) NULL,
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [numeric](12, 2) NULL,
	[sizeprint] [nchar](1) NULL,
	[ewfc] [numeric](18, 2) NULL,
	[costfactorST] [decimal](10, 4) NULL,
	[ReturnQty] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceHeader](
	[yrcd1] [char](1) NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_yrcd1]  DEFAULT (''),
	[billtype] [char](4) NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_billtype]  DEFAULT (''),
	[billno] [char](20) NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_billno]  DEFAULT (''),
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NOT NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[slpucd] [char](7) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[otheramt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[slman] [char](8) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[notes2] [varchar](250) NULL,
	[notes] [varchar](250) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](50) NULL,
	[MOBILE] [char](50) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[PAMT2] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[pricing] [char](15) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[PAMT1FC] [numeric](18, 3) NULL,
	[PAMT2FC] [numeric](18, 3) NULL,
	[DISCAMTFC] [numeric](12, 2) NULL,
	[DISCAMTBC] [numeric](12, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAXBC] [numeric](18, 2) NULL,
	[STUserID] [char](10) NULL,
	[cancelled] [char](1) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CashReceiptStat] [int] NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_CashReceiptStat]  DEFAULT ((0)),
	[CashReceiptAmount] [numeric](12, 2) NULL,
	[INVOICETYPE] [char](4) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[Approved_Stat] [tinyint] NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_Approved_Stat]  DEFAULT ((0)),
	[Approved_By] [char](30) NULL,
	[Approved_Date] [smalldatetime] NULL,
	[emailToSM] [tinyint] NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_emailToSM_1]  DEFAULT ((0)),
	[emailToAM] [tinyint] NOT NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_emailToAM_1]  DEFAULT ((0)),
	[TRORDER] [datetime] NULL CONSTRAINT [DF_T_Acc_InvoiceHeader_TRORDER]  DEFAULT (getdate()),
	[ewfc] [numeric](18, 2) NULL,
	[ewbc] [numeric](18, 2) NULL,
	[deliverytype] [nvarchar](500) NULL,
	[salestax] [numeric](18, 2) NULL,
	[ew] [int] NULL,
	[ewacc] [int] NULL,
	[Country] [nchar](4) NULL,
	[Brand] [nchar](20) NULL,
	[Loc] [nvarchar](20) NULL,
	[PaymentType] [nvarchar](20) NULL,
	[PrintCount] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 0) NULL,
	[CashRecdAmtBC] [numeric](18, 0) NULL,
	[CashRecdBy] [nvarchar](50) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[ReqAmt] [numeric](18, 0) NULL,
	[PaymentType2] [nvarchar](30) NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdBy2] [nvarchar](50) NULL,
	[CashRecdDate2] [smalldatetime] NULL,
	[NationalID] [varchar](50) NULL,
	[EcoCode] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[farsicustname] [nvarchar](50) NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_Acc_InvoiceHeader] PRIMARY KEY CLUSTERED 
(
	[billtype] ASC,
	[billno] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceHeader_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceHeader_prev](
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NOT NULL,
	[billno] [char](20) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NOT NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[slpucd] [char](7) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[otheramt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[slman] [char](8) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[notes2] [varchar](250) NULL,
	[notes] [varchar](250) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](50) NULL,
	[MOBILE] [char](50) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[PAMT2] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[pricing] [char](15) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[PAMT1FC] [numeric](18, 3) NULL,
	[PAMT2FC] [numeric](18, 3) NULL,
	[DISCAMTFC] [numeric](12, 2) NULL,
	[DISCAMTBC] [numeric](12, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[SALESTAXBC] [numeric](18, 2) NULL,
	[STUserID] [char](10) NULL,
	[cancelled] [char](1) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CashReceiptStat] [int] NOT NULL,
	[CashReceiptAmount] [numeric](12, 2) NULL,
	[INVOICETYPE] [char](4) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[Approved_Stat] [tinyint] NOT NULL,
	[Approved_By] [char](30) NULL,
	[Approved_Date] [smalldatetime] NULL,
	[emailToSM] [tinyint] NOT NULL,
	[emailToAM] [tinyint] NOT NULL,
	[TRORDER] [datetime] NULL,
	[ewfc] [numeric](18, 2) NULL,
	[ewbc] [numeric](18, 2) NULL,
	[deliverytype] [nvarchar](500) NULL,
	[salestax] [numeric](18, 2) NULL,
	[ew] [int] NULL,
	[ewacc] [int] NULL,
	[Country] [nchar](4) NULL,
	[Brand] [nchar](20) NULL,
	[Loc] [nvarchar](20) NULL,
	[PaymentType] [nvarchar](20) NULL,
	[PrintCount] [int] NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 0) NULL,
	[CashRecdAmtBC] [numeric](18, 0) NULL,
	[CashRecdBy] [nvarchar](50) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[ReqAmt] [numeric](18, 0) NULL,
	[PaymentType2] [nvarchar](30) NULL,
	[ReqAmt2] [numeric](18, 2) NULL,
	[PAmount2] [numeric](18, 2) NULL,
	[CashRecd2] [int] NULL,
	[CashRecdBy2] [nvarchar](50) NULL,
	[CashRecdDate2] [smalldatetime] NULL,
	[NationalID] [varchar](50) NULL,
	[EcoCode] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[farsicustname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceReturnDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceReturnDetail](
	[yrcd1] [char](1) NULL,
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](20) NULL,
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[costfactorst] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [decimal](13, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceReturnDetail_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceReturnDetail_prev](
	[yrcd1] [char](1) NULL,
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](20) NULL,
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[costfactorst] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [decimal](13, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceReturnHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceReturnHeader](
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NOT NULL,
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NOT NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[slpucd] [char](7) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[otheramt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[slman] [char](8) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[notes2] [varchar](250) NULL,
	[notes] [varchar](250) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](50) NULL,
	[MOBILE] [char](50) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[PAMT2] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[pricing] [char](8) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[PAMT1FC] [numeric](18, 3) NULL,
	[PAMT2FC] [numeric](18, 3) NULL,
	[DISCAMTFC] [numeric](12, 2) NULL,
	[DISCAMTBC] [numeric](12, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[STUserID] [char](10) NULL,
	[cancelled] [char](1) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CashReceiptAmount] [numeric](12, 2) NULL,
	[INVOICETYPE] [char](4) NULL,
	[CNStatus] [int] NULL,
	[TRORDER] [datetime] NULL,
	[ewfc] [numeric](18, 2) NULL,
	[ewbc] [numeric](18, 2) NULL,
	[deliverytype] [nvarchar](500) NULL,
	[salestax] [numeric](18, 2) NULL,
	[ew] [int] NULL,
	[ewacc] [int] NULL,
	[Country] [nchar](4) NULL,
	[Brand] [nchar](20) NULL,
	[Loc] [nvarchar](20) NULL,
	[PaymentType] [nvarchar](20) NULL,
	[PaymentType2] [nvarchar](20) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_Acc_InvoiceReturnHeader] PRIMARY KEY CLUSTERED 
(
	[billtype] ASC,
	[billno] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Acc_InvoiceReturnHeader_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Acc_InvoiceReturnHeader_prev](
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NOT NULL,
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NOT NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[slpucd] [char](7) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[otheramt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[slman] [char](8) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[notes2] [varchar](250) NULL,
	[notes] [varchar](250) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](50) NULL,
	[MOBILE] [char](50) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[PAMT2] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[pricing] [char](8) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[PAMT1FC] [numeric](18, 3) NULL,
	[PAMT2FC] [numeric](18, 3) NULL,
	[DISCAMTFC] [numeric](12, 2) NULL,
	[DISCAMTBC] [numeric](12, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[STUserID] [char](10) NULL,
	[cancelled] [char](1) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CashReceiptAmount] [numeric](12, 2) NULL,
	[INVOICETYPE] [char](4) NULL,
	[CNStatus] [int] NULL,
	[TRORDER] [datetime] NULL,
	[ewfc] [numeric](18, 2) NULL,
	[ewbc] [numeric](18, 2) NULL,
	[deliverytype] [nvarchar](500) NULL,
	[salestax] [numeric](18, 2) NULL,
	[ew] [int] NULL,
	[ewacc] [int] NULL,
	[Country] [nchar](4) NULL,
	[Brand] [nchar](20) NULL,
	[Loc] [nvarchar](20) NULL,
	[PaymentType] [nvarchar](20) NULL,
	[PaymentType2] [nvarchar](20) NULL,
	[XMLEXPORT] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_AdvanceReceipt]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_AdvanceReceipt](
	[DOCNO] [numeric](18, 0) NOT NULL,
	[Jobno] [int] NULL,
	[CCode] [char](10) NULL,
	[TrackingNo] [char](20) NULL,
	[CustomerName] [nvarchar](200) NULL,
	[AdvanceamtFC] [numeric](18, 2) NULL,
	[Advanceamt] [numeric](18, 2) NULL,
	[AdvanceDate] [datetime] NULL,
	[AdvanceUser] [nvarchar](30) NULL,
	[DeliveryType] [nvarchar](100) NULL,
	[PMTYPE1] [nvarchar](30) NULL,
	[PMTYPE2] [nvarchar](30) NULL,
	[AMT1] [numeric](18, 2) NULL,
	[AMT2] [numeric](18, 2) NULL,
	[CNAmt] [numeric](18, 2) NULL,
	[ReqAMT] [numeric](18, 2) NULL,
	[Pamt] [numeric](18, 2) NULL,
	[Puser] [nvarchar](30) NULL,
	[PStatus] [tinyint] NULL,
	[Pdocno] [nvarchar](20) NULL,
	[Pdate] [date] NULL,
	[XMLEXPORT] [int] NULL,
	[ChqNo] [varchar](50) NULL,
	[ChqDate] [smalldatetime] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_AdvanceReceipt] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_cashback]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_cashback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[FOBAMT] [numeric](18, 3) NULL,
	[FMAPP] [int] NULL,
	[FMAPPUSER] [varchar](50) NULL,
	[FMAPPRDATE] [smalldatetime] NULL,
	[CMAPP] [int] NULL,
	[CMAPPUSER] [varchar](50) NULL,
	[CMAPPDATE] [smalldatetime] NULL,
	[FMAPPAMT] [numeric](18, 2) NULL,
	[CMAPPAMT] [numeric](18, 2) NULL,
	[CPAPPAMT] [numeric](18, 2) NULL,
	[FMREQ] [int] NULL,
	[FMREMARKS] [varchar](500) NULL,
	[CMremarks] [varchar](500) NULL,
	[FOBAMTMAX] [numeric](18, 3) NULL,
	[DOCNO] [numeric](18, 0) NULL,
	[CashReturn] [int] NULL,
	[SLNO] [int] NULL,
	[Claimed] [int] NULL,
	[CURRCODE] [varchar](50) NULL,
	[FOBAMTMAXBC] [numeric](18, 2) NULL,
	[FOBAMTBC] [numeric](18, 2) NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[EXPCNAMT] [numeric](18, 2) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[CashBackRequest] [int] NULL,
	[EXPFCNAMT] [numeric](18, 3) NULL,
	[CURRCODE1] [nchar](20) NULL,
	[CNAMTFC] [numeric](18, 2) NULL,
	[CNAMTBC] [numeric](18, 2) NULL,
	[EMAIL_SENT] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASHBACK_APR]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CASHBACK_APR](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[SRNO] [varchar](50) NULL,
	[EBSSRNO] [varchar](50) NULL,
	[SNNO] [varchar](50) NULL,
	[OSVRMANO] [varchar](50) NULL,
	[CURRENCY] [varchar](4) NULL,
	[CNUP] [numeric](18, 3) NULL,
	[CNAMT] [numeric](18, 3) NULL,
	[CNAMTBC] [numeric](18, 2) NULL,
	[REASONCODE] [varchar](50) NULL,
	[REASONDESC] [varchar](250) NULL,
	[LOCALRMANO] [varchar](50) NULL,
	[ISSUEPARTNO] [varchar](50) NULL,
	[ISSUEPNDESC] [varchar](50) NULL,
	[CUSTOMER] [varchar](50) NULL,
	[RETENDCUSTOMER] [varchar](50) NULL,
	[RETURNQTY] [varchar](50) NULL,
	[SRDATE] [smalldatetime] NULL,
	[MEMO] [varchar](50) NULL,
	[SBU] [varchar](50) NULL,
	[SLNO] [int] NULL,
	[DOCNO] [numeric](18, 0) NULL,
 CONSTRAINT [PK_T_CASHBACK_APR] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[JOBNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASHBACK_APR_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CASHBACK_APR_HEADER](
	[DOCNO] [numeric](18, 0) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[REMARKS] [varchar](500) NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_T_CASHBACK_APR_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASHBACK_CLAIMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CASHBACK_CLAIMS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[FOBAMT] [numeric](18, 3) NULL,
	[FMAPP] [int] NULL,
	[FMAPPUSER] [varchar](50) NULL,
	[FMAPPRDATE] [smalldatetime] NULL,
	[CMAPP] [int] NULL,
	[CMAPPUSER] [varchar](50) NULL,
	[CMAPPDATE] [smalldatetime] NULL,
	[FMAPPAMT] [numeric](18, 2) NULL,
	[CMAPPAMT] [numeric](18, 2) NULL,
	[CPAPPAMT] [numeric](18, 2) NULL,
	[FMREQ] [int] NULL,
	[FMREMARKS] [varchar](500) NULL,
	[CMremarks] [varchar](500) NULL,
	[FOBAMTMAX] [numeric](18, 3) NULL,
	[DOCNO] [numeric](18, 0) NULL,
	[CashReturn] [int] NULL,
	[SLNO] [int] NULL,
	[Claimed] [int] NULL,
	[CURRCODE] [varchar](50) NULL,
	[FOBAMTMAXBC] [numeric](18, 2) NULL,
	[FOBAMTBC] [numeric](18, 2) NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[EXPCNAMT] [numeric](18, 2) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[CashBackRequest] [int] NULL,
	[EXPFCNAMT] [numeric](18, 3) NULL,
	[CURRCODE1] [nchar](20) NULL,
	[CNAMTFC] [numeric](18, 2) NULL,
	[CNAMTBC] [numeric](18, 2) NULL,
	[EMAIL_SENT] [int] NULL,
	[swapratebc] [numeric](18, 2) NULL DEFAULT ((0)),
	[swapratebc_prev] [float] NULL DEFAULT ((0)),
	[VENDORAPPROVAL] [char](1) NULL,
 CONSTRAINT [PK_T_CASHBACK_CLAIMS] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[JOBNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASHBACK_CLAIMS_AMEND]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CASHBACK_CLAIMS_AMEND](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[FOBAMT] [numeric](18, 3) NULL,
	[FMAPP] [int] NULL,
	[FMAPPUSER] [varchar](50) NULL,
	[FMAPPRDATE] [smalldatetime] NULL,
	[CMAPP] [int] NULL,
	[CMAPPUSER] [varchar](50) NULL,
	[CMAPPDATE] [smalldatetime] NULL,
	[FMAPPAMT] [numeric](18, 2) NULL,
	[CMAPPAMT] [numeric](18, 2) NULL,
	[CPAPPAMT] [numeric](18, 2) NULL,
	[FMREQ] [int] NULL,
	[FMREMARKS] [varchar](500) NULL,
	[CMremarks] [varchar](500) NULL,
	[FOBAMTMAX] [numeric](18, 3) NULL,
	[DOCNO] [numeric](18, 0) NULL,
	[CashReturn] [int] NULL,
	[SLNO] [int] NULL,
	[Claimed] [int] NULL,
	[CURRCODE] [varchar](50) NULL,
	[FOBAMTMAXBC] [numeric](18, 2) NULL,
	[FOBAMTBC] [numeric](18, 2) NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPAPPRDATE] [smalldatetime] NULL,
	[SWAPAPPRUSER] [varchar](50) NULL,
	[EXPCNAMT] [numeric](18, 0) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[CashBackRequest] [int] NULL,
	[EXPFCNAMT] [numeric](18, 0) NULL,
	[CURRCODE1] [nchar](20) NULL,
	[CNAMTFC] [numeric](18, 2) NULL,
	[CNAMTBC] [numeric](18, 2) NULL,
	[EMAIL_SENT] [int] NULL,
	[AMEND_REASON] [nvarchar](500) NULL,
	[AMEND_DATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASHBACK_CLAIMS_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CASHBACK_CLAIMS_HEADER](
	[DOCNO] [numeric](18, 0) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[REMARKS] [varchar](500) NULL,
 CONSTRAINT [PK_T_CASHBACK_CLAIMS_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CashBack_Request]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CashBack_Request](
	[DocNo] [numeric](18, 0) NOT NULL,
	[RequestDate] [smalldatetime] NULL,
	[CCODE] [nchar](10) NULL,
	[JOBNO] [nchar](10) NULL,
	[TrackingNo] [char](20) NULL,
	[DCustomerID] [nvarchar](10) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[Product] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[RMANO] [nvarchar](50) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[SLNO] [nvarchar](18) NULL,
	[AppAmount] [numeric](18, 0) NULL,
	[ReturnAmount] [numeric](18, 0) NULL,
	[BalanceAmount] [numeric](18, 0) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[ChqNo] [varchar](50) NULL,
	[ChqDate] [smalldatetime] NULL,
	[PaymentMode] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[bank] [varchar](100) NULL,
 CONSTRAINT [PK_T_CashBack_Request] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CashBack_Return]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CashBack_Return](
	[DocNo] [numeric](18, 0) NOT NULL,
	[ReturnDate] [smalldatetime] NULL,
	[CCODE] [nchar](10) NULL,
	[JOBNO] [nchar](10) NULL,
	[TrackingNo] [char](20) NULL,
	[DCustomerID] [nvarchar](10) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[Product] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[RMANO] [nvarchar](50) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[SLNO] [nvarchar](18) NULL,
	[AppAmount] [numeric](18, 0) NULL,
	[ReturnAmount] [numeric](18, 0) NULL,
	[BalanceAmount] [numeric](18, 0) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[PartCode] [char](25) NULL,
	[ChqNo] [varchar](50) NULL,
	[ChqDate] [smalldatetime] NULL,
	[PaymentMode] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[bank] [varchar](100) NULL,
 CONSTRAINT [PK_T_CashBack_Return] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CBCN_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CBCN_DETAIL](
	[JOBNO] [char](8) NULL,
	[CCODE] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL,
	[SRNO] [varchar](50) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](20) NULL,
	[SNNO] [varchar](50) NULL,
	[TOTALAMT] [numeric](18, 2) NULL,
	[SlNo] [numeric](5, 0) NULL,
	[BILLNO] [char](8) NULL,
	[BILLTYPE] [char](4) NULL,
	[TOTALAMTFC] [numeric](18, 3) NULL,
	[REMARKS] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CBCN_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CBCN_HEADER](
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[TOTAMTFC] [numeric](12, 3) NULL,
	[TOTALAMT] [numeric](12, 2) NULL,
	[REFNO] [char](30) NULL,
	[REMARKS] [varchar](250) NULL,
	[CLAIMDOCNO] [char](8) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[CUSTNAME] [char](50) NULL,
	[T] [timestamp] NULL,
	[noprint] [int] NULL,
	[Country] [char](10) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMAPR_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMAPR_DETAIL](
	[DOCNO] [char](8) NOT NULL CONSTRAINT [DF_T_CLAIMAPR_DETAIL_DOCNO]  DEFAULT (''),
	[CCODE] [char](10) NULL CONSTRAINT [DF_T_CLAIMAPR_DETAIL_CCODE]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NULL,
	[LONAME] [char](50) NULL,
	[TRACKINGNO] [char](20) NULL,
	[IMEINO] [varchar](50) NULL,
	[STATUS] [nchar](10) NULL,
	[SLNO] [int] NULL,
	[INVOICED] [int] NULL,
	[RMANO] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMAPR_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMAPR_HEADER](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[CLAIMDOCNO] [char](8) NULL,
	[REMARKS] [varchar](500) NULL,
	[STATUS] [nvarchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_CLAIMAPR_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMDATA]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMDATA](
	[JOBNO] [char](8) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[INVREF] [char](8) NULL,
	[DATE] [varchar](50) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](20) NULL,
	[IMEINO] [varchar](50) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[CURRENCY] [char](5) NULL,
	[TOTALAMT] [numeric](18, 2) NULL,
	[PARTSAMT] [numeric](18, 2) NULL,
	[LCHARGE] [numeric](18, 2) NULL,
	[FREIGHTAMT] [numeric](18, 2) NULL,
	[OTHERAMT] [numeric](18, 2) NULL,
	[RETURNAMT] [numeric](18, 2) NULL,
	[CLAIMDATE] [varchar](50) NULL,
	[WCLAIMNO] [varchar](50) NOT NULL,
	[WBILLNO] [varchar](50) NULL,
	[CLAIMPERIOD] [varchar](10) NULL,
	[DOCNO] [char](8) NULL,
	[SlNo] [numeric](5, 0) NULL,
 CONSTRAINT [PK_T_CLAIMDATA_1] PRIMARY KEY CLUSTERED 
(
	[JOBNO] ASC,
	[CCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMDATA_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMDATA_HEADER](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[CLAIMPERIOD] [varchar](50) NULL,
	[REMARKS] [varchar](500) NULL,
	[STATUS] [int] NULL,
 CONSTRAINT [PK_T_CLAIMDATA_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMREQ_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMREQ_DETAIL](
	[DOCNO] [char](8) NOT NULL CONSTRAINT [DF_T_CLAIMREQ_DETAIL_DOCNO]  DEFAULT (''),
	[CCODE] [char](10) NOT NULL CONSTRAINT [DF_T_CLAIMREQ_DETAIL_CCODE]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CLAIMREF] [char](25) NULL,
	[SOURCE] [nchar](10) NULL,
	[JBDT] [datetime] NULL,
	[UNITDROPPEDDATE] [smalldatetime] NULL,
	[INDT] [datetime] NULL,
	[DATE] [datetime] NULL,
	[TAT] [int] NULL,
	[SERVICE_MODEL] [char](20) NULL,
	[REFURBISHMENT] [char](10) NULL,
	[WARRANTY] [int] NULL,
	[PART_NO] [char](20) NULL,
	[PRODUCT] [char](30) NULL,
	[MODEL] [char](30) NULL,
	[MSNNO] [varchar](18) NULL,
	[IMEINO] [varchar](50) NULL,
	[BOUNCE] [int] NULL,
	[JBFAULTCODE] [char](15) NULL,
	[CUSTREM] [varchar](250) NULL,
	[REPAIRCODE] [char](8) NULL,
	[JOBREM] [varchar](500) NULL,
	[REPAIR_LEVEL] [char](10) NOT NULL CONSTRAINT [DF_T_CLAIMREQ_DETAIL_REPAIR_LEVEL]  DEFAULT ((0)),
	[SIMEINO] [varchar](20) NULL,
	[PART1] [char](25) NULL,
	[CLAIM1] [char](1) NULL,
	[PART2] [char](25) NULL,
	[CLAIM2] [char](1) NULL,
	[PART3] [char](25) NULL,
	[CLAIM3] [char](1) NULL,
	[PART4] [char](25) NULL,
	[CLAIM4] [char](1) NULL,
	[PART5] [char](25) NULL,
	[CLAIM5] [char](1) NULL,
	[PART6] [char](25) NULL,
	[CLAIM6] [char](1) NULL,
	[PART7] [char](25) NULL,
	[CLAIM7] [char](1) NULL,
	[PART8] [char](25) NULL,
	[CLAIM8] [char](1) NULL,
	[PART9] [char](25) NULL,
	[CLAIM9] [char](1) NULL,
	[PART10] [char](25) NULL,
	[CLAIM10] [char](1) NULL,
	[PART11] [char](25) NULL,
	[CLAIM11] [char](1) NULL,
	[PART12] [char](25) NULL,
	[CLAIM12] [char](1) NULL,
	[PART13] [char](25) NULL,
	[CLAIM13] [char](1) NULL,
	[PART14] [char](25) NULL,
	[CLAIM14] [char](1) NULL,
	[TECHCD] [char](8) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[SLNO] [int] NULL,
	[STATUS] [nchar](10) NULL,
	[TRACKINGNO] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CLAIMREQ_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLAIMREQ_HEADER](
	[DOCNO] [char](8) NOT NULL CONSTRAINT [DF_T_CLAIMREQ_HEADER_DOCNO]  DEFAULT (''),
	[DOCDATE] [smalldatetime] NULL,
	[CLAIMFROM] [smalldatetime] NULL,
	[CLAIMTO] [smalldatetime] NULL,
	[BRAND] [nvarchar](20) NULL,
	[REMARKS] [nvarchar](500) NULL,
	[PRODUCT] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_CLAIMREQ_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CreditNote_Detail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CreditNote_Detail](
	[DocNo] [char](8) NOT NULL,
	[locode] [char](10) NULL,
	[BillNo] [char](8) NOT NULL,
	[BillDate] [smalldatetime] NULL,
	[BillType] [char](4) NULL,
	[InvAmt] [decimal](13, 2) NULL,
	[DisAmt] [decimal](13, 2) NULL,
	[NetPayaAmt] [decimal](13, 2) NULL,
	[PaidAmt] [decimal](13, 2) NULL,
	[PreCNAmt] [decimal](13, 2) NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NULL,
 CONSTRAINT [PK_CND] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CreditNote_Header]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CreditNote_Header](
	[DocNo] [char](8) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[accode] [char](7) NULL,
	[NetCNAmt] [decimal](13, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[XMLEXPORT] [int] NULL,
 CONSTRAINT [PK_CNH] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CST_RECEIVED]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CST_RECEIVED](
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NOT NULL CONSTRAINT [DF_T_CST_RECEIVED_JOBNO]  DEFAULT ((0)),
	[ITCODE] [char](25) NULL,
	[ITDESC] [nvarchar](250) NULL,
	[QTY] [int] NULL,
	[SLNO] [int] NULL,
	[RECEIVED] [bit] NOT NULL CONSTRAINT [DF_T_CST_RECEIVED_RECEIVED]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailyEmail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyEmail](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyRevenue]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyRevenue](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailySnapshot]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailySnapshot](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_EnggRemarks]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EnggRemarks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CCODE] [varchar](50) NULL,
	[JOBNO] [numeric](6, 0) NULL,
	[DATE] [smalldatetime] NULL,
	[REMARKS] [varchar](500) NULL,
 CONSTRAINT [PK_T_EnggRemarks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_fault_dxb]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_fault_dxb](
	[model] [nvarchar](255) NULL,
	[jbfaultcode] [nvarchar](255) NULL,
	[id] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_FORECAST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FORECAST](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[Approved] [int] NULL,
	[POREF] [char](10) NULL,
	[FM_USERID] [char](10) NULL,
	[FM_AppDate] [smalldatetime] NULL,
	[FM_Approved] [int] NULL,
	[CM_USERID] [char](10) NULL,
	[CM_AppDate] [smalldatetime] NULL,
	[CM_Approved] [int] NULL,
	[emailToLM_forApp] [tinyint] NOT NULL,
	[emailToFM_forApp] [tinyint] NOT NULL,
	[emailToCM_forApp] [tinyint] NOT NULL,
	[emailToLM_forOrder] [tinyint] NOT NULL,
	[GM_USERID] [char](10) NULL,
	[GM_AppDate] [smalldatetime] NULL,
	[GM_Approved] [int] NULL,
	[emailToGM_forApp] [tinyint] NOT NULL,
	[IC_USERID] [char](10) NULL,
	[IC_AppDate] [smalldatetime] NULL,
	[IC_Approved] [int] NULL,
	[emailToIC_forApp] [tinyint] NOT NULL,
	[LM_USERID] [char](10) NULL,
	[LM_AppDate] [smalldatetime] NULL,
	[LM_Approved] [int] NULL,
	[FM_Remark] [varchar](100) NULL,
	[GM_Remark] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_FORECASTDETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FORECASTDETAIL](
	[DOCNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITCATE] [char](8) NULL,
	[ITUNIT] [char](5) NULL,
	[FACTOR] [numeric](10, 4) NULL,
	[StockQty] [bigint] NULL,
	[ConsAvgQty] [numeric](12, 2) NULL,
	[Cons1Qty] [numeric](12, 2) NULL,
	[Cons2Qty] [numeric](12, 2) NULL,
	[Cons3Qty] [numeric](12, 2) NULL,
	[Cons4Qty] [numeric](12, 2) NULL,
	[Cons5Qty] [numeric](12, 2) NULL,
	[Cons6Qty] [numeric](12, 2) NULL,
	[RegValue] [numeric](12, 2) NULL,
	[FinalRegValue] [numeric](12, 2) NULL,
	[PendingUnits] [bigint] NULL,
	[LocStk] [bigint] NULL,
	[CSLocStk] [bigint] NULL,
	[GIT] [bigint] NULL,
	[ActReqQty] [bigint] NULL,
	[ReqQty] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[LogisticsRemarks] [varchar](100) NULL,
	[AppQty] [bigint] NULL,
	[RecdQty] [bigint] NULL,
	[CostModifier] [numeric](12, 2) NULL,
	[CostAdjOrder] [numeric](12, 2) NULL,
	[UnitRate] [numeric](12, 4) NULL,
	[Amount] [numeric](12, 4) NULL,
	[Cate] [char](1) NULL,
	[LocStkKSA] [bigint] NULL,
	[LocStkKWT] [bigint] NULL,
	[ConsUAE] [numeric](12, 2) NULL,
	[ConsKSA] [numeric](12, 2) NULL,
	[ConsKWT] [numeric](12, 2) NULL,
	[LocStkUAE] [bigint] NULL,
	[CMAppQty] [bigint] NULL,
	[CMRemarks] [varchar](100) NULL,
	[ICAppQty] [bigint] NULL,
	[ICRemarks] [varchar](100) NULL,
	[LMAppQty] [bigint] NULL,
	[LMRemarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_HTCPOUPLOAD]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_HTCPOUPLOAD](
	[HTCPoNo] [varchar](500) NOT NULL,
	[PartCode] [char](30) NOT NULL,
	[ETD_TW] [smalldatetime] NULL,
	[ETA_TC] [smalldatetime] NULL,
 CONSTRAINT [PK_HTCPO] PRIMARY KEY CLUSTERED 
(
	[HTCPoNo] ASC,
	[PartCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Invoice_Header]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Invoice_Header](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [char](20) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[CCode] [nchar](10) NOT NULL,
	[WrType] [smallint] NOT NULL,
	[JobNo] [numeric](8, 0) NULL,
	[JobRef] [nvarchar](15) NULL,
	[TrackingNo] [char](20) NULL,
	[DCustomerID] [nchar](7) NULL,
	[UserID] [nchar](15) NULL,
 CONSTRAINT [PK__T_Invoic__3357D1F468900600] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC,
	[CCode] ASC,
	[WrType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_invoice_header_rejected]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_invoice_header_rejected](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [char](20) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[CCode] [nchar](10) NOT NULL,
	[WrType] [smallint] NOT NULL,
	[JobNo] [numeric](8, 0) NULL,
	[JobRef] [nvarchar](15) NULL,
	[TrackingNo] [char](20) NULL,
	[DCustomerID] [nchar](7) NULL,
	[UserID] [nchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Invoice_Main]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Invoice_Main](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](20) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceType] [varchar](10) NOT NULL,
	[TrackingNo] [char](20) NULL,
	[InvNo] [char](6) NOT NULL,
 CONSTRAINT [PK_T_Invoice_Main_Invno] PRIMARY KEY CLUSTERED 
(
	[InvNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobQC]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobQC](
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](6, 0) NULL,
	[QCDISPLAY1N] [int] NULL,
	[QCDISPLAY1A] [int] NULL,
	[QCDISPLAY2N] [int] NULL,
	[QCDISPLAY2A] [int] NULL,
	[QCDISPLAY3N] [int] NULL,
	[QCDISPLAY3A] [int] NULL,
	[QCDISPLAY4N] [int] NULL,
	[QCDISPLAY4A] [int] NULL,
	[QCAUDIO1N] [int] NULL,
	[QCAUDIO1A] [int] NULL,
	[QCAUDIO2N] [int] NULL,
	[QCAUDIO2A] [int] NULL,
	[QCAUDIO3N] [int] NULL,
	[QCAUDIO3A] [int] NULL,
	[QCAUDIO4N] [int] NULL,
	[QCAUDIO4A] [int] NULL,
	[QCAUDIO5N] [int] NULL,
	[QCAUDIO5A] [int] NULL,
	[QCAUDIO6N] [int] NULL,
	[QCAUDIO6A] [int] NULL,
	[QCAUDIO7N] [int] NULL,
	[QCAUDIO7A] [int] NULL,
	[QCAUDIO8N] [int] NULL,
	[QCAUDIO8A] [int] NULL,
	[QCPOWER1N] [int] NULL,
	[QCPOWER1A] [int] NULL,
	[QCPOWER2N] [int] NULL,
	[QCPOWER2A] [int] NULL,
	[QCPOWER3N] [int] NULL,
	[QCPOWER3A] [int] NULL,
	[QCPOWER4N] [int] NULL,
	[QCPOWER4A] [int] NULL,
	[QCKEYPAD1N] [int] NULL,
	[QCKEYPAD1A] [int] NULL,
	[QCKEYPAD2N] [int] NULL,
	[QCKEYPAD2A] [int] NULL,
	[QCKEYPAD3N] [int] NULL,
	[QCKEYPAD3A] [int] NULL,
	[QCKEYPAD4N] [int] NULL,
	[QCKEYPAD4A] [int] NULL,
	[QCKEYPAD5N] [int] NULL,
	[QCKEYPAD5A] [int] NULL,
	[QCTECH1N] [int] NULL,
	[QCTECH1A] [int] NULL,
	[QCTECH2N] [int] NULL,
	[QCTECH2A] [int] NULL,
	[QCTECH3N] [int] NULL,
	[QCTECH3A] [int] NULL,
	[QCTECH4N] [int] NULL,
	[QCTECH4A] [int] NULL,
	[QCTECH5N] [int] NULL,
	[QCTECH5A] [int] NULL,
	[QCCAM1N] [int] NULL,
	[QCCAM1A] [int] NULL,
	[QCCAM2N] [int] NULL,
	[QCCAM2A] [int] NULL,
	[QCCAM3N] [int] NULL,
	[QCCAM3A] [int] NULL,
	[QCFIRM1N] [int] NULL,
	[QCFIRM1A] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobQC1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobQC1](
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](6, 0) NULL,
	[QC1] [int] NULL,
	[QC2] [int] NULL,
	[QC3] [int] NULL,
	[QC4] [int] NULL,
	[QC5] [int] NULL,
	[QC6] [int] NULL,
	[QC7] [int] NULL,
	[QC8] [int] NULL,
	[QC9] [int] NULL,
	[QC10] [int] NULL,
	[QC11] [int] NULL,
	[QC12] [int] NULL,
	[QC13] [int] NULL,
	[QC14] [int] NULL,
	[QC15] [int] NULL,
	[QC16] [int] NULL,
	[QC17] [int] NULL,
	[QC18] [int] NULL,
	[QC19] [int] NULL,
	[QC20] [int] NULL,
	[QC21] [int] NULL,
	[QC22] [int] NULL,
	[QC23] [int] NULL,
	[QC24] [int] NULL,
	[QC25] [int] NULL,
	[QC26] [int] NULL,
	[QC27] [int] NULL,
	[QC28] [int] NULL,
	[QC29] [int] NULL,
	[QC30] [int] NULL,
	[QC31] [int] NULL,
	[QC32] [int] NULL,
	[FAULT1] [varchar](50) NULL,
	[FAULT2] [varchar](50) NULL,
	[FAULT3] [varchar](50) NULL,
	[FAULT4] [varchar](50) NULL,
	[FAULT5] [varchar](50) NULL,
	[TestResult] [varchar](max) NULL,
	[TestResult1] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobQCFailed]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobQCFailed](
	[LOCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](6, 0) NOT NULL,
	[EnggRemarks] [varchar](255) NULL,
	[JobStatus] [char](2) NULL,
	[JobAll_TECHCD] [char](5) NULL,
	[JobAll_Date] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](5) NULL,
	[JobStartDate] [smalldatetime] NULL,
	[JobComplete] [char](1) NULL,
	[TechnicianCode] [char](5) NULL,
	[JobEndDate] [smalldatetime] NULL,
	[QCTechCode] [char](5) NULL,
	[QCDate] [datetime] NULL,
	[QC_StartDate] [datetime] NULL,
	[QCRemarks] [varchar](255) NULL,
	[QC_Status] [char](1) NULL,
	[Repair_Status] [char](1) NULL,
	[JobCloseRemarks] [varchar](255) NULL,
	[QC1] [int] NULL,
	[QC2] [int] NULL,
	[QC3] [int] NULL,
	[QC4] [int] NULL,
	[QC5] [int] NULL,
	[QC6] [int] NULL,
	[QC7] [int] NULL,
	[QC8] [int] NULL,
	[QC9] [int] NULL,
	[QC10] [int] NULL,
	[QC11] [int] NULL,
	[QC12] [int] NULL,
	[QC13] [int] NULL,
	[QC14] [int] NULL,
	[QC15] [int] NULL,
	[QC16] [int] NULL,
	[QC17] [int] NULL,
	[QC18] [int] NULL,
	[QC19] [int] NULL,
	[QC20] [int] NULL,
	[QC21] [int] NULL,
	[QC22] [int] NULL,
	[QC23] [int] NULL,
	[QC24] [int] NULL,
	[QC25] [int] NULL,
	[QC27] [int] NULL,
	[QC26] [int] NULL,
	[QC28] [int] NULL,
	[QC29] [int] NULL,
	[QC30] [int] NULL,
	[QC31] [int] NULL,
	[QC32] [int] NULL,
	[FAULT1] [varchar](50) NULL,
	[FAULT2] [varchar](50) NULL,
	[FAULT3] [varchar](50) NULL,
	[FAULT4] [varchar](50) NULL,
	[FAULT5] [varchar](50) NULL,
	[TestResult] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobReturnDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobReturnDetail](
	[yrcd1] [char](1) NULL,
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[costfactorst] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [decimal](13, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobReturnDetail_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobReturnDetail_prev](
	[yrcd1] [char](1) NULL,
	[locode] [char](10) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[IMEINo] [char](20) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](10, 3) NULL,
	[itqty] [decimal](13, 3) NULL,
	[itrte] [decimal](14, 4) NULL,
	[discper] [decimal](6, 2) NULL,
	[discamt] [decimal](14, 3) NULL,
	[itamnt] [decimal](14, 3) NULL,
	[bcamnt] [decimal](14, 3) NULL,
	[costfactor] [decimal](10, 4) NULL,
	[costfactorst] [decimal](10, 4) NULL,
	[stkval] [decimal](13, 2) NULL,
	[Incentive] [numeric](18, 0) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[netamt] [decimal](13, 2) NULL,
	[STKLOC] [char](10) NULL,
	[DEFCODE] [char](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobReturnHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobReturnHeader](
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NOT NULL,
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[jobno] [int] NOT NULL,
	[Product] [nvarchar](30) NULL,
	[Brand] [nchar](20) NULL,
	[Model] [nvarchar](30) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[salestax] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[UserID] [char](10) NULL,
	[TRORDER] [datetime] NULL,
	[Country] [nchar](4) NULL,
	[IMEINO] [nvarchar](30) NULL,
	[CollectionPoint] [nvarchar](200) NULL,
	[LCHARGE] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[OPLOSS] [numeric](18, 2) NULL,
	[OPLOSSFC] [numeric](18, 3) NULL,
	[DELIVERYTYPE] [nvarchar](100) NULL,
	[PAYMENTTYPE1] [nvarchar](100) NULL,
	[PAYMENTTYPE2] [nvarchar](100) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[ACTUALITEMTOTAL] [numeric](18, 2) NULL,
	[ACTUALITEMTOTALFC] [numeric](18, 3) NULL,
	[GRANDTOTAL] [numeric](18, 2) NULL,
	[GRANDTOTALFC] [numeric](18, 3) NULL,
	[PARTIALSTFC] [numeric](18, 3) NULL,
	[PARTIALST] [numeric](18, 2) NULL,
	[PARTIALTOTALFC] [numeric](18, 3) NULL,
	[PARTIALTOTAL] [numeric](18, 2) NULL,
	[RETURNTYPE] [int] NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_JobReturnHeader] PRIMARY KEY CLUSTERED 
(
	[billtype] ASC,
	[billno] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_JobReturnHeader_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JobReturnHeader_prev](
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NOT NULL,
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[jobno] [int] NOT NULL,
	[Product] [nvarchar](30) NULL,
	[Brand] [nchar](20) NULL,
	[Model] [nvarchar](30) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[tramnt] [numeric](12, 3) NULL,
	[bcamnt] [numeric](12, 2) NULL,
	[refno] [char](30) NULL,
	[Itemtotal] [numeric](12, 2) NULL,
	[netamt] [numeric](12, 2) NULL,
	[costfactor] [numeric](10, 4) NULL,
	[CLIENTNAME] [varchar](100) NULL,
	[ADDRESS] [varchar](250) NULL,
	[CustomerType] [int] NULL,
	[PCODE1] [char](10) NULL,
	[PAMT1] [numeric](12, 2) NULL,
	[CSOREF] [char](10) NULL,
	[salestax] [numeric](18, 2) NULL,
	[SALESTAXFC] [numeric](18, 3) NULL,
	[UserID] [char](10) NULL,
	[TRORDER] [datetime] NULL,
	[Country] [nchar](4) NULL,
	[IMEINO] [nvarchar](30) NULL,
	[CollectionPoint] [nvarchar](200) NULL,
	[LCHARGE] [numeric](18, 2) NULL,
	[LCHARGEFC] [numeric](18, 3) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[OPLOSS] [numeric](18, 2) NULL,
	[OPLOSSFC] [numeric](18, 3) NULL,
	[DELIVERYTYPE] [nvarchar](100) NULL,
	[PAYMENTTYPE1] [nvarchar](100) NULL,
	[PAYMENTTYPE2] [nvarchar](100) NULL,
	[PMTAMT] [numeric](18, 2) NULL,
	[PMTAMTFC] [numeric](18, 3) NULL,
	[PMTAMT1] [numeric](18, 2) NULL,
	[PMTAMT1FC] [numeric](18, 3) NULL,
	[ACTUALITEMTOTAL] [numeric](18, 2) NULL,
	[ACTUALITEMTOTALFC] [numeric](18, 3) NULL,
	[GRANDTOTAL] [numeric](18, 2) NULL,
	[GRANDTOTALFC] [numeric](18, 3) NULL,
	[PARTIALSTFC] [numeric](18, 3) NULL,
	[PARTIALST] [numeric](18, 2) NULL,
	[PARTIALTOTALFC] [numeric](18, 3) NULL,
	[PARTIALTOTAL] [numeric](18, 2) NULL,
	[RETURNTYPE] [int] NULL,
	[XMLEXPORT] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerDetail](
	[YRCD] [char](1) NULL CONSTRAINT [DF_Table_1_yrcd]  DEFAULT (''),
	[TRNTYPE] [char](4) NULL CONSTRAINT [DF_Table_1_trntype]  DEFAULT (''),
	[TRNO] [char](50) NULL CONSTRAINT [DF_Table_1_trno_1]  DEFAULT (''),
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](1000) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](10) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgerdetail_3006]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgerdetail_3006](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgerdetail_3105]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgerdetail_3105](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgerdetail_310718]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgerdetail_310718](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgerdetail_310818]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgerdetail_310818](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](1000) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](10) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerDetail_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerDetail_PREV](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [varchar](6) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerDetail_REVDATA]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerDetail_REVDATA](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [varchar](6) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](8) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgerdetail0208]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgerdetail0208](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[LOCODE] [char](10) NULL,
	[CLSUP] [char](7) NULL,
	[SLCODE] [char](20) NULL,
	[REMARKS] [varchar](500) NULL,
	[DBAMTBC] [decimal](18, 2) NULL,
	[CRAMTBC] [decimal](18, 2) NULL,
	[DIVISION] [varchar](8) NULL,
	[DEPARTMENT] [varchar](8) NULL,
	[BRANCH] [varchar](50) NULL,
	[ACCOUNTNAME] [varchar](100) NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[SLNO] [int] NULL,
	[TRDATE] [smalldatetime] NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerMaster]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerMaster](
	[YRCD] [char](1) NULL CONSTRAINT [DF_T_LedgerMaster_yrcd]  DEFAULT (''),
	[TRNTYPE] [char](4) NULL CONSTRAINT [DF_T_LedgerMaster_trntype]  DEFAULT (''),
	[TRNO] [char](50) NULL CONSTRAINT [DF_T_LedgerMaster_trno]  DEFAULT (''),
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgermaster_3006]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgermaster_3006](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgermaster_3105]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgermaster_3105](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgermaster_310718]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgermaster_310718](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgermaster_310818]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgermaster_310818](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerMaster_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerMaster_PREV](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LedgerMaster_REVDATA]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LedgerMaster_REVDATA](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](25) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](14) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ledgermaster0208]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ledgermaster0208](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[TRDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[Integrated] [int] NULL,
	[VOUCHERTYPE] [char](10) NULL,
	[H_SeqNo] [int] NULL,
	[ErrorReason] [nvarchar](max) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[DETAILDESC] [varchar](500) NULL,
	[VOUCHERNO] [char](25) NULL,
	[IntegratedDate] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ledgerdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LInvDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LInvDetail](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](18, 3) NULL,
	[itqty] [decimal](18, 3) NULL,
	[adjtype] [char](1) NULL,
	[itrte] [decimal](18, 4) NULL,
	[discper] [decimal](18, 2) NULL,
	[discamt] [decimal](18, 3) NULL,
	[itamnt] [decimal](18, 3) NULL,
	[bcamnt] [decimal](18, 3) NULL,
	[costfactor] [decimal](18, 4) NULL,
	[csamnt] [decimal](18, 2) NULL,
	[netamt] [decimal](18, 2) NULL,
	[stkval] [decimal](18, 2) NULL,
	[slno] [numeric](5, 0) NOT NULL,
	[cancelled] [char](1) NULL,
	[locode] [char](10) NULL,
	[refno] [char](15) NULL,
	[pack1] [char](15) NULL,
	[othercrg] [numeric](18, 2) NULL,
	[ITEMDESC] [char](100) NOT NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[ccode] [char](4) NULL,
	[binloc] [char](10) NULL,
	[ltrqty] [numeric](18, 2) NULL,
	[FCSTKVAL] [numeric](18, 3) NULL,
	[PJMREF] [char](15) NULL,
	[OLDITCODE] [char](20) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [char](30) NULL,
	[EWFC] [numeric](18, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[stkval1] [decimal](18, 2) NULL,
	[rmk] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LInvHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LInvHeader](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[yrcd1] [char](1) NULL,
	[billtype] [char](4) NULL,
	[billno] [char](8) NULL,
	[billdate] [smalldatetime] NULL,
	[lcpo] [char](1) NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](18, 4) NULL,
	[slpucd] [char](7) NULL,
	[Itemtotal] [numeric](18, 2) NULL,
	[tramnt] [numeric](18, 3) NULL,
	[bcamnt] [numeric](18, 2) NULL,
	[netamt] [numeric](18, 2) NULL,
	[otheramt] [numeric](18, 2) NULL,
	[costfactor] [numeric](18, 4) NULL,
	[refno] [char](30) NULL,
	[refdt] [smalldatetime] NULL,
	[duedate] [smalldatetime] NULL,
	[slman] [char](8) NULL,
	[slloc] [char](8) NULL,
	[transport] [char](8) NULL,
	[pricing] [char](8) NULL,
	[notes] [varchar](250) NULL,
	[notes1] [varchar](250) NULL,
	[notes2] [varchar](250) NULL,
	[lctrac] [char](7) NULL,
	[cancelled] [char](1) NULL,
	[ordno] [char](8) NULL,
	[discount] [numeric](18, 3) NULL,
	[expcode] [char](7) NULL,
	[expamt] [numeric](18, 2) NULL,
	[othercrg] [numeric](18, 2) NULL,
	[PYTERMS] [char](12) NULL,
	[NOTES3] [char](50) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[DOTAG] [char](1) NULL,
	[INVTAG] [char](1) NULL,
	[CUSTNAME] [char](50) NULL,
	[RECEIP] [char](35) NULL,
	[DISCPER] [numeric](18, 2) NULL,
	[DISCAMT] [numeric](18, 2) NULL,
	[T] [timestamp] NULL,
	[SAMTAG] [char](1) NULL,
	[SAMTEXT] [char](200) NULL,
	[weight] [numeric](18, 3) NULL,
	[noofbox] [numeric](5, 0) NULL,
	[trackno] [char](20) NULL,
	[courierno] [char](25) NULL,
	[couriername] [char](50) NULL,
	[Toloc] [char](10) NULL,
	[gitloc] [char](10) NULL,
	[gweight] [numeric](18, 2) NULL,
	[CLIENTID] [char](10) NULL,
	[TELEPHONE] [char](20) NULL,
	[MOBILE] [char](20) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PCODE1] [char](10) NULL,
	[PCODE2] [char](10) NULL,
	[PAMT1] [numeric](18, 2) NULL,
	[PAMT2] [numeric](18, 2) NULL,
	[CSOREF] [char](10) NULL,
	[CLIENTNAME] [varchar](50) NULL,
	[USERNAME] [char](50) NULL,
	[AWBDATE] [smalldatetime] NULL,
	[awbrecdDate] [smalldatetime] NULL,
	[awbRecdby] [char](30) NULL,
	[dispatchNo] [char](15) NULL,
	[PAMT1FC] [numeric](18, 3) NULL,
	[PAMT2FC] [numeric](18, 3) NULL,
	[noprint] [int] NULL,
	[GRNNO] [char](8) NULL,
	[DISCAMTFC] [numeric](18, 2) NULL,
	[DISCAMTBC] [numeric](18, 2) NULL,
	[CashRecd] [int] NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecdBy] [char](30) NULL,
	[ACCINVTYPE] [char](10) NULL,
	[TRADEDISCFC] [numeric](18, 2) NULL,
	[TRADEDISCBC] [numeric](18, 2) NULL,
	[CLAIMVOUCHERID] [varchar](50) NULL,
	[EWFC] [numeric](18, 2) NULL,
	[EWBC] [numeric](18, 2) NULL,
	[CashRecdAmtBC] [numeric](18, 2) NULL,
	[DeliveryType] [varchar](500) NULL,
	[XMLEXPORT] [int] NULL,
	[XMLEXPORTCSH] [int] NULL,
	[VoucherNo] [char](8) NULL,
	[Approval] [int] NULL,
	[XMLEXPORTGIT] [int] NULL,
	[email01] [bit] NULL,
	[email02] [bit] NULL,
	[Country] [char](10) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](18, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_OpeningPayables]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_OpeningPayables](
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[billtype] [char](4) NOT NULL,
	[locode] [char](10) NOT NULL,
	[netamt] [numeric](12, 2) NULL,
	[PAmount] [decimal](13, 2) NULL,
	[PStatus] [int] NULL,
	[PDate] [smalldatetime] NULL,
	[PDocNo] [char](8) NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[JobNo] [numeric](8, 0) NULL,
	[CusCode] [char](7) NULL,
	[CusName] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[ReqAmt] [decimal](13, 2) NULL,
 CONSTRAINT [PK_OP] PRIMARY KEY CLUSTERED 
(
	[billno] ASC,
	[billtype] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_parts_dxb]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_parts_dxb](
	[REPAIRCODE] [nvarchar](255) NULL,
	[FAULTCODE] [nvarchar](255) NULL,
	[FAULTDESC] [nvarchar](max) NULL,
	[PARTCODE] [nvarchar](255) NULL,
	[PARTDESC] [nvarchar](255) NULL,
	[MODEL] [nvarchar](255) NULL,
	[Count] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Payment_Detail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Payment_Detail](
	[DocNo] [char](8) NOT NULL,
	[BillNo] [char](8) NOT NULL,
	[BillDate] [smalldatetime] NULL,
	[BillType] [char](4) NULL,
	[NetAmt] [decimal](18, 2) NULL,
	[slno] [numeric](5, 0) NULL,
	[PAmount] [decimal](18, 2) NULL,
	[locode] [char](10) NULL,
	[TRACKINGNO] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Payment_Header]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Payment_Header](
	[DocNo] [char](8) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[accode] [char](7) NULL,
	[ChqNo] [varchar](100) NULL,
	[ChqDate] [smalldatetime] NULL,
	[Bank] [varchar](100) NULL,
	[BankRef] [varchar](50) NULL,
	[PaidAmt] [decimal](18, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_PH] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PendingSODETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PendingSODETAIL](
	[DOCNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITCATE] [char](8) NULL,
	[ITUNIT] [char](5) NULL,
	[FACTOR] [numeric](10, 4) NULL,
	[StockQty] [bigint] NULL,
	[ReqQty] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[LogisticsRemarks] [varchar](100) NULL,
	[AppQty] [bigint] NULL,
	[RecdQty] [bigint] NULL,
	[UnitRate] [numeric](12, 2) NULL,
	[Amount] [numeric](12, 2) NULL,
	[CMAppQty] [bigint] NULL,
	[CMRemarks] [varchar](100) NULL,
	[ICAppQty] [bigint] NULL,
	[ICRemarks] [varchar](100) NULL,
	[LMAppQty] [bigint] NULL,
	[LMRemarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PendingSORequest]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PendingSORequest](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[Approved] [int] NULL,
	[POREF] [char](10) NULL,
	[FM_USERID] [char](10) NULL,
	[FM_AppDate] [smalldatetime] NULL,
	[FM_Approved] [int] NULL,
	[CM_USERID] [char](10) NULL,
	[CM_AppDate] [smalldatetime] NULL,
	[CM_Approved] [int] NULL,
	[emailToLM_forApp] [tinyint] NOT NULL,
	[emailToFM_forApp] [tinyint] NOT NULL,
	[emailToCM_forApp] [tinyint] NOT NULL,
	[emailToLM_forOrder] [tinyint] NOT NULL,
	[GM_USERID] [char](10) NULL,
	[GM_AppDate] [smalldatetime] NULL,
	[GM_Approved] [int] NULL,
	[emailToGM_forApp] [tinyint] NOT NULL,
	[IC_USERID] [char](10) NULL,
	[IC_AppDate] [smalldatetime] NULL,
	[IC_Approved] [int] NULL,
	[emailToIC_forApp] [tinyint] NOT NULL,
	[LM_USERID] [char](10) NULL,
	[LM_AppDate] [smalldatetime] NULL,
	[LM_Approved] [int] NULL,
	[FM_Remark] [varchar](100) NULL,
	[GM_Remark] [varchar](100) NULL,
	[REF1] [char](15) NULL,
	[REF2] [char](15) NULL,
	[REF3] [char](15) NULL,
	[REF4] [char](15) NULL,
	[REF5] [char](15) NULL,
	[REF6] [char](15) NULL,
	[REF7] [char](15) NULL,
	[REF8] [char](15) NULL,
	[REF9] [char](15) NULL,
	[REF10] [char](15) NULL,
	[REF11] [char](15) NULL,
	[REF12] [char](15) NULL,
	[REF13] [char](15) NULL,
	[REF14] [char](15) NULL,
	[REF15] [char](15) NULL,
	[REF16] [char](15) NULL,
	[REF17] [char](15) NULL,
	[REF18] [char](15) NULL,
	[REF19] [char](15) NULL,
	[REF20] [char](15) NULL,
	[REF21] [char](15) NULL,
	[REF22] [char](15) NULL,
	[REF23] [char](15) NULL,
	[REF24] [char](15) NULL,
	[REF25] [char](15) NULL,
	[REF26] [char](15) NULL,
	[REF27] [char](15) NULL,
	[REF28] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PORequest]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PORequest](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[LOCODE] [char](10) NULL,
	[PREPAREDBY] [char](50) NULL,
	[APPROVEDBY] [char](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[Approved] [int] NULL,
	[POREF] [char](10) NULL,
	[FM_USERID] [char](10) NULL,
	[FM_AppDate] [smalldatetime] NULL,
	[FM_Approved] [int] NULL,
	[CM_USERID] [char](10) NULL,
	[CM_AppDate] [smalldatetime] NULL,
	[CM_Approved] [int] NULL,
	[emailToLM_forApp] [tinyint] NOT NULL,
	[emailToFM_forApp] [tinyint] NOT NULL,
	[emailToCM_forApp] [tinyint] NOT NULL,
	[emailToLM_forOrder] [tinyint] NOT NULL,
	[GM_USERID] [char](10) NULL,
	[GM_AppDate] [smalldatetime] NULL,
	[GM_Approved] [int] NULL,
	[emailToGM_forApp] [tinyint] NOT NULL,
	[IC_USERID] [char](10) NULL,
	[IC_AppDate] [smalldatetime] NULL,
	[IC_Approved] [int] NULL,
	[emailToIC_forApp] [tinyint] NOT NULL,
	[LM_USERID] [char](10) NULL,
	[LM_AppDate] [smalldatetime] NULL,
	[LM_Approved] [int] NULL,
	[FM_Remark] [varchar](100) NULL,
	[GM_Remark] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_POREQUESTDETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_POREQUESTDETAIL](
	[DOCNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITCATE] [char](8) NULL,
	[ITUNIT] [char](5) NULL,
	[FACTOR] [numeric](10, 4) NULL,
	[StockQty] [bigint] NULL,
	[ReqQty] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[LogisticsRemarks] [varchar](100) NULL,
	[AppQty] [bigint] NULL,
	[RecdQty] [bigint] NULL,
	[UnitRate] [numeric](12, 2) NULL,
	[Amount] [numeric](12, 2) NULL,
	[CMAppQty] [bigint] NULL,
	[CMRemarks] [varchar](100) NULL,
	[ICAppQty] [bigint] NULL,
	[ICRemarks] [varchar](100) NULL,
	[LMAppQty] [bigint] NULL,
	[LMRemarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RTVAPR_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RTVAPR_DETAIL](
	[DOCNO] [char](8) NOT NULL CONSTRAINT [DF_T_RTVAPR_DETAIL_DOCNO]  DEFAULT (''),
	[CCODE] [char](10) NULL CONSTRAINT [DF_T_RTVAPR_DETAIL_CCODE]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NULL,
	[LONAME] [char](50) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RMANO] [char](50) NULL,
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](250) NULL,
	[IMEINO] [varchar](50) NULL,
	[STATUS] [nchar](10) NULL,
	[SLNO] [int] NULL,
	[ORDERED] [int] NULL,
	[RETURNED] [int] NULL,
	[RECEIVED] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RTVAPR_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RTVAPR_HEADER](
	[DOCNO] [char](8) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[REMARKS] [varchar](500) NULL,
	[CLAIMREQDOCNO] [char](8) NULL,
 CONSTRAINT [PK_T_RTVAPR_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RTVCLAIMREQ_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RTVCLAIMREQ_DETAIL](
	[DOCNO] [char](8) NULL CONSTRAINT [DF_T_RTVCLAIMREQ_DETAIL_DOCNO]  DEFAULT (''),
	[TRACKINGNO] [char](20) NULL,
	[CCODE] [char](10) NULL CONSTRAINT [DF_T_RTVCLAIMREQ_DETAIL_CCODE]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NULL,
	[IMEINO] [varchar](50) NULL,
	[ITCODE] [char](25) NULL,
	[ITDESC] [char](250) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[SLNO] [int] NULL,
	[TYPE] [nchar](10) NULL,
	[STATUS] [nchar](10) NULL,
	[RMANo] [nvarchar](50) NULL,
	[prevstat] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RTVCLAIMREQ_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RTVCLAIMREQ_HEADER](
	[DOCNO] [char](8) NOT NULL CONSTRAINT [DF_T_RTVCLAIMREQ_HEADER_DOCNO]  DEFAULT (''),
	[DOCDATE] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[CLAIMFROM] [smalldatetime] NULL,
	[CLAIMTO] [smalldatetime] NULL,
	[BRAND] [nvarchar](20) NULL,
	[REMARKS] [nvarchar](500) NULL,
	[PRODUCT] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_RTVCLAIMREQ_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Samsung_GETSRAIF]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Samsung_GETSRAIF](
	[CONVERSATION_ID] [char](35) NULL,
	[COMPANY] [char](4) NULL,
	[ASC_CODE] [char](10) NULL,
	[PASSWORD] [char](40) NULL,
	[MSG_TYPE] [char](8) NULL,
	[STATUS] [char](10) NULL,
	[ERROR_CODE] [numeric](5, 0) NULL,
	[DESCRIPTION] [char](100) NULL,
	[CON_SEQUENCE] [numeric](10, 0) NULL,
	[ASC_JOB_NO] [char](30) NULL,
	[BP_NO] [char](10) NULL,
	[TR_NO] [char](10) NULL,
	[TR_STATUS] [char](5) NULL,
	[TR_REASON] [char](10) NULL,
	[ASC_BILL_NO] [char](15) NULL,
	[WTY_BILL_NO] [char](15) NULL,
	[WTY_STATUS] [char](2) NULL,
	[JOB_FLAG] [char](1) NULL,
	[JOB_COMMENTS] [char](100) NULL,
	[BPKIND] [char](4) NULL,
	[TITLE] [char](4) NULL,
	[LANGUAGE] [char](2) NULL,
	[NAME_FIRST] [char](40) NULL,
	[NAME_LAST] [char](40) NULL,
	[STREET3] [char](40) NULL,
	[STREET2] [char](40) NULL,
	[STREET] [char](60) NULL,
	[DISTRICT] [char](40) NULL,
	[CITY] [char](25) NULL,
	[CITY_CODE] [char](10) NULL,
	[REGION] [char](3) NULL,
	[POST_CODE] [char](10) NULL,
	[COUNTRY] [char](3) NULL,
	[UNIQUE_ID] [char](20) NULL,
	[HOME_PHONE] [char](30) NULL,
	[OFFICE_PHONE] [char](30) NULL,
	[MOBILE_PHONE] [char](30) NULL,
	[EMAIL] [char](100) NULL,
	[FAX] [char](30) NULL,
	[CONTACT] [char](1) NULL,
	[COMMENTS] [char](50) NULL,
	[CP_NAME_FIRST] [char](40) NULL,
	[CP_NAME_LAST] [char](40) NULL,
	[JOB_NO] [char](30) NULL,
	[POSTING_DATE] [char](8) NULL,
	[STATUS_COMMENTS] [char](100) NULL,
	[MODEL] [char](18) NULL,
	[SERIAL_NO] [char](20) NULL,
	[IMEI] [char](18) NULL,
	[PURCHASING_DT] [char](8) NULL,
	[VERSION] [char](4) NULL,
	[INOUTWTY] [char](2) NULL,
	[COLLECT_POINT] [char](10) NULL,
	[ENGINEER_CODE] [char](20) NULL,
	[ENGINEER_NAME] [char](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[REPAIR_RCV_DT] [char](8) NULL,
	[REPAIR_RCV_TM] [char](6) NULL,
	[CUST_REQ_DT] [char](8) NULL,
	[CUST_REQ_TM] [char](6) NULL,
	[CC_APP_DT] [char](8) NULL,
	[CC_APP_TM] [char](6) NULL,
	[ASC_APP_DT] [char](8) NULL,
	[ASC_APP_TM] [char](6) NULL,
	[ENG_ASSIGN_DT] [char](8) NULL,
	[ENG_ASSIGN_TM] [char](6) NULL,
	[UNIT_RCV_DT] [char](8) NULL,
	[UNIT_RCV_TM] [char](6) NULL,
	[VISIT_DT] [char](8) NULL,
	[VISIT_TM] [char](6) NULL,
	[COMPLETE_DT] [char](8) NULL,
	[COMPLETE_TM] [char](6) NULL,
	[DLVRY_DT] [char](8) NULL,
	[DLVRY_TM] [char](6) NULL,
	[SWAP_MODEL] [char](18) NULL,
	[SWAP_SERIAL_NO] [char](20) NULL,
	[SWAP_IMEI] [char](18) NULL,
	[DEALER_JOB_NO] [char](30) NULL,
	[SYMPTOM1_DESC] [char](40) NULL,
	[SYMPTOM2_DESC] [char](40) NULL,
	[SYMPTOM3_DESC] [char](40) NULL,
	[SVC_LEVEL] [char](10) NULL,
	[SVC_LEVEL_DESC] [char](40) NULL,
	[OPERATOR] [char](30) NULL,
	[PACK_NO] [char](18) NULL,
	[COMPU_OS] [char](10) NULL,
	[COMPU_TYPE] [char](10) NULL,
	[COMPU_MANUF] [char](30) NULL,
	[COMPU_MODEL] [char](30) NULL,
	[COMPU_INFO] [char](30) NULL,
	[SIGNAL_SOURCE] [char](1) NULL,
	[SIGNAL_COM_ID] [char](10) NULL,
	[SIGNAL_MODEL] [char](30) NULL,
	[SAW_NO] [char](20) NULL,
	[PURCHASE_PLACE] [char](50) NULL,
	[USER_NAME] [char](30) NULL,
	[WTY_EXCEPTION] [char](5) NULL,
	[INQUIRY] [char](132) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Samsung_GETSRTIF]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Samsung_GETSRTIF](
	[CONVERSATION_ID] [char](35) NULL,
	[COMPANY] [char](4) NULL,
	[ASC_CODE] [char](10) NULL,
	[PASSWORD] [char](40) NULL,
	[MSG_TYPE] [char](8) NULL,
	[STATUS] [char](10) NULL,
	[ERROR_CODE] [numeric](5, 0) NULL,
	[DESCRIPTION] [char](100) NULL,
	[CON_SEQUENCE] [numeric](10, 0) NULL,
	[ASC_JOB_NO] [char](30) NULL,
	[BP_NO] [char](10) NULL,
	[TR_NO] [char](10) NULL,
	[TR_STATUS] [char](5) NULL,
	[TR_REASON] [char](10) NULL,
	[ASC_BILL_NO] [char](15) NULL,
	[WTY_BILL_NO] [char](15) NULL,
	[WTY_STATUS] [char](2) NULL,
	[JOB_FLAG] [char](1) NULL,
	[JOB_COMMENTS] [char](100) NULL,
	[BPKIND] [char](4) NULL,
	[TITLE] [char](4) NULL,
	[LANGUAGE] [char](2) NULL,
	[NAME_FIRST] [char](40) NULL,
	[NAME_LAST] [char](40) NULL,
	[STREET3] [char](40) NULL,
	[STREET2] [char](40) NULL,
	[STREET] [char](60) NULL,
	[DISTRICT] [char](40) NULL,
	[CITY] [char](25) NULL,
	[CITY_CODE] [char](10) NULL,
	[REGION] [char](3) NULL,
	[POST_CODE] [char](10) NULL,
	[COUNTRY] [char](3) NULL,
	[UNIQUE_ID] [char](20) NULL,
	[HOME_PHONE] [char](30) NULL,
	[OFFICE_PHONE] [char](30) NULL,
	[MOBILE_PHONE] [char](30) NULL,
	[EMAIL] [char](100) NULL,
	[FAX] [char](30) NULL,
	[CONTACT] [char](1) NULL,
	[COMMENTS] [char](50) NULL,
	[CP_NAME_FIRST] [char](40) NULL,
	[CP_NAME_LAST] [char](40) NULL,
	[JOB_NO] [char](30) NULL,
	[POSTING_DATE] [char](8) NULL,
	[STATUS_COMMENTS] [char](100) NULL,
	[MODEL] [char](18) NULL,
	[SERIAL_NO] [char](20) NULL,
	[IMEI] [char](18) NULL,
	[PURCHASING_DT] [char](8) NULL,
	[VERSION] [char](4) NULL,
	[INOUTWTY] [char](2) NULL,
	[COLLECT_POINT] [char](10) NULL,
	[ENGINEER_CODE] [char](20) NULL,
	[ENGINEER_NAME] [char](50) NULL,
	[SERVICE_TYPE] [char](2) NULL,
	[REPAIR_RCV_DT] [char](8) NULL,
	[REPAIR_RCV_TM] [char](6) NULL,
	[CUST_REQ_DT] [char](8) NULL,
	[CUST_REQ_TM] [char](6) NULL,
	[CC_APP_DT] [char](8) NULL,
	[CC_APP_TM] [char](6) NULL,
	[ASC_APP_DT] [char](8) NULL,
	[ASC_APP_TM] [char](6) NULL,
	[ENG_ASSIGN_DT] [char](8) NULL,
	[ENG_ASSIGN_TM] [char](6) NULL,
	[UNIT_RCV_DT] [char](8) NULL,
	[UNIT_RCV_TM] [char](6) NULL,
	[VISIT_DT] [char](8) NULL,
	[VISIT_TM] [char](6) NULL,
	[COMPLETE_DT] [char](8) NULL,
	[COMPLETE_TM] [char](6) NULL,
	[DLVRY_DT] [char](8) NULL,
	[DLVRY_TM] [char](6) NULL,
	[SWAP_MODEL] [char](18) NULL,
	[SWAP_SERIAL_NO] [char](20) NULL,
	[SWAP_IMEI] [char](18) NULL,
	[DEALER_JOB_NO] [char](30) NULL,
	[SYMPTOM1_DESC] [char](40) NULL,
	[SYMPTOM2_DESC] [char](40) NULL,
	[SYMPTOM3_DESC] [char](40) NULL,
	[SVC_LEVEL] [char](10) NULL,
	[SVC_LEVEL_DESC] [char](40) NULL,
	[OPERATOR] [char](30) NULL,
	[PACK_NO] [char](18) NULL,
	[COMPU_OS] [char](10) NULL,
	[COMPU_TYPE] [char](10) NULL,
	[COMPU_MANUF] [char](30) NULL,
	[COMPU_MODEL] [char](30) NULL,
	[COMPU_INFO] [char](30) NULL,
	[SIGNAL_SOURCE] [char](1) NULL,
	[SIGNAL_COM_ID] [char](10) NULL,
	[SIGNAL_MODEL] [char](30) NULL,
	[SAW_NO] [char](20) NULL,
	[PURCHASE_PLACE] [char](50) NULL,
	[USER_NAME] [char](30) NULL,
	[WTY_EXCEPTION] [char](5) NULL,
	[SUB_SEQUENCE] [numeric](5, 0) NULL,
	[PARTS_CODE] [char](18) NULL,
	[REPAIR_LOC] [char](10) NULL,
	[SERIAL_MAT] [char](25) NULL,
	[QTY] [int] NULL,
	[PO_DATE] [char](8) NULL,
	[PO_NO] [char](34) NULL,
	[PO_ITEM] [char](6) NULL,
	[SO_NO] [char](10) NULL,
	[SO_ITEM] [char](6) NULL,
	[INVOICE_NO] [char](20) NULL,
	[INVOICE_ITEM] [char](6) NULL,
	[UNIT_PRICE] [char](13) NULL,
	[UNIT_PRICE_LOCL] [char](13) NULL,
	[IN_OUT_WTY] [char](1) NULL,
	[REQUEST_NO] [char](20) NULL,
	[REQUEST_ITEM] [char](6) NULL,
	[REQUEST_DT] [char](8) NULL,
	[GI_DATE] [char](8) NULL,
	[GI_DOCUMENT] [char](10) NULL,
	[GI_ITEM_NO] [numeric](4, 0) NULL,
	[REP_TYPE] [char](2) NULL,
	[LAB_TYPE] [char](2) NULL,
	[AUTH_ID] [char](12) NULL,
	[WBSEX] [char](4) NULL,
	[SERIALTYPE] [char](16) NULL,
	[IRIS_CONDI] [char](1) NULL,
	[IRIS_DEFEC] [char](2) NULL,
	[IRIS_SYMPT] [char](3) NULL,
	[IRIS_REPAI] [char](3) NULL,
	[IRIS_FLAG] [char](1) NULL,
	[IRIS_SECTION] [char](4) NULL,
	[ACCESSORY] [char](50) NULL,
	[SVC_REQ_DT] [char](8) NULL,
	[SVC_REQ_TM] [char](6) NULL,
	[REPAIR_RCV] [char](8) NULL,
	[DISTANT] [char](5) NULL,
	[FREIGHT] [char](9) NULL,
	[PARTS_AMT] [char](9) NULL,
	[OTHER_AMT] [char](9) NULL,
	[OTHER_AMT_TEXT] [char](50) NULL,
	[DEFECTDESC] [char](50) NULL,
	[REPAIRDESC] [char](50) NULL,
	[REMARK] [char](64) NULL,
	[INVO_NUM_DT] [char](8) NULL,
	[INVO_NUM] [char](15) NULL,
	[PRINTED] [char](10) NULL,
	[DPQ] [char](1) NULL,
	[NEW_MODEL_NAME] [char](18) NULL,
	[NEW_SERIAL_NO] [char](16) NULL,
	[ENGINEER] [char](20) NULL,
	[SUB_PRO_TYPE] [char](1) NULL,
	[CUSTOMER_TYPE] [char](1) NULL,
	[PUR_PRIC] [char](9) NULL,
	[ADD_FREIGHT] [char](1) NULL,
	[GAS_CHARGE] [char](2) NULL,
	[TOLL_FEE] [char](9) NULL,
	[SVC_GRADE] [char](2) NULL,
	[CHARGEABLE_TO] [char](1) NULL,
	[NEW_IMEI_NO] [char](50) NULL,
	[DEFINE_CODE] [char](4) NULL,
	[B2B_SVC_LEVEL] [char](4) NULL,
	[SPARE1] [char](10) NULL,
	[SPARE2] [char](10) NULL,
	[SPARE3] [char](10) NULL,
	[SPARE4] [char](10) NULL,
	[SPARE5] [char](10) NULL,
	[TOTAL_INVOICE] [char](11) NULL,
	[TOTAL_LABOR] [char](11) NULL,
	[TOTAL_PARTS] [char](11) NULL,
	[TOTAL_FREIGHT] [char](11) NULL,
	[TOTAL_TOLL_FEE] [char](11) NULL,
	[TOTAL_GAS_CHARGE] [char](11) NULL,
	[TOTAL_TAX] [char](11) NULL,
	[TOTAL_OTHER] [char](11) NULL,
	[INQUIRY] [char](132) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SERVICE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SERVICE](
	[DOCNO] [numeric](6, 0) NULL,
	[DOCDT] [smalldatetime] NULL,
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](6, 0) NULL,
	[QCDISPLAY1N] [int] NULL,
	[QCDISPLAY1A] [int] NULL,
	[QCDISPLAY1R] [varchar](300) NULL,
	[QCAUDIO1N] [int] NULL,
	[QCAUDIO1A] [int] NULL,
	[QCAUDIO1R] [varchar](300) NULL,
	[QCPOWER1N] [int] NULL,
	[QCPOWER1A] [int] NULL,
	[QCPOWER1R] [varchar](300) NULL,
	[QCPOWER2N] [int] NULL,
	[QCPOWER2A] [int] NULL,
	[QCPOWER2R] [varchar](300) NULL,
	[QCKEYPAD1N] [int] NULL,
	[QCKEYPAD1A] [int] NULL,
	[QCKEYPAD1R] [varchar](300) NULL,
	[QCTECH1N] [int] NULL,
	[QCTECH1A] [int] NULL,
	[QCTECH1R] [varchar](300) NULL,
	[QCTECH2N] [int] NULL,
	[QCTECH2A] [int] NULL,
	[QCTECH2R] [varchar](300) NULL,
	[QCTECH3N] [int] NULL,
	[QCTECH3A] [int] NULL,
	[QCTECH3R] [varchar](300) NULL,
	[QCTECH4N] [int] NULL,
	[QCTECH4A] [int] NULL,
	[QCTECH4R] [varchar](300) NULL,
	[QCTECH5N] [int] NULL,
	[QCTECH5A] [int] NULL,
	[QCTECH5R] [varchar](300) NULL,
	[QCCAM1N] [int] NULL,
	[QCCAM1A] [int] NULL,
	[QCCAM1R] [varchar](300) NULL,
	[QCFIRM1N] [int] NULL,
	[QCFIRM1A] [int] NULL,
	[QCFIRM1R] [varchar](300) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SERVICE_INVOICE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SERVICE_INVOICE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INVOICENO] [char](20) NOT NULL,
	[INVOICEDATE] [smalldatetime] NULL,
	[TRACKINGNO] [char](20) NULL,
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[CLCODE] [char](7) NULL,
	[PMTTYPE] [char](4) NULL,
	[SERVICETYPE] [nchar](10) NULL,
	[DCUSTOMERNAME] [varchar](75) NULL,
	[REMARKS] [varchar](250) NULL,
	[CUSTOMERNAME] [varchar](100) NULL,
	[MOBILENO] [varchar](50) NULL,
	[CREATEDBY] [varchar](100) NULL,
	[SERVICEAMT] [numeric](18, 2) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[INVOICEAMT] [numeric](18, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[PMTTYPE2] [nvarchar](30) NULL,
	[AMT1] [numeric](18, 2) NULL,
	[AMT2] [numeric](18, 2) NULL,
	[ReqAMT] [numeric](18, 2) NULL,
	[Pamt] [numeric](18, 2) NULL,
	[Pdocno] [nvarchar](20) NULL,
	[Puser] [nvarchar](30) NULL,
	[Pdate] [datetime] NULL,
	[deliverytype] [nvarchar](100) NULL,
	[PStatus] [tinyint] NULL,
	[CNAmount] [numeric](18, 2) NULL,
	[ReqAMT2] [numeric](18, 2) NULL,
	[Pamt2] [numeric](18, 2) NULL,
	[CashRecd] [tinyint] NULL,
	[CashRecdBy] [nvarchar](50) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecd2] [tinyint] NULL,
	[CashRecdBy2] [nvarchar](50) NULL,
	[CashRecdDate2] [smalldatetime] NULL,
	[EMAIL_SENT] [int] NULL,
	[QRS] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_SERVICE_INVOICE] PRIMARY KEY CLUSTERED 
(
	[INVOICENO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SERVICE_INVOICE_1406]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SERVICE_INVOICE_1406](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INVOICENO] [char](20) NOT NULL,
	[INVOICEDATE] [smalldatetime] NULL,
	[TRACKINGNO] [char](20) NULL,
	[CCODE] [char](10) NULL,
	[JOBNO] [numeric](8, 0) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[CLCODE] [char](7) NULL,
	[PMTTYPE] [char](4) NULL,
	[SERVICETYPE] [nchar](10) NULL,
	[DCUSTOMERNAME] [varchar](75) NULL,
	[REMARKS] [varchar](250) NULL,
	[CUSTOMERNAME] [varchar](100) NULL,
	[MOBILENO] [varchar](50) NULL,
	[CREATEDBY] [varchar](100) NULL,
	[SERVICEAMT] [numeric](18, 2) NULL,
	[SALESTAX] [numeric](18, 2) NULL,
	[INVOICEAMT] [numeric](18, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[PMTTYPE2] [nvarchar](30) NULL,
	[AMT1] [numeric](18, 2) NULL,
	[AMT2] [numeric](18, 2) NULL,
	[ReqAMT] [numeric](18, 2) NULL,
	[Pamt] [numeric](18, 2) NULL,
	[Pdocno] [nvarchar](20) NULL,
	[Puser] [nvarchar](30) NULL,
	[Pdate] [datetime] NULL,
	[deliverytype] [nvarchar](100) NULL,
	[PStatus] [tinyint] NULL,
	[CNAmount] [numeric](18, 2) NULL,
	[ReqAMT2] [numeric](18, 2) NULL,
	[Pamt2] [numeric](18, 2) NULL,
	[CashRecd] [tinyint] NULL,
	[CashRecdBy] [nvarchar](50) NULL,
	[CashRecdDate] [smalldatetime] NULL,
	[CashRecd2] [tinyint] NULL,
	[CashRecdBy2] [nvarchar](50) NULL,
	[CashRecdDate2] [smalldatetime] NULL,
	[EMAIL_SENT] [int] NULL,
	[QRS] [int] NULL,
	[EXPORTDATE] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ServiceRequest]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ServiceRequest](
	[TRACKINGNO] [char](20) NULL,
	[Product] [char](30) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[Jobno] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[ServiceReq] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_ServiceReq]  DEFAULT ((0)),
	[ServiceReqBy] [varchar](30) NULL,
	[ServiceReqDate] [smalldatetime] NULL,
	[ServiceReqType] [nchar](20) NULL,
	[ServiceAmt] [numeric](18, 2) NULL,
	[SalesTax] [numeric](18, 2) NULL,
	[ServiceTAmt] [numeric](18, 2) NULL,
	[CNAmt] [numeric](18, 2) NULL CONSTRAINT [DF_T_ServiceRequest_CNAmt]  DEFAULT ((0)),
	[sid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CMApproval] [tinyint] NULL,
	[BMApproval] [tinyint] NULL,
	[Invoiced] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_Invoiced]  DEFAULT ((0)),
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[BMRemark] [nvarchar](50) NULL,
	[BMAppAMT] [numeric](18, 2) NULL,
	[SWCost] [numeric](18, 2) NULL,
	[BMAppDt] [smalldatetime] NULL,
	[BMUser] [nchar](20) NULL,
	[CURRCODE] [nvarchar](20) NULL,
	[CNFCAmt] [numeric](18, 2) NULL,
	[ProdigyReq] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_ProdigyReq]  DEFAULT ((0)),
	[EMAIL_SENT] [int] NULL,
 CONSTRAINT [PK_T_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[Jobno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ServiceRequest_Amend]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ServiceRequest_Amend](
	[TRACKINGNO] [char](20) NULL,
	[Product] [char](30) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[Jobno] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[ServiceReq] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_Amend_ServiceReq]  DEFAULT ((0)),
	[ServiceReqBy] [varchar](30) NULL,
	[ServiceReqDate] [smalldatetime] NULL,
	[ServiceReqType] [nchar](20) NULL,
	[ServiceAmt] [numeric](18, 2) NULL,
	[SalesTax] [numeric](18, 2) NULL,
	[ServiceTAmt] [numeric](18, 2) NULL,
	[CNAmt] [numeric](18, 2) NULL CONSTRAINT [DF_T_ServiceRequest_Amend_CNAmt]  DEFAULT ((0)),
	[sid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CMApproval] [tinyint] NULL,
	[BMApproval] [tinyint] NULL,
	[Invoiced] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_Amend_Invoiced]  DEFAULT ((0)),
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[BMRemark] [nvarchar](50) NULL,
	[BMAppAMT] [numeric](18, 2) NULL,
	[SWCost] [numeric](18, 2) NULL,
	[BMAppDt] [smalldatetime] NULL,
	[BMUser] [nchar](20) NULL,
	[CURRCODE] [nvarchar](20) NULL,
	[CNFCAmt] [numeric](18, 2) NULL,
	[ProdigyReq] [tinyint] NULL CONSTRAINT [DF_T_ServiceRequest_Amend_ProdigyReq]  DEFAULT ((0)),
	[EMAIL_SENT] [int] NULL,
 CONSTRAINT [PK_T_ServiceRequest_Amend] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[Jobno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ServiceRequest404978]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ServiceRequest404978](
	[TRACKINGNO] [char](20) NULL,
	[Product] [char](30) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[Jobno] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[ServiceReq] [tinyint] NULL,
	[ServiceReqBy] [varchar](30) NULL,
	[ServiceReqDate] [smalldatetime] NULL,
	[ServiceReqType] [nchar](20) NULL,
	[ServiceAmt] [numeric](18, 2) NULL,
	[SalesTax] [numeric](18, 2) NULL,
	[ServiceTAmt] [numeric](18, 2) NULL,
	[CNAmt] [numeric](18, 2) NULL,
	[sid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CMApproval] [tinyint] NULL,
	[BMApproval] [tinyint] NULL,
	[Invoiced] [tinyint] NULL,
	[SWAP] [int] NULL,
	[SWAPITEM] [char](25) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[BMRemark] [nvarchar](50) NULL,
	[BMAppAMT] [numeric](18, 2) NULL,
	[SWCost] [numeric](18, 2) NULL,
	[BMAppDt] [smalldatetime] NULL,
	[BMUser] [nchar](20) NULL,
	[CURRCODE] [nvarchar](20) NULL,
	[CNFCAmt] [numeric](18, 2) NULL,
	[ProdigyReq] [tinyint] NULL,
	[EMAIL_SENT] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ShipmentDetails_NW]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShipmentDetails_NW](
	[DocumentNo] [char](5) NULL,
	[IMEINo] [char](18) NULL,
	[Model] [char](15) NULL,
	[ProductCode] [varchar](15) NULL,
	[SCPRefNo] [varchar](25) NULL,
	[SymCode] [char](20) NULL,
	[WarrantyType] [int] NULL,
	[JobNo] [numeric](5, 0) NULL,
	[Remarks] [varchar](500) NULL,
	[Slno] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ShipmentMaster_NW]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShipmentMaster_NW](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [int] NOT NULL,
	[DocumentDate] [smalldatetime] NULL,
	[Remarks] [varchar](500) NULL,
 CONSTRAINT [PK_T_ShipmentMaster_NW] PRIMARY KEY CLUSTERED 
(
	[DocumentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ShipmentMaster_NW_Ref]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShipmentMaster_NW_Ref](
	[YRCD] [char](1) NULL,
	[TRTYPE] [char](4) NULL,
	[CURRNO] [char](8) NULL,
	[MINNO] [char](8) NULL,
	[MAXNO] [char](8) NULL,
	[SLNO] [int] NOT NULL,
	[TEST] [char](8) NULL,
	[CCODE] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ShippingDetail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShippingDetail](
	[ShippingNo] [varchar](50) NULL,
	[ShipToParty] [varchar](500) NULL,
	[CustPO] [varchar](500) NULL,
	[POS] [int] NULL,
	[OrderedItem] [varchar](500) NULL,
	[ShippedItem] [varchar](500) NULL,
	[ShipQty] [numeric](18, 0) NULL,
	[UnitPrice] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Sno] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ShippingHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShippingHeader](
	[ShippingNo] [varchar](50) NOT NULL,
	[TotalItem] [numeric](18, 0) NULL,
	[TotalQty] [numeric](18, 0) NULL,
	[SNAmount] [numeric](18, 0) NULL,
	[DeliveryDate] [smalldatetime] NULL,
	[HAWB] [varchar](50) NULL,
	[Sno] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_T_ShippingHeader] PRIMARY KEY CLUSTERED 
(
	[ShippingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SPRequest]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SPRequest](
	[Locode] [char](10) NULL,
	[Trno] [char](10) NOT NULL,
	[Jobno] [numeric](6, 0) NULL,
	[Model] [char](30) NULL,
	[itcode] [char](25) NULL,
	[Qty] [int] NULL,
	[EnggCode] [char](5) NULL,
	[Approved] [char](1) NULL,
	[Returned] [char](1) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_SPRequest_Date]  DEFAULT (getdate()),
	[Consumed] [char](1) NULL,
	[RetReq] [char](1) NULL,
	[DefReq] [char](1) NULL,
	[DefRecd] [char](1) NULL,
	[SwapPermit] [char](1) NULL,
	[Cancelled] [char](1) NULL CONSTRAINT [DF_T_SPRequest_Cancelled]  DEFAULT ('0'),
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [char](2) NULL,
	[WaitForPart] [int] NULL,
	[PartReceived] [int] NULL,
	[DOARetReq] [char](1) NULL,
	[DOAReturned] [char](1) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[PartsReceivedBy] [varchar](50) NULL,
	[PartsReceivedDate] [smalldatetime] NULL,
	[ConsumedBy] [varchar](50) NULL,
	[ConsumedDate] [smalldatetime] NULL,
	[RetReqBy] [varchar](50) NULL,
	[RetReqDate] [smalldatetime] NULL,
	[ReturnedBy] [varchar](50) NULL,
	[ReturnedDate] [smalldatetime] NULL,
	[DOARetReqBy] [varchar](50) NULL,
	[DOARetReqDate] [smalldatetime] NULL,
	[DefReqBy] [varchar](50) NULL,
	[DefReqDate] [smalldatetime] NULL,
	[DefRecdBy] [varchar](50) NULL,
	[DefRecdDate] [smalldatetime] NULL,
	[DOAReturnedBy] [varchar](50) NULL,
	[DOAReturnedDate] [smalldatetime] NULL,
	[SwapIMEINo] [varchar](50) NULL,
	[issuepartcode] [char](25) NULL,
	[STKLOC] [char](10) NULL,
	[transferref] [int] NULL,
 CONSTRAINT [PK_T_SPRequest] PRIMARY KEY CLUSTERED 
(
	[Trno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SPRequest_020918]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SPRequest_020918](
	[Locode] [char](10) NULL,
	[Trno] [char](10) NOT NULL,
	[Jobno] [numeric](6, 0) NULL,
	[Model] [char](30) NULL,
	[itcode] [char](25) NULL,
	[Qty] [int] NULL,
	[EnggCode] [char](5) NULL,
	[Approved] [char](1) NULL,
	[Returned] [char](1) NULL,
	[Date] [smalldatetime] NULL,
	[Consumed] [char](1) NULL,
	[RetReq] [char](1) NULL,
	[DefReq] [char](1) NULL,
	[DefRecd] [char](1) NULL,
	[SwapPermit] [char](1) NULL,
	[Cancelled] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [char](2) NULL,
	[WaitForPart] [int] NULL,
	[PartReceived] [int] NULL,
	[DOARetReq] [char](1) NULL,
	[DOAReturned] [char](1) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[PartsReceivedBy] [varchar](50) NULL,
	[PartsReceivedDate] [smalldatetime] NULL,
	[ConsumedBy] [varchar](50) NULL,
	[ConsumedDate] [smalldatetime] NULL,
	[RetReqBy] [varchar](50) NULL,
	[RetReqDate] [smalldatetime] NULL,
	[ReturnedBy] [varchar](50) NULL,
	[ReturnedDate] [smalldatetime] NULL,
	[DOARetReqBy] [varchar](50) NULL,
	[DOARetReqDate] [smalldatetime] NULL,
	[DefReqBy] [varchar](50) NULL,
	[DefReqDate] [smalldatetime] NULL,
	[DefRecdBy] [varchar](50) NULL,
	[DefRecdDate] [smalldatetime] NULL,
	[DOAReturnedBy] [varchar](50) NULL,
	[DOAReturnedDate] [smalldatetime] NULL,
	[SwapIMEINo] [varchar](50) NULL,
	[issuepartcode] [char](25) NULL,
	[STKLOC] [char](10) NULL,
	[transferref] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_sprequest_0417]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_sprequest_0417](
	[Locode] [char](10) NULL,
	[Trno] [char](10) NOT NULL,
	[Jobno] [numeric](6, 0) NULL,
	[Model] [char](30) NULL,
	[itcode] [char](25) NULL,
	[Qty] [int] NULL,
	[EnggCode] [char](5) NULL,
	[Approved] [char](1) NULL,
	[Returned] [char](1) NULL,
	[Date] [smalldatetime] NULL,
	[Consumed] [char](1) NULL,
	[RetReq] [char](1) NULL,
	[DefReq] [char](1) NULL,
	[DefRecd] [char](1) NULL,
	[SwapPermit] [char](1) NULL,
	[Cancelled] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [char](2) NULL,
	[WaitForPart] [int] NULL,
	[PartReceived] [int] NULL,
	[DOARetReq] [char](1) NULL,
	[DOAReturned] [char](1) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[PartsReceivedBy] [varchar](50) NULL,
	[PartsReceivedDate] [smalldatetime] NULL,
	[ConsumedBy] [varchar](50) NULL,
	[ConsumedDate] [smalldatetime] NULL,
	[RetReqBy] [varchar](50) NULL,
	[RetReqDate] [smalldatetime] NULL,
	[ReturnedBy] [varchar](50) NULL,
	[ReturnedDate] [smalldatetime] NULL,
	[DOARetReqBy] [varchar](50) NULL,
	[DOARetReqDate] [smalldatetime] NULL,
	[DefReqBy] [varchar](50) NULL,
	[DefReqDate] [smalldatetime] NULL,
	[DefRecdBy] [varchar](50) NULL,
	[DefRecdDate] [smalldatetime] NULL,
	[DOAReturnedBy] [varchar](50) NULL,
	[DOAReturnedDate] [smalldatetime] NULL,
	[SwapIMEINo] [varchar](50) NULL,
	[issuepartcode] [char](25) NULL,
	[STKLOC] [char](10) NULL,
	[transferref] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SPRequest_Header]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SPRequest_Header](
	[Locode] [char](10) NULL,
	[Trno] [char](10) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_T_SPRequest_Header] PRIMARY KEY CLUSTERED 
(
	[Trno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SPREQUEST_PREV]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SPREQUEST_PREV](
	[Locode] [char](10) NULL,
	[Trno] [char](10) NOT NULL,
	[Jobno] [numeric](6, 0) NULL,
	[Model] [char](30) NULL,
	[itcode] [char](25) NULL,
	[Qty] [int] NULL,
	[EnggCode] [char](5) NULL,
	[Approved] [char](1) NULL,
	[Returned] [char](1) NULL,
	[Date] [smalldatetime] NULL,
	[Consumed] [char](1) NULL,
	[RetReq] [char](1) NULL,
	[DefReq] [char](1) NULL,
	[DefRecd] [char](1) NULL,
	[SwapPermit] [char](1) NULL,
	[Cancelled] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [char](2) NULL,
	[WaitForPart] [int] NULL,
	[PartReceived] [int] NULL,
	[DOARetReq] [char](1) NULL,
	[DOAReturned] [char](1) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[PartsReceivedBy] [varchar](50) NULL,
	[PartsReceivedDate] [smalldatetime] NULL,
	[ConsumedBy] [varchar](50) NULL,
	[ConsumedDate] [smalldatetime] NULL,
	[RetReqBy] [varchar](50) NULL,
	[RetReqDate] [smalldatetime] NULL,
	[ReturnedBy] [varchar](50) NULL,
	[ReturnedDate] [smalldatetime] NULL,
	[DOARetReqBy] [varchar](50) NULL,
	[DOARetReqDate] [smalldatetime] NULL,
	[DefReqBy] [varchar](50) NULL,
	[DefReqDate] [smalldatetime] NULL,
	[DefRecdBy] [varchar](50) NULL,
	[DefRecdDate] [smalldatetime] NULL,
	[DOAReturnedBy] [varchar](50) NULL,
	[DOAReturnedDate] [smalldatetime] NULL,
	[SwapIMEINo] [varchar](50) NULL,
	[issuepartcode] [char](25) NULL,
	[STKLOC] [char](10) NULL,
	[transferref] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_STKADJVAL_DETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_STKADJVAL_DETAIL](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](18, 3) NULL,
	[adjtype] [char](1) NULL,
	[currval] [decimal](18, 4) NULL,
	[adjval] [decimal](18, 3) NULL,
	[finalval] [decimal](18, 3) NULL,
	[stkval] [decimal](18, 2) NULL,
	[slno] [numeric](6, 0) NOT NULL,
	[locode] [char](10) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[cancelled] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_STKADJVAL_DETAIL_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_STKADJVAL_DETAIL_prev](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[itcode] [char](25) NULL,
	[itunit] [char](5) NULL,
	[factor] [decimal](18, 3) NULL,
	[adjtype] [char](1) NULL,
	[currval] [decimal](18, 4) NULL,
	[adjval] [decimal](18, 3) NULL,
	[finalval] [decimal](18, 3) NULL,
	[stkval] [decimal](18, 2) NULL,
	[slno] [numeric](6, 0) NOT NULL,
	[locode] [char](10) NULL,
	[AINT] [int] IDENTITY(1,1) NOT NULL,
	[cancelled] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_STKADJVAL_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_STKADJVAL_HEADER](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[slpucd] [char](7) NULL,
	[NOTES] [char](250) NULL,
	[T] [timestamp] NULL,
	[noprint] [int] NULL,
	[Approval] [int] NULL,
	[cancelled] [char](1) NULL,
	[trorder] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_STKADJVAL_HEADER_prev]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_STKADJVAL_HEADER_prev](
	[yrcd] [char](1) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](8) NULL,
	[trdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[slpucd] [char](7) NULL,
	[NOTES] [char](250) NULL,
	[T] [timestamp] NULL,
	[noprint] [int] NULL,
	[Approval] [int] NULL,
	[cancelled] [char](1) NULL,
	[trorder] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SWAP_CN_FOOTER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SWAP_CN_FOOTER](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[CNAMT] [numeric](18, 3) NULL,
	[CNFCAMT] [numeric](18, 3) NULL,
	[CURRCODE] [nchar](20) NULL,
	[REMARKS] [varchar](500) NULL,
	[DOCNO] [numeric](18, 0) NULL,
	[SLNO] [varchar](50) NULL,
 CONSTRAINT [PK_T_SWAP_CN_FOOTER] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[JOBNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SWAP_CN_HEADER]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SWAP_CN_HEADER](
	[DOCNO] [numeric](18, 0) NOT NULL,
	[DOCDATE] [smalldatetime] NULL,
	[REMARKS] [varchar](500) NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDt] [smalldatetime] NULL,
 CONSTRAINT [PK_T_SWAP_CN_HEADER] PRIMARY KEY CLUSTERED 
(
	[DOCNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SWAPAPPROVAL_AMEND]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SWAPAPPROVAL_AMEND](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[TRACKINGNO] [char](20) NULL,
	[BRAND] [varchar](50) NULL,
	[MODEL] [varchar](50) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[PRODUCT] [nvarchar](50) NULL,
	[ReceivedFrom_RC] [int] NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](6, 0) NULL,
	[ReceivedFrom_RC_ReceiptDate] [smalldatetime] NULL,
	[TransferTo_LC] [int] NULL,
	[TransferTo_LC_DNRef] [numeric](6, 0) NULL,
	[TransferTo_LC_DNDate] [smalldatetime] NULL,
	[RC_CloseDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_RC_Closed]  DEFAULT ((0)),
	[TCInvoiced] [int] NULL,
	[Rep_TC_Received] [int] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_Rep_TC_Received]  DEFAULT ((0)),
	[Rep_TC_ReceivedDate] [smalldatetime] NULL,
	[Rep_TC_ReceivedBy] [char](15) NULL,
	[RC_Issued] [int] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_RC_Issued]  DEFAULT ((0)),
	[RC_IssuedBy] [char](15) NULL,
	[RC_IssuedDate] [smalldatetime] NULL,
	[TransferedTo_LC_DNRef] [numeric](6, 0) NULL,
	[INVREF] [char](8) NULL,
	[DATE] [datetime] NULL,
	[DELIVERY] [smallint] NULL,
	[DELIVERYDATE] [datetime] NULL,
	[INVOICED] [smallint] NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[PInvUser] [varchar](50) NULL,
	[PInvFlag] [smallint] NULL,
	[ADD_DESC] [varchar](50) NULL,
	[ADD_AMT] [numeric](18, 2) NULL,
	[ADD_AMTFC] [numeric](18, 3) NULL,
	[DED_DESC] [varchar](50) NULL,
	[DED_AMT] [numeric](18, 2) NULL,
	[DED_AMTFC] [numeric](18, 3) NULL,
	[PMTTYPE] [char](4) NULL,
	[PMTTYPE1] [char](4) NULL,
	[PMTAMT] [numeric](18, 2) NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_PMTAMT]  DEFAULT ((0)),
	[PMTAMTFC] [numeric](18, 3) NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_PMTAMTFC]  DEFAULT ((0)),
	[PMTAMT1] [numeric](18, 2) NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_PMTAMT1]  DEFAULT ((0)),
	[PMTAMT1FC] [numeric](18, 3) NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_PMTAMT1FC]  DEFAULT ((0)),
	[CUST_AMT] [numeric](18, 2) NULL,
	[CUST_AMTFC] [numeric](18, 3) NULL,
	[DELIVERY_REMARKS] [varchar](250) NULL,
	[JobCloseRemarks] [nvarchar](255) NULL,
	[JBDT] [datetime] NULL,
	[JBCOMPLETE] [bit] NOT NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_JBCOMPLETE]  DEFAULT ((0)),
	[REPAIR_STATUS] [int] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_REPAIR_STATUS]  DEFAULT ((0)),
	[QTECH] [char](10) NULL,
	[QDATE] [smalldatetime] NULL,
	[QREMARKS] [varchar](250) NULL,
	[QC_STATUS] [smallint] NOT NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_QC_STATUS]  DEFAULT ((0)),
	[SWAPReq] [tinyint] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_SWAPReq]  DEFAULT ((0)),
	[SWAPReqApp] [tinyint] NULL CONSTRAINT [DF_T_SWAPAPPROVAL_AMEND_SWAPReqApp]  DEFAULT ((0)),
	[SWAPReqBy] [varchar](30) NULL,
	[SWAPReqDt] [smalldatetime] NULL,
	[SWAPAppBy] [varchar](30) NULL,
	[SWAPAppDt] [smalldatetime] NULL,
	[SwapAprRemarks] [nvarchar](500) NULL,
	[AMEND_REASON] [nvarchar](500) NULL,
	[AMEND_DATE] [datetime] NULL,
	[AMEND_USER] [nvarchar](50) NULL,
	[amend_reasontype] [varchar](75) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SwapInvoice]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SwapInvoice](
	[InvoiceNo] [numeric](18, 0) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[CCODE] [nchar](10) NULL,
	[JOBNO] [nchar](10) NULL,
	[TrackingNo] [char](20) NULL,
	[DCustomerID] [nvarchar](10) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[Product] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[PartCode] [char](25) NULL,
	[SwapItem] [char](25) NULL,
	[SwapIMEINo] [varchar](50) NULL,
	[SWAPITEMBRAND] [varchar](50) NULL,
	[XMLEXPORT] [int] NULL,
	[swapratebc] [numeric](18, 2) NULL DEFAULT ((0)),
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_T_SwapInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SwapRequestApproval]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SwapRequestApproval](
	[TRACKINGNO] [char](20) NULL,
	[Jobno] [numeric](8, 0) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[Product] [char](30) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[SWAPReq] [tinyint] NULL CONSTRAINT [DF_T_SwapRequestApproval_SWAPReq]  DEFAULT ((0)),
	[SWAPReqBy] [varchar](30) NULL,
	[SWAPReqDt] [smalldatetime] NULL,
	[SWAPApp] [tinyint] NULL CONSTRAINT [DF_T_SwapRequestApproval_SWAPApp]  DEFAULT ((0)),
	[SWAPAppBy] [varchar](30) NULL,
	[SWAPAppDt] [smalldatetime] NULL,
	[sid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_T_SwapRequestApproval] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[Jobno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WeeklyAgeingReport]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_WeeklyAgeingReport](
	[Date] [smalldatetime] NULL,
	[Status] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_WeeklyEmail]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_WeeklyEmail](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_WeeklyWIP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_WeeklyWIP](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_WINVDETAIL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WINVDETAIL](
	[BILLNO] [char](8) NULL,
	[BILLTYPE] [char](4) NULL,
	[TRACKINGNO] [char](20) NULL,
	[IMEINO] [varchar](50) NULL,
	[CCODE] [char](10) NULL CONSTRAINT [DF_T_WINVDETAIL_CCODE1]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [varchar](30) NULL,
	[TYPE] [nchar](15) NULL,
	[RECEIVABLEAMTFC] [numeric](18, 2) NULL,
	[RECEIVABLEAMTBC] [numeric](18, 2) NULL,
	[RECEIVEDAMTFC] [numeric](18, 2) NULL,
	[RECEIVEDAMTBC] [numeric](18, 2) NULL,
	[GAINAMTFC] [numeric](18, 2) NULL,
	[GAINAMTBC] [numeric](18, 2) NULL,
	[SlNo] [numeric](5, 0) NULL,
	[CREDITNOTENO] [nchar](30) NULL,
	[STATUS] [nchar](10) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[RMANO] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WINVDETAILSWAP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WINVDETAILSWAP](
	[BILLNO] [char](8) NULL,
	[BILLTYPE] [char](4) NULL,
	[TRACKINGNO] [char](20) NULL,
	[RMANO] [varchar](50) NULL,
	[IMEINO] [varchar](50) NULL,
	[CCODE] [char](10) NULL CONSTRAINT [DF_T_WINVDETAILSWAP_CCODE1]  DEFAULT (''),
	[JOBNO] [numeric](8, 0) NULL,
	[PRODUCT] [char](30) NULL,
	[BRAND] [char](20) NULL,
	[MODEL] [char](30) NULL,
	[DEFLOCODE] [char](10) NULL,
	[DEFITEM] [char](25) NULL,
	[RECEIVABLEAMTFC] [numeric](18, 2) NULL,
	[RECEIVABLEAMTBC] [numeric](18, 2) NULL,
	[RECEIVEDAMTFC] [numeric](18, 2) NULL,
	[RECEIVEDAMTBC] [numeric](18, 2) NULL,
	[GAINAMTFC] [numeric](18, 2) NULL,
	[GAINAMTBC] [numeric](18, 2) NULL,
	[SlNo] [numeric](5, 0) NULL,
	[CREDITNOTENO] [nchar](30) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[DOA] [int] NULL,
	[recamtfc] [numeric](18, 2) NULL,
	[recamtbc] [numeric](18, 2) NULL,
	[vatfc] [numeric](18, 2) NULL,
	[vatbc] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WInvHeader]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WInvHeader](
	[billtype] [char](4) NULL CONSTRAINT [DF_T_WInvHeader_billtype]  DEFAULT (''),
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[RECEIVABLEAMTFC] [numeric](18, 3) NULL,
	[RECEIVABLEAMTBC] [numeric](18, 2) NULL,
	[RECEIVEDAMTFC] [numeric](18, 3) NULL,
	[RECEIVEDAMTBC] [numeric](18, 3) NULL,
	[GAINAMTFC] [numeric](18, 3) NULL,
	[GAINAMTBC] [numeric](18, 2) NULL,
	[REFNO] [nchar](15) NULL,
	[REMARKS] [varchar](250) NULL,
	[REFDT] [smalldatetime] NULL,
	[CUSTNAME] [char](50) NULL,
	[T] [timestamp] NULL,
	[Country] [char](10) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[CreditNoteDate] [datetime] NULL,
	[craccode] [varchar](8) NULL,
	[dbaccode] [varchar](8) NULL,
	[crsubac] [varchar](8) NULL,
 CONSTRAINT [PK_T_WInvHeader_1] PRIMARY KEY NONCLUSTERED 
(
	[billno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WInvHeaderSwap]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WInvHeaderSwap](
	[billtype] [char](4) NULL CONSTRAINT [DF_T_WInvHeaderSwap_billtype]  DEFAULT (''),
	[billno] [char](8) NOT NULL,
	[billdate] [smalldatetime] NULL,
	[ccode] [char](4) NULL,
	[locode] [char](10) NULL,
	[clsup] [char](7) NULL,
	[curcode] [char](4) NULL,
	[exrte] [decimal](10, 4) NULL,
	[RECEIVABLEAMTFC] [numeric](18, 3) NULL,
	[RECEIVABLEAMTBC] [numeric](18, 2) NULL,
	[RECEIVEDAMTFC] [numeric](18, 3) NULL,
	[RECEIVEDAMTBC] [numeric](18, 3) NULL,
	[GAINAMTFC] [numeric](18, 3) NULL,
	[GAINAMTBC] [numeric](18, 2) NULL,
	[REFNO] [nchar](15) NULL,
	[REMARKS] [varchar](250) NULL,
	[REFDT] [smalldatetime] NULL,
	[CUSTNAME] [char](50) NULL,
	[T] [timestamp] NULL,
	[Country] [char](10) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[EXPORTDATE] [datetime] NULL,
	[craccode] [varchar](8) NULL,
	[CreditNoteDate] [datetime] NULL,
	[dbaccode] [varchar](8) NULL,
	[crsubac] [varchar](8) NULL,
 CONSTRAINT [PK_T_WInvHeaderSwap] PRIMARY KEY NONCLUSTERED 
(
	[billno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_XMLVALIDATION]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_XMLVALIDATION](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[CUSTOMERNAME] [varchar](100) NULL,
	[MOBILE] [varchar](50) NULL,
	[MODEL] [char](20) NULL,
	[SNO] [varchar](18) NULL,
	[IMEINO] [varchar](15) NULL,
	[IRISCONDITION] [char](4) NULL,
	[IRISSYMPTOM] [char](4) NULL,
	[IRISDEFECT] [char](4) NULL,
	[IRISREPAIR] [char](4) NULL,
	[DEFECTDESCRIPTION] [varchar](250) NULL,
	[REPAIRDESCRIPTION] [varchar](500) NULL,
	[TRANSACTIONNO] [varchar](50) NULL,
	[ENGGCODE] [char](8) NULL,
	[DEALERNAME] [varchar](100) NULL,
	[PARTCODE1] [char](20) NULL,
	[PARTCODE2] [char](20) NULL,
	[PARTCODE3] [char](20) NULL,
	[PARTCODE4] [char](20) NULL,
	[PARTCODE5] [char](20) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[REPAIRRECEIVEDATE] [smalldatetime] NULL,
	[COMPLETIONDATE] [smalldatetime] NULL,
	[DELIVERYDATE] [smalldatetime] NULL,
	[XMLExport] [int] NULL,
	[BPNO] [varchar](50) NULL,
	[WRTYPE] [char](1) NULL,
	[PUTWBAIF_RESPONSE_JOBCOMMENTS] [varchar](250) NULL,
	[PUTWBAIF_RESPONSE_ERRORCODE] [varchar](50) NULL,
	[PUTWBAIF_RESPONSE_JOBFLAG] [char](1) NULL,
	[CONSEQUENCENO] [varchar](50) NULL,
	[CONVERSATIONID] [varchar](500) NULL,
	[ReValidated] [int] NULL,
	[ReExport] [int] NULL,
	[WTYSTATUS] [varchar](50) NULL,
	[WTYBILLNO] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[XMLValidatedDate] [smalldatetime] NULL,
	[ValidatedUser] [varchar](50) NULL,
 CONSTRAINT [PK_T_XMLVALIDATION] PRIMARY KEY CLUSTERED 
(
	[CCODE] ASC,
	[JOBNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_1210]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_1210](
	[remarks] [varchar](1000) NULL,
	[trntype] [char](4) NULL,
	[trno] [char](50) NULL,
	[d] [decimal](38, 2) NULL,
	[c] [decimal](38, 2) NULL,
	[dif] [decimal](38, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempExcel]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempExcel](
	[OrderNo] [char](10) NULL,
	[ItemCode] [char](30) NULL,
	[Qty] [numeric](9, 2) NULL,
	[Type] [char](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmp_opskupload1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_opskupload1](
	[itcode] [nvarchar](255) NULL,
	[Stkloc] [nvarchar](255) NULL,
	[AdjQty] [float] NULL,
	[AdjRate] [float] NULL,
	[AdjValue] [float] NULL,
	[opstk] [decimal](30, 2) NULL,
	[oprate] [numeric](30, 4) NULL,
	[opvalue] [numeric](30, 2) NULL,
	[clstk] [int] NOT NULL,
	[clrate] [int] NOT NULL,
	[clvalue] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_opstkupload]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_opstkupload](
	[ItCode] [nvarchar](255) NULL,
	[StkLoc] [nvarchar](255) NULL,
	[AdjQty] [float] NULL,
	[AdjRate] [float] NULL,
	[AdjValue] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_opstkuploadfinal]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_opstkuploadfinal](
	[itcode] [nvarchar](255) NULL,
	[stkloc] [nvarchar](255) NULL,
	[opstk] [decimal](38, 2) NULL,
	[adjqty] [float] NULL,
	[opval] [numeric](38, 2) NULL,
	[adjvaue] [float] NULL,
	[clstk] [float] NULL,
	[clrate] [int] NOT NULL,
	[clvalue] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_opstkuploadfinal1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_opstkuploadfinal1](
	[itcode] [nvarchar](255) NULL,
	[stkloc] [nvarchar](255) NULL,
	[opstk] [decimal](38, 2) NULL,
	[adjqty] [float] NULL,
	[opval] [numeric](38, 2) NULL,
	[adjvaue] [float] NULL,
	[clstk] [float] NULL,
	[clrate] [int] NOT NULL,
	[clvalue] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpbrand]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpbrand](
	[Brand_Code] [nvarchar](255) NULL,
	[Brand_Name] [nvarchar](255) NULL,
	[MAINACCODE] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TMPHAMIITEMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPHAMIITEMS](
	[ITCODE] [char](25) NOT NULL,
	[ITDESC] [char](250) NULL,
	[ITBRND] [char](20) NULL,
	[ITGRP] [char](15) NULL,
	[ITCATE] [char](8) NULL,
	[ITPRODCD] [char](15) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpHUAWEIITEMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpHUAWEIITEMS](
	[ITCODE] [nvarchar](255) NULL,
	[ITDESC] [nvarchar](255) NULL,
	[WEBPRICE] [float] NULL,
	[ITBRND] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmphuaweiitems1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmphuaweiitems1](
	[ITCODE] [nvarchar](255) NULL,
	[ITDESC] [nvarchar](255) NULL,
	[ITBRND] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL,
	[WEBPRICE] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpItems]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpItems](
	[ITCODE] [nvarchar](255) NULL,
	[ITDESC] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[BRAND] [nvarchar](255) NULL,
	[BRAND_NEW] [nvarchar](255) NULL,
	[ITGRP_NEW] [nvarchar](255) NULL,
	[ITCATE_NEW] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpitems_new]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpitems_new](
	[ITCODE] [nvarchar](255) NULL,
	[IDESC] [nvarchar](255) NULL,
	[BRAND] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL,
	[BRAND_NEW] [nvarchar](255) NULL,
	[ITGRP_NEW] [nvarchar](255) NULL,
	[ITCATE_NEW] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpitems1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpitems1](
	[ITCODE] [nvarchar](255) NULL,
	[ITDESC] [nvarchar](255) NULL,
	[ITBRND] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TMPITMAST]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPITMAST](
	[ITCODE] [char](25) NOT NULL,
	[ITDESC] [char](250) NULL,
	[ITCATE] [char](8) NULL,
	[ITGRP] [char](15) NULL,
	[ITBRND] [char](20) NULL,
	[ITPRODCD] [char](15) NULL,
	[BINCODE] [char](8) NULL,
	[SPPER] [numeric](12, 2) NULL,
	[WEBPRICE] [numeric](14, 4) NULL,
	[NWPRICE] [numeric](12, 2) NULL,
	[NWCURCODE] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tMPLEDGERDELETE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMPLEDGERDELETE](
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[SEQUENCENO] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tMPLEDGERDELETED]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMPLEDGERDELETED](
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[SEQUENCENO] [nchar](10) NULL,
	[TRACKINGNO] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tMPLEDGERTODELETE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMPLEDGERTODELETE](
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](50) NULL,
	[SEQUENCENO] [nchar](10) NULL,
	[TRACKINGNO] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmplenovo]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmplenovo](
	[TRACKINGNO] [char](20) NULL,
	[LCHARGE] [numeric](18, 2) NULL,
	[LCHARGETYPE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPMODEL]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPMODEL](
	[ITCODE] [char](30) NULL,
	[ITDESC] [varchar](250) NULL,
	[PRODUCTTYPE] [varchar](30) NULL,
	[ITBRAND] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpnewitems]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpnewitems](
	[ITCODE] [nvarchar](255) NULL,
	[ITDESC] [nvarchar](255) NULL,
	[ITBRND] [nvarchar](255) NULL,
	[ITGRP] [nvarchar](255) NULL,
	[ITCATE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpopstk]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpopstk](
	[LOCODE] [nvarchar](255) NULL,
	[ITCODE] [nvarchar](255) NULL,
	[ITQTY] [float] NULL,
	[ITRTE] [float] NULL,
	[ITRTE1] [float] NULL,
	[STKVAL] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpopstkfinal]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpopstkfinal](
	[ITCODE] [nvarchar](255) NULL,
	[ITQTY] [float] NULL,
	[ITRTE] [float] NULL,
	[STKVAL] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpopstkfinal1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpopstkfinal1](
	[locode] [nvarchar](255) NULL,
	[ITCODE] [nvarchar](255) NULL,
	[ITQTY] [float] NULL,
	[ITRTE] [float] NULL,
	[STKVAL] [float] NULL,
	[SLNO] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TMPOPSTKFINAL2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMPOPSTKFINAL2](
	[LOCODE] [nvarchar](255) NULL,
	[ITCODE] [nvarchar](255) NULL,
	[ITQTY] [float] NULL,
	[ITRTE] [float] NULL,
	[ITRTE1] [float] NULL,
	[STKVAL] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TMPOPSTOCK_ITEMS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMPOPSTOCK_ITEMS](
	[ITCODE] [nvarchar](255) NULL,
	[ITQTY] [float] NULL,
	[ITRTE] [float] NULL,
	[STKVAL] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmppc]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmppc](
	[PC] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmppg]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmppg](
	[PG] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmppohuawei]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmppohuawei](
	[itcode] [nvarchar](255) NULL,
	[qty] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpproduct]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpproduct](
	[CODE] [nvarchar](255) NULL,
	[DESC] [nvarchar](255) NULL,
	[MAINACCODE] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmprma]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmprma](
	[RMA#] [nvarchar](255) NULL,
	[imeino] [nvarchar](255) NULL,
	[trackingno] [char](20) NULL,
	[itcode] [nvarchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpseqno]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmpseqno](
	[REMARKS] [nvarchar](255) NULL,
	[TRACKINGNO] [char](20) NULL,
	[Labor Price "USD"] [money] NULL,
	[Labourcharges Code] [nvarchar](255) NULL,
	[SEQUENCENO] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpseqnodelete]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpseqnodelete](
	[SEQUENCENO] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpswaptrackingno]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmpswaptrackingno](
	[TrackingNo] [char](20) NULL,
	[Vendor RMA No] [nvarchar](255) NULL,
	[Serial No] [nvarchar](255) NULL,
	[Credit Note No] [float] NULL,
	[Credit Note Amount Swap / CB] [float] NULL,
	[Brand] [nvarchar](255) NULL,
	[remarks] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPTEMP]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPTEMP](
	[ITCODE] [char](25) NOT NULL,
	[LOCODE] [char](15) NULL,
	[STOCK] [decimal](38, 3) NULL,
	[STKVAL] [numeric](38, 2) NULL,
	[RESVSTK] [int] NOT NULL,
	[PENORDER] [int] NOT NULL,
	[BINLOC] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPTEMP1]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPTEMP1](
	[ITCODE] [char](25) NOT NULL,
	[LOCODE] [char](15) NULL,
	[STOCK] [decimal](38, 3) NULL,
	[STKVAL] [numeric](38, 2) NULL,
	[RESVSTK] [int] NOT NULL,
	[PENORDER] [int] NOT NULL,
	[BINLOC] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPTEMP2]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPTEMP2](
	[ITCODE] [char](25) NOT NULL,
	[LOCODE] [char](15) NULL,
	[STOCK] [decimal](38, 3) NULL,
	[STKVAL] [numeric](38, 2) NULL,
	[RESVSTK] [int] NOT NULL,
	[PENORDER] [int] NOT NULL,
	[BINLOC] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmptrackingno]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmptrackingno](
	[TrackingNo] [char](20) NULL,
	[Vendor RMA No] [nvarchar](255) NULL,
	[Serial No] [nvarchar](255) NULL,
	[Credit Note No] [float] NULL,
	[Credit Note Amount Swap / CB] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPTRACKINGNOTOUPDATE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPTRACKINGNOTOUPDATE](
	[TRACKINGNO] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TORFOOT]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TORFOOT](
	[ORTYP] [char](1) NULL,
	[ORDNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[ITUNIT] [char](5) NULL,
	[PACK1] [char](15) NULL,
	[FACTOR] [numeric](10, 4) NULL,
	[ITQTY] [numeric](10, 3) NULL,
	[ITRTE] [numeric](12, 4) NULL,
	[ITAMNT] [numeric](12, 3) NULL,
	[BCAMNT] [numeric](12, 2) NULL,
	[OPQTY] [numeric](10, 3) NULL,
	[RCQTY] [numeric](10, 3) NULL,
	[CNQTY] [numeric](10, 3) NULL,
	[Slno] [int] NOT NULL,
	[ITEMDESC] [varchar](100) NOT NULL,
	[GITQTY] [numeric](10, 3) NOT NULL,
	[BOOKING] [bit] NOT NULL,
	[BOOKQTY] [numeric](10, 3) NULL,
	[BOOKRCQTY] [numeric](18, 0) NULL,
	[TRCQTY] [numeric](10, 3) NULL,
	[SIZEPRINT] [char](1) NOT NULL,
	[tmpqty] [numeric](10, 3) NOT NULL,
	[t] [char](1) NULL,
	[PQTY] [numeric](13, 2) NULL,
	[PAMT] [numeric](13, 2) NULL,
	[Remarks] [varchar](100) NULL,
	[DetDesc] [varchar](250) NULL,
	[DISCPER] [numeric](12, 2) NULL,
	[refno] [char](15) NULL,
	[DISCAMT] [numeric](12, 2) NULL,
	[CONSDQTY] [numeric](14, 2) NULL,
	[MINQTY] [numeric](14, 2) NULL,
	[ACTREQQTY] [numeric](14, 2) NULL,
	[CONS1] [numeric](12, 0) NULL,
	[CONS2] [numeric](12, 0) NULL,
	[CONS3] [numeric](12, 0) NULL,
	[SOQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TORFOOT_SOQTY]  DEFAULT (0),
	[ADDLQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TORFOOT_ADDLQTY]  DEFAULT (0),
	[MINORDQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TORFOOT_MINORDQTY]  DEFAULT (0),
	[STKQTY] [numeric](18, 0) NOT NULL CONSTRAINT [DF_TORFOOT_STKQTY]  DEFAULT (0),
	[LESSQTY] [numeric](18, 0) NULL,
	[STOCKQTY] [numeric](18, 0) NULL,
	[POADDLQTY] [numeric](18, 0) NULL,
	[RSTOCK] [numeric](18, 0) NULL,
	[LOCSTK] [numeric](18, 0) NULL,
	[LOCCONS] [numeric](18, 0) NULL,
	[CSCONS] [numeric](18, 0) NULL,
	[ACTORDQTY] [numeric](18, 0) NULL,
	[OBSLOC] [numeric](18, 0) NULL,
	[PENDPOQTY] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TORHEAD]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TORHEAD](
	[ORTYP] [char](1) NOT NULL,
	[ORDNO] [char](8) NOT NULL,
	[ORDTE] [smalldatetime] NULL,
	[CCODE] [char](3) NULL,
	[REFNO] [char](20) NULL,
	[REFDT] [smalldatetime] NULL,
	[FORWARDER] [char](8) NULL,
	[PORT] [char](10) NULL,
	[DUEDATE] [smalldatetime] NULL,
	[PRICING] [char](8) NULL,
	[TRANSPORT] [varchar](50) NULL,
	[PMT_TERMS] [varchar](50) NULL,
	[CLSUP] [char](7) NULL,
	[CURCODE] [char](4) NULL,
	[EXRTE] [decimal](10, 4) NULL,
	[TRAMNT] [numeric](14, 3) NULL,
	[BCAMNT] [numeric](13, 2) NULL,
	[ATTN] [varchar](40) NULL,
	[CC] [varchar](40) NULL,
	[FAX] [char](15) NULL,
	[SLMAN] [char](8) NULL,
	[REMARKS] [varchar](100) NULL,
	[TRNTAG] [char](1) NULL,
	[REQDTAG] [bit] NOT NULL,
	[ETD] [smalldatetime] NULL,
	[ETA] [smalldatetime] NULL,
	[LCNO] [char](20) NULL,
	[LCDT] [smalldatetime] NULL,
	[LCREF] [char](20) NULL,
	[LCREFDT] [smalldatetime] NULL,
	[LCTYP] [char](5) NULL,
	[LPONO] [char](30) NULL,
	[LPODT] [smalldatetime] NULL,
	[REF1] [char](8) NULL,
	[REF2] [char](8) NULL,
	[REF3] [char](8) NULL,
	[REF4] [char](8) NULL,
	[REF5] [char](8) NULL,
	[REF6] [char](8) NULL,
	[REF7] [char](8) NULL,
	[REF8] [char](8) NULL,
	[REF9] [char](8) NULL,
	[REF10] [char](8) NULL,
	[REF11] [char](8) NULL,
	[REF12] [char](8) NULL,
	[REF13] [char](8) NULL,
	[REF14] [char](8) NULL,
	[REF15] [char](8) NULL,
	[REF16] [char](8) NULL,
	[REF17] [char](8) NULL,
	[REF18] [char](8) NULL,
	[REF19] [char](8) NULL,
	[REF20] [char](8) NULL,
	[REF21] [char](8) NULL,
	[REF22] [char](8) NULL,
	[REF23] [char](8) NULL,
	[REF24] [char](8) NULL,
	[REF25] [char](8) NULL,
	[REF26] [char](8) NULL,
	[REF27] [char](8) NULL,
	[REF28] [char](8) NULL,
	[PJM1] [char](15) NULL,
	[PJM2] [char](15) NULL,
	[PJM3] [char](15) NULL,
	[PJM4] [char](15) NULL,
	[PJM5] [char](15) NULL,
	[DISCPER] [numeric](12, 2) NULL,
	[DISCAMT] [numeric](12, 2) NULL,
	[ORDTAG] [char](1) NULL,
	[PREBY] [char](50) NULL,
	[APPBY] [char](50) NULL,
	[T] [timestamp] NULL,
	[LOCODE] [char](10) NULL,
	[USERNAME] [char](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRADEJOB]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRADEJOB](
	[YRCD] [char](1) NULL,
	[JOBNO] [numeric](5, 0) NULL,
	[JOBDATE] [smalldatetime] NULL,
	[MODEL] [char](15) NULL,
	[IMEINO] [char](20) NULL,
	[OBSERV] [varchar](250) NULL,
	[TECHID] [char](4) NULL,
	[TECHASS] [varchar](250) NULL,
	[ASSVALUE] [numeric](14, 2) NULL,
	[STATUS] [char](1) NULL,
	[PURCTYPE] [char](1) NULL,
	[PURCREM] [varchar](250) NULL,
	[PURCREF] [char](8) NULL,
	[NAME] [char](35) NULL,
	[ADDRESS] [varchar](250) NULL,
	[PHONE] [char](25) NULL,
	[PURCVAL] [numeric](12, 2) NULL,
	[ADDITION] [numeric](12, 2) NULL,
	[LESS] [numeric](12, 2) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[BRAND] [char](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRADEJOBDET]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRADEJOBDET](
	[YRCD] [char](1) NULL,
	[TRCD] [char](4) NULL,
	[JOBNO] [numeric](5, 0) NULL,
	[TYPE] [char](4) NULL,
	[REMARKS] [varchar](250) NULL,
	[SLNO] [numeric](10, 0) NULL,
	[STATUS] [char](1) NULL,
	[TOTAL] [numeric](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRANLOG_JBR]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRANLOG_JBR](
	[TRNID] [int] IDENTITY(1,1) NOT NULL,
	[TRNDATE] [datetime] NULL,
	[DEALERREF] [char](20) NULL,
	[CCODE] [char](10) NOT NULL,
	[JOBNO] [numeric](8, 0) NOT NULL,
	[UnitRequest] [int] NULL,
	[UnitIssue] [int] NULL,
	[UnitReceive] [int] NULL,
	[UnitReceiveDate] [smalldatetime] NULL,
	[JobAll_EnggCode] [char](30) NULL,
	[ESTIMATE] [char](1) NULL,
	[ESTDATE] [smalldatetime] NULL,
	[CPAPPR] [numeric](18, 0) NULL,
	[JBSDT] [datetime] NULL,
	[JBCOMPLETE] [bit] NOT NULL CONSTRAINT [DF__TRANLOG_J__JBCOM__78372EE2]  DEFAULT ((0)),
	[REPAIR_STATUS] [int] NULL CONSTRAINT [DF__TRANLOG_J__REPAI__792B531B]  DEFAULT ((0)),
	[JBDT] [datetime] NULL,
	[SWAPReq] [tinyint] NULL,
	[SWAPReqApp] [tinyint] NULL,
	[SWAP] [int] NULL,
	[QC_STATUS] [smallint] NOT NULL,
	[QDATE] [smalldatetime] NULL,
	[PInvFlag] [smallint] NULL,
	[PInvDate] [smalldatetime] NULL,
	[PInvNo] [char](8) NULL,
	[INVREF] [char](20) NULL,
	[INVOICED] [smallint] NULL,
	[QRS] [int] NULL,
	[DOA] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trlog]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trlog](
	[trid] [int] IDENTITY(1,1) NOT NULL,
	[locode] [varchar](50) NULL,
	[itcode] [varchar](50) NULL,
	[itqty] [float] NULL,
	[addsign] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrnDet]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnDet](
	[Billno] [char](8) NOT NULL,
	[BillType] [char](4) NOT NULL,
	[Descr] [varchar](100) NULL,
	[ACCODE] [char](8) NOT NULL,
	[CurCode] [char](4) NULL,
	[PERC] [numeric](6, 2) NULL,
	[Exrte] [decimal](10, 4) NULL,
	[Supplier] [char](1) NULL CONSTRAINT [DF_TrnDet_Supplier]  DEFAULT ('Y'),
	[Fcamnt] [numeric](12, 3) NULL CONSTRAINT [DF_TrnDet_Fcamnt]  DEFAULT (0),
	[Bcamnt] [numeric](12, 2) NULL CONSTRAINT [DF_TrnDet_Bcamnt]  DEFAULT (0),
	[slno] [decimal](4, 0) NULL,
	[yrcd1] [char](1) NULL,
	[CANCELLED] [char](1) NULL,
	[ccode] [char](4) NULL,
	[CUSTCODE] [char](8) NULL,
	[STHID] [int] NOT NULL DEFAULT ((0)),
	[TRDID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrnDetpending]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrnDetpending](
	[Billno] [char](8) NOT NULL,
	[BillType] [char](4) NOT NULL,
	[Descr] [varchar](100) NULL,
	[ACCODE] [char](8) NOT NULL,
	[CurCode] [char](4) NULL,
	[PERC] [numeric](6, 2) NULL,
	[Exrte] [decimal](10, 4) NULL,
	[Supplier] [char](1) NULL,
	[Fcamnt] [numeric](12, 3) NULL,
	[Bcamnt] [numeric](12, 2) NULL,
	[slno] [decimal](4, 0) NULL,
	[yrcd1] [char](1) NULL,
	[CANCELLED] [char](1) NULL,
	[ccode] [char](4) NULL,
	[CUSTCODE] [char](8) NULL,
	[STHID] [int] NOT NULL,
	[TRDID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trnlog]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trnlog](
	[date] [datetime] NULL,
	[userid] [char](10) NULL,
	[moduleid] [char](3) NULL,
	[trcd] [char](4) NULL,
	[trno] [char](8) NULL,
	[trntag] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHOUSE]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHOUSE](
	[LOCODE] [char](3) NOT NULL,
	[WHOUSE] [char](3) NOT NULL,
	[LONAME] [varchar](50) NULL,
	[NOTES] [varchar](50) NULL,
	[CCODE] [char](6) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHSTK]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHSTK](
	[YRCD] [char](1) NULL,
	[TRNTYPE] [char](4) NULL,
	[TRNO] [char](8) NULL,
	[ITCODE] [char](20) NULL,
	[WHOUSE] [char](3) NULL,
	[LOCODE] [char](3) NULL,
	[CONT1] [numeric](13, 2) NULL,
	[CONT2] [numeric](13, 2) NULL,
	[CONT3] [numeric](13, 2) NULL,
	[MSLNO] [int] NULL,
	[SLNO] [int] NULL,
	[REFNO] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WPPARTS]    Script Date: 12/01/2019 06:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WPPARTS](
	[JOBNO] [numeric](8, 0) NOT NULL,
	[ITCODE] [char](25) NULL,
	[QTY] [numeric](5, 2) NULL,
	[SLNO] [int] NOT NULL,
	[DOI] [smalldatetime] NULL CONSTRAINT [DF_WPPARTS_DOI]  DEFAULT (getdate()),
	[CCODE] [char](10) NULL,
	[POREF] [numeric](10, 0) NULL,
	[PODATE] [smalldatetime] NULL,
	[SAMSUNGPOREF] [varchar](20) NULL,
	[COSMOSREF] [varchar](50) NULL,
	[REQREF] [varchar](50) NULL,
	[PartsReceived] [int] NULL,
	[STKLOC] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_LOCODE]  DEFAULT ('') FOR [LOCODE]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_ITCODE]  DEFAULT ('') FOR [ITCODE]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_OPBAL]  DEFAULT (0) FOR [OPBAL]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_OPRATE]  DEFAULT (0) FOR [OPRATE]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_OPVAL]  DEFAULT (0) FOR [OPVAL]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_PVALUE]  DEFAULT (0) FOR [PVALUE]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_PURC]  DEFAULT (0) FOR [PURC]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_STKBAL]  DEFAULT (0) FOR [STKBAL]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_AVGRATE]  DEFAULT (0) FOR [AVGRATE]
GO
ALTER TABLE [dbo].[AVGFILE] ADD  CONSTRAINT [DF_AVGFILE_STKVAL]  DEFAULT (0) FOR [STKVAL]
GO
ALTER TABLE [dbo].[BUDGET] ADD  CONSTRAINT [DF_BUDGET_APORTION]  DEFAULT (0) FOR [APORTION]
GO
ALTER TABLE [dbo].[CLIENT] ADD  CONSTRAINT [DF_CLIENT_TYPE]  DEFAULT ('C') FOR [TYPE]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_DateCreated]  DEFAULT (dateadd(minute,(90),getdate())) FOR [DateCreated]
GO
ALTER TABLE [dbo].[M_RepairLevel] ADD  CONSTRAINT [DF_M_RepairLevel_CostPerRepair]  DEFAULT ((0)) FOR [CostPerRepair]
GO
ALTER TABLE [dbo].[M_RepairLevel] ADD  CONSTRAINT [DF_M_RepairLevel_Freight]  DEFAULT ((0)) FOR [Freight]
GO
ALTER TABLE [dbo].[M_ServiceMast] ADD  CONSTRAINT [DF_M_ServiceMast_curcode]  DEFAULT (' ') FOR [curcode]
GO
ALTER TABLE [dbo].[M_ServiceMast] ADD  CONSTRAINT [DF_M_ServiceMast_WI]  DEFAULT ((0)) FOR [WI]
GO
ALTER TABLE [dbo].[PRICEMST] ADD  CONSTRAINT [DF_PRICEMST_PRICE]  DEFAULT (0) FOR [PRICE]
GO
ALTER TABLE [dbo].[ShipSub] ADD  CONSTRAINT [DF_ShipSub_Trn1Qty]  DEFAULT (0) FOR [Trn1Qty]
GO
ALTER TABLE [dbo].[ShipSub] ADD  CONSTRAINT [DF_ShipSub_Trn2Qty]  DEFAULT (0) FOR [Trn2Qty]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnDetail] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnDetail_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnDetail] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnDetail_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnDetail] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnDetail_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnDetail] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnDetail_itcode]  DEFAULT ('') FOR [itcode]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnHeader] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnHeader_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnHeader] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnHeader_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnHeader] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnHeader_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_Acc_InvoiceReturnHeader] ADD  CONSTRAINT [DF_T_Acc_InvoiceReturnHeader_TRORDER]  DEFAULT (getdate()) FOR [TRORDER]
GO
ALTER TABLE [dbo].[T_CBCN_DETAIL] ADD  CONSTRAINT [DF_T_CBCN_DETAIL_CCODE]  DEFAULT ('') FOR [CCODE]
GO
ALTER TABLE [dbo].[T_CBCN_HEADER] ADD  CONSTRAINT [DF_T_CBCN_HEADER_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_CBCN_HEADER] ADD  CONSTRAINT [DF_T_CBCN_HEADER_LPONO]  DEFAULT ('') FOR [LPONO]
GO
ALTER TABLE [dbo].[T_CLAIMDATA] ADD  CONSTRAINT [DF_T_CLAIMDATA_CCODE]  DEFAULT ('') FOR [CCODE]
GO
ALTER TABLE [dbo].[T_CLAIMDATA_HEADER] ADD  CONSTRAINT [DF_Table_1_trno]  DEFAULT ('') FOR [DOCNO]
GO
ALTER TABLE [dbo].[T_EnggRemarks] ADD  CONSTRAINT [DF_T_EnggRemarks_DATE]  DEFAULT (getdate()) FOR [DATE]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_DOCDATE]  DEFAULT (getdate()) FOR [DOCDATE]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_FM_Approved]  DEFAULT ((0)) FOR [FM_Approved]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_CM_Approved]  DEFAULT ((0)) FOR [CM_Approved]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToLM_forApp]  DEFAULT ((0)) FOR [emailToLM_forApp]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToFM_forApp]  DEFAULT ((0)) FOR [emailToFM_forApp]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToCM_forApp]  DEFAULT ((0)) FOR [emailToCM_forApp]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToLM_forOrder]  DEFAULT ((0)) FOR [emailToLM_forOrder]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_CM_Approved1]  DEFAULT ((0)) FOR [GM_Approved]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToLM_forApp1]  DEFAULT ((0)) FOR [emailToGM_forApp]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_IC_Approved]  DEFAULT ((0)) FOR [IC_Approved]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_emailToIC_forApp]  DEFAULT ((0)) FOR [emailToIC_forApp]
GO
ALTER TABLE [dbo].[T_FORECAST] ADD  CONSTRAINT [DF_T_FORECAST_LM_Approved]  DEFAULT ((0)) FOR [LM_Approved]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAIL_StockQty]  DEFAULT ((0)) FOR [StockQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAIL_ConsQty]  DEFAULT ((0)) FOR [ConsAvgQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons1Qty]  DEFAULT ((0)) FOR [Cons1Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons2Qty]  DEFAULT ((0)) FOR [Cons2Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons3Qty]  DEFAULT ((0)) FOR [Cons3Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons4Qty]  DEFAULT ((0)) FOR [Cons4Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons5Qty]  DEFAULT ((0)) FOR [Cons5Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cons6Qty]  DEFAULT ((0)) FOR [Cons6Qty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_RegValue]  DEFAULT ((0)) FOR [RegValue]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_FinalRegValue]  DEFAULT ((0)) FOR [FinalRegValue]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAIL_PendingUnits]  DEFAULT ((0)) FOR [PendingUnits]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAIL_LocStk]  DEFAULT ((0)) FOR [LocStk]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_CSLocStk]  DEFAULT ((0)) FOR [CSLocStk]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAILT_GIT]  DEFAULT ((0)) FOR [GIT]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAIL_ActReqQty]  DEFAULT ((0)) FOR [ActReqQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_FORECASTDETAILT_ReqQty]  DEFAULT ((0)) FOR [ReqQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_AppQty]  DEFAULT ((0)) FOR [AppQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_CostModifier]  DEFAULT ((0)) FOR [CostModifier]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_CostAdjOrder]  DEFAULT ((0)) FOR [CostAdjOrder]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_UnitRate]  DEFAULT ((0)) FOR [UnitRate]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_Cate]  DEFAULT ('') FOR [Cate]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_LocStkKSA]  DEFAULT ((0)) FOR [LocStkKSA]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_LocStkKWT]  DEFAULT ((0)) FOR [LocStkKWT]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_LocStkKSA1]  DEFAULT ((0)) FOR [LocStkUAE]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_CMAppQty]  DEFAULT ((0)) FOR [CMAppQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_ICAppQty]  DEFAULT ((0)) FOR [ICAppQty]
GO
ALTER TABLE [dbo].[T_FORECASTDETAIL] ADD  CONSTRAINT [DF_T_FORECASTDETAIL_LMAppQty]  DEFAULT ((0)) FOR [LMAppQty]
GO
ALTER TABLE [dbo].[T_JobReturnDetail] ADD  CONSTRAINT [DF_T_JobReturnDetail_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_JobReturnDetail] ADD  CONSTRAINT [DF_T_JobReturnDetail_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_JobReturnDetail] ADD  CONSTRAINT [DF_T_JobReturnDetail_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_JobReturnDetail] ADD  CONSTRAINT [DF_T_JobReturnDetail_itcode]  DEFAULT ('') FOR [itcode]
GO
ALTER TABLE [dbo].[T_JobReturnHeader] ADD  CONSTRAINT [DF_T_JobReturnHeader_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_JobReturnHeader] ADD  CONSTRAINT [DF_T_JobReturnHeader_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_JobReturnHeader] ADD  CONSTRAINT [DF_T_JobReturnHeader_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_JobReturnHeader] ADD  CONSTRAINT [DF_T_JobReturnHeader_TRORDER]  DEFAULT (getdate()) FOR [TRORDER]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_yrcd]  DEFAULT ('') FOR [yrcd]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_trntype]  DEFAULT ('') FOR [trntype]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_trno]  DEFAULT ('') FOR [trno]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_itcode]  DEFAULT ('') FOR [itcode]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_ITEMDESC]  DEFAULT ('') FOR [ITEMDESC]
GO
ALTER TABLE [dbo].[T_LInvDetail] ADD  CONSTRAINT [DF_T_LInvDetail_SIZEPRINT]  DEFAULT ('N') FOR [SIZEPRINT]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_yrcd]  DEFAULT ('') FOR [yrcd]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_trntype]  DEFAULT ('') FOR [trntype]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_trno]  DEFAULT ('') FOR [trno]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_yrcd1]  DEFAULT ('') FOR [yrcd1]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_LInvHeader] ADD  CONSTRAINT [DF_T_LInvHeader_LPONO]  DEFAULT ('') FOR [LPONO]
GO
ALTER TABLE [dbo].[T_OpeningPayables] ADD  CONSTRAINT [DF_T_OpeningPaybale_billno]  DEFAULT ('') FOR [billno]
GO
ALTER TABLE [dbo].[T_OpeningPayables] ADD  CONSTRAINT [DF_T_OpeningPaybale_billtype]  DEFAULT ('') FOR [billtype]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_StockQty]  DEFAULT ((0)) FOR [StockQty]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_ReqQty]  DEFAULT ((0)) FOR [ReqQty]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_AppQty]  DEFAULT ((0)) FOR [AppQty]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_UnitRate]  DEFAULT ((0)) FOR [UnitRate]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_CMAppQty]  DEFAULT ((0)) FOR [CMAppQty]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_ICAppQty]  DEFAULT ((0)) FOR [ICAppQty]
GO
ALTER TABLE [dbo].[T_PendingSODETAIL] ADD  CONSTRAINT [DF_T_PendingSODetail_LMAppQty]  DEFAULT ((0)) FOR [LMAppQty]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_DOCDATE]  DEFAULT (getdate()) FOR [DOCDATE]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_FM_Approved]  DEFAULT ((0)) FOR [FM_Approved]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_CM_Approved]  DEFAULT ((0)) FOR [CM_Approved]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToLM_forApp]  DEFAULT ((0)) FOR [emailToLM_forApp]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToFM_forApp]  DEFAULT ((0)) FOR [emailToFM_forApp]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToCM_forApp]  DEFAULT ((0)) FOR [emailToCM_forApp]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToLM_forOrder]  DEFAULT ((0)) FOR [emailToLM_forOrder]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_CM_Approved1]  DEFAULT ((0)) FOR [GM_Approved]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToLM_forApp1]  DEFAULT ((0)) FOR [emailToGM_forApp]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_IC_Approved]  DEFAULT ((0)) FOR [IC_Approved]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_emailToIC_forApp]  DEFAULT ((0)) FOR [emailToIC_forApp]
GO
ALTER TABLE [dbo].[T_PendingSORequest] ADD  CONSTRAINT [DF_T_PendingSORequest_LM_Approved]  DEFAULT ((0)) FOR [LM_Approved]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_DOCDATE]  DEFAULT (getdate()) FOR [DOCDATE]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_FM_Approved]  DEFAULT ((0)) FOR [FM_Approved]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_CM_Approved]  DEFAULT ((0)) FOR [CM_Approved]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToLM_forApp]  DEFAULT ((0)) FOR [emailToLM_forApp]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToFM_forApp]  DEFAULT ((0)) FOR [emailToFM_forApp]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToCM_forApp]  DEFAULT ((0)) FOR [emailToCM_forApp]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToLM_forOrder]  DEFAULT ((0)) FOR [emailToLM_forOrder]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_CM_Approved1]  DEFAULT ((0)) FOR [GM_Approved]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToLM_forApp1]  DEFAULT ((0)) FOR [emailToGM_forApp]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_IC_Approved]  DEFAULT ((0)) FOR [IC_Approved]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_emailToIC_forApp]  DEFAULT ((0)) FOR [emailToIC_forApp]
GO
ALTER TABLE [dbo].[T_PORequest] ADD  CONSTRAINT [DF_T_POREQUEST_LM_Approved]  DEFAULT ((0)) FOR [LM_Approved]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_StockQty]  DEFAULT ((0)) FOR [StockQty]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_ReqQty]  DEFAULT ((0)) FOR [ReqQty]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_AppQty]  DEFAULT ((0)) FOR [AppQty]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_UnitRate]  DEFAULT ((0)) FOR [UnitRate]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_CMAppQty]  DEFAULT ((0)) FOR [CMAppQty]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_ICAppQty]  DEFAULT ((0)) FOR [ICAppQty]
GO
ALTER TABLE [dbo].[T_POREQUESTDETAIL] ADD  CONSTRAINT [DF_T_POREQUESTDETAIL_LMAppQty]  DEFAULT ((0)) FOR [LMAppQty]
GO
ALTER TABLE [dbo].[T_ShipmentDetails_NW] ADD  CONSTRAINT [DF_T_ShipmentDetails_NW_WarrantyType]  DEFAULT ((0)) FOR [WarrantyType]
GO
ALTER TABLE [dbo].[T_ShipmentMaster_NW] ADD  CONSTRAINT [DF_T_ShipmentMaster_NW_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_STKADJVAL_DETAIL] ADD  CONSTRAINT [DF_T_STKADJVAL_DETAIL_yrcd]  DEFAULT ('') FOR [yrcd]
GO
ALTER TABLE [dbo].[T_STKADJVAL_DETAIL] ADD  CONSTRAINT [DF_T_STKADJVAL_DETAIL_trntype]  DEFAULT ('') FOR [trntype]
GO
ALTER TABLE [dbo].[T_STKADJVAL_DETAIL] ADD  CONSTRAINT [DF_T_STKADJVAL_DETAIL_trno]  DEFAULT ('') FOR [trno]
GO
ALTER TABLE [dbo].[T_STKADJVAL_DETAIL] ADD  CONSTRAINT [DF_T_STKADJVAL_DETAIL_itcode]  DEFAULT ('') FOR [itcode]
GO
ALTER TABLE [dbo].[T_STKADJVAL_HEADER] ADD  CONSTRAINT [DF_T_STKADJVAL_HEADER_yrcd]  DEFAULT ('') FOR [yrcd]
GO
ALTER TABLE [dbo].[T_STKADJVAL_HEADER] ADD  CONSTRAINT [DF_T_STKADJVAL_HEADER_trntype]  DEFAULT ('') FOR [trntype]
GO
ALTER TABLE [dbo].[T_STKADJVAL_HEADER] ADD  CONSTRAINT [DF_T_STKADJVAL_HEADER_trno]  DEFAULT ('') FOR [trno]
GO
ALTER TABLE [dbo].[T_STKADJVAL_HEADER] ADD  CONSTRAINT [DF_T_STKADJVAL_HEADER_trorder]  DEFAULT (getdate()) FOR [trorder]
GO
ALTER TABLE [dbo].[T_XMLVALIDATION] ADD  CONSTRAINT [DF_T_XMLVALIDATION_XMLValidatedDate]  DEFAULT (getdate()) FOR [XMLValidatedDate]
GO
ALTER TABLE [dbo].[TRADEJOB] ADD  CONSTRAINT [DF_TRADEJOB_STATUS]  DEFAULT (0) FOR [STATUS]
GO
ALTER TABLE [dbo].[TRADEJOB] ADD  CONSTRAINT [DF_TRADEJOB_PURCTYPE]  DEFAULT (0) FOR [PURCTYPE]
GO
ALTER TABLE [dbo].[TRADEJOB] ADD  CONSTRAINT [DF_TRADEJOB_PURCVAL]  DEFAULT (0) FOR [PURCVAL]
GO
ALTER TABLE [dbo].[TRADEJOB] ADD  CONSTRAINT [DF_TRADEJOB_ADDITIONS]  DEFAULT (0) FOR [ADDITION]
GO
ALTER TABLE [dbo].[TRADEJOB] ADD  CONSTRAINT [DF_TRADEJOB_LESS]  DEFAULT (0) FOR [LESS]
GO
ALTER TABLE [dbo].[TrnDetpending] ADD  CONSTRAINT [DF_TrnDet_Supplierp]  DEFAULT ('Y') FOR [Supplier]
GO
ALTER TABLE [dbo].[TrnDetpending] ADD  CONSTRAINT [DF_TrnDet_Fcamntp]  DEFAULT ((0)) FOR [Fcamnt]
GO
ALTER TABLE [dbo].[TrnDetpending] ADD  CONSTRAINT [DF_TrnDet_Bcamntp]  DEFAULT ((0)) FOR [Bcamnt]
GO
ALTER TABLE [dbo].[TrnDetpending] ADD  DEFAULT ((0)) FOR [STHID]
GO
ALTER TABLE [dbo].[WHOUSE] ADD  CONSTRAINT [DF_WHOUSE_LONAME]  DEFAULT ('') FOR [LONAME]
GO
ALTER TABLE [dbo].[WHOUSE] ADD  CONSTRAINT [DF_WHOUSE_NOTES]  DEFAULT ('') FOR [NOTES]
GO
ALTER TABLE [dbo].[WHSTK] ADD  CONSTRAINT [DF__WHSTK__CONT1__513AFB4D]  DEFAULT (0) FOR [CONT1]
GO
ALTER TABLE [dbo].[WHSTK] ADD  CONSTRAINT [DF__WHSTK__CONT2__522F1F86]  DEFAULT (0) FOR [CONT2]
GO
ALTER TABLE [dbo].[WHSTK] ADD  CONSTRAINT [DF__WHSTK__CONT3__532343BF]  DEFAULT (0) FOR [CONT3]
GO
ALTER TABLE [dbo].[accmst]  WITH NOCHECK ADD  CONSTRAINT [FK_accmst_acgroup] FOREIGN KEY([grpcd])
REFERENCES [dbo].[ACGROUP] ([GRPCD])
GO
ALTER TABLE [dbo].[accmst] CHECK CONSTRAINT [FK_accmst_acgroup]
GO
ALTER TABLE [dbo].[ITSTK]  WITH NOCHECK ADD  CONSTRAINT [FK_STKLOC_glumast] FOREIGN KEY([STKLOC])
REFERENCES [dbo].[glumast] ([locode])
GO
ALTER TABLE [dbo].[ITSTK] CHECK CONSTRAINT [FK_STKLOC_glumast]
GO

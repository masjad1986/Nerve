USE [HAMI_SCP]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
	[Confirmed] [int] NULL CONSTRAINT [DF_aspnet_Membership_Confirmed]  DEFAULT ((0)),
	[MobileNo] [varchar](50) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UserInfo]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_UserInfo](
	[UserId] [uniqueidentifier] NOT NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Pobox] [varchar](10) NULL,
	[Emirate] [varchar](25) NULL,
	[Telephone] [varchar](25) NULL,
	[Mobile] [varchar](25) NULL,
	[Confemail] [varchar](50) NULL,
 CONSTRAINT [PK_aspnet_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankingDetails]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankingDetails](
	[DocNo] [char](10) NOT NULL,
	[id] [bigint] NOT NULL,
	[TrackingNo] [char](20) NULL,
	[AmountDeposited] [numeric](12, 2) NULL,
 CONSTRAINT [PK_BankingDetails] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankingMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankingMaster](
	[DocNo] [char](10) NOT NULL,
	[DocDate] [datetime] NULL,
	[BankName] [varchar](50) NULL,
	[BankRefNo] [varchar](50) NULL,
	[DepositedDate] [datetime] NULL,
	[AddedBy] [varchar](50) NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [PK_BankingMaster] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BCGMAST_03092017]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BCGMAST_03092017](
	[ITTAG] [char](1) NULL,
	[ITCODE] [char](30) NULL,
	[ITDESC] [varchar](250) NULL,
	[NOTES] [char](75) NULL,
	[TARGET] [numeric](18, 0) NULL,
	[TRGAMT] [numeric](18, 2) NULL,
	[ACCODE] [char](7) NULL,
	[DBCODE] [char](7) NULL,
	[ADD_TAG] [bit] NOT NULL,
	[SEQ] [char](1) NULL,
	[STOCKAC] [char](7) NULL,
	[WIPAC] [char](7) NULL,
	[CSAC] [char](7) NULL,
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
	[Block] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrefour2]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrefour2](
	[InvNum] [nchar](15) NULL,
	[CRNNum] [nchar](15) NULL,
	[PDate] [smalldatetime] NULL,
	[Customer] [nchar](50) NULL,
	[Mobile] [nchar](15) NULL,
	[IMEI] [nchar](25) NULL,
	[Description] [nchar](100) NULL,
	[Supplier] [nchar](50) NULL,
	[Branch] [nchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CollectionRequest]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollectionRequest](
	[DCustomerID] [varchar](50) NULL,
	[TotalUnits] [numeric](5, 0) NULL,
	[ReceivedDate] [smalldatetime] NULL,
	[Allocated] [char](1) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AllocatedTo] [varchar](50) NULL,
	[Received] [int] NULL,
	[MsgBody] [varchar](500) NULL,
	[CollectionType] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPInvoice]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CPInvoice](
	[Invoiceno] [numeric](18, 0) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[ReqRef] [varchar](500) NULL,
	[LocPrefix] [char](10) NULL,
	[DCustomerName] [char](50) NULL,
	[AWBNo] [char](20) NULL,
	[t] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [char](10) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[SlipReceived] [int] NULL CONSTRAINT [DF_CPInvoice_Received]  DEFAULT ((0)),
	[PreparedDate] [smalldatetime] NULL,
	[DeliveryID] [char](10) NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[COSMOSREF] [varchar](50) NULL,
 CONSTRAINT [PK_CPInvoice] PRIMARY KEY CLUSTERED 
(
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CPInvoice_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CPInvoice_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoiceno] [numeric](6, 0) NOT NULL,
	[DCustomerID] [varchar](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[LocationCode] [char](50) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[IMEINo] [char](50) NULL,
	[SIMEINo] [char](22) NULL,
	[Model] [varchar](40) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[MasterID] [int] NULL CONSTRAINT [DF_CPInvoice_Detail_MasterID]  DEFAULT ((0)),
	[Delivered] [int] NULL CONSTRAINT [DF_CPInvoice_Detail_Delivered]  DEFAULT ((0)),
	[DeliveryconfirmDate] [smalldatetime] NULL,
	[DeliveryUSER] [varchar](50) NULL,
	[ReturnRemarks] [varchar](50) NULL,
	[Del_AWBNo] [varchar](20) NULL,
	[Delivery_Confirmation] [smallint] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[itcode] [char](25) NULL,
 CONSTRAINT [PK_CPInvoice_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CRNTemplate]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRNTemplate](
	[CRN_Number] [float] NULL,
	[Date] [nchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[Customerid] [int] NULL,
	[ContactName] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[CustomerName] [varchar](500) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](500) NULL,
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DDPLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DDPLog](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](15) NULL,
	[Mobile] [char](15) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](25) NULL,
	[IMEINO] [char](25) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](25) NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[PurchasePrice] [varchar](50) NULL,
 CONSTRAINT [DDPLog1] PRIMARY KEY CLUSTERED 
(
	[Docno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dealer_CollReq]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dealer_CollReq](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [varchar](50) NULL,
	[DeviceType] [varchar](25) NULL,
	[Qty] [numeric](5, 0) NULL,
	[Destination] [varchar](50) NULL,
	[DocumentNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[PartnerName] [varchar](50) NULL,
	[Backend] [int] NULL,
	[USERID] [char](10) NULL,
	[EmailSent] [int] NULL,
	[Remarks] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerInvoice]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerInvoice](
	[Invoiceno] [numeric](18, 0) NULL,
	[InvoiceDate] [smalldatetime] NULL CONSTRAINT [DF_DealerInvoice_InvoiceDate]  DEFAULT (getdate()),
	[ReqRef] [varchar](500) NULL,
	[LocPrefix] [char](4) NULL,
	[AWBNo] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerLog](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](20) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](30) NULL,
	[Mobile] [char](30) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[MSNNO] [char](18) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[PHONETYPE] [char](1) NULL,
	[WARRANTY] [char](1) NULL,
	[Phycondition] [nvarchar](275) NULL,
	[FaultDetails] [varchar](275) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [char](10) NULL,
	[LocationName] [varchar](50) NULL,
	[CSORef] [numeric](8, 0) NULL,
	[EmailSent] [char](1) NULL,
	[DealerInvNo] [numeric](18, 0) NULL,
	[Dispatched] [int] NULL,
	[DealerTCInvNo] [numeric](18, 0) NULL,
	[DispatchDate] [smalldatetime] NULL,
	[AWBNo] [char](20) NULL,
	[APPROVED] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[ESTIMATEMAIL] [char](1) NULL,
	[APPROVEDMAIL] [char](1) NULL,
	[CustomerRef] [char](25) NULL,
	[ENGGREMARKS] [varchar](500) NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](30) NULL,
	[UnitsReceived_TC] [int] NOT NULL CONSTRAINT [DF_DealerLog_UnitsReceived_TC]  DEFAULT ((0)),
	[UnitsReceived_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_TC] [int] NOT NULL CONSTRAINT [DF_DealerLog_UnitsAllocated_TC]  DEFAULT ((0)),
	[UnitsAllocated_To] [varchar](50) NULL,
	[UnitsAllocated_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_Ref] [varchar](25) NULL,
	[UnitsReceived_CP] [int] NULL CONSTRAINT [DF_DealerLog_UnitsReceived_CP]  DEFAULT ((0)),
	[UnitsReceived_CP_Date] [smalldatetime] NULL,
	[UnitsDelivered] [int] NULL CONSTRAINT [DF_DealerLog_UnitsDelivered]  DEFAULT ((0)),
	[UnitsDelivered_Date] [smalldatetime] NULL,
	[SMSSent_Customer] [int] NULL CONSTRAINT [DF_DealerLog_SMSSent_Customer]  DEFAULT ((0)),
	[EmailSent_Customer] [int] NULL,
	[RC_LogDate] [smalldatetime] NULL,
	[RC_Logged] [int] NULL CONSTRAINT [DF_DealerLog_Logged]  DEFAULT ((0)),
	[RC_CloseDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL CONSTRAINT [DF_DealerLog_RC_Closed]  DEFAULT ((0)),
	[Forwarder] [varchar](50) NULL,
	[USERID] [varchar](50) NULL,
	[TC_CRN] [int] NULL CONSTRAINT [DF_DealerLog_TC_CRN]  DEFAULT ((0)),
	[Customer_Approval] [int] NULL,
	[Customer_ApprovalRemarks] [varchar](500) NULL,
	[SMSALERT] [int] NULL CONSTRAINT [DF_DealerLog_SMSALERT]  DEFAULT ((0)),
	[FinalWarranty] [int] NULL,
	[WaitForPart] [int] NULL,
	[Flat] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[PreferedDate] [smalldatetime] NULL,
	[PreferedTime] [varchar](25) NULL,
	[DirectCustomer] [int] NULL CONSTRAINT [DF_DealerLog_DirectCustomer]  DEFAULT ((0)),
	[Emirate] [varchar](25) NULL,
	[ProductCode] [varchar](20) NULL,
	[FaultCode] [varchar](15) NULL,
	[BackEnd] [int] NULL CONSTRAINT [DF_DealerLog_BackEnd]  DEFAULT ((0)),
	[BatchRef] [numeric](6, 0) NULL,
	[BatchID] [char](10) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[PrdMonth] [varchar](10) NULL,
	[DeliveryAddress] [varchar](275) NULL,
	[Invoiceamt] [numeric](18, 2) NULL,
	[Customer_Reference] [varchar](25) NULL,
	[ForwardAgent] [varchar](50) NULL,
	[SMS_DeliveryAfter3Days] [int] NULL CONSTRAINT [DF_DealerLog_SMS_DeliveryAfter3Days]  DEFAULT ((0)),
	[RecdUnits] [varchar](250) NULL,
	[AddressUpd] [int] NULL CONSTRAINT [DF_DealerLog_AddressSent]  DEFAULT ((0)),
	[NonWarranty] [int] NULL,
	[Password] [varchar](50) NULL,
	[Transfer_To] [varchar](50) NULL,
	[NonTCRepair] [int] NULL,
	[PartnerDelivery] [int] NULL,
	[PartnerDelivery_Date] [smalldatetime] NULL,
	[PartnerDelivery_No] [numeric](6, 0) NULL,
	[PaymentAdvice] [int] NULL,
	[PaymentAdviceNo] [numeric](5, 0) NULL,
	[PaymentAdviceDate] [smalldatetime] NULL,
	[ServiceCentre_Jobno] [varchar](50) NULL,
	[ServiceCentre_NWAmt] [numeric](12, 2) NULL,
	[BatchRefID] [int] NULL,
	[Hold] [int] NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[EMax_SRFNo] [varchar](25) NULL,
	[DeliveryID] [varchar](50) NULL,
	[Service_Model] [char](10) NULL,
	[Part_No] [char](25) NULL,
	[NewWarrantyStatus] [char](1) NULL,
	[CustAddress] [nvarchar](500) NULL,
	[WarrantyChangedBy] [char](15) NULL,
	[WarrantyRemarks] [nvarchar](250) NULL,
	[WarrantyChangedDate] [datetime] NULL,
	[Banking] [bit] NOT NULL CONSTRAINT [DF_DealerLog_Banking]  DEFAULT ((0)),
	[PictureUploadStatus] [bit] NOT NULL CONSTRAINT [DF_DealerLog_PictureUploadStatus]  DEFAULT ((0)),
	[PicturePath] [nvarchar](500) NULL,
	[IMarketing_Ref] [char](10) NULL,
	[IMarketing] [bit] NOT NULL CONSTRAINT [DF_DealerLog_IMarketing]  DEFAULT ((0)),
	[TCCollectedDate] [smalldatetime] NULL,
	[NOS] [int] NULL,
	[TransferTo_RC] [int] NULL,
	[TransferTo_RC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_RC_DNDate] [smalldatetime] NULL,
	[TransferTo_LC] [int] NULL,
	[TransferTo_LC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_LC_DNDate] [smalldatetime] NULL,
	[ReceivedFrom_DC] [int] NULL,
	[ReceivedFrom_DC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_DC_ReceiptDate] [smalldatetime] NULL,
	[ReceivedFrom_RC] [int] NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_RC_ReceiptDate] [smalldatetime] NULL,
	[LoginType] [char](10) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[DeliverTo] [varchar](30) NULL,
	[AdvanceAmtFC] [numeric](12, 2) NULL,
	[IMktgWalkIn] [char](1) NULL,
	[TCInvoiced] [int] NULL,
	[TCInvoiceDocNo] [numeric](5, 0) NULL,
	[TCInvoicedDate] [smalldatetime] NULL,
	[DeliveryType] [varchar](500) NULL,
	[AdvanceDeliveryType] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[AdvancePmtType] [varchar](50) NULL,
	[RMODEL] [char](25) NULL,
	[RIMEINO] [varchar](20) NULL,
	[RB0] [bit] NULL,
	[RB1] [bit] NULL,
	[RB2] [bit] NULL,
	[RC1] [bit] NULL,
	[RC2] [bit] NULL,
	[RO1] [bit] NULL,
	[RO2] [bit] NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RBRAND] [char](25) NULL,
	[PaymentType] [char](20) NULL,
	[JobOrderId] [char](10) NULL,
	[ClaimId] [char](10) NULL,
	[LOC] [varchar](50) NULL,
	[CollectionDateTime] [varchar](100) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[ServiceCenter] [int] NULL,
	[Flag] [int] NULL,
	[Accepted] [nvarchar](1) NULL,
	[Note] [nvarchar](100) NULL,
	[SanitaizationAppr] [nvarchar](1) NULL,
	[SanitaizationApprBy] [nvarchar](20) NULL,
	[PitcherPOP] [nvarchar](100) NULL,
	[TypeOfWarranty] [int] NULL,
	[SanitaizationRemarks] [nvarchar](400) NULL,
	[detailid] [int] NULL,
	[ReceiveFrom_SA] [int] NULL,
	[ReceiveFrom_SA_Date] [smalldatetime] NULL,
	[TransferFrom_SA_Ref] [numeric](5, 0) NULL,
	[SanitaizationAppr_Date] [smalldatetime] NULL,
	[ReceiveFrom_SA_Ref] [numeric](5, 0) NULL,
	[TransferFrom_SA] [int] NULL,
	[TransferFrom_SA_Date] [smalldatetime] NULL,
	[JOBREF] [nvarchar](15) NULL,
	[BinCode] [nvarchar](8) NULL,
	[PaymentConfirmed] [int] NULL,
	[PaymentConfirmedby] [nvarchar](20) NULL,
	[PaymentConfirmedDate] [smalldatetime] NULL,
	[SMSLanguage] [int] NULL,
	[OutRegion] [int] NULL,
	[RMANo] [varchar](50) NULL,
	[BounceRMANo] [varchar](50) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[JobStatus] [int] NULL,
	[QRS] [int] NULL,
	[ExpiryMonths] [int] NULL,
	[Vista] [int] NULL,
	[DOA] [int] NULL,
	[TransferStatus] [int] NULL,
	[BOUNCEREMARKS] [nvarchar](250) NULL,
	[FARSIDATE] [varchar](50) NULL,
	[NATIONALID] [varchar](50) NULL,
	[ECOCODE] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
	[FARSICUSTNAME] [nvarchar](50) NULL,
	[S_REMARKS] [varchar](250) NULL,
	[UnitsDelivered_By] [varchar](50) NULL,
 CONSTRAINT [DealerLog1] PRIMARY KEY CLUSTERED 
(
	[Docno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dealerlog_031018]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dealerlog_031018](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](20) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](30) NULL,
	[Mobile] [char](30) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[MSNNO] [char](18) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[PHONETYPE] [char](1) NULL,
	[WARRANTY] [char](1) NULL,
	[Phycondition] [nvarchar](275) NULL,
	[FaultDetails] [varchar](275) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [char](10) NULL,
	[LocationName] [varchar](50) NULL,
	[CSORef] [numeric](8, 0) NULL,
	[EmailSent] [char](1) NULL,
	[DealerInvNo] [numeric](18, 0) NULL,
	[Dispatched] [int] NULL,
	[DealerTCInvNo] [numeric](18, 0) NULL,
	[DispatchDate] [smalldatetime] NULL,
	[AWBNo] [char](20) NULL,
	[APPROVED] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[ESTIMATEMAIL] [char](1) NULL,
	[APPROVEDMAIL] [char](1) NULL,
	[CustomerRef] [char](25) NULL,
	[ENGGREMARKS] [varchar](500) NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](30) NULL,
	[UnitsReceived_TC] [int] NOT NULL,
	[UnitsReceived_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_TC] [int] NOT NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[UnitsAllocated_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_Ref] [varchar](25) NULL,
	[UnitsReceived_CP] [int] NULL,
	[UnitsReceived_CP_Date] [smalldatetime] NULL,
	[UnitsDelivered] [int] NULL,
	[UnitsDelivered_Date] [smalldatetime] NULL,
	[SMSSent_Customer] [int] NULL,
	[EmailSent_Customer] [int] NULL,
	[RC_LogDate] [smalldatetime] NULL,
	[RC_Logged] [int] NULL,
	[RC_CloseDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL,
	[Forwarder] [varchar](50) NULL,
	[USERID] [varchar](50) NULL,
	[TC_CRN] [int] NULL,
	[Customer_Approval] [int] NULL,
	[Customer_ApprovalRemarks] [varchar](500) NULL,
	[SMSALERT] [int] NULL,
	[FinalWarranty] [int] NULL,
	[WaitForPart] [int] NULL,
	[Flat] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[PreferedDate] [smalldatetime] NULL,
	[PreferedTime] [varchar](25) NULL,
	[DirectCustomer] [int] NULL,
	[Emirate] [varchar](25) NULL,
	[ProductCode] [varchar](20) NULL,
	[FaultCode] [varchar](15) NULL,
	[BackEnd] [int] NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[BatchID] [char](10) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[PrdMonth] [varchar](10) NULL,
	[DeliveryAddress] [varchar](275) NULL,
	[Invoiceamt] [numeric](18, 2) NULL,
	[Customer_Reference] [varchar](25) NULL,
	[ForwardAgent] [varchar](50) NULL,
	[SMS_DeliveryAfter3Days] [int] NULL,
	[RecdUnits] [varchar](250) NULL,
	[AddressUpd] [int] NULL,
	[NonWarranty] [int] NULL,
	[Password] [varchar](50) NULL,
	[Transfer_To] [varchar](50) NULL,
	[NonTCRepair] [int] NULL,
	[PartnerDelivery] [int] NULL,
	[PartnerDelivery_Date] [smalldatetime] NULL,
	[PartnerDelivery_No] [numeric](6, 0) NULL,
	[PaymentAdvice] [int] NULL,
	[PaymentAdviceNo] [numeric](5, 0) NULL,
	[PaymentAdviceDate] [smalldatetime] NULL,
	[ServiceCentre_Jobno] [varchar](50) NULL,
	[ServiceCentre_NWAmt] [numeric](12, 2) NULL,
	[BatchRefID] [int] NULL,
	[Hold] [int] NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[EMax_SRFNo] [varchar](25) NULL,
	[DeliveryID] [varchar](50) NULL,
	[Service_Model] [char](10) NULL,
	[Part_No] [char](25) NULL,
	[NewWarrantyStatus] [char](1) NULL,
	[CustAddress] [nvarchar](500) NULL,
	[WarrantyChangedBy] [char](15) NULL,
	[WarrantyRemarks] [nvarchar](250) NULL,
	[WarrantyChangedDate] [datetime] NULL,
	[Banking] [bit] NOT NULL,
	[PictureUploadStatus] [bit] NOT NULL,
	[PicturePath] [nvarchar](500) NULL,
	[IMarketing_Ref] [char](10) NULL,
	[IMarketing] [bit] NOT NULL,
	[TCCollectedDate] [smalldatetime] NULL,
	[NOS] [int] NULL,
	[TransferTo_RC] [int] NULL,
	[TransferTo_RC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_RC_DNDate] [smalldatetime] NULL,
	[TransferTo_LC] [int] NULL,
	[TransferTo_LC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_LC_DNDate] [smalldatetime] NULL,
	[ReceivedFrom_DC] [int] NULL,
	[ReceivedFrom_DC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_DC_ReceiptDate] [smalldatetime] NULL,
	[ReceivedFrom_RC] [int] NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_RC_ReceiptDate] [smalldatetime] NULL,
	[LoginType] [char](10) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[DeliverTo] [varchar](30) NULL,
	[AdvanceAmtFC] [numeric](12, 2) NULL,
	[IMktgWalkIn] [char](1) NULL,
	[TCInvoiced] [int] NULL,
	[TCInvoiceDocNo] [numeric](5, 0) NULL,
	[TCInvoicedDate] [smalldatetime] NULL,
	[DeliveryType] [varchar](500) NULL,
	[AdvanceDeliveryType] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[AdvancePmtType] [varchar](50) NULL,
	[RMODEL] [char](25) NULL,
	[RIMEINO] [varchar](20) NULL,
	[RB0] [bit] NULL,
	[RB1] [bit] NULL,
	[RB2] [bit] NULL,
	[RC1] [bit] NULL,
	[RC2] [bit] NULL,
	[RO1] [bit] NULL,
	[RO2] [bit] NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RBRAND] [char](25) NULL,
	[PaymentType] [char](20) NULL,
	[JobOrderId] [char](10) NULL,
	[ClaimId] [char](10) NULL,
	[LOC] [varchar](50) NULL,
	[CollectionDateTime] [varchar](100) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[ServiceCenter] [int] NULL,
	[Flag] [int] NULL,
	[Accepted] [nvarchar](1) NULL,
	[Note] [nvarchar](100) NULL,
	[SanitaizationAppr] [nvarchar](1) NULL,
	[SanitaizationApprBy] [nvarchar](20) NULL,
	[PitcherPOP] [nvarchar](100) NULL,
	[TypeOfWarranty] [int] NULL,
	[SanitaizationRemarks] [nvarchar](400) NULL,
	[detailid] [int] NULL,
	[ReceiveFrom_SA] [int] NULL,
	[ReceiveFrom_SA_Date] [smalldatetime] NULL,
	[TransferFrom_SA_Ref] [numeric](5, 0) NULL,
	[SanitaizationAppr_Date] [smalldatetime] NULL,
	[ReceiveFrom_SA_Ref] [numeric](5, 0) NULL,
	[TransferFrom_SA] [int] NULL,
	[TransferFrom_SA_Date] [smalldatetime] NULL,
	[JOBREF] [nvarchar](15) NULL,
	[BinCode] [nvarchar](8) NULL,
	[PaymentConfirmed] [int] NULL,
	[PaymentConfirmedby] [nvarchar](20) NULL,
	[PaymentConfirmedDate] [smalldatetime] NULL,
	[SMSLanguage] [int] NULL,
	[OutRegion] [int] NULL,
	[RMANo] [varchar](50) NULL,
	[BounceRMANo] [varchar](50) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[JobStatus] [int] NULL,
	[QRS] [int] NULL,
	[ExpiryMonths] [int] NULL,
	[Vista] [int] NULL,
	[DOA] [int] NULL,
	[TransferStatus] [int] NULL,
	[BOUNCEREMARKS] [nvarchar](250) NULL,
	[FARSIDATE] [varchar](50) NULL,
	[NATIONALID] [varchar](50) NULL,
	[ECOCODE] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
	[FARSICUSTNAME] [nvarchar](50) NULL,
	[S_REMARKS] [varchar](250) NULL,
	[UnitsDelivered_By] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dealerlog_0408]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dealerlog_0408](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](20) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](30) NULL,
	[Mobile] [char](30) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[MSNNO] [char](18) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[PHONETYPE] [char](1) NULL,
	[WARRANTY] [char](1) NULL,
	[Phycondition] [nvarchar](275) NULL,
	[FaultDetails] [varchar](275) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [char](10) NULL,
	[LocationName] [varchar](50) NULL,
	[CSORef] [numeric](8, 0) NULL,
	[EmailSent] [char](1) NULL,
	[DealerInvNo] [numeric](18, 0) NULL,
	[Dispatched] [int] NULL,
	[DealerTCInvNo] [numeric](18, 0) NULL,
	[DispatchDate] [smalldatetime] NULL,
	[AWBNo] [char](20) NULL,
	[APPROVED] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[ESTIMATEMAIL] [char](1) NULL,
	[APPROVEDMAIL] [char](1) NULL,
	[CustomerRef] [char](25) NULL,
	[ENGGREMARKS] [varchar](500) NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](30) NULL,
	[UnitsReceived_TC] [int] NOT NULL,
	[UnitsReceived_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_TC] [int] NOT NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[UnitsAllocated_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_Ref] [varchar](25) NULL,
	[UnitsReceived_CP] [int] NULL,
	[UnitsReceived_CP_Date] [smalldatetime] NULL,
	[UnitsDelivered] [int] NULL,
	[UnitsDelivered_Date] [smalldatetime] NULL,
	[SMSSent_Customer] [int] NULL,
	[EmailSent_Customer] [int] NULL,
	[RC_LogDate] [smalldatetime] NULL,
	[RC_Logged] [int] NULL,
	[RC_CloseDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL,
	[Forwarder] [varchar](50) NULL,
	[USERID] [varchar](50) NULL,
	[TC_CRN] [int] NULL,
	[Customer_Approval] [int] NULL,
	[Customer_ApprovalRemarks] [varchar](500) NULL,
	[SMSALERT] [int] NULL,
	[FinalWarranty] [int] NULL,
	[WaitForPart] [int] NULL,
	[Flat] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[PreferedDate] [smalldatetime] NULL,
	[PreferedTime] [varchar](25) NULL,
	[DirectCustomer] [int] NULL,
	[Emirate] [varchar](25) NULL,
	[ProductCode] [varchar](20) NULL,
	[FaultCode] [varchar](15) NULL,
	[BackEnd] [int] NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[BatchID] [char](10) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[PrdMonth] [varchar](10) NULL,
	[DeliveryAddress] [varchar](275) NULL,
	[Invoiceamt] [numeric](18, 2) NULL,
	[Customer_Reference] [varchar](25) NULL,
	[ForwardAgent] [varchar](50) NULL,
	[SMS_DeliveryAfter3Days] [int] NULL,
	[RecdUnits] [varchar](250) NULL,
	[AddressUpd] [int] NULL,
	[NonWarranty] [int] NULL,
	[Password] [varchar](50) NULL,
	[Transfer_To] [varchar](50) NULL,
	[NonTCRepair] [int] NULL,
	[PartnerDelivery] [int] NULL,
	[PartnerDelivery_Date] [smalldatetime] NULL,
	[PartnerDelivery_No] [numeric](6, 0) NULL,
	[PaymentAdvice] [int] NULL,
	[PaymentAdviceNo] [numeric](5, 0) NULL,
	[PaymentAdviceDate] [smalldatetime] NULL,
	[ServiceCentre_Jobno] [varchar](50) NULL,
	[ServiceCentre_NWAmt] [numeric](12, 2) NULL,
	[BatchRefID] [int] NULL,
	[Hold] [int] NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[EMax_SRFNo] [varchar](25) NULL,
	[DeliveryID] [varchar](50) NULL,
	[Service_Model] [char](10) NULL,
	[Part_No] [char](25) NULL,
	[NewWarrantyStatus] [char](1) NULL,
	[CustAddress] [nvarchar](500) NULL,
	[WarrantyChangedBy] [char](15) NULL,
	[WarrantyRemarks] [nvarchar](250) NULL,
	[WarrantyChangedDate] [datetime] NULL,
	[Banking] [bit] NOT NULL,
	[PictureUploadStatus] [bit] NOT NULL,
	[PicturePath] [nvarchar](500) NULL,
	[IMarketing_Ref] [char](10) NULL,
	[IMarketing] [bit] NOT NULL,
	[TCCollectedDate] [smalldatetime] NULL,
	[NOS] [int] NULL,
	[TransferTo_RC] [int] NULL,
	[TransferTo_RC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_RC_DNDate] [smalldatetime] NULL,
	[TransferTo_LC] [int] NULL,
	[TransferTo_LC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_LC_DNDate] [smalldatetime] NULL,
	[ReceivedFrom_DC] [int] NULL,
	[ReceivedFrom_DC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_DC_ReceiptDate] [smalldatetime] NULL,
	[ReceivedFrom_RC] [int] NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_RC_ReceiptDate] [smalldatetime] NULL,
	[LoginType] [char](10) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[DeliverTo] [varchar](30) NULL,
	[AdvanceAmtFC] [numeric](12, 2) NULL,
	[IMktgWalkIn] [char](1) NULL,
	[TCInvoiced] [int] NULL,
	[TCInvoiceDocNo] [numeric](5, 0) NULL,
	[TCInvoicedDate] [smalldatetime] NULL,
	[DeliveryType] [varchar](500) NULL,
	[AdvanceDeliveryType] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[AdvancePmtType] [varchar](50) NULL,
	[RMODEL] [char](25) NULL,
	[RIMEINO] [varchar](20) NULL,
	[RB0] [bit] NULL,
	[RB1] [bit] NULL,
	[RB2] [bit] NULL,
	[RC1] [bit] NULL,
	[RC2] [bit] NULL,
	[RO1] [bit] NULL,
	[RO2] [bit] NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RBRAND] [char](25) NULL,
	[PaymentType] [char](20) NULL,
	[JobOrderId] [char](10) NULL,
	[ClaimId] [char](10) NULL,
	[LOC] [varchar](50) NULL,
	[CollectionDateTime] [varchar](100) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[ServiceCenter] [int] NULL,
	[Flag] [int] NULL,
	[Accepted] [nvarchar](1) NULL,
	[Note] [nvarchar](100) NULL,
	[SanitaizationAppr] [nvarchar](1) NULL,
	[SanitaizationApprBy] [nvarchar](20) NULL,
	[PitcherPOP] [nvarchar](100) NULL,
	[TypeOfWarranty] [int] NULL,
	[SanitaizationRemarks] [nvarchar](400) NULL,
	[detailid] [int] NULL,
	[ReceiveFrom_SA] [int] NULL,
	[ReceiveFrom_SA_Date] [smalldatetime] NULL,
	[TransferFrom_SA_Ref] [numeric](5, 0) NULL,
	[SanitaizationAppr_Date] [smalldatetime] NULL,
	[ReceiveFrom_SA_Ref] [numeric](5, 0) NULL,
	[TransferFrom_SA] [int] NULL,
	[TransferFrom_SA_Date] [smalldatetime] NULL,
	[JOBREF] [nvarchar](15) NULL,
	[BinCode] [nvarchar](8) NULL,
	[PaymentConfirmed] [int] NULL,
	[PaymentConfirmedby] [nvarchar](20) NULL,
	[PaymentConfirmedDate] [smalldatetime] NULL,
	[SMSLanguage] [int] NULL,
	[OutRegion] [int] NULL,
	[RMANo] [varchar](50) NULL,
	[BounceRMANo] [varchar](50) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[JobStatus] [int] NULL,
	[QRS] [int] NULL,
	[ExpiryMonths] [int] NULL,
	[Vista] [int] NULL,
	[DOA] [int] NULL,
	[TransferStatus] [int] NULL,
	[BOUNCEREMARKS] [nvarchar](250) NULL,
	[FARSIDATE] [varchar](50) NULL,
	[NATIONALID] [varchar](50) NULL,
	[ECOCODE] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
	[FARSICUSTNAME] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dealerlog_040901]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dealerlog_040901](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](20) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](30) NULL,
	[Mobile] [char](30) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](30) NULL,
	[IMEINO] [varchar](50) NULL,
	[MSNNO] [char](18) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[PHONETYPE] [char](1) NULL,
	[WARRANTY] [char](1) NULL,
	[Phycondition] [nvarchar](275) NULL,
	[FaultDetails] [varchar](275) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [char](10) NULL,
	[LocationName] [varchar](50) NULL,
	[CSORef] [numeric](8, 0) NULL,
	[EmailSent] [char](1) NULL,
	[DealerInvNo] [numeric](18, 0) NULL,
	[Dispatched] [int] NULL,
	[DealerTCInvNo] [numeric](18, 0) NULL,
	[DispatchDate] [smalldatetime] NULL,
	[AWBNo] [char](20) NULL,
	[APPROVED] [char](1) NULL,
	[ESTIMATE] [char](1) NULL,
	[ESTIMATEMAIL] [char](1) NULL,
	[APPROVEDMAIL] [char](1) NULL,
	[CustomerRef] [char](25) NULL,
	[ENGGREMARKS] [varchar](500) NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](30) NULL,
	[UnitsReceived_TC] [int] NOT NULL,
	[UnitsReceived_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_TC] [int] NOT NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[UnitsAllocated_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_Ref] [varchar](25) NULL,
	[UnitsReceived_CP] [int] NULL,
	[UnitsReceived_CP_Date] [smalldatetime] NULL,
	[UnitsDelivered] [int] NULL,
	[UnitsDelivered_Date] [smalldatetime] NULL,
	[SMSSent_Customer] [int] NULL,
	[EmailSent_Customer] [int] NULL,
	[RC_LogDate] [smalldatetime] NULL,
	[RC_Logged] [int] NULL,
	[RC_CloseDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL,
	[Forwarder] [varchar](50) NULL,
	[USERID] [varchar](50) NULL,
	[TC_CRN] [int] NULL,
	[Customer_Approval] [int] NULL,
	[Customer_ApprovalRemarks] [varchar](500) NULL,
	[SMSALERT] [int] NULL,
	[FinalWarranty] [int] NULL,
	[WaitForPart] [int] NULL,
	[Flat] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[Landmark] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[PreferedDate] [smalldatetime] NULL,
	[PreferedTime] [varchar](25) NULL,
	[DirectCustomer] [int] NULL,
	[Emirate] [varchar](25) NULL,
	[ProductCode] [varchar](20) NULL,
	[FaultCode] [varchar](15) NULL,
	[BackEnd] [int] NULL,
	[BatchRef] [numeric](6, 0) NULL,
	[BatchID] [char](10) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[PrdMonth] [varchar](10) NULL,
	[DeliveryAddress] [varchar](275) NULL,
	[Invoiceamt] [numeric](18, 2) NULL,
	[Customer_Reference] [varchar](25) NULL,
	[ForwardAgent] [varchar](50) NULL,
	[SMS_DeliveryAfter3Days] [int] NULL,
	[RecdUnits] [varchar](250) NULL,
	[AddressUpd] [int] NULL,
	[NonWarranty] [int] NULL,
	[Password] [varchar](50) NULL,
	[Transfer_To] [varchar](50) NULL,
	[NonTCRepair] [int] NULL,
	[PartnerDelivery] [int] NULL,
	[PartnerDelivery_Date] [smalldatetime] NULL,
	[PartnerDelivery_No] [numeric](6, 0) NULL,
	[PaymentAdvice] [int] NULL,
	[PaymentAdviceNo] [numeric](5, 0) NULL,
	[PaymentAdviceDate] [smalldatetime] NULL,
	[ServiceCentre_Jobno] [varchar](50) NULL,
	[ServiceCentre_NWAmt] [numeric](12, 2) NULL,
	[BatchRefID] [int] NULL,
	[Hold] [int] NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[EMax_SRFNo] [varchar](25) NULL,
	[DeliveryID] [varchar](50) NULL,
	[Service_Model] [char](10) NULL,
	[Part_No] [char](25) NULL,
	[NewWarrantyStatus] [char](1) NULL,
	[CustAddress] [nvarchar](500) NULL,
	[WarrantyChangedBy] [char](15) NULL,
	[WarrantyRemarks] [nvarchar](250) NULL,
	[WarrantyChangedDate] [datetime] NULL,
	[Banking] [bit] NOT NULL,
	[PictureUploadStatus] [bit] NOT NULL,
	[PicturePath] [nvarchar](500) NULL,
	[IMarketing_Ref] [char](10) NULL,
	[IMarketing] [bit] NOT NULL,
	[TCCollectedDate] [smalldatetime] NULL,
	[NOS] [int] NULL,
	[TransferTo_RC] [int] NULL,
	[TransferTo_RC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_RC_DNDate] [smalldatetime] NULL,
	[TransferTo_LC] [int] NULL,
	[TransferTo_LC_DNRef] [numeric](5, 0) NULL,
	[TransferTo_LC_DNDate] [smalldatetime] NULL,
	[ReceivedFrom_DC] [int] NULL,
	[ReceivedFrom_DC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_DC_ReceiptDate] [smalldatetime] NULL,
	[ReceivedFrom_RC] [int] NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_RC_ReceiptDate] [smalldatetime] NULL,
	[LoginType] [char](10) NULL,
	[DeviceCategory] [varchar](500) NULL,
	[Priority] [varchar](500) NULL,
	[EWCompany] [varchar](500) NULL,
	[DeliverTo] [varchar](30) NULL,
	[AdvanceAmtFC] [numeric](12, 2) NULL,
	[IMktgWalkIn] [char](1) NULL,
	[TCInvoiced] [int] NULL,
	[TCInvoiceDocNo] [numeric](5, 0) NULL,
	[TCInvoicedDate] [smalldatetime] NULL,
	[DeliveryType] [varchar](500) NULL,
	[AdvanceDeliveryType] [varchar](500) NULL,
	[AdvanceReturn] [int] NULL,
	[AdvancePmtType] [varchar](50) NULL,
	[RMODEL] [char](25) NULL,
	[RIMEINO] [varchar](20) NULL,
	[RB0] [bit] NULL,
	[RB1] [bit] NULL,
	[RB2] [bit] NULL,
	[RC1] [bit] NULL,
	[RC2] [bit] NULL,
	[RO1] [bit] NULL,
	[RO2] [bit] NULL,
	[REPLDESCR] [varchar](50) NULL,
	[RBRAND] [char](25) NULL,
	[PaymentType] [char](20) NULL,
	[JobOrderId] [char](10) NULL,
	[ClaimId] [char](10) NULL,
	[LOC] [varchar](50) NULL,
	[CollectionDateTime] [varchar](100) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[ServiceCenter] [int] NULL,
	[Flag] [int] NULL,
	[Accepted] [nvarchar](1) NULL,
	[Note] [nvarchar](100) NULL,
	[SanitaizationAppr] [nvarchar](1) NULL,
	[SanitaizationApprBy] [nvarchar](20) NULL,
	[PitcherPOP] [nvarchar](100) NULL,
	[TypeOfWarranty] [int] NULL,
	[SanitaizationRemarks] [nvarchar](400) NULL,
	[detailid] [int] NULL,
	[ReceiveFrom_SA] [int] NULL,
	[ReceiveFrom_SA_Date] [smalldatetime] NULL,
	[TransferFrom_SA_Ref] [numeric](5, 0) NULL,
	[SanitaizationAppr_Date] [smalldatetime] NULL,
	[ReceiveFrom_SA_Ref] [numeric](5, 0) NULL,
	[TransferFrom_SA] [int] NULL,
	[TransferFrom_SA_Date] [smalldatetime] NULL,
	[JOBREF] [nvarchar](15) NULL,
	[BinCode] [nvarchar](8) NULL,
	[PaymentConfirmed] [int] NULL,
	[PaymentConfirmedby] [nvarchar](20) NULL,
	[PaymentConfirmedDate] [smalldatetime] NULL,
	[SMSLanguage] [int] NULL,
	[OutRegion] [int] NULL,
	[RMANo] [varchar](50) NULL,
	[BounceRMANo] [varchar](50) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[JobStatus] [int] NULL,
	[QRS] [int] NULL,
	[ExpiryMonths] [int] NULL,
	[Vista] [int] NULL,
	[DOA] [int] NULL,
	[TransferStatus] [int] NULL,
	[BOUNCEREMARKS] [nvarchar](250) NULL,
	[FARSIDATE] [varchar](50) NULL,
	[NATIONALID] [varchar](50) NULL,
	[ECOCODE] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
	[FARSICUSTNAME] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerLog_SMS]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerLog_SMS](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Docno] [char](10) NULL,
	[SMSAlert] [int] NULL CONSTRAINT [DF_DealerLog_SMS_SMSAlert]  DEFAULT ((0)),
	[EmailSent] [int] NULL CONSTRAINT [DF_DealerLog_SMS_EmailSent]  DEFAULT ((0)),
	[SMSSent_Customer] [int] NULL CONSTRAINT [DF_DealerLog_SMS_SMSSent_Customer]  DEFAULT ((0)),
	[EmailSent_Customer] [int] NULL CONSTRAINT [DF_DealerLog_SMS_EmailSent_Customer]  DEFAULT ((0)),
	[SMSAccept] [int] NULL,
	[EmailAccept] [int] NULL,
	[EmailSentCP] [int] NULL CONSTRAINT [DF_DealerLog_SMS_EmailSent1]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoice]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoice](
	[Invoiceno] [numeric](18, 0) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[ReqRef] [varchar](500) NULL,
	[LocPrefix] [char](4) NULL,
	[DCustomerName] [char](50) NULL,
	[AWBNo] [char](20) NULL,
	[t] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [char](10) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[SlipReceived] [int] NULL CONSTRAINT [DF_DealerTCInvoice_Received]  DEFAULT ((0)),
	[PreparedDate] [smalldatetime] NULL,
	[DeliveryID] [char](10) NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[COSMOSREF] [varchar](50) NULL,
 CONSTRAINT [PK_DealerTCInvoice] PRIMARY KEY CLUSTERED 
(
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dealertcinvoice_040801]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dealertcinvoice_040801](
	[Invoiceno] [numeric](18, 0) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[ReqRef] [varchar](500) NULL,
	[LocPrefix] [char](4) NULL,
	[DCustomerName] [char](50) NULL,
	[AWBNo] [char](20) NULL,
	[t] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [char](10) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[SlipReceived] [int] NULL,
	[PreparedDate] [smalldatetime] NULL,
	[DeliveryID] [char](10) NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[COSMOSREF] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoice_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoice_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoiceno] [numeric](5, 0) NOT NULL,
	[DCustomerID] [varchar](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[LocationCode] [char](50) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[IMEINo] [char](50) NULL,
	[SIMEINo] [char](22) NULL,
	[Model] [varchar](40) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[MasterID] [int] NULL CONSTRAINT [DF_DealerTCInvoice_Detail_MasterID]  DEFAULT ((0)),
	[Delivered] [int] NULL CONSTRAINT [DF_DealerTCInvoice_Detail_Delivered]  DEFAULT ((0)),
	[DeliveryconfirmDate] [smalldatetime] NULL,
	[DeliveryUSER] [varchar](50) NULL,
	[ReturnRemarks] [varchar](50) NULL,
	[Del_AWBNo] [varchar](60) NULL,
	[Delivery_Confirmation] [smallint] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[itcode] [char](25) NULL,
 CONSTRAINT [PK_DealerTCInvoice_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoice_Detail_0408]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoice_Detail_0408](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoiceno] [numeric](5, 0) NOT NULL,
	[DCustomerID] [varchar](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[LocationCode] [char](50) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[IMEINo] [char](50) NULL,
	[SIMEINo] [char](22) NULL,
	[Model] [varchar](40) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[MasterID] [int] NULL,
	[Delivered] [int] NULL,
	[DeliveryconfirmDate] [smalldatetime] NULL,
	[DeliveryUSER] [varchar](50) NULL,
	[ReturnRemarks] [varchar](50) NULL,
	[Del_AWBNo] [varchar](20) NULL,
	[Delivery_Confirmation] [smallint] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[itcode] [char](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoice_Detail_040801]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoice_Detail_040801](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoiceno] [numeric](5, 0) NOT NULL,
	[DCustomerID] [varchar](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[LocationCode] [char](50) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[IMEINo] [char](50) NULL,
	[SIMEINo] [char](22) NULL,
	[Model] [varchar](40) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[MasterID] [int] NULL,
	[Delivered] [int] NULL,
	[DeliveryconfirmDate] [smalldatetime] NULL,
	[DeliveryUSER] [varchar](50) NULL,
	[ReturnRemarks] [varchar](50) NULL,
	[Del_AWBNo] [varchar](20) NULL,
	[Delivery_Confirmation] [smallint] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[itcode] [char](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoiceVendor]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoiceVendor](
	[Invoiceno] [numeric](18, 0) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[ReqRef] [varchar](500) NULL,
	[LocPrefix] [char](4) NULL,
	[DCustomerName] [char](50) NULL,
	[AWBNo] [char](20) NULL,
	[t] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [char](10) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[SlipReceived] [int] NULL CONSTRAINT [DF_DealerTCInvoiceVendor_Received]  DEFAULT ((0)),
	[PreparedDate] [smalldatetime] NULL,
	[DeliveryID] [char](10) NULL,
	[GRVReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[COSMOSREF] [varchar](50) NULL,
 CONSTRAINT [PK_DealerTCInvoiceVendor] PRIMARY KEY CLUSTERED 
(
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealerTCInvoiceVendor_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DealerTCInvoiceVendor_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoiceno] [numeric](5, 0) NOT NULL,
	[DCustomerID] [varchar](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[LocationCode] [char](50) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[IMEINo] [char](50) NULL,
	[SIMEINo] [char](22) NULL,
	[Model] [varchar](40) NULL,
	[DeliveryAgent] [varchar](500) NULL,
	[MasterID] [int] NULL CONSTRAINT [DF_DealerTCInvoiceVendor_Detail_MasterID]  DEFAULT ((0)),
	[Delivered] [int] NULL CONSTRAINT [DF_DealerTCInvoiceVendor_Detail_Delivered]  DEFAULT ((0)),
	[DeliveryconfirmDate] [smalldatetime] NULL,
	[DeliveryUSER] [varchar](50) NULL,
	[ReturnRemarks] [varchar](50) NULL,
	[Del_AWBNo] [varchar](20) NULL,
	[Delivery_Confirmation] [smallint] NULL,
	[COSMOSREF] [varchar](50) NULL,
	[PARTS] [nvarchar](50) NULL,
	[PARTDETAILS] [nvarchar](250) NULL,
	[RMAREF] [varchar](10) NULL,
 CONSTRAINT [PK_DealerTCInvoiceVendor_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Invoiceno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DOALog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOALog](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[Phone] [char](15) NULL,
	[Mobile] [char](15) NULL,
	[Brand] [char](10) NULL,
	[Model] [char](15) NULL,
	[IMEINO] [char](18) NULL,
	[MSNNO] [char](18) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[PHONETYPE] [char](1) NULL,
	[WARRANTY] [char](1) NULL,
	[Phycondition] [varchar](250) NULL,
	[FaultDetails] [varchar](250) NULL,
	[UR_MOBILE] [char](1) NULL,
	[UR_BATTERY] [char](1) NULL,
	[UR_CHARGER] [char](1) NULL,
	[UR_MMCCARD] [char](1) NULL,
	[UR_DATABACKUP] [char](1) NULL,
	[UR_BATTERYDOOR] [char](1) NULL,
	[UR_BASE] [char](1) NULL,
	[UR_HANDSET] [char](1) NULL,
	[UR_GCHARGER] [char](1) NULL,
	[UR_OTHERS] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailSent] [char](1) NULL,
	[AWBNo] [char](20) NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](25) NULL,
	[UnitsAllocated_TC] [int] NOT NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[EMSWarranty] [varchar](50) NULL,
	[UnitsAllocated_TC_Date] [smalldatetime] NULL,
	[UnitsAllocated_Ref] [varchar](25) NULL,
	[SMSSent_Customer] [int] NULL,
	[EmailSent_Customer] [int] NULL,
	[Airwaybillno] [varchar](20) NULL,
	[Forwarder] [varchar](20) NULL,
	[USERID] [varchar](50) NULL,
	[SMSALERT] [int] NULL,
 CONSTRAINT [DoaLog1] PRIMARY KEY CLUSTERED 
(
	[Docno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
	[UserID] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[CRNNo] [varchar](50) NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[CustomerRemarks] [nvarchar](500) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NULL CONSTRAINT [DF_Feedback_DateCreated]  DEFAULT (getdate()),
	[ClientIP] [varchar](50) NULL,
	[DateCreatedTime] [datetime] NULL CONSTRAINT [DF_Feedback_DateCreatedTime]  DEFAULT (getdate()),
	[Q1Text] [nvarchar](100) NULL,
	[Q2Text] [nvarchar](100) NULL,
	[Q3Text] [nvarchar](100) NULL,
	[Q4Text] [nvarchar](100) NULL,
	[Q5Text] [nvarchar](100) NULL,
	[MailSent] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GBBLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GBBLog](
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[Prefix] [char](10) NULL,
	[Docno] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[UnitDroppedDate] [smalldatetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [char](15) NULL,
	[Mobile] [char](15) NULL,
	[Country] [varchar](50) NULL,
	[Brand] [char](20) NULL,
	[Product] [char](30) NULL,
	[Model] [char](25) NULL,
	[IMEINO] [char](25) NULL,
	[PURCDATE] [smalldatetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPerson] [varchar](50) NULL,
	[CollRef] [varchar](25) NULL,
	[UnitsAllocated_To] [varchar](50) NULL,
	[PurchasePrice] [varchar](50) NULL,
	[InvoiceNo] [numeric](18, 0) NULL,
 CONSTRAINT [GBBLog1] PRIMARY KEY CLUSTERED 
(
	[Docno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HandprintedForm]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HandprintedForm](
	[CRN_Number] [float] NULL,
	[Date] [smalldatetime] NULL,
	[Name] [nchar](50) NULL,
	[Mobile_no] [float] NULL,
	[E_mail] [nchar](50) NULL,
	[IMEI_Serial_no] [nchar](50) NULL,
	[Brand] [nchar](50) NULL,
	[Model] [nchar](50) NULL,
	[Product_MobilePhone] [bit] NULL,
	[Product_Laptop] [bit] NULL,
	[Product_Tablet] [bit] NULL,
	[Product_Gigaset] [bit] NULL,
	[Product_Camera] [bit] NULL,
	[Product_Accessory] [bit] NULL,
	[Product_Others] [bit] NULL,
	[ACC_Battery] [bit] NULL,
	[ACC_Batterycover] [bit] NULL,
	[ACC_Headset] [bit] NULL,
	[ACC_BluetoothHS] [bit] NULL,
	[ACC_Charger] [bit] NULL,
	[ACC_Stylus] [bit] NULL,
	[ACC_Memorymedia] [bit] NULL,
	[ACC_Others] [nchar](50) NULL,
	[UC_Scraches] [bit] NULL,
	[UC_LiquidDamage] [bit] NULL,
	[UC_KeyPadDamage] [bit] NULL,
	[UC_Missingparts] [bit] NULL,
	[UC_Connectordamage] [bit] NULL,
	[UC_Displaydamage] [bit] NULL,
	[FC_Notworking] [bit] NULL,
	[FC_Nodisplay] [bit] NULL,
	[FC_Hanging] [bit] NULL,
	[FC_Lowsignal] [bit] NULL,
	[FC_Notcharging] [bit] NULL,
	[FC_Cameranotworking] [bit] NULL,
	[FC_Autoswitchoff] [bit] NULL,
	[FC_Batterydrainslast] [bit] NULL,
	[FC_Noringing] [bit] NULL,
	[FC_Nosound] [bit] NULL,
	[FC_Calldrops] [bit] NULL,
	[FC_Keypadnotworking] [bit] NULL,
	[FC_Touchpanelnotworking] [bit] NULL,
	[FC_WiFinotworking] [bit] NULL,
	[Fault_Description] [nchar](50) NULL,
	[RMA_No] [nchar](50) NULL,
	[Customer_signature] [image] NULL,
	[PAGE_IMAGES] [nchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ID_Card]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ID_Card](
	[Barcode] [nchar](25) NULL,
	[Name] [nchar](50) NULL,
	[ID_Number] [nchar](50) NULL,
	[Nationality] [nchar](25) NULL,
	[Sex] [nchar](50) NULL,
	[BirthDate] [smalldatetime] NULL,
	[ExpiryDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Image] [image] NULL,
	[Audio] [image] NULL,
	[thump] [image] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jbrepair_2804]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jbrepair_2804](
	[Status] [varchar](100) NULL,
	[Expr1] [char](1) NOT NULL,
	[Expr2] [numeric](8, 0) NOT NULL,
	[Expr3] [char](8) NULL,
	[Expr4] [char](1) NULL,
	[Expr5] [char](4) NULL,
	[Expr6] [char](7) NULL,
	[Expr7] [char](10) NOT NULL,
	[Expr8] [char](10) NULL,
	[Expr9] [char](10) NULL,
	[Expr10] [char](10) NULL,
	[Expr11] [char](30) NULL,
	[Expr12] [char](8) NULL,
	[Expr13] [datetime] NULL,
	[Expr14] [datetime] NULL,
	[Expr15] [char](20) NULL,
	[Expr16] [char](30) NULL,
	[Expr17] [varchar](50) NULL,
	[Expr18] [varchar](20) NULL,
	[Expr19] [varchar](15) NULL,
	[Expr20] [varchar](18) NULL,
	[Expr21] [numeric](18, 2) NULL,
	[Expr22] [numeric](18, 3) NULL,
	[Expr23] [char](4) NULL,
	[Expr24] [bit] NOT NULL,
	[Expr25] [bit] NOT NULL,
	[Expr26] [bit] NOT NULL,
	[Expr27] [varchar](50) NULL,
	[Expr28] [varchar](10) NULL,
	[Expr29] [bit] NOT NULL,
	[Expr30] [bit] NOT NULL,
	[Expr31] [varchar](20) NULL,
	[Expr32] [bit] NOT NULL,
	[Expr33] [bit] NOT NULL,
	[Expr34] [varchar](50) NULL,
	[Expr35] [bit] NOT NULL,
	[Expr36] [bit] NOT NULL,
	[Expr37] [bit] NOT NULL,
	[Expr38] [bit] NOT NULL,
	[Expr39] [bit] NOT NULL,
	[Expr40] [varchar](50) NULL,
	[Expr41] [numeric](18, 2) NULL,
	[Expr42] [numeric](18, 3) NULL,
	[Expr43] [smallint] NULL,
	[Expr44] [char](15) NULL,
	[Expr45] [smalldatetime] NULL,
	[Expr46] [smalldatetime] NULL,
	[Expr47] [smallint] NULL,
	[Expr48] [char](8) NULL,
	[Expr49] [smalldatetime] NULL,
	[Expr50] [smalldatetime] NULL,
	[Expr51] [varchar](50) NULL,
	[Expr52] [datetime] NULL,
	[Expr53] [char](5) NULL,
	[Expr54] [datetime] NULL,
	[Expr55] [char](5) NULL,
	[Expr56] [datetime] NULL,
	[Expr57] [char](5) NULL,
	[Expr58] [bit] NOT NULL,
	[Expr59] [int] NULL,
	[Expr60] [bit] NOT NULL,
	[Expr61] [varchar](50) NULL,
	[Expr62] [varchar](250) NULL,
	[Expr63] [datetime] NULL,
	[Expr64] [char](5) NULL,
	[Expr65] [numeric](18, 2) NULL,
	[Expr66] [numeric](18, 3) NULL,
	[Expr67] [numeric](18, 2) NULL,
	[Expr68] [numeric](18, 3) NULL,
	[Expr69] [smallint] NULL,
	[Expr70] [varchar](50) NULL,
	[Expr71] [numeric](18, 2) NULL,
	[Expr72] [numeric](18, 3) NULL,
	[Expr73] [varchar](50) NULL,
	[Expr74] [numeric](18, 2) NULL,
	[Expr75] [numeric](18, 3) NULL,
	[Expr76] [numeric](18, 2) NULL,
	[Expr77] [numeric](18, 3) NULL,
	[Expr78] [char](4) NULL,
	[Expr79] [numeric](18, 2) NULL,
	[Expr80] [numeric](18, 3) NULL,
	[Expr81] [char](4) NULL,
	[Expr82] [char](8) NULL,
	[Expr83] [char](8) NULL,
	[Expr84] [varchar](25) NULL,
	[Expr85] [smalldatetime] NULL,
	[Expr86] [varchar](20) NULL,
	[Expr87] [varchar](50) NULL,
	[Expr88] [varchar](50) NULL,
	[Expr89] [char](20) NULL,
	[Expr90] [nvarchar](250) NULL,
	[Expr91] [varchar](20) NULL,
	[Expr92] [smalldatetime] NULL,
	[Expr93] [varchar](50) NULL,
	[Expr94] [smalldatetime] NULL,
	[Expr95] [numeric](18, 2) NULL,
	[Expr96] [varchar](50) NULL,
	[Expr97] [char](10) NULL,
	[Expr98] [char](10) NULL,
	[Expr99] [char](10) NULL,
	[Expr100] [smalldatetime] NULL,
	[Expr101] [varchar](250) NULL,
	[Expr102] [smallint] NOT NULL,
	[Expr103] [smalldatetime] NULL,
	[Expr104] [smalldatetime] NULL,
	[Expr105] [smalldatetime] NULL,
	[Expr106] [smalldatetime] NULL,
	[Expr107] [varchar](50) NULL,
	[Expr108] [varchar](50) NULL,
	[Expr109] [varchar](50) NULL,
	[Expr110] [varchar](50) NULL,
	[Expr111] [char](10) NOT NULL,
	[Expr112] [bit] NOT NULL,
	[Expr113] [varchar](100) NULL,
	[Expr114] [char](1) NULL,
	[Expr115] [char](10) NULL,
	[Expr116] [char](1) NULL,
	[Expr117] [char](1) NULL,
	[Expr118] [char](1) NULL,
	[Expr119] [char](1) NULL,
	[Expr120] [char](10) NULL,
	[Expr121] [smalldatetime] NULL,
	[Expr122] [varchar](100) NULL,
	[Expr123] [numeric](1, 0) NULL,
	[Expr124] [char](10) NULL,
	[Expr125] [smalldatetime] NULL,
	[Expr126] [varchar](250) NULL,
	[Expr127] [numeric](18, 0) NULL,
	[Expr128] [smallint] NULL,
	[Expr129] [datetime] NULL,
	[Expr130] [char](1) NULL,
	[Expr131] [char](1) NULL,
	[Expr132] [char](10) NULL,
	[Expr133] [smalldatetime] NULL,
	[Expr134] [char](25) NULL,
	[Expr135] [char](25) NULL,
	[Expr136] [char](25) NULL,
	[Expr137] [char](8) NULL,
	[Expr138] [char](10) NULL,
	[Expr139] [char](10) NULL,
	[Expr140] [char](20) NULL,
	[Expr141] [char](8) NULL,
	[Expr142] [varchar](50) NULL,
	[Expr143] [smalldatetime] NULL,
	[Expr144] [char](1) NULL,
	[Expr145] [numeric](18, 2) NULL,
	[Expr146] [numeric](18, 3) NULL,
	[Expr147] [char](1) NULL,
	[Expr148] [numeric](18, 2) NULL,
	[Expr149] [numeric](18, 3) NULL,
	[Expr150] [numeric](18, 2) NULL,
	[Expr151] [numeric](18, 3) NULL,
	[Expr152] [varchar](500) NULL,
	[Expr153] [varchar](250) NULL,
	[Expr154] [numeric](18, 2) NULL,
	[Expr155] [numeric](18, 3) NULL,
	[Expr156] [varchar](250) NULL,
	[Expr157] [smallint] NULL,
	[Expr158] [char](20) NULL,
	[Expr159] [char](25) NULL,
	[Expr160] [varchar](100) NULL,
	[Expr161] [char](20) NULL,
	[Expr162] [char](20) NULL,
	[Expr163] [char](1) NULL,
	[Expr164] [varchar](250) NULL,
	[Expr165] [smalldatetime] NULL,
	[Expr166] [char](10) NULL,
	[Expr167] [char](10) NULL,
	[Expr168] [char](1) NULL,
	[Expr169] [smalldatetime] NULL,
	[Expr170] [char](10) NULL,
	[Expr171] [varchar](250) NULL,
	[Expr172] [int] NULL,
	[Expr173] [char](10) NULL,
	[Expr174] [int] NULL,
	[Expr175] [char](20) NULL,
	[Expr176] [char](20) NULL,
	[Expr177] [char](10) NULL,
	[Expr178] [numeric](18, 0) NULL,
	[Expr179] [char](1) NULL,
	[Expr180] [char](1) NULL,
	[Expr181] [char](1) NULL,
	[Expr182] [char](1) NULL,
	[Expr183] [char](1) NULL,
	[Expr184] [char](1) NULL,
	[Expr185] [char](1) NULL,
	[Expr186] [char](20) NULL,
	[Expr187] [char](8) NULL,
	[Expr188] [char](8) NULL,
	[Expr189] [char](5) NULL,
	[Expr190] [numeric](2, 0) NULL,
	[Expr191] [numeric](2, 0) NULL,
	[Expr192] [char](10) NULL,
	[Expr193] [char](1) NULL,
	[Expr194] [char](1) NULL,
	[Expr195] [smalldatetime] NULL,
	[Expr196] [char](10) NULL,
	[Expr197] [smalldatetime] NULL,
	[Expr198] [smallint] NULL,
	[Expr199] [int] NULL,
	[Expr200] [numeric](10, 2) NULL,
	[Expr201] [numeric](18, 2) NULL,
	[Expr202] [numeric](18, 2) NULL,
	[Expr203] [numeric](18, 2) NULL,
	[Expr204] [numeric](18, 2) NULL,
	[Expr205] [char](20) NULL,
	[Expr206] [char](20) NULL,
	[Expr207] [char](20) NULL,
	[Expr208] [char](1) NULL,
	[Expr209] [char](1) NULL,
	[Expr210] [varchar](250) NULL,
	[Expr211] [char](20) NULL,
	[Expr212] [char](20) NULL,
	[Expr213] [smalldatetime] NULL,
	[Expr214] [smalldatetime] NULL,
	[Expr215] [smallint] NULL,
	[Expr216] [numeric](18, 2) NULL,
	[Expr217] [numeric](18, 3) NULL,
	[Expr218] [int] NULL,
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
	[ESTAMT] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laptop_VendorMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Laptop_VendorMaster](
	[Location] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](100) NULL,
	[Address3] [varchar](100) NULL,
	[Telephone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Products] [varchar](250) NULL,
	[Brands] [varchar](250) NULL,
	[ID] [int] NOT NULL,
	[ContactPerson] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[Emailccid] [varchar](100) NULL,
	[TCRepairs] [int] NULL CONSTRAINT [DF_TCRepairs]  DEFAULT ('1'),
	[ServiceCenterLoc] [nvarchar](10) NULL,
	[City] [nvarchar](20) NULL,
	[LOCODE] [nchar](10) NULL,
	[NATIONALID] [varchar](50) NULL,
	[ECOCODE] [varchar](50) NULL,
	[POSTALCODE] [varchar](50) NULL,
 CONSTRAINT [PK_Laptop_VendorMaster] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
	[UserID] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginCredientials]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginCredientials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EncryptedValue] [nvarchar](500) NULL,
	[Country] [nvarchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Accessories]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Accessories](
	[AccessoryID] [int] IDENTITY(100,1) NOT NULL,
	[AccessoryDesc] [nvarchar](100) NOT NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[ShortName] [nvarchar](4) NULL,
 CONSTRAINT [PK_M_Accessories] PRIMARY KEY NONCLUSTERED 
(
	[AccessoryDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_BBCost]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_BBCost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RepairAction] [varchar](50) NULL,
	[Cost] [numeric](18, 2) NULL,
	[CustomerType] [varchar](20) NULL,
	[WarrantyType] [varchar](3) NULL,
 CONSTRAINT [PK_M_BBCost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_BikerDetails]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_BikerDetails](
	[SCP] [nvarchar](255) NULL,
	[Mode] [nvarchar](255) NULL,
	[Mall] [nvarchar](255) NULL,
	[Courier] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Driver] [nvarchar](255) NULL,
	[Zone] [nvarchar](255) NULL,
	[SCPID] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_BinMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_BinMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BinCode] [nvarchar](8) NOT NULL,
	[BinDescription] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[ServiceCentre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BinCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Brand]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Brand](
	[BrandCode] [varchar](50) NULL,
	[BrandDescr] [varchar](50) NULL,
	[ProductType] [varchar](100) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[REVENUE] [int] NULL CONSTRAINT [DF_M_Brand_REVENUE]  DEFAULT ((0)),
	[Type] [int] NULL,
	[REVENUENONTC] [int] NULL CONSTRAINT [DF_M_Brand_REVENUE1]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_BrandDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_BrandDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[BrandCode] [nvarchar](50) NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updaetd_On] [date] NULL,
	[Deleted] [nvarchar](1) NULL,
 CONSTRAINT [PK__M_BrandD__135C314D373CD852] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_CapacityPlaningCollection]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_CapacityPlaningCollection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[LocationName] [nvarchar](200) NULL,
	[WalkInCollection] [int] NULL,
	[WalkInDelivery] [int] NULL,
	[WalkInTotal] [int] NULL,
	[RetailCollection] [int] NULL,
	[RetailDelivery] [int] NULL,
	[RetailTotal] [int] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](20) NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_CapacityPlaningRepair]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_CapacityPlaningRepair](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[LocationName] [nvarchar](200) NULL,
	[DetailID] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[BrandName] [nvarchar](100) NULL,
	[EngineerPerDay] [int] NULL,
	[QCPerDay] [int] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](20) NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_CollectionLocations]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CollectionLocations](
	[CollectionPoint] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Emirate] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[WorkingHours] [varchar](150) NULL,
	[Etisalat] [int] NULL,
	[Slno] [int] NULL,
	[slno1] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CollectionLocations_Customer]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CollectionLocations_Customer](
	[CollectionPoint] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Emirate] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[WorkingHours] [varchar](150) NULL,
	[Etisalat] [int] NULL,
	[Slno] [int] NULL,
	[TypeofColl] [int] NULL,
	[Country] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CollLoc]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CollLoc](
	[LocationName] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[LocationCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Country]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Country](
	[cID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_M_Country] PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CRNRef]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_CRNRef](
	[CRNNo] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_DealerProduct]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_DealerProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DealerID] [nvarchar](15) NOT NULL,
	[DetailID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[BrandCode] [nvarchar](50) NULL,
	[Deleted] [nchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_DeliveryAgent]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_DeliveryAgent](
	[Agent_Code] [int] IDENTITY(1,1) NOT NULL,
	[Agent_Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NULL,
	[Country] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NULL,
	[Biker] [int] NULL,
	[Status] [char](1) NULL,
	[Target] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[CC] [nvarchar](500) NULL,
	[Type] [char](10) NULL,
 CONSTRAINT [PK_M_DeliveryAgent] PRIMARY KEY CLUSTERED 
(
	[Agent_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_DeliveryType]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_DeliveryType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryCode] [nvarchar](25) NOT NULL,
	[DeliveryDescription] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[ServiceCentre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Detail_Accessories]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Detail_Accessories](
	[AccessoryDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[DetailID] [int] NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_DUVoucher]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_DUVoucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FromAmount] [int] NULL,
	[ToAmount] [int] NULL,
	[Barcode] [varchar](25) NULL,
	[B_Used] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ECustomerMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ECustomerMaster](
	[CustomerCode] [char](10) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[Address3] [varchar](100) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Mobile] [varchar](25) NULL,
	[Email] [varchar](100) NULL,
	[CPerson] [varchar](100) NULL,
	[Currency] [varchar](100) NULL,
	[ExchangeRate] [numeric](18, 2) NULL,
 CONSTRAINT [PK_M_ECustomerMaster] PRIMARY KEY CLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ExchangePOutlet]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ExchangePOutlet](
	[SlNo] [int] NULL,
	[Emirate] [varchar](50) NULL,
	[RetailOutlet] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[WorkingHours] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_FormDetails]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_FormDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[FormID] [nvarchar](5) NOT NULL,
	[FormName] [nvarchar](100) NOT NULL,
	[FormType] [nvarchar](20) NULL,
	[Deleted] [nvarchar](1) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_On] [datetime] NULL,
	[Updated_By] [nvarchar](20) NULL,
	[Updated_On] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC,
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_FormDetails1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_FormDetails1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [nvarchar](5) NOT NULL,
	[FormName] [nvarchar](50) NULL,
	[FormType] [nvarchar](20) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](20) NULL,
	[Updated_On] [date] NULL,
	[ModuleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC,
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_HPBarcode]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_HPBarcode](
	[Amount] [float] NULL,
	[Barcode] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_LabelNames]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_LabelNames](
	[LabelID] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [nvarchar](max) NULL,
	[LabelTextEnglish] [nvarchar](max) NULL,
	[LabelTextArabic] [nvarchar](max) NULL,
	[LabelTextFarsi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Location]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Location](
	[Location] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_NCBarcode]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_NCBarcode](
	[Barcode] [float] NULL,
	[Amount] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Partner]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Partner](
	[PartnerCode] [char](25) NULL,
	[PartnerName] [varchar](50) NOT NULL,
	[SPartnerCode] [char](10) NULL,
	[Status] [nvarchar](1) NULL,
	[Country] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_M_Partner] PRIMARY KEY CLUSTERED 
(
	[PartnerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_PhysicalCondition]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_PhysicalCondition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhysicalCondition] [nvarchar](100) NOT NULL,
	[PhyConditionOtherLang] [nvarchar](200) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
 CONSTRAINT [PK__M_Physic__800B224EBD2257E7] PRIMARY KEY CLUSTERED 
(
	[PhysicalCondition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Product]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[Brand] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ProductType]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ProductType](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_M_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Reason]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Reason](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [varchar](100) NULL,
	[Responsable] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_RefurbCost]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_RefurbCost](
	[Type] [nvarchar](50) NULL,
	[Perc] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Samsung_Ref]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Samsung_Ref](
	[Transaction_Ref] [numeric](18, 0) NULL,
	[Update_Ref] [numeric](18, 0) NULL,
	[WarrTransaction_Ref] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_ServiceCenter_Location]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_ServiceCenter_Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCenterID] [int] NOT NULL,
	[LocationCode] [nvarchar](50) NOT NULL,
	[LocationName] [nvarchar](200) NOT NULL,
	[DetailID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[BrandCode] [nvarchar](50) NULL,
	[Created_By] [nvarchar](25) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](25) NULL,
	[Updated_On] [date] NULL,
	[Deleted] [nvarchar](1) NOT NULL CONSTRAINT [DF__M_Service__Delet__19C0A931]  DEFAULT ('N'),
 CONSTRAINT [PK__M_Servic__3214EC27B1C8C7AD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_SMSDealerMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_SMSDealerMaster](
	[CPName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[SNo] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_StandByUnits]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_StandByUnits](
	[IMEINo] [varchar](20) NOT NULL,
	[Brand] [char](25) NULL,
	[Model] [char](25) NULL,
	[Country] [varchar](50) NULL,
	[StockLocation] [varchar](50) NULL,
	[TrackingNo] [char](20) NULL,
	[JobNo] [numeric](8, 0) NULL,
	[Locode] [char](10) NULL,
	[Issued] [bit] NULL,
	[ProductID] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_SBU] PRIMARY KEY CLUSTERED 
(
	[IMEINo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Status]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](500) NULL,
	[OrderBy] [int] NULL,
	[LinkWith] [nvarchar](20) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
	[COMBINED_STATUS] [nvarchar](50) NULL,
	[COMBINED_ORDER] [int] NULL,
 CONSTRAINT [PK__M_Status__C8EE20435D6F53D9] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_VendorPriceList]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_VendorPriceList](
	[Vendor] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Model] [varchar](60) NULL,
	[Date] [smalldatetime] NULL,
	[MonthYear] [varchar](10) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[W_Price] [numeric](18, 2) NULL,
	[NW_Price] [numeric](18, 2) NULL,
	[MAvailable] [int] NULL,
	[MType] [char](1) NULL,
 CONSTRAINT [PK_M_VendorPriceList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_VendorPriceMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_VendorPriceMaster](
	[Vendor] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Model] [varchar](60) NULL,
	[Date] [smalldatetime] NULL,
	[MonthYear] [varchar](10) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[W_Price] [numeric](18, 2) NULL,
	[NW_Price] [numeric](18, 2) NULL,
	[MType] [char](1) NULL,
 CONSTRAINT [PK_M_VendorPriceMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_WarrantyData]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_WarrantyData](
	[Vendor] [nvarchar](255) NULL,
	[Txn_Code] [nvarchar](255) NULL,
	[Supp_Cust_Code] [nvarchar](255) NULL,
	[Doc_No] [float] NULL,
	[Model] [nvarchar](255) NULL,
	[IMEINo] [nvarchar](255) NULL,
	[ModelDesc] [nvarchar](255) NULL,
	[Brand] [nvarchar](255) NULL,
	[Product] [nvarchar](255) NULL,
	[Business_Unit] [nvarchar](255) NULL,
	[POP] [datetime] NULL,
	[ExpiryMonths] [int] NULL,
	[CreatedBy] [nvarchar](30) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[LOCN_CODE] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_WarrantyDataUpload]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_WarrantyDataUpload](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMEINO] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Model] [nvarchar](50) NULL,
	[PurchaseDate] [date] NULL,
	[WarrantyType] [int] NULL,
	[Product] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
	[ExpiryMonths] [int] NULL,
	[imeino2] [nvarchar](50) NULL,
	[imeino3] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IMEINO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_WarrantyType]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_WarrantyType](
	[WarrantyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WarrantyType] [nvarchar](25) NULL,
	[PriorityLevel] [int] NOT NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PriorityLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_X_PDTUser]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_X_PDTUser](
	[IMEINo] [char](15) NULL,
	[Name] [char](25) NULL,
	[MobNo] [varchar](13) NULL,
	[Target] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuGroup]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[ModuleID] [int] NULL,
	[MenuID] [int] NULL,
	[SaveOption] [nvarchar](1) NULL,
	[UpdateOption] [nvarchar](1) NULL,
	[DeleteOption] [nvarchar](1) NULL,
	[PrintOption] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[AuditOption] [nvarchar](1) NULL,
	[ViewOption] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menugroup_160518]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menugroup_160518](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[ModuleID] [int] NULL,
	[MenuID] [int] NULL,
	[SaveOption] [nvarchar](1) NULL,
	[UpdateOption] [nvarchar](1) NULL,
	[DeleteOption] [nvarchar](1) NULL,
	[PrintOption] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[AuditOption] [nvarchar](1) NULL,
	[ViewOption] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuLanguageMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuLanguageMaster](
	[ID] [int] NOT NULL DEFAULT ((0)),
	[Language] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MenuLanguageMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](200) NOT NULL,
	[MenuText] [nvarchar](200) NULL,
	[FormName] [nvarchar](200) NULL,
	[OrderBy] [int] NULL,
	[Type] [nvarchar](1) NULL,
	[ParentMenuID] [int] NULL,
	[ModuleID] [int] NOT NULL,
	[Status] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[FormType] [nvarchar](1) NOT NULL,
	[ReportID] [nvarchar](100) NULL,
	[URL] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuName] ASC,
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMaster](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleMenuMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMenuMaster](
	[ModuleName] [nvarchar](max) NOT NULL,
	[ModuleLink] [nvarchar](max) NULL,
	[ParentModuleID] [int] NOT NULL,
	[Active] [bit] NULL,
	[ModuleID] [int] NOT NULL,
	[OrderBy] [int] NULL,
	[MenuOptionID] [int] NULL,
 CONSTRAINT [PK__ModuleMe__2B747787C8C3CAAD] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NRV_M_Languagetext]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NRV_M_Languagetext](
	[LabelID] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [nvarchar](max) NULL,
	[LabelTextEnglish] [nvarchar](max) NULL,
	[LabelTextFarsi] [nvarchar](max) NULL,
	[LabelTextArabic] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Options]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[OptionName] [nvarchar](25) NOT NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OW_LABOURDATA]    Script Date: 12/01/2019 06:49:09 ******/
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
/****** Object:  Table [dbo].[OW_SRCENTER]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OW_SRCENTER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCenterID] [int] NOT NULL,
	[LocationCode] [nvarchar](50) NOT NULL,
	[LocationName] [nvarchar](200) NOT NULL,
	[DetailID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[BrandCode] [nvarchar](50) NULL,
	[Created_By] [nvarchar](25) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](25) NULL,
	[Updated_On] [date] NULL,
	[Deleted] [nvarchar](1) NOT NULL,
	[SRID] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Printed_Form]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Printed_Form](
	[InvNum] [nchar](15) NULL,
	[CRNNum] [nchar](15) NULL,
	[PDate] [smalldatetime] NULL,
	[Customer] [nchar](50) NULL,
	[Mobile] [nchar](15) NULL,
	[IMEI] [nchar](25) NULL,
	[Description] [nchar](100) NULL,
	[Supplier] [nchar](50) NULL,
	[Branch] [nchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Printed_Form_New]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Printed_Form_New](
	[CaseNumber] [nchar](50) NULL,
	[InvoiceNumber] [nchar](50) NULL,
	[PurchaseDate] [nchar](50) NULL,
	[Customer] [nchar](50) NULL,
	[CustomerContact] [nchar](50) NULL,
	[Product] [nchar](50) NULL,
	[SerialNumber] [nchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrintedForm]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintedForm](
	[CaseNumber] [nchar](20) NULL,
	[InvoiceNumber] [nchar](20) NULL,
	[PurchaseDate] [nchar](50) NULL,
	[Customer] [nchar](50) NULL,
	[CustomerContact] [nchar](50) NULL,
	[SerialNumber] [nchar](50) NULL,
	[Product] [nchar](50) NULL,
	[Warranty] [nchar](50) NULL,
	[SupplierName] [nchar](50) NULL,
	[Branch] [nchar](50) NULL,
	[Description] [nchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrintedTemplate]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintedTemplate](
	[CaseNumber] [nchar](25) NULL,
	[InvoiceNumber] [nchar](50) NULL,
	[PurchaseDate] [nchar](50) NULL,
	[Customer] [nchar](50) NULL,
	[CustomerContact] [nchar](50) NULL,
	[SerialNumber] [nchar](50) NULL,
	[Product] [nchar](50) NULL,
	[Warranty] [nchar](50) NULL,
	[SupplierName] [nchar](50) NULL,
	[Branch] [nchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REF]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[RoleModule]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleModule](
	[GroupCode] [char](5) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK__RoleModu__3214EC27245954BA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SwapMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SwapMaster](
	[Field1] [varchar](50) NULL,
	[Field2] [varchar](50) NULL,
	[Field3] [varchar](50) NULL,
	[Field4] [varchar](50) NULL,
	[Field5] [varchar](50) NULL,
	[Field6] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Accessories_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Accessories_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrackingNo] [char](20) NULL,
	[AccessoryID] [int] NULL,
	[Deleted] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BBClaimData]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BBClaimData](
	[SerialNo] [varchar](15) NULL,
	[IssueDate] [smalldatetime] NULL,
	[TicketRef] [char](20) NULL,
	[Model] [varchar](20) NULL,
	[IMEINo] [varchar](15) NULL,
	[CUSTOMERTYPE] [varchar](20) NULL,
	[CUSTOMERNAME] [varchar](70) NULL,
	[Location] [varchar](70) NULL,
	[DAP] [varchar](3) NULL,
	[FaultCode] [varchar](50) NULL,
	[CustRem] [varchar](450) NULL,
	[DateClosed] [smalldatetime] NULL,
	[WarrantyType] [varchar](3) NULL,
	[Category] [int] NULL,
	[Repname] [varchar](75) NULL,
	[Remarks] [varchar](500) NULL,
	[SwapModel] [varchar](15) NULL,
	[SIMEINO] [varchar](15) NULL,
	[CashRecdAmt] [numeric](18, 2) NULL,
	[JobNo] [numeric](8, 0) NULL,
	[InvRef] [char](8) NULL,
	[Period] [varchar](8) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CollectionPointName] [varchar](70) NULL,
	[DocumentNo] [int] NULL,
 CONSTRAINT [PK_T_BBClaimData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BBClaimData_Header]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BBClaimData_Header](
	[DocumentNo] [int] NOT NULL,
	[DocumentDate] [smalldatetime] NULL,
	[Period] [varchar](8) NULL,
	[LastClaimedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_T_BBClaimData_Header] PRIMARY KEY CLUSTERED 
(
	[DocumentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BookIssue]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BookIssue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](50) NULL,
	[BookStartNo] [numeric](5, 0) NULL,
	[BookEndNo] [numeric](5, 0) NULL,
	[ReceiverName] [varchar](50) NULL,
	[RecdDate] [smalldatetime] NULL,
	[CreatedDate] [smalldatetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Returned] [int] NULL,
	[ReturnedDate] [smalldatetime] NULL,
	[DocumentNo] [int] NULL,
	[DocumentDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Citymaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Citymaster](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[cID] [int] NULL,
	[City_Name] [nvarchar](50) NOT NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](20) NULL,
	[Updated_On] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CollectionRequest]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CollectionRequest](
	[RequestRef] [bigint] NOT NULL,
	[RequestDate] [smalldatetime] NULL,
	[CPCode] [char](10) NULL,
	[CPDescr] [varchar](100) NULL,
	[NoofUnits] [int] NULL,
	[CPerson] [varchar](50) NULL,
	[ReqType] [varchar](20) NULL,
	[CollAddress] [varchar](250) NULL,
	[OfficeTime] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Emirate] [varchar](50) NULL,
	[Status] [char](15) NULL,
	[FinalRef] [bigint] NULL,
	[TicketRef] [varchar](50) NULL,
	[CollectionType] [char](1) NULL CONSTRAINT [DF_T_CollectionRequest_CollectionType]  DEFAULT ((0)),
	[ClaimRef] [varchar](50) NULL,
	[DeviceType] [char](20) NULL CONSTRAINT [DF_T_CollectionRequest_DeviceType]  DEFAULT (''),
	[Dealer_CR] [int] NULL,
	[TCCollAddress] [varchar](250) NULL,
	[UpdatedBy] [char](15) NULL,
	[UpdatedDate] [datetime] NULL,
	[EWPartner] [nvarchar](20) NULL,
	[CollectionDateTime] [varchar](100) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[TrackingNo] [char](20) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[Product] [nvarchar](30) NULL,
	[Brand] [nvarchar](30) NULL,
 CONSTRAINT [PK_T_CollectionRequest] PRIMARY KEY CLUSTERED 
(
	[RequestRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CollectionRequest_Final]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CollectionRequest_Final](
	[Id] [bigint] NOT NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](100) NULL,
	[ReqDate] [smalldatetime] NULL,
	[Status] [char](15) NULL,
	[RequestRef] [bigint] NULL,
	[TicketRef] [varchar](10) NULL,
	[DocumentNo] [numeric](5, 0) NULL,
	[DocumentDate] [smalldatetime] NULL,
	[CollectionAgent] [varchar](50) NULL,
	[CollectionType] [char](1) NULL,
	[Collected] [int] NULL CONSTRAINT [DF_T_CollectionRequest_Final_Collected]  DEFAULT ((0)),
	[CollectedDate] [smalldatetime] NULL,
	[ClaimRef] [varchar](50) NULL,
	[Dealer_CR] [int] NULL,
	[TrackingNo] [char](20) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[Product] [nvarchar](30) NULL,
	[Brand] [nvarchar](30) NULL,
 CONSTRAINT [PK_T_CollectionRequest_Final] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CollectionRequest_Web]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CollectionRequest_Web](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](200) NULL,
	[MobileNo] [nvarchar](25) NULL,
	[Address] [nvarchar](500) NULL,
	[Productid] [int] NULL,
	[Product] [nvarchar](100) NULL,
	[DetailID] [int] NULL,
	[BrandCode] [nvarchar](100) NULL,
	[ModelID] [nvarchar](50) NULL,
	[Model] [nvarchar](100) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[CollectionRequired] [nchar](1) NULL,
	[CollectionDateTime] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedOn] [date] NULL,
	[Email] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_ConsignmentReceiptDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ConsignmentReceiptDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[ExchDocNo] [int] NULL,
	[DocumentNo] [char](10) NULL,
	[SerialNo] [varchar](50) NULL,
	[ReadDate] [varchar](50) NULL,
	[ReadTime] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ConsignmentReceiptDetail1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ConsignmentReceiptDetail1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[DocNo] [int] NULL,
	[DocumentNo] [char](10) NULL,
	[SerialNo] [varchar](50) NULL,
	[ReadDate] [varchar](50) NULL,
	[ReadTime] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ConsignmentReceitMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ConsignmentReceitMaster](
	[DocumentId] [int] NOT NULL,
	[DocumentDate] [smalldatetime] NULL,
 CONSTRAINT [PK_T_ConsignmentReceitMaster] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_ConsignmentReceitMaster1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ConsignmentReceitMaster1](
	[DocumentId] [int] NOT NULL,
	[DocumentDate] [smalldatetime] NULL,
 CONSTRAINT [PK_T_ConsignmentReceitMaster1] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CustomerFollowup_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CustomerFollowup_Detail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[TrackingNo] [char](20) NULL,
	[FollowupDate] [smalldatetime] NULL,
	[Followups] [nvarchar](400) NULL,
	[FollowupBy] [nvarchar](20) NULL,
	[Country] [nvarchar](4) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[Type] [nvarchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CustomerFollowup_Header]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CustomerFollowup_Header](
	[FollowupID] [int] IDENTITY(1,1) NOT NULL,
	[DocNo] [nchar](20) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[TrackingNo] [char](20) NULL,
	[CollectionPoint] [nvarchar](50) NULL,
	[CustomerFirstName] [nvarchar](50) NULL,
	[CustomerLastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nchar](30) NULL,
	[Product] [nvarchar](30) NULL,
	[Brand] [nvarchar](30) NULL,
	[Model] [nvarchar](30) NULL,
	[FaultDetails] [nvarchar](275) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[Country] [nvarchar](4) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](20) NULL,
	[UpdatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK__T_Custom__3EF1E05619C84D01] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailyBrand]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyBrand](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyPendingEmail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyPendingEmail](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyPendingEmail1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyPendingEmail1](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyPendingStatusReport]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyPendingStatusReport](
	[Date] [smalldatetime] NULL,
	[Status] [tinyint] NULL,
	[Report] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyRetailer]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyRetailer](
	[Date] [smalldatetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DailyStatusRegistry]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DailyStatusRegistry](
	[Date] [smalldatetime] NULL,
	[TotMail] [int] NULL,
	[SentMail] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DC_IssueDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DC_IssueDetail](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DC_IssueHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DC_IssueHeader](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_DC_IssueHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL,
	[LoginType] [nvarchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DC_ReceiptDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DC_ReceiptDetail](
	[ReceiptNo] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DC_ReceiptHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DC_ReceiptHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_DC_ReceiptHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[ReceiptFrom] [varchar](50) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DealerLog_Main]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DealerLog_Main](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocNo] [char](20) NOT NULL,
	[DCustomerID] [nchar](10) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[Prefix] [nchar](10) NULL,
	[DocDate] [smalldatetime] NULL,
	[IMEINO] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DeliveryHH]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DeliveryHH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SignDate] [smalldatetime] NULL,
	[CustomerSign] [image] NULL,
	[TechnocareSign] [image] NULL,
	[DocNo] [varchar](50) NULL,
 CONSTRAINT [PK_T_DeliveryHH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DeliveryHHD]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DeliveryHHD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrackingNo] [char](20) NULL,
	[IMEINo] [varchar](25) NULL,
	[Model] [varchar](25) NULL,
	[DcustomerID] [varchar](50) NULL,
	[DeviceIMEINo] [varchar](20) NULL,
	[UserID] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[DocNo] [varchar](50) NULL,
	[InvoiceNo] [varchar](20) NULL,
	[TranscationDate] [datetime] NULL,
 CONSTRAINT [PK_T_DeliveryHHD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DeliveryRecdCustomer]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DeliveryRecdCustomer](
	[MsgBody] [varchar](200) NULL,
	[Mobile] [varchar](50) NULL,
	[RecdDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Deposit_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Deposit_Detail](
	[DocNo] [char](8) NOT NULL,
	[InvType] [char](4) NOT NULL,
	[InvNo] [char](20) NOT NULL,
	[InvDate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[JobNo] [char](10) NULL,
	[TrackingNo] [char](20) NULL,
	[CusCode] [char](7) NULL,
	[CusName] [varchar](100) NULL,
	[InvAmt] [decimal](13, 2) NULL,
	[PaidAmt] [decimal](13, 2) NULL,
	[DepAmt] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NULL,
 CONSTRAINT [PK_DD] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[InvType] ASC,
	[InvNo] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Deposit_Header]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Deposit_Header](
	[DocNo] [char](8) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[RefNo] [char](8) NULL,
	[DeliveryType] [varchar](100) NULL,
	[PaymentType] [varchar](50) NULL,
	[Bank] [varchar](500) NULL,
	[ChqNo] [varchar](50) NULL,
	[ChqDate] [smalldatetime] NULL,
	[DeliveryAgent] [int] NULL,
	[DepositRef] [varchar](50) NULL,
	[DepositAmt] [decimal](13, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[XMLEXPORT] [int] NULL,
	[UsrId] [char](15) NULL,
	[Country] [char](10) NULL,
	[emailToFM] [tinyint] NULL,
	[PaymentType2] [nvarchar](50) NULL,
	[EXPORTDATE] [datetime] NULL,
 CONSTRAINT [PK_DH] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepositCan_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DepositCan_Detail](
	[DocNo] [char](8) NOT NULL,
	[InvType] [char](4) NOT NULL,
	[InvNo] [char](20) NOT NULL,
	[InvDate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[JobNo] [char](10) NULL,
	[TrackingNo] [char](20) NULL,
	[CusCode] [char](7) NULL,
	[CusName] [varchar](100) NULL,
	[InvAmt] [decimal](13, 2) NULL,
	[PaidAmt] [decimal](13, 2) NULL,
	[CanAmt] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NULL,
 CONSTRAINT [PK_DDC] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[InvType] ASC,
	[InvNo] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepositCan_Header]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DepositCan_Header](
	[DocNo] [char](8) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[RefNo] [char](8) NULL,
	[DeliveryType] [varchar](100) NULL,
	[PaymentType] [varchar](50) NULL,
	[Bank] [varchar](500) NULL,
	[ChqNo] [varchar](50) NULL,
	[ChqDate] [smalldatetime] NULL,
	[DeliveryAgent] [int] NULL,
	[DepositRef] [varchar](50) NULL,
	[CancelAmt] [decimal](13, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[UsrId] [char](15) NULL,
	[Country] [char](10) NULL,
	[PaymentType2] [nvarchar](50) NULL,
 CONSTRAINT [PK_DC] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepositReq_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DepositReq_Detail](
	[DocNo] [char](8) NOT NULL,
	[InvType] [char](4) NOT NULL,
	[InvNo] [char](20) NOT NULL,
	[InvDate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[JobNo] [char](10) NULL,
	[TrackingNo] [char](20) NULL,
	[CusCode] [char](7) NULL,
	[CusName] [varchar](100) NULL,
	[InvAmt] [decimal](13, 2) NULL,
	[PaidAmt] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NULL,
	[PmtDate] [smalldatetime] NULL,
	[ReqAmt] [decimal](13, 2) NULL,
	[CanAmt] [decimal](13, 2) NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[T_DepositReq_Detail] ADD [ActInvType] [char](4) NULL
 CONSTRAINT [PK_DRD] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[InvType] ASC,
	[InvNo] ASC,
	[locode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepositReq_Detail_0412]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DepositReq_Detail_0412](
	[DocNo] [char](8) NOT NULL,
	[InvType] [char](4) NOT NULL,
	[InvNo] [char](20) NOT NULL,
	[InvDate] [smalldatetime] NULL,
	[locode] [char](10) NOT NULL,
	[JobNo] [char](10) NULL,
	[TrackingNo] [char](20) NULL,
	[CusCode] [char](7) NULL,
	[CusName] [varchar](100) NULL,
	[InvAmt] [decimal](13, 2) NULL,
	[PaidAmt] [decimal](13, 2) NULL,
	[slno] [numeric](5, 0) NULL,
	[PmtDate] [smalldatetime] NULL,
	[ReqAmt] [decimal](13, 2) NULL,
	[CanAmt] [decimal](13, 2) NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[T_DepositReq_Detail_0412] ADD [ActInvType] [char](4) NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepositReq_Header]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DepositReq_Header](
	[DocNo] [nchar](8) NOT NULL,
	[DocDate] [smalldatetime] NULL,
	[DeliveryType] [nvarchar](100) NULL,
	[PaymentType] [nvarchar](100) NULL,
	[Bank] [nvarchar](500) NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[ChequeDate] [smalldatetime] NULL,
	[DeliveryAgent] [int] NULL,
	[DepositRef] [nvarchar](50) NULL,
	[DepositAmount] [decimal](13, 2) NULL,
	[Remarks] [nvarchar](200) NULL,
	[XMLEXPORT] [int] NULL,
	[UserID] [nchar](15) NULL,
	[Country] [nchar](10) NULL,
	[Confirmed] [bit] NULL,
	[ConfirmedDocNo] [nchar](8) NULL,
	[ConfirmedBy] [nchar](15) NULL,
	[CollectionPoint] [nvarchar](50) NULL,
	[PaymentType2] [nvarchar](50) NULL,
 CONSTRAINT [PK_DRH] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_DirectColl]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DirectColl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RejectComments] [varchar](250) NULL,
	[Docno] [numeric](6, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EmailAlerts]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EmailAlerts](
	[EmailAddress] [varchar](100) NULL,
	[EmailSent] [int] NULL CONSTRAINT [DF_T_EmailAlerts_EmailSent]  DEFAULT ((0)),
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EmailAlerts_0412]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EmailAlerts_0412](
	[EmailAddress] [varchar](100) NULL,
	[EmailSent] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EmailMsg]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EmailMsg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Docno] [varchar](10) NULL,
	[DCustomerID] [varchar](50) NULL,
	[CreatedDate] [smalldatetime] NULL CONSTRAINT [DF_T_EmailMsg_CreatedDate]  DEFAULT (getdate()),
	[SMSSent] [int] NOT NULL CONSTRAINT [DF_T_EmailMsg_SMSSent]  DEFAULT ((0)),
	[EMailSent] [int] NOT NULL CONSTRAINT [DF_T_EmailMsg_EMailSent]  DEFAULT ((0)),
	[MessageText] [varchar](500) NULL,
	[CreatedBy] [varchar](50) NULL,
	[subject] [varchar](500) NULL,
	[Dealer] [int] NULL,
	[DealerEmail] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EMS_IssueDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EMS_IssueDetail](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[CRNRef] [char](15) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](15) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](50) NULL,
	[IMEINo] [char](20) NULL,
	[FaultDetails] [varchar](250) NULL,
	[CustomerName] [varchar](50) NULL,
	[Mobile] [varchar](20) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerRef] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EMS_IssueHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EMS_IssueHeader](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Estimation]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Estimation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [int] NOT NULL,
	[IMEINo] [varchar](50) NULL,
	[DocumentDate] [smalldatetime] NULL,
	[TrackingNo] [char](20) NULL,
	[EstRemarks] [varchar](200) NULL,
	[EstAmount] [numeric](12, 2) NULL,
	[USERID] [char](10) NULL,
	[CRNRef] [char](30) NULL,
	[EmailSent] [int] NULL,
	[SMSSent] [int] NULL,
	[LiquidDamage] [int] NULL,
	[Cus_ApprovalRemarks] [varchar](200) NULL,
	[Approved_Status] [int] NULL,
	[ApprovedUserID] [char](10) NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[InvoiceAmt] [numeric](12, 2) NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[InvoiceUserID] [char](10) NULL,
	[InvoiceNo] [int] NULL,
	[InvoiceRemarks] [varchar](200) NULL,
	[PaymentReceivedStat] [tinyint] NOT NULL,
	[PaymentReceivedType] [varchar](50) NULL,
	[PaymentReceiveddate] [smalldatetime] NULL,
	[PaymentReceivedBy] [char](15) NULL,
	[PaymentReceived] [numeric](12, 2) NULL,
	[EmailSent_RetailPoint] [int] NULL,
	[EmailSent_CustomerApprovelRP] [int] NOT NULL,
	[EmailSent_DeliveryRP] [int] NOT NULL,
	[EmailSent_ServiceCentre] [int] NULL,
	[EstSMSSentDate] [smalldatetime] NULL,
	[EstEmailSentDate] [smalldatetime] NULL,
	[DeliveryAddress] [varchar](250) NULL,
	[noSMS_toCustomer] [int] NULL,
	[InvoiceRef] [char](20) NULL,
	[InvoiceRefDate] [smalldatetime] NULL,
	[PaymentReceivedAmoStat] [tinyint] NOT NULL,
	[PaymentReceivedRemarks] [varchar](200) NULL,
	[EWCompany] [varchar](500) NULL,
	[DeliveryType] [char](15) NULL,
	[PDocNo] [char](8) NULL,
	[PDate] [smalldatetime] NULL,
	[PStatus] [int] NULL,
	[PAmount] [decimal](13, 2) NULL,
	[CNStatus] [int] NULL,
	[CNAmt] [decimal](13, 2) NULL,
	[XMLEXPORT] [int] NULL,
	[ReqAmt] [decimal](13, 2) NULL,
 CONSTRAINT [PK_T_Estimation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DocumentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EWCollection_Request]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EWCollection_Request](
	[DocNo] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NOT NULL,
	[JobOrderId] [char](10) NULL,
	[JobOrderDate] [smalldatetime] NULL,
	[EWPartner] [varchar](20) NULL,
	[ClaimId] [char](10) NULL,
	[CustomerName] [varchar](100) NULL,
	[CusLastName] [varchar](50) NULL,
	[PhoneNo] [varchar](20) NULL,
	[Product] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[SerialNo] [varchar](20) NULL,
	[Client] [char](15) NULL,
	[Remark] [varchar](100) NULL,
	[UserId] [char](15) NULL,
	[RequestRef] [bigint] NULL,
	[TrackingNo] [char](20) NULL,
 CONSTRAINT [PK_EWCR] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Form_Master]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Form_Master](
	[Form_ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_ID] [int] NULL,
	[Form_Name] [nvarchar](50) NOT NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Form_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_IMarketing]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IMarketing](
	[DocNo] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NOT NULL,
	[PageName] [varchar](200) NULL,
	[URL] [varchar](300) NULL,
	[Variant] [varchar](5) NULL,
	[name] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[email_Date] [smalldatetime] NULL,
	[brand_and_type] [varchar](200) NULL,
	[telephone] [varchar](20) NULL,
	[problem_or_issue] [varchar](max) NULL,
	[ip_address] [varchar](30) NULL,
	[qualified_Stat] [tinyint] NOT NULL,
	[qualifiedDate] [smalldatetime] NULL,
	[qualifiedBy] [char](10) NULL,
	[Remark] [varchar](200) NULL,
	[SMSAlert] [bit] NOT NULL,
	[EmailAlert] [bit] NOT NULL,
	[CollectionRequest_Stat] [bit] NOT NULL,
	[CollectionRequest_No] [bigint] NULL,
	[UnitLoged] [bit] NOT NULL,
	[TrackingNo] [char](20) NULL,
 CONSTRAINT [PK_T_IMarketing] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IMarketing_Detail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IMarketing_Detail](
	[DocNo] [char](10) NOT NULL,
	[Id] [int] NOT NULL,
	[date] [smalldatetime] NULL,
	[followups] [varchar](max) NULL,
	[followupBy] [char](10) NULL,
 CONSTRAINT [PK_T_IMarketing_Detail] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IMarketing1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IMarketing1](
	[DocNo] [char](10) NOT NULL,
	[DocDate] [smalldatetime] NOT NULL,
	[PageName] [varchar](200) NULL,
	[URL] [varchar](300) NULL,
	[Variant] [varchar](5) NULL,
	[name] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[email_Date] [smalldatetime] NULL,
	[brand_and_type] [varchar](200) NULL,
	[telephone] [varchar](20) NULL,
	[problem_or_issue] [varchar](max) NULL,
	[ip_address] [varchar](30) NULL,
	[qualified_Stat] [tinyint] NOT NULL,
	[qualifiedDate] [smalldatetime] NULL,
	[qualifiedBy] [char](10) NULL,
	[Remark] [varchar](200) NULL,
	[SMSAlert] [bit] NOT NULL,
	[EmailAlert] [bit] NOT NULL,
	[CollectionRequest_Stat] [bit] NOT NULL,
	[CollectionRequest_No] [bigint] NULL,
	[UnitLoged] [bit] NOT NULL,
	[TrackingNo] [char](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_KGTWarranty]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_KGTWarranty](
	[SNO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IMEINO] [varchar](50) NULL,
	[ITEMDESC] [varchar](500) NULL,
	[CUSTOMER] [varchar](500) NULL,
	[BILLDATE] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_KGTWarrantyNew]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_KGTWarrantyNew](
	[IMEINo] [char](20) NULL,
	[ItemDesc] [varchar](50) NULL,
	[WDate] [smalldatetime] NULL,
	[Filename] [varchar](25) NULL,
	[Customer] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Label_Master]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Label_Master](
	[Label_ID] [int] IDENTITY(1,1) NOT NULL,
	[Form_ID] [int] NULL,
	[Label_Name] [nvarchar](50) NOT NULL,
	[Label_Text] [nvarchar](500) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
	[Tool_Tip] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Label_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Language_Mapping]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Language_Mapping](
	[Language_Mapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Label_ID] [int] NULL,
	[Language_ID] [int] NULL,
	[Label_Text] [nvarchar](500) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
	[tool_tip] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Language_Mapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Language_Mapping_bkp]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Language_Mapping_bkp](
	[Language_Mapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Label_ID] [int] NULL,
	[Language_ID] [int] NULL,
	[Label_Text] [nvarchar](500) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
	[tool_tip] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Language_Master]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Language_Master](
	[Language_ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Short] [nvarchar](5) NOT NULL,
	[Language_Name] [nvarchar](50) NOT NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Language_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Laptop_IssueDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_IssueDetail](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[CRNRef] [char](250) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](15) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](250) NULL,
	[CustomerName] [varchar](100) NULL,
	[Mobile] [varchar](20) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Laptop_IssueHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_IssueHeader](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Laptop_PartnerID]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_PartnerID](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[ProdigyRef] [char](20) NULL,
	[NWAmount] [numeric](12, 0) NULL,
	[Dealer_ID] [int] NULL,
	[Location] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Laptop_PartnerIH]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_PartnerIH](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[DeliveryDate] [smalldatetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [char](10) NULL,
	[Location] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Laptop_ReceiptDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_ReceiptDetail](
	[ReceiptNo] [numeric](5, 0) NULL,
	[CRNRef] [char](250) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](15) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](50) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](250) NULL,
	[CustomerName] [varchar](90) NULL,
	[Mobile] [varchar](20) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Laptop_ReceiptHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Laptop_ReceiptHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[UserID] [char](10) NULL,
	[ReceiptFrom] [varchar](50) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_IssueDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_IssueDetail](
	[DeliveryNoteNo] [numeric](5, 0) NOT NULL,
	[ID] [int] NOT NULL,
	[DocumentNo] [int] NULL,
	[DocumentDate] [smalldatetime] NULL,
	[Enteredby] [varchar](50) NULL,
	[RecdFrom] [varchar](50) NULL,
	[ReceivedDate] [smalldatetime] NULL,
	[ReceivedBy] [varchar](50) NULL,
	[IMEINo] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_IssueHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_IssueHeader](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[UserID] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_IssueVendorDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_IssueVendorDetail](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[RMAREF] [char](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_IssueVendorHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_IssueVendorHeader](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_LC_IssueVendorHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_ReceiptVendorDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_ReceiptVendorDetail](
	[ReceiptNo] [numeric](5, 0) NULL,
	[CRNRef] [char](25) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[SIMEINO] [char](30) NULL,
	[RMAREF] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LC_ReceiptVendorHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LC_ReceiptVendorHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_LC_ReceiptVendorHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[ReceiptFrom] [varchar](50) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoginMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoginMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMEINo] [varchar](30) NULL,
	[CollRef] [char](10) NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](75) NULL,
	[DocDate] [datetime] NULL,
	[DocNo] [char](10) NULL,
	[AgentName] [varchar](50) NULL,
	[Product] [char](30) NULL,
	[Brand] [char](30) NULL,
	[Model] [nchar](30) NULL,
	[CustomerName] [varchar](75) NULL,
	[MobileNo] [varchar](20) NULL,
	[TranscationDate] [datetime] NULL,
	[FaultImage] [image] NULL,
	[RFID] [char](10) NULL,
	[TCReceived] [int] NULL,
	[TCReceiptDocno] [int] NULL,
 CONSTRAINT [PK_T_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MenuCategory]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MenuCategory](
	[MenuCategoryID] [int] NOT NULL,
	[MenuID] [int] NULL,
	[MenuCategoryName] [varchar](120) NULL,
	[MenuCategoryURL] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MenuMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MenuMaster](
	[MenuID] [int] NOT NULL,
	[ParentMenuName] [varchar](120) NULL,
	[ParentMenuURL] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PENDING]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PENDING](
	[ID] [int] NOT NULL,
	[STATUS] [varchar](100) NOT NULL,
	[TATDAYS] [varchar](14) NOT NULL,
	[VISTAQTY] [int] NULL,
	[NVISTAQTY] [int] NULL,
	[ASUSNBVISTA] [int] NULL,
	[ASUSNBNVISTA] [int] NULL,
	[ASUSTABVISTA] [int] NULL,
	[ASUSTABNVISTA] [int] NULL,
	[ASUSPADPHVISTA] [int] NULL,
	[ASUSPADPHNVISTA] [int] NULL,
	[ASUSAIOVISTA] [int] NULL,
	[ASUSAIONVISTA] [int] NULL,
	[ASUSOTHERSVISTA] [int] NULL,
	[ASUSOTHERSNVISTA] [int] NULL,
	[LENOVOVISTA] [int] NULL,
	[LENOVONVISTA] [int] NULL,
	[ACERVISTA] [int] NULL,
	[ACERNVISTA] [int] NULL,
	[SEAGATEVISTA] [int] NULL,
	[SEAGATENVISTA] [int] NULL,
	[WDVISTA] [int] NULL,
	[WDNVISTA] [int] NULL,
	[OTHERSDVISTA] [int] NULL,
	[OTHERSNVISTA] [int] NULL,
	[HTCVISTA] [int] NULL,
	[HTCNVISTA] [int] NULL,
	[CATVISTA] [int] NULL,
	[CATNVISTA] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PENDING1]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PENDING1](
	[ID] [int] NOT NULL,
	[STATUS] [varchar](22) NOT NULL,
	[TATDAYS] [varchar](14) NOT NULL,
	[VISTAQTY] [int] NULL,
	[NVISTAQTY] [int] NULL,
	[ASUSNBVISTA] [int] NULL,
	[ASUSNBNVISTA] [int] NULL,
	[ASUSTABVISTA] [int] NULL,
	[ASUSTABNVISTA] [int] NULL,
	[ASUSPADPHVISTA] [int] NULL,
	[ASUSPADPHNVISTA] [int] NULL,
	[ASUSAIOVISTA] [int] NULL,
	[ASUSAIONVISTA] [int] NULL,
	[ASUSOTHERSVISTA] [int] NULL,
	[ASUSOTHERSNVISTA] [int] NULL,
	[LENOVOVISTA] [int] NULL,
	[LENOVONVISTA] [int] NULL,
	[ACERVISTA] [int] NULL,
	[ACERNVISTA] [int] NULL,
	[SEAGATEVISTA] [int] NULL,
	[SEAGATENVISTA] [int] NULL,
	[WDVISTA] [int] NULL,
	[WDNVISTA] [int] NULL,
	[OTHERSDVISTA] [int] NULL,
	[OTHERSNVISTA] [int] NULL,
	[HTCVISTA] [int] NULL,
	[HTCNVISTA] [int] NULL,
	[CATVISTA] [int] NULL,
	[CATNVISTA] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PENDING2]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PENDING2](
	[ID] [int] NOT NULL,
	[STATUS] [varchar](48) NOT NULL,
	[TATDAYS] [varchar](14) NOT NULL,
	[VISTAQTY] [int] NULL,
	[NVISTAQTY] [int] NULL,
	[ASUSNBVISTA] [int] NULL,
	[ASUSNBNVISTA] [int] NULL,
	[ASUSTABVISTA] [int] NULL,
	[ASUSTABNVISTA] [int] NULL,
	[ASUSPADPHVISTA] [int] NULL,
	[ASUSPADPHNVISTA] [int] NULL,
	[ASUSAIOVISTA] [int] NULL,
	[ASUSAIONVISTA] [int] NULL,
	[ASUSOTHERSVISTA] [int] NULL,
	[ASUSOTHERSNVISTA] [int] NULL,
	[LENOVOVISTA] [int] NULL,
	[LENOVONVISTA] [int] NULL,
	[ACERVISTA] [int] NULL,
	[ACERNVISTA] [int] NULL,
	[SEAGATEVISTA] [int] NULL,
	[SEAGATENVISTA] [int] NULL,
	[WDVISTA] [int] NULL,
	[WDNVISTA] [int] NULL,
	[OTHERSDVISTA] [int] NULL,
	[OTHERSNVISTA] [int] NULL,
	[HTCVISTA] [int] NULL,
	[HTCNVISTA] [int] NULL,
	[CATVISTA] [int] NULL,
	[CATNVISTA] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Project_Master]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Project_Master](
	[Project_ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [nvarchar](50) NOT NULL,
	[Created_By] [nvarchar](50) NULL,
	[Created_On] [date] NULL,
	[Updated_By] [nvarchar](50) NULL,
	[Updated_On] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Project_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_RC_IssueDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueDetail](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_IssueDetail_040901]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueDetail_040901](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_IssueHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueHeader](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_RC_IssueHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_IssueHeader_040901]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueHeader_040901](
	[DeliveryNoteNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL,
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_IssueVendorDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueVendorDetail](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_IssueVendorHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_IssueVendorHeader](
	[DeliveryNoteNo] [numeric](6, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_RC_IssueVendorHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[TransferTo] [varchar](50) NULL,
	[Forwarder] [varchar](50) NULL,
	[AWBNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_ReceiptDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_ReceiptDetail](
	[ReceiptNo] [numeric](5, 0) NULL,
	[CRNRef] [char](25) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_ReceiptHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_ReceiptHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_RC_ReceiptHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[ReceiptFrom] [varchar](50) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_ReceiptVendorDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_ReceiptVendorDetail](
	[ReceiptNo] [numeric](5, 0) NULL,
	[CRNRef] [char](25) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[RMAREF] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RC_ReceiptVendorHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RC_ReceiptVendorHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_RC_ReceiptVendorHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[ReceiptFrom] [varchar](50) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Reason]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Reason](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [int] NULL,
	[Batchno] [int] NULL,
	[BatchID] [int] NULL,
	[IMEINo] [varchar](50) NULL,
	[DocumentDate] [smalldatetime] NULL,
	[TrackingNo] [char](20) NULL,
	[Reason] [varchar](50) NULL,
	[ReasonRemarks] [varchar](200) NULL,
	[Hold] [int] NULL,
	[UnHoldRemarks] [varchar](200) NULL,
	[USERID] [char](10) NULL,
	[UnholdDate] [smalldatetime] NULL,
	[UnHoldUSERID] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReceiptTCDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReceiptTCDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [numeric](6, 0) NULL,
	[IMEINo] [varchar](50) NULL,
	[Received] [int] NOT NULL CONSTRAINT [DF_T_ReceiptTCDetail_Received]  DEFAULT ((0)),
	[ReceivedBy] [varchar](50) NULL,
	[ReceivedDate] [smalldatetime] NULL,
	[Issued] [int] NOT NULL CONSTRAINT [DF_T_ReceiptTCDetail_Issued_To_Coordinator]  DEFAULT ((0)),
	[IssuedBy] [varchar](50) NULL,
	[IssuedDate] [smalldatetime] NULL,
	[DC_Received] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_DC_Received]  DEFAULT ((0)),
	[DC_ReceivedBy] [varchar](50) NULL,
	[DC_ReceivedDate] [smalldatetime] NULL,
	[LocationCode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[LaptopReceived] [int] NULL,
	[CSOCreated] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_CSOCreated]  DEFAULT ((0)),
	[CSOCreatedDate] [smalldatetime] NULL,
	[CSOCreatedBy] [varchar](50) NULL,
	[DC_Issued] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_DC_Issued]  DEFAULT ((0)),
	[DC_IssuedBy] [varchar](50) NULL,
	[DC_IssuedDate] [smalldatetime] NULL,
	[RC_Received] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_RC_Received]  DEFAULT ((0)),
	[RC_ReceivedBy] [varchar](50) NULL,
	[RC_ReceivedDate] [smalldatetime] NULL,
	[RC_Closed] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_RC_Closed]  DEFAULT ((0)),
	[RC_ClosedDate] [smalldatetime] NULL,
	[RC_Issued] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_RC_Issued]  DEFAULT ((0)),
	[RC_IssuedBy] [varchar](50) NULL,
	[RC_IssuedDate] [smalldatetime] NULL,
	[Rep_TC_Received] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_Rep_TC_Receipt]  DEFAULT ((0)),
	[Rep_TC_ReceivedDate] [smalldatetime] NULL,
	[Rep_TC_ReceivedBy] [varchar](50) NULL,
	[Dispatched] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_Dispatched]  DEFAULT ((0)),
	[DeliveryAgent] [varchar](50) NULL,
	[Dispatch_Invno] [numeric](5, 0) NULL,
	[Dispatch_Date] [smalldatetime] NULL,
	[Delivered_CP] [int] NULL CONSTRAINT [DF_T_ReceiptTCDetail_Delivered_CP]  DEFAULT ((0)),
	[Delivery_LocationType] [varchar](50) NULL,
	[Delivery_LocChange_Rem] [varchar](25) NULL,
	[TransferLocation] [varchar](50) NULL,
	[ProdigyRef] [char](20) NULL,
	[PartnerDelivery] [int] NULL,
	[PartnerDelivery_Date] [smalldatetime] NULL,
	[PartnerDelivery_No] [numeric](6, 0) NULL,
	[AWBNo] [char](15) NULL,
	[DCustomerID] [varchar](50) NULL,
	[DCustomerName] [varchar](100) NULL,
	[Hold] [int] NULL,
	[GrvReturn] [int] NULL,
	[GRVReturn_SupplierName] [varchar](50) NULL,
	[RFID] [numeric](6, 0) NULL,
	[HHID] [int] NULL,
	[HHLogDate] [smalldatetime] NULL,
	[Agent] [varchar](50) NULL,
	[TransferedTo_RC_DNRef] [numeric](5, 0) NULL,
	[TransferedTo_LC_DNRef] [numeric](5, 0) NULL,
	[ReceivedFrom_DC_ReceiptRef] [numeric](5, 0) NULL,
	[ReceivedFrom_RC_ReceiptRef] [numeric](5, 0) NULL,
	[RC_IssuedVendor] [int] NULL,
	[RC_IssuedByVendor] [char](15) NULL,
	[RC_IssuedDateVendor] [smalldatetime] NULL,
	[TransferedTo_LC_DNRefVendor] [numeric](6, 0) NULL,
	[Rep_TC_ReceivedVendor] [int] NULL,
	[Rep_TC_ReceivedDateVendor] [smalldatetime] NULL,
	[Rep_TC_ReceivedByVendor] [char](15) NULL,
	[ReceivedFrom_RC_ReceiptRefVendor] [numeric](6, 0) NULL,
	[DispatchedVendor] [int] NULL,
	[Dispatch_InvnoVendor] [numeric](6, 0) NULL,
	[Dispatch_DateVendor] [smalldatetime] NULL,
	[DispatchedByVendor] [char](15) NULL,
	[ReceivedVendor] [int] NULL,
	[ReceivedDateVendor] [smalldatetime] NULL,
	[ReceivedByVendor] [char](15) NULL,
	[ReceiptRefVendor] [numeric](6, 0) NULL,
	[LC_IssuedVendor] [int] NULL,
	[LC_IssuedByVendor] [char](15) NULL,
	[LC_IssuedDateVendor] [smalldatetime] NULL,
	[TransferedTo_RC_DNRefVendor] [numeric](6, 0) NULL,
	[LC_TC_ReceivedVendor] [int] NULL,
	[LC_TC_ReceivedDateVendor] [smalldatetime] NULL,
	[LC_TC_ReceivedByVendor] [char](15) NULL,
	[ReceivedFrom_LC_ReceiptRefVendor] [numeric](6, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReceiptTCHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReceiptTCHeader](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [bigint] NOT NULL,
	[DocumentDate] [smalldatetime] NULL CONSTRAINT [DF_T_ReceiptTCHeader_DocumentDate]  DEFAULT (getdate()),
	[Enteredby] [varchar](50) NULL,
	[Remarks] [varchar](50) NULL,
	[RecdFrom] [varchar](50) NULL,
	[AWBNo] [char](15) NULL,
	[Country] [char](10) NULL,
	[DCustomerID] [char](10) NULL,
	[DCustomerName] [varchar](100) NULL,
	[COSMOSREF] [varchar](50) NULL,
 CONSTRAINT [PK_T_ReceiptTCHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DocumentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReceiptVendorDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReceiptVendorDetail](
	[ReceiptNo] [numeric](6, 0) NULL,
	[CRNRef] [char](25) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [varchar](20) NULL,
	[Model] [varchar](50) NULL,
	[DCustomerID] [char](7) NULL,
	[DCustomerName] [varchar](75) NULL,
	[IMEINo] [char](30) NULL,
	[FaultDetails] [varchar](275) NULL,
	[CustomerName] [varchar](150) NULL,
	[Mobile] [varchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Locode] [char](10) NULL,
	[Jobno] [numeric](8, 0) NULL,
	[SIMEINO] [char](30) NULL,
	[RMAREF] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReceiptVendorHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReceiptVendorHeader](
	[ReceiptNo] [numeric](6, 0) NULL,
	[Date] [smalldatetime] NULL CONSTRAINT [DF_T_ReceiptVendorHeader_Date]  DEFAULT (getdate()),
	[UserID] [char](10) NULL,
	[ReceiverName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReceiveSMS]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ReceiveSMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[SMSNumberMemo] [nvarchar](20) NULL,
	[SMSDes] [nvarchar](200) NULL,
	[GetID] [nvarchar](20) NULL,
	[FromNumber] [nvarchar](20) NULL,
	[SMSNumberMemo1] [nvarchar](20) NULL,
	[M_ReceivedDate] [smalldatetime] NULL,
	[M_SRDate] [smalldatetime] NULL,
	[SMSDes1] [nvarchar](200) NULL,
	[Flag1] [bit] NULL,
	[Flag2] [bit] NULL,
	[Flag3] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Remarks]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Remarks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [int] NOT NULL,
	[IMEINo] [varchar](50) NULL,
	[DocumentDate] [smalldatetime] NULL,
	[TrackingNo] [char](20) NULL,
	[Remarks] [varchar](200) NULL,
	[USERID] [char](10) NULL,
	[CRNRef] [char](30) NULL,
 CONSTRAINT [PK_T_Remarks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DocumentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SA_ReceiveDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SA_ReceiveDetail](
	[ReceiptDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptNo] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [nvarchar](20) NULL,
	[Model] [nvarchar](50) NULL,
	[DCustomerID] [nvarchar](7) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[IMEINo] [nvarchar](30) NULL,
	[FaultDetails] [nvarchar](275) NULL,
	[CustomerName] [nvarchar](150) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[Locode] [nvarchar](10) NULL,
	[Jobno] [numeric](5, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SA_ReceiveHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SA_ReceiveHeader](
	[ReceiptNo] [numeric](5, 0) NULL,
	[ReceiptDate] [smalldatetime] NULL,
	[UserID] [nvarchar](20) NULL,
	[Transfer_To] [nvarchar](100) NULL,
	[Forwarder] [nvarchar](50) NULL,
	[AWBNo] [nvarchar](50) NULL,
	[LoginType] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_SA_TransferDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SA_TransferDetail](
	[TransferDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TransferID] [numeric](5, 0) NULL,
	[DealerRef] [char](20) NULL,
	[Brand] [nvarchar](25) NULL,
	[Model] [nvarchar](50) NULL,
	[DCustomerID] [nvarchar](7) NULL,
	[DCustomerName] [nvarchar](75) NULL,
	[IMEINo] [nvarchar](30) NULL,
	[FaultDetails] [nvarchar](275) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Dealer_ID] [int] NULL,
	[Locode] [nvarchar](10) NULL,
	[JobNo] [numeric](5, 0) NULL,
	[JobRef] [nvarchar](15) NULL,
	[CustomerName] [nvarchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SA_TransferHeader]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SA_TransferHeader](
	[TransferID] [numeric](5, 0) NULL,
	[TransferDate] [smalldatetime] NULL,
	[UserID] [nvarchar](20) NULL,
	[Transfer_To] [nvarchar](100) NULL,
	[Forwarder] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_SMSAlert_EMS]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SMSAlert_EMS](
	[SMSDate] [smalldatetime] NULL,
	[SMSSent] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_SmsCampain]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SmsCampain](
	[MobileNo] [varchar](50) NULL,
	[SMSSent] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SMSMessage]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SMSMessage](
	[Mob_No] [varchar](15) NULL,
	[message_Text] [varchar](max) NULL,
	[message_Type] [varchar](50) NULL,
	[dateOf_Sent] [smalldatetime] NULL,
	[dateOf_Delivered] [smalldatetime] NULL,
	[doc_No] [char](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SMSNotification]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SMSNotification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [smalldatetime] NULL,
	[MessageText] [varchar](500) NULL,
	[AgentName] [varchar](50) NULL,
	[AgentMobNo] [varchar](13) NULL,
	[IMEINo] [varchar](50) NULL,
	[SMSSent] [int] NULL,
 CONSTRAINT [PK_T_SMSNotification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TripAllocation]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TripAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentNo] [bigint] NULL,
	[DocumentDate] [smalldatetime] NULL,
	[CollectionAgent] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_VendorMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_VendorMaster](
	[Id] [int] NOT NULL,
	[VendorId] [varchar](50) NULL,
	[Vendor] [varchar](100) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[Address3] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[S_Address1] [varchar](50) NULL,
	[S_Address2] [varchar](50) NULL,
	[S_Address3] [varchar](50) NULL,
	[S_Phone] [varchar](50) NULL,
	[S_Fax] [varchar](50) NULL,
	[S_Email] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[S_Name] [varchar](50) NULL,
	[CPerson] [varchar](50) NULL,
	[S_CPerson] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WarrantyRejectedUnits]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WarrantyRejectedUnits](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrackingNo] [char](20) NULL,
	[IMEINO] [nvarchar](50) NULL,
	[CollectionPoint] [nvarchar](100) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Mobile] [nchar](30) NULL,
	[Product] [nchar](30) NULL,
	[Brand] [nchar](30) NULL,
	[Model] [nchar](30) NULL,
	[Remarks] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[WarrantyType] [nvarchar](25) NULL,
	[FaultDetails] [nvarchar](100) NULL,
	[UserID] [nchar](10) NULL,
	[RejectedDate] [smalldatetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WarrantyStatusLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WarrantyStatusLog](
	[Id] [int] NOT NULL,
	[TrackingNo] [char](20) NOT NULL,
	[WarrantyStatus] [char](1) NULL,
	[ChangedBy] [varchar](50) NULL,
	[ChangedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_WarrantyStatusLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[TrackingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMPINVPREFIX]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMPINVPREFIX](
	[locode] [nchar](10) NULL,
	[BRINVOICE_PREFIX] [char](6) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketDetails](
	[TicketID] [varchar](100) NULL,
	[EMail] [varchar](100) NULL,
	[ContactName] [varchar](100) NULL,
	[ContactNo] [varchar](100) NULL,
	[CreationDate] [smalldatetime] NULL,
	[IMEINo] [varchar](50) NULL,
	[PINNo] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[RECEIVED] [int] NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Description] [varchar](400) NULL,
	[SCPName] [varchar](100) NULL,
	[Fault] [varchar](100) NULL,
	[Brand] [varchar](50) NULL,
	[Product] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketDetails_CP]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketDetails_CP](
	[TicketID] [varchar](100) NULL,
	[EMail] [varchar](100) NULL,
	[ContactName] [varchar](100) NULL,
	[ContactNo] [varchar](100) NULL,
	[CreationDate] [smalldatetime] NULL,
	[IMEINo] [varchar](50) NULL,
	[PINNo] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[RECEIVED] [int] NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Description] [varchar](400) NULL,
	[SCPName] [varchar](100) NULL,
	[Fault] [varchar](250) NULL,
	[Brand] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPCSTISSUE]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPCSTISSUE](
	[PRODIGYREF] [char](20) NULL,
	[LOCATIONCODE] [char](10) NULL,
	[JOBNO] [numeric](5, 0) NULL,
	[RC_IssuedByVendor] [char](15) NULL,
	[RC_IssuedDateVendor] [smalldatetime] NULL,
	[TransferedTo_LC_DNRefVendor] [numeric](6, 0) NULL,
	[Rep_TC_ReceivedVendor] [int] NULL,
	[Rep_TC_ReceivedDateVendor] [smalldatetime] NULL,
	[Rep_TC_ReceivedByVendor] [char](15) NULL,
	[ReceivedFrom_RC_ReceiptRefVendor] [numeric](6, 0) NULL,
	[DispatchedVendor] [int] NULL,
	[Dispatch_InvnoVendor] [numeric](6, 0) NULL,
	[Dispatch_DateVendor] [smalldatetime] NULL,
	[DispatchedByVendor] [char](15) NULL,
	[ReceivedVendor] [int] NULL,
	[ReceivedDateVendor] [smalldatetime] NULL,
	[ReceivedByVendor] [char](15) NULL,
	[ReceiptRefVendor] [numeric](6, 0) NULL,
	[LC_IssuedVendor] [int] NULL,
	[LC_IssuedByVendor] [char](15) NULL,
	[LC_IssuedDateVendor] [smalldatetime] NULL,
	[TransferedTo_RC_DNRefVendor] [numeric](6, 0) NULL,
	[LC_TC_ReceivedVendor] [int] NULL,
	[LC_TC_ReceivedDateVendor] [smalldatetime] NULL,
	[LC_TC_ReceivedByVendor] [char](15) NULL,
	[ReceivedFrom_LC_ReceiptRefVendor] [numeric](6, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPLOCPREFIX]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPLOCPREFIX](
	[USERID] [nchar](10) NULL,
	[USERNAME] [nvarchar](250) NULL,
	[LOCPREFIX] [nchar](10) NULL,
	[BRTRACKING_PREFIX] [char](6) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[track]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[track](
	[album] [char](10) NOT NULL,
	[disk] [int] NOT NULL,
	[posn] [int] NOT NULL,
	[song] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[album] ASC,
	[disk] ASC,
	[posn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranLog](
	[TRANID] [int] IDENTITY(1,1) NOT NULL,
	[LOGDATE] [datetime] NULL,
	[TRCD] [nvarchar](4) NULL,
	[TRNO] [nvarchar](30) NULL,
	[USERID] [nvarchar](25) NULL,
	[OPTAG] [varchar](1) NULL,
	[MODULEID] [nvarchar](3) NULL,
	[REMARKS] [nvarchar](100) NULL,
 CONSTRAINT [PK__TranLog__6EF725E7D6BAD213] PRIMARY KEY CLUSTERED 
(
	[TRANID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRANLOG_DL]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRANLOG_DL](
	[TRNID] [int] IDENTITY(1,1) NOT NULL,
	[TRNDATE] [datetime] NOT NULL,
	[DOCNO] [char](20) NULL,
	[DocDate] [smalldatetime] NULL,
	[FinalWarranty] [int] NULL,
	[JobStatus] [int] NULL,
	[TransferTo_LC] [int] NULL,
	[ReceivedFrom_RC] [int] NULL,
	[Dispatched] [int] NULL,
	[DispatchDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroupMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupMaster](
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL,
	[ModuleID] [int] NOT NULL,
 CONSTRAINT [PK__UserGrou__0C4B934D9385C2E1] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC,
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[USERID] [char](15) NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[PASSWORD] [varchar](max) NULL,
	[CREATIONDATE] [smalldatetime] NULL,
	[LASTLOGINDATE] [smalldatetime] NULL,
	[CUSTOMERID] [char](7) NULL,
	[LOCPREFIX] [char](4) NULL,
	[EMAIL] [char](100) NULL,
	[EmailCC] [varchar](250) NULL,
	[ToEmail] [char](100) NULL,
	[TCLOC] [char](100) NULL,
	[BRAND] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Emirate] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CollectedBy] [varchar](20) NULL,
	[CustomerType] [varchar](20) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[Backenduser] [int] NULL CONSTRAINT [DF_UserMaster_Backenduser]  DEFAULT ((0)),
	[UserType] [int] NULL CONSTRAINT [DF_UserMaster_UserType]  DEFAULT ((0)),
	[FS_UserType] [int] NULL,
	[T] [int] IDENTITY(1,1) NOT NULL,
	[BBOffer] [int] NULL,
	[HTCOffer] [int] NULL,
	[NOKIAOffer] [int] NULL,
	[SiemensOffer] [int] NULL,
	[MotorolaOffer] [int] NULL,
	[GenericOffer] [int] NULL,
	[AppleOffer] [int] NULL CONSTRAINT [DF_UserMaster_AppleOffer]  DEFAULT ((0)),
	[LaptopOffer] [int] NULL,
	[IPADOffer] [int] NULL,
	[ThoshibaOffer] [int] NULL,
	[SonyOffer] [int] NULL,
	[Camera] [int] NULL,
	[MP3Player] [int] NULL,
	[GameConsole] [int] NULL,
	[MainPartnercode] [varchar](50) NULL,
	[MainSPartnercode] [varchar](50) NULL,
	[SubPartner] [int] NULL,
	[LastLabelID] [varchar](13) NULL,
	[CurrCode] [char](5) NULL,
	[ExchRate] [numeric](12, 4) NULL,
	[Laptop_LocationName] [varchar](50) NULL,
	[CF_LocationCode] [char](5) NULL,
	[Laptop_MasterLocation] [varchar](50) NULL,
	[CF_Prefix] [varchar](4) NULL,
	[Region] [varchar](20) NULL,
	[MainPartnerCode1] [varchar](50) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSUSERID] [char](15) NULL,
	[SendEmail] [tinyint] NOT NULL CONSTRAINT [DF_UserMaster_SendEmail]  DEFAULT ((0)),
	[Branch] [nchar](50) NULL,
	[Language_ID] [int] NULL,
	[MultipleLocation] [char](1) NULL,
	[Inactive] [int] NULL,
	[LOC] [varchar](50) NULL,
	[Laptop_VenderID] [int] NULL,
	[GroupID] [int] NULL,
	[CollectionRequired] [bit] NULL,
	[DiscPer] [numeric](18, 0) NULL CONSTRAINT [DF_UserMaster_DiscPer]  DEFAULT ((0)),
	[DefaultFormMenuID] [int] NULL,
	[Type] [nchar](1) NULL,
	[MenuType] [int] NULL,
	[EnggCode] [nvarchar](5) NULL,
	[DefaultCollectionPoint] [nvarchar](10) NULL,
	[DefaultLocationCode] [nvarchar](10) NULL,
	[CashPer] [numeric](18, 0) NULL CONSTRAINT [DF_UserMaster_CashPer]  DEFAULT ((0)),
	[CP_INCHARGE] [char](15) NULL,
	[USER_MODULE] [int] NULL CONSTRAINT [DF_UserMaster_USER_MODULE]  DEFAULT ((0)),
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[USERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usermaster_0400]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usermaster_0400](
	[USERID] [char](15) NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[PASSWORD] [varchar](max) NULL,
	[CREATIONDATE] [smalldatetime] NULL,
	[LASTLOGINDATE] [smalldatetime] NULL,
	[CUSTOMERID] [char](7) NULL,
	[LOCPREFIX] [char](4) NULL,
	[EMAIL] [char](100) NULL,
	[EmailCC] [varchar](250) NULL,
	[ToEmail] [char](100) NULL,
	[TCLOC] [char](100) NULL,
	[BRAND] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Emirate] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CollectedBy] [varchar](20) NULL,
	[CustomerType] [varchar](20) NULL,
	[DeliveryAgent] [varchar](50) NULL,
	[Backenduser] [int] NULL,
	[UserType] [int] NULL,
	[FS_UserType] [int] NULL,
	[T] [int] IDENTITY(1,1) NOT NULL,
	[BBOffer] [int] NULL,
	[HTCOffer] [int] NULL,
	[NOKIAOffer] [int] NULL,
	[SiemensOffer] [int] NULL,
	[MotorolaOffer] [int] NULL,
	[GenericOffer] [int] NULL,
	[AppleOffer] [int] NULL,
	[LaptopOffer] [int] NULL,
	[IPADOffer] [int] NULL,
	[ThoshibaOffer] [int] NULL,
	[SonyOffer] [int] NULL,
	[Camera] [int] NULL,
	[MP3Player] [int] NULL,
	[GameConsole] [int] NULL,
	[MainPartnercode] [varchar](50) NULL,
	[MainSPartnercode] [varchar](50) NULL,
	[SubPartner] [int] NULL,
	[LastLabelID] [varchar](13) NULL,
	[CurrCode] [char](5) NULL,
	[ExchRate] [numeric](12, 4) NULL,
	[Laptop_LocationName] [varchar](50) NULL,
	[CF_LocationCode] [char](5) NULL,
	[Laptop_MasterLocation] [varchar](50) NULL,
	[CF_Prefix] [varchar](4) NULL,
	[Region] [varchar](20) NULL,
	[MainPartnerCode1] [varchar](50) NULL,
	[LoginType] [char](10) NULL,
	[COSMOSUSERID] [char](15) NULL,
	[SendEmail] [tinyint] NOT NULL,
	[Branch] [nchar](50) NULL,
	[Language_ID] [int] NULL,
	[MultipleLocation] [char](1) NULL,
	[Inactive] [int] NULL,
	[LOC] [varchar](50) NULL,
	[Laptop_VenderID] [int] NULL,
	[GroupID] [int] NULL,
	[CollectionRequired] [bit] NULL,
	[DiscPer] [numeric](18, 0) NULL,
	[DefaultFormMenuID] [int] NULL,
	[Type] [nchar](1) NULL,
	[MenuType] [int] NULL,
	[EnggCode] [nvarchar](5) NULL,
	[DefaultCollectionPoint] [nvarchar](10) NULL,
	[DefaultLocationCode] [nvarchar](10) NULL,
	[CashPer] [numeric](18, 0) NULL,
	[CP_INCHARGE] [char](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMasterDetail]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMasterDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](15) NULL,
	[ServiceCentreID] [int] NULL,
	[ServiceCentreName] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedOn] [date] NULL,
	[Deleted] [nvarchar](1) NULL,
	[LocationCode] [nvarchar](10) NULL,
	[LocationName] [nvarchar](50) NULL,
	[Category] [nchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WEB_MENUMASTER]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WEB_MENUMASTER](
	[MenuId] [int] NOT NULL,
	[MenuName] [nvarchar](max) NOT NULL,
	[MenuLink] [nvarchar](max) NULL,
	[ParentMenuID] [int] NOT NULL,
	[ModuleName] [varchar](10) NOT NULL,
	[Active] [bit] NULL,
	[OrderBy] [int] NULL,
	[LanguageId] [int] NULL,
 CONSTRAINT [PK__MenuMe__2B747787C8C3CAAD1] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WEB_USERRIGHTS]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEB_USERRIGHTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[ModuleID] [int] NULL,
	[MenuID] [int] NULL,
	[ViewOption] [nvarchar](1) NULL,
	[SaveOption] [nvarchar](1) NULL,
	[UpdateOption] [nvarchar](1) NULL,
	[DeleteOption] [nvarchar](1) NULL,
	[PrintOption] [nvarchar](1) NULL,
	[Deleted] [nvarchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [nvarchar](25) NULL,
	[UpdatedOn] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WeekEndsAndHolidays]    Script Date: 12/01/2019 06:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeekEndsAndHolidays](
	[DayOfWeekDate] [datetime] NULL,
	[DayName] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CollectionRequest] ADD  CONSTRAINT [DF_CollectionRequest_TotalUnits]  DEFAULT ((0)) FOR [TotalUnits]
GO
ALTER TABLE [dbo].[CollectionRequest] ADD  CONSTRAINT [DF_CollectionRequest_ReceivedDate]  DEFAULT (getdate()) FOR [ReceivedDate]
GO
ALTER TABLE [dbo].[CollectionRequest] ADD  CONSTRAINT [DF_CollectionRequest_Received]  DEFAULT ((0)) FOR [Received]
GO
ALTER TABLE [dbo].[CollectionRequest] ADD  CONSTRAINT [DF_CollectionRequest_CollectionType]  DEFAULT ((0)) FOR [CollectionType]
GO
ALTER TABLE [dbo].[Dealer_CollReq] ADD  CONSTRAINT [DF_Dealer_CollReq_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Dealer_CollReq] ADD  CONSTRAINT [DF_Dealer_CollReq_Backend]  DEFAULT ((0)) FOR [Backend]
GO
ALTER TABLE [dbo].[Dealer_CollReq] ADD  CONSTRAINT [DF_Dealer_CollReq_EmailSent]  DEFAULT ((0)) FOR [EmailSent]
GO
ALTER TABLE [dbo].[DOALog] ADD  CONSTRAINT [DF_DoaLog_UnitsAllocated_TC]  DEFAULT ((0)) FOR [UnitsAllocated_TC]
GO
ALTER TABLE [dbo].[DOALog] ADD  CONSTRAINT [DF_DoaLog_SMSSent_Customer]  DEFAULT ((0)) FOR [SMSSent_Customer]
GO
ALTER TABLE [dbo].[DOALog] ADD  CONSTRAINT [DF_DoaLog_SMSALERT]  DEFAULT ((0)) FOR [SMSALERT]
GO
ALTER TABLE [dbo].[M_ECustomerMaster] ADD  CONSTRAINT [DF_M_ECustomerMaster_ExchangeRate]  DEFAULT ((1)) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[M_VendorPriceList] ADD  CONSTRAINT [DF_M_VendorPriceList_MAvailable]  DEFAULT ((0)) FOR [MAvailable]
GO
ALTER TABLE [dbo].[T_BBClaimData_Header] ADD  CONSTRAINT [DF_T_BBClaimData_Header_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_BookIssue] ADD  CONSTRAINT [DF_T_BookIssue_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[T_BookIssue] ADD  CONSTRAINT [DF_T_BookIssue_Returned]  DEFAULT ((0)) FOR [Returned]
GO
ALTER TABLE [dbo].[T_ConsignmentReceitMaster1] ADD  CONSTRAINT [DF_T_ConsignmentReceitMaster1_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_DeliveryHH] ADD  CONSTRAINT [DF_T_DeliveryHH_SignDate]  DEFAULT (getdate()) FOR [SignDate]
GO
ALTER TABLE [dbo].[T_DeliveryRecdCustomer] ADD  CONSTRAINT [DF_T_DeliveryRecdCustomer_RecdDate]  DEFAULT (getdate()) FOR [RecdDate]
GO
ALTER TABLE [dbo].[T_EMS_IssueHeader] ADD  CONSTRAINT [DF_T_EMS_IssueHeader_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_PaymentReceivedStat]  DEFAULT ((0)) FOR [PaymentReceivedStat]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_EmailSent_CustomerApprovelRP]  DEFAULT ((0)) FOR [EmailSent_CustomerApprovelRP]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_EmailSent_DeliveryRP]  DEFAULT ((0)) FOR [EmailSent_DeliveryRP]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_noSMS_toCustomer]  DEFAULT ((0)) FOR [noSMS_toCustomer]
GO
ALTER TABLE [dbo].[T_Estimation] ADD  CONSTRAINT [DF_T_Estimation_PaymentReceivedAmoStat]  DEFAULT ((0)) FOR [PaymentReceivedAmoStat]
GO
ALTER TABLE [dbo].[T_IMarketing] ADD  CONSTRAINT [DF_T_IMarketing_approve]  DEFAULT ((0)) FOR [qualified_Stat]
GO
ALTER TABLE [dbo].[T_IMarketing] ADD  CONSTRAINT [DF_T_IMarketing_SMSAlert]  DEFAULT ((0)) FOR [SMSAlert]
GO
ALTER TABLE [dbo].[T_IMarketing] ADD  CONSTRAINT [DF_T_IMarketing_EmailAlert]  DEFAULT ((0)) FOR [EmailAlert]
GO
ALTER TABLE [dbo].[T_IMarketing] ADD  CONSTRAINT [DF_T_IMarketing_CollectionRequest_Stat]  DEFAULT ((0)) FOR [CollectionRequest_Stat]
GO
ALTER TABLE [dbo].[T_IMarketing] ADD  CONSTRAINT [DF_T_IMarketing_UnitLoged]  DEFAULT ((0)) FOR [UnitLoged]
GO
ALTER TABLE [dbo].[T_Laptop_IssueHeader] ADD  CONSTRAINT [DF_T_Laptop_IssueHeader_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[T_Laptop_PartnerIH] ADD  CONSTRAINT [DF_T_Laptop_PartnerIH_DeliveryDate]  DEFAULT (getdate()) FOR [DeliveryDate]
GO
ALTER TABLE [dbo].[T_Laptop_ReceiptHeader] ADD  CONSTRAINT [DF_T_Laptop_ReceiptHeader_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[T_LC_IssueHeader] ADD  CONSTRAINT [DF_T_LC_IssueHeader_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[T_Reason] ADD  CONSTRAINT [DF_T_Reason_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_Remarks] ADD  CONSTRAINT [DF_T_Remarks_DocumentDate]  DEFAULT (getdate()) FOR [DocumentDate]
GO
ALTER TABLE [dbo].[T_SMSAlert_EMS] ADD  CONSTRAINT [DF_T_SMSAlert_EMS_SMSSent]  DEFAULT ((0)) FOR [SMSSent]
GO
ALTER TABLE [dbo].[T_SMSNotification] ADD  CONSTRAINT [DF_T_SMSNotification]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[T_SMSNotification] ADD  CONSTRAINT [DF_T_SMSNotification_SMSSent]  DEFAULT ((0)) FOR [SMSSent]
GO
ALTER TABLE [dbo].[TicketDetails] ADD  CONSTRAINT [DF_TicketDetails_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[TicketDetails] ADD  CONSTRAINT [DF_TicketDetails_RECEIVED]  DEFAULT ((0)) FOR [RECEIVED]
GO
ALTER TABLE [dbo].[TicketDetails_CP] ADD  CONSTRAINT [DF_TicketDetails_CP_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[TicketDetails_CP] ADD  CONSTRAINT [DF_TicketDetails_CP_RECEIVED]  DEFAULT ((0)) FOR [RECEIVED]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[M_BrandDetail]  WITH CHECK ADD  CONSTRAINT [FK__M_BrandDe__Produ__71B2B7D7] FOREIGN KEY([ProductID])
REFERENCES [dbo].[M_ProductType] ([ProductID])
GO
ALTER TABLE [dbo].[M_BrandDetail] CHECK CONSTRAINT [FK__M_BrandDe__Produ__71B2B7D7]
GO
ALTER TABLE [dbo].[ModuleMenuMaster]  WITH CHECK ADD  CONSTRAINT [FK_ModuleMenuMaster_MenuLanguageMaster] FOREIGN KEY([MenuOptionID])
REFERENCES [dbo].[MenuLanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[ModuleMenuMaster] CHECK CONSTRAINT [FK_ModuleMenuMaster_MenuLanguageMaster]
GO
ALTER TABLE [dbo].[RoleModule]  WITH CHECK ADD  CONSTRAINT [FK_RoleModule_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[ModuleMenuMaster] ([ModuleID])
GO
ALTER TABLE [dbo].[RoleModule] CHECK CONSTRAINT [FK_RoleModule_Module]
GO
ALTER TABLE [dbo].[T_Citymaster]  WITH CHECK ADD FOREIGN KEY([cID])
REFERENCES [dbo].[M_Country] ([cID])
GO
ALTER TABLE [dbo].[T_Form_Master]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[T_Project_Master] ([Project_ID])
GO
ALTER TABLE [dbo].[T_Label_Master]  WITH CHECK ADD FOREIGN KEY([Form_ID])
REFERENCES [dbo].[T_Form_Master] ([Form_ID])
GO
ALTER TABLE [dbo].[T_Language_Mapping]  WITH CHECK ADD FOREIGN KEY([Label_ID])
REFERENCES [dbo].[T_Label_Master] ([Label_ID])
GO
ALTER TABLE [dbo].[T_Language_Mapping]  WITH CHECK ADD FOREIGN KEY([Language_ID])
REFERENCES [dbo].[T_Language_Master] ([Language_ID])
GO

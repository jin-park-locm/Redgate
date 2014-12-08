CREATE TABLE [dbo].[tblLP_BusListingContent_DELs]
(
[lAdvertiserID] [int] NOT NULL,
[szTagLine] [varchar] (175) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szReturnPolicy] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lLocationTotal] [int] NULL,
[lEmployeeTotal] [int] NULL,
[szYearEstablished] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sFemale] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sMinority] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sEmergency] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szAward] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCertification] [varchar] (180) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__27472386] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__283B47BF] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

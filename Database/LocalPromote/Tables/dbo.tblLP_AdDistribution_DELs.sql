CREATE TABLE [dbo].[tblLP_AdDistribution_DELs]
(
[ladvertiserid] [int] NOT NULL,
[lSiteID] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[lAdServiceType] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdD__DtDel__7E450DF3] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_AdD__Machi__7F39322C] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

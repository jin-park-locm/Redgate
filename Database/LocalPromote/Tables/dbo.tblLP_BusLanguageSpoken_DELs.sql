CREATE TABLE [dbo].[tblLP_BusLanguageSpoken_DELs]
(
[lLanguageID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__19ED2868] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__1AE14CA1] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_BusTwitter_DELs]
(
[lTableKey] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lTwitterID] [int] NOT NULL,
[szTwitterName] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__499C3B8A] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__4A905FC3] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

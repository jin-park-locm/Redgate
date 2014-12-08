CREATE TABLE [dbo].[tblLP_BusDescription_DELs]
(
[lBusDescID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__0E7B75BC] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__0F6F99F5] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

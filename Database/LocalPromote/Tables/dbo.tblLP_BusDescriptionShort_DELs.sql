CREATE TABLE [dbo].[tblLP_BusDescriptionShort_DELs]
(
[lAdvertiserID] [int] NOT NULL,
[szBusDescShort] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__1157E267] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__124C06A0] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

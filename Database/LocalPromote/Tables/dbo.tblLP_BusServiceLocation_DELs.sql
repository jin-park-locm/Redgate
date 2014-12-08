CREATE TABLE [dbo].[tblLP_BusServiceLocation_DELs]
(
[lBusLocationID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lStateCountyID] [int] NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__3E2A88DE] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__3F1EAD17] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

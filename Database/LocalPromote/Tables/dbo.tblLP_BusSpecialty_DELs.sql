CREATE TABLE [dbo].[tblLP_BusSpecialty_DELs]
(
[lSpecialtyID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[szSpecialtyDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__46BFCEDF] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__47B3F318] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

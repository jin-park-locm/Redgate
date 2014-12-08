CREATE TABLE [dbo].[tblLP_BusListingCat_DELs]
(
[lAdvertiserID] [int] NOT NULL,
[BDC] [int] NOT NULL,
[sPrimary] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__218E4A30] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__22826E69] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

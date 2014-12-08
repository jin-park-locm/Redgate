CREATE TABLE [dbo].[tblLP_BusPhotoImage_DELs]
(
[lPhotoImageID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lImageID] [int] NOT NULL,
[szImageTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szImageDesc] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__3871AF88] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__3965D3C1] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

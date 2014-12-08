CREATE TABLE [dbo].[tblLP_BusPhotoFile_DELs]
(
[lPhotoFileID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sPhotoType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhotoDesc] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFullLocation] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szThumbnail] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__359542DD] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__36896716] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_BusPhotoFile_0706_2010]
(
[lPhotoFileID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[sPhotoType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhotoDesc] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFullLocation] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szThumbnail] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

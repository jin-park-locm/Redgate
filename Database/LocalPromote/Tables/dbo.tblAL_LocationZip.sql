CREATE TABLE [dbo].[tblAL_LocationZip]
(
[lLocationID] [int] NOT NULL,
[ZipCode] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sCityType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sZipType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

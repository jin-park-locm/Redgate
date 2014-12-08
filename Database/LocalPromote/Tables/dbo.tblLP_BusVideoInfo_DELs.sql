CREATE TABLE [dbo].[tblLP_BusVideoInfo_DELs]
(
[lBusVideoInfoId] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lBusVideoTypeId] [int] NOT NULL,
[lBusVideoLocationId] [int] NOT NULL,
[szVideoTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szVideoDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dVideoBitRateBitsPerSec] [decimal] (18, 0) NULL,
[szVideoFileName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lVideoFramesPerSec] [int] NULL,
[dVideoFileSizeBytes] [decimal] (18, 0) NULL,
[lResWidth] [int] NULL,
[lResHeight] [int] NULL,
[lDurationInSeconds] [int] NULL,
[dtVideoCreated] [datetime] NULL,
[dtVideoLastEdited] [datetime] NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL,
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__4C78A835] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__4D6CCC6E] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

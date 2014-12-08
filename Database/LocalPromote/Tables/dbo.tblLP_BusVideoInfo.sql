CREATE TABLE [dbo].[tblLP_BusVideoInfo]
(
[lBusVideoInfoId] [int] NOT NULL IDENTITY(1, 1),
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
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__008AE713] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__017F0B4C] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusVideoInfoDEL] on [dbo].[tblLP_BusVideoInfo]
for delete
as
insert dbo.tblLP_BusVideoInfo_DELs(lBusVideoInfoId,lAdvertiserID,lBusVideoTypeId,lBusVideoLocationId,szVideoTitle,szVideoDesc,dVideoBitRateBitsPerSec,szVideoFileName,lVideoFramesPerSec,dVideoFileSizeBytes,lResWidth,lResHeight,lDurationInSeconds,dtVideoCreated,dtVideoLastEdited,dtActiveStart,dtActiveEnd,dtInsert,szInsertedBy,szUpdatedBy,dtUpdate)
select lBusVideoInfoId,lAdvertiserID,lBusVideoTypeId,lBusVideoLocationId,szVideoTitle,szVideoDesc,dVideoBitRateBitsPerSec,szVideoFileName,lVideoFramesPerSec,dVideoFileSizeBytes,lResWidth,lResHeight,lDurationInSeconds,dtVideoCreated,dtVideoLastEdited,dtActiveStart,dtActiveEnd,dtInsert,szInsertedBy,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusVideoInfo] ADD CONSTRAINT [PK_tblLP_BusVideoInfo] PRIMARY KEY NONCLUSTERED  ([lBusVideoInfoId]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_advertiserid] ON [dbo].[tblLP_BusVideoInfo] ([lAdvertiserID]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoInfo] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoInfo] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoInfo] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoInfo] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoInfo] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoInfo] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoInfo] TO [web_user]
GO

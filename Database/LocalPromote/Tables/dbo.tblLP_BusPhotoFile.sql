CREATE TABLE [dbo].[tblLP_BusPhotoFile]
(
[lPhotoFileID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[sPhotoType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhotoDesc] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFullLocation] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szThumbnail] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_BusPhotoFile_sActive] DEFAULT ('Y'),
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__3805392F] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusPhotoFileDEL] on [dbo].[tblLP_BusPhotoFile]
for delete
as
insert dbo.tblLP_BusPhotoFile_DELs(lPhotoFileID,lAdvertiserID,sPhotoType,szTitle,szPhotoDesc,szFullLocation,szThumbnail,sActive,szUpdatedBy,dtUpdate)
select lPhotoFileID,lAdvertiserID,sPhotoType,szTitle,szPhotoDesc,szFullLocation,szThumbnail,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusPhotoFile] ADD CONSTRAINT [tblLP_BusPhotoFile_PK] PRIMARY KEY NONCLUSTERED  ([lPhotoFileID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_AID] ON [dbo].[tblLP_BusPhotoFile] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_PhotoType_Active] ON [dbo].[tblLP_BusPhotoFile] ([sPhotoType], [sActive]) INCLUDE ([lAdvertiserID], [szFullLocation]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusPhotoFile] ADD CONSTRAINT [tblLP_BusPhotoFile_FK2] FOREIGN KEY ([sPhotoType]) REFERENCES [dbo].[tblAL_PhotoType] ([sPhotoType])
GO
GRANT SELECT ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusPhotoFile] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusPhotoFile] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusPhotoFile] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPhotoFile] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusPhotoFile] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusPhotoFile] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusPhotoFile] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusPhotoFile] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusPhotoFile] TO [web_user]
GO

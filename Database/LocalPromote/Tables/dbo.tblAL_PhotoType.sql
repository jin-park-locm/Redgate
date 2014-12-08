CREATE TABLE [dbo].[tblAL_PhotoType]
(
[sPhotoType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPhotoTypeName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Pho__dtUpd__1B68FA81] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_PhotoType] ADD CONSTRAINT [tblAL_PhotoType_PK] PRIMARY KEY NONCLUSTERED  ([sPhotoType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_PhotoType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_PhotoType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_PhotoType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_PhotoType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_PhotoType] TO [web_user]
GO

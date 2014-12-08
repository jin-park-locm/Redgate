CREATE TABLE [dbo].[tblAL_EmailType]
(
[sEmailType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szEmailTypeDesc] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Ema__dtUpd__47C69FAC] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_EmailType] ADD CONSTRAINT [tblAL_EmailType_PK] PRIMARY KEY NONCLUSTERED  ([sEmailType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_EmailType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_EmailType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_EmailType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_EmailType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_EmailType] TO [web_user]
GO

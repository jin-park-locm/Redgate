CREATE TABLE [dbo].[tblAL_Language]
(
[lLanguageID] [int] NOT NULL IDENTITY(1, 1),
[szLanguage] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Lan__dtUpd__49AEE81E] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Language] ADD CONSTRAINT [tblAL_Language_PK] PRIMARY KEY CLUSTERED  ([lLanguageID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_Language] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_Language] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_Language] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_Language] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_Language] TO [web_user]
GO

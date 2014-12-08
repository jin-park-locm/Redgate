CREATE TABLE [dbo].[tblAL_SecurityLevel]
(
[lSecurityLevelID] [int] NOT NULL IDENTITY(1, 1),
[szSecurityLevel] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Sec__dtUpd__4D7F7902] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_SecurityLevel] ADD CONSTRAINT [tblAL_SecurityLevel_PK] PRIMARY KEY NONCLUSTERED  ([lSecurityLevelID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_SecurityLevel] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_SecurityLevel] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_SecurityLevel] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_SecurityLevel] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_SecurityLevel] TO [web_user]
GO

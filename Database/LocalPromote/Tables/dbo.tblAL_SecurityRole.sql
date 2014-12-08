CREATE TABLE [dbo].[tblAL_SecurityRole]
(
[lSecurityRoleID] [int] NOT NULL IDENTITY(1, 1),
[szSecurityRole] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Sec__dtUpd__4AE3CED0] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_SecurityRole] ADD CONSTRAINT [tblAL_SecurityRole_PK] PRIMARY KEY CLUSTERED  ([lSecurityRoleID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_SecurityRole] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_SecurityRole] TO [web_user]
GO

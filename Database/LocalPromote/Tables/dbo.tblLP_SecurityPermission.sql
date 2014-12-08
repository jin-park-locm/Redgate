CREATE TABLE [dbo].[tblLP_SecurityPermission]
(
[lSecurityLevelID] [int] NOT NULL,
[lSecurityActionID] [int] NOT NULL,
[lSecurityRoleID] [int] NOT NULL,
[sSiteSpecific] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Sec__dtUpd__509CA826] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_SecurityPermission] ADD CONSTRAINT [tblLP_SecurityPermission_PK] PRIMARY KEY CLUSTERED  ([lSecurityLevelID], [lSecurityRoleID], [lSecurityActionID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_SecurityPermission] ADD CONSTRAINT [tblLP_SecurityPermission_FK1] FOREIGN KEY ([lSecurityActionID]) REFERENCES [dbo].[tblAL_SecurityAction] ([lSecurityActionID])
GO
ALTER TABLE [dbo].[tblLP_SecurityPermission] ADD CONSTRAINT [tblLP_SecurityPermission_FK3] FOREIGN KEY ([lSecurityLevelID]) REFERENCES [dbo].[tblAL_SecurityLevel] ([lSecurityLevelID])
GO
ALTER TABLE [dbo].[tblLP_SecurityPermission] ADD CONSTRAINT [tblLP_SecurityPermission_FK2] FOREIGN KEY ([lSecurityRoleID]) REFERENCES [dbo].[tblAL_SecurityRole] ([lSecurityRoleID])
GO
GRANT SELECT ON  [dbo].[tblLP_SecurityPermission] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_SecurityPermission] TO [web_user]
GO

CREATE TABLE [dbo].[tblAL_SecurityAction]
(
[lSecurityActionID] [int] NOT NULL IDENTITY(1, 1),
[szSecurityAction] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Sec__dtUpd__4DC03B7B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_SecurityAction] ADD CONSTRAINT [tblAL_SecurityAction_PK] PRIMARY KEY CLUSTERED  ([lSecurityActionID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_SecurityAction] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_SecurityAction] TO [web_user]
GO

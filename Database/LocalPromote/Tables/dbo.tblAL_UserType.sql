CREATE TABLE [dbo].[tblAL_UserType]
(
[sUserType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUserDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Use__dtUpd__11DF9047] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_UserType] ADD CONSTRAINT [tblAL_UserType_PK] PRIMARY KEY NONCLUSTERED  ([sUserType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_UserType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_UserType] TO [web_user]
GO

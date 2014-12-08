CREATE TABLE [dbo].[tblAL_DBState]
(
[sDBState] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDbStateDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_DBState] ADD CONSTRAINT [tblAL_DBState_PK] PRIMARY KEY NONCLUSTERED  ([sDBState]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_DBState] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_DBState] TO [web_user]
GO

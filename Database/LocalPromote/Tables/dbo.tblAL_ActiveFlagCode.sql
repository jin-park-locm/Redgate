CREATE TABLE [dbo].[tblAL_ActiveFlagCode]
(
[sActiveCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szActiveCodeName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Act__dtUpd__55CB7197] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_ActiveFlagCode] ADD CONSTRAINT [tblAL_ActiveFlagCode_PK] PRIMARY KEY CLUSTERED  ([sActiveCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_ActiveFlagCode] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_ActiveFlagCode] TO [web_user]
GO

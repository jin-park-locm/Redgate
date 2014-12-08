CREATE TABLE [dbo].[tblAL_ActionType]
(
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szActionDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Act__dtUpd__38845C1C] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_ActionType] ADD CONSTRAINT [tblAL_ActionType_PK] PRIMARY KEY NONCLUSTERED  ([sAction]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_ActionType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_ActionType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_ActionType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_ActionType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_ActionType] TO [web_user]
GO

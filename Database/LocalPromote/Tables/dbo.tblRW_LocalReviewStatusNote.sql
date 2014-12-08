CREATE TABLE [dbo].[tblRW_LocalReviewStatusNote]
(
[lStatusID] [int] NOT NULL,
[szStatusNote] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblRW_Loc__dtUpd__30B91D22] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReviewStatusNote] ADD CONSTRAINT [tblRW_LocalReviewStatusNote_PK] PRIMARY KEY NONCLUSTERED  ([lStatusID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReviewStatusNote] ADD CONSTRAINT [tblRW_LocalReviewStatusNote_FK1] FOREIGN KEY ([lStatusID]) REFERENCES [dbo].[tblRW_LocalReviewStatus] ([lStatusID])
GO
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [web_user]
GRANT INSERT ON  [dbo].[tblRW_LocalReviewStatusNote] TO [web_user]
GRANT DELETE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [web_user]
GRANT UPDATE ON  [dbo].[tblRW_LocalReviewStatusNote] TO [web_user]
GO

CREATE TABLE [dbo].[tblBDCTier4CatAction]
(
[sCatActCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCatActDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblBDCTie__dtUpd__1FCDBCEB] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier4CatAction] ADD CONSTRAINT [tblBDCTier4CatAction_PK] PRIMARY KEY NONCLUSTERED  ([sCatActCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [ClientService]
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatAction] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatAction] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatAction] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatAction] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDCTier4CatAction] TO [web_user]
GRANT INSERT ON  [dbo].[tblBDCTier4CatAction] TO [web_user]
GRANT DELETE ON  [dbo].[tblBDCTier4CatAction] TO [web_user]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatAction] TO [web_user]
GO

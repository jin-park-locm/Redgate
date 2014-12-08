CREATE TABLE [dbo].[tblBDCTier4CatType]
(
[sCatTypeCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCatTypeDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblBDCTie__dtUpd__21B6055D] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier4CatType] ADD CONSTRAINT [tblBDCTier4CatType_PK] PRIMARY KEY NONCLUSTERED  ([sCatTypeCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [ClientService]
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblBDCTier4CatType] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblBDCTier4CatType] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDCTier4CatType] TO [web_user]
GRANT INSERT ON  [dbo].[tblBDCTier4CatType] TO [web_user]
GRANT DELETE ON  [dbo].[tblBDCTier4CatType] TO [web_user]
GRANT UPDATE ON  [dbo].[tblBDCTier4CatType] TO [web_user]
GO

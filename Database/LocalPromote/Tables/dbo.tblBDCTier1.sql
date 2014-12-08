CREATE TABLE [dbo].[tblBDCTier1]
(
[lBDCTier1] [int] NOT NULL,
[szBDCDesc] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDisplayName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblBDCTie__dtUpd__182C9B23] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier1] ADD CONSTRAINT [tblBDCTier1_PK] PRIMARY KEY NONCLUSTERED  ([lBDCTier1]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [ClientService]
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblBDCTier1] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblBDCTier1] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblBDCTier1] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblBDCTier1] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblBDCTier1] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblBDCTier1] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblBDCTier1] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblBDCTier1] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblBDCTier1] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDCTier1] TO [web_user]
GRANT INSERT ON  [dbo].[tblBDCTier1] TO [web_user]
GRANT DELETE ON  [dbo].[tblBDCTier1] TO [web_user]
GRANT UPDATE ON  [dbo].[tblBDCTier1] TO [web_user]
GO

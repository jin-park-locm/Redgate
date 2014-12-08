CREATE TABLE [dbo].[tblLP_ProductLevel]
(
[lLevel] [int] NOT NULL IDENTITY(0, 1),
[szLevelDesc] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtAdd__4C0C31DC] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductLevel] ADD CONSTRAINT [tblLP_ProductLevel_PK] PRIMARY KEY NONCLUSTERED  ([lLevel]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductLevel] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductLevel] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductLevel] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductLevel] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductLevel] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductLevel] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductLevel] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductLevel] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductLevel] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductLevel] TO [web_user]
GO

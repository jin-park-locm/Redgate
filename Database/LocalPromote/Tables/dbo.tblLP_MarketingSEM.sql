CREATE TABLE [dbo].[tblLP_MarketingSEM]
(
[lSEM] [int] NOT NULL IDENTITY(1, 1),
[lCIDNo] [int] NOT NULL,
[szKeyword] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szGid] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtCreated] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mar__dtCre__418EA369] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MarketingSEM] ADD CONSTRAINT [tblLP_MarketingSEM_PK] PRIMARY KEY NONCLUSTERED  ([lSEM]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MarketingSEM] ADD CONSTRAINT [tblLP_MarketingSEM_FK1] FOREIGN KEY ([lCIDNo]) REFERENCES [dbo].[tblLP_ProductCampaign] ([lCIDNo])
GO
GRANT SELECT ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MarketingSEM] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MarketingSEM] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MarketingSEM] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MarketingSEM] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MarketingSEM] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MarketingSEM] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MarketingSEM] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MarketingSEM] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MarketingSEM] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MarketingSEM] TO [web_user]
GO

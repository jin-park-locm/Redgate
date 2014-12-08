CREATE TABLE [dbo].[tblLP_AdDistributionType]
(
[lDistTypeID] [int] NOT NULL IDENTITY(1, 1),
[szDistribution] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdD__dtUpd__18427513] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AdDistributionType] ADD CONSTRAINT [tblLP_AdDistributionType_PK] PRIMARY KEY NONCLUSTERED  ([lDistTypeID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_AdDistributionType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistributionType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistributionType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistributionType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AdDistributionType] TO [web_user]
GO

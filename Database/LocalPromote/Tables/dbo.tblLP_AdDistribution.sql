CREATE TABLE [dbo].[tblLP_AdDistribution]
(
[ladvertiserid] [int] NOT NULL,
[lSiteID] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[lAdServiceType] [int] NOT NULL CONSTRAINT [DF__tblLP_AdD__lAdSe__15660868] DEFAULT ('2'),
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdD__dtUpd__165A2CA1] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_AdDistributionDEL] on [dbo].[tblLP_AdDistribution]
for delete
as
insert dbo.tblLP_AdDistribution_DELs(ladvertiserid,lSiteID,lOrderNo,lAdServiceType,sActive,szUpdatedBy,dtUpdate)
select ladvertiserid,lSiteID,lOrderNo,lAdServiceType,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_AdDistribution] ADD CONSTRAINT [tblLP_AdDistribution_PK] PRIMARY KEY NONCLUSTERED  ([lSiteID], [ladvertiserid], [lOrderNo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_AdDistribution] ([ladvertiserid]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AdDistribution] ADD CONSTRAINT [tblLP_AdDistribution_FK4] FOREIGN KEY ([lAdServiceType]) REFERENCES [dbo].[tblLP_AdServiceAreaType] ([lAdServiceType])
GO
ALTER TABLE [dbo].[tblLP_AdDistribution] ADD CONSTRAINT [tblLP_AdDistribution_FK3] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
ALTER TABLE [dbo].[tblLP_AdDistribution] ADD CONSTRAINT [tblLP_AdDistribution_FK2] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_AdDistribution] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_AdDistribution] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_AdDistribution] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_AdDistribution] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_AdDistribution] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_AdDistribution] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AdDistribution] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_AdDistribution] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_AdDistribution] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_AdDistribution] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_PartnerSiteBilling]
(
[lSiteID] [int] NOT NULL,
[lBillingID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__6D8D2138] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteBilling] ADD CONSTRAINT [tblLP_PartnerSiteBilling_PK] PRIMARY KEY NONCLUSTERED  ([lSiteID], [lBillingID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteBilling] ADD CONSTRAINT [tblLP_PartnerSiteBilling_FK2] FOREIGN KEY ([lBillingID]) REFERENCES [dbo].[tblAL_BillingMethod] ([lBillingID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteBilling] ADD CONSTRAINT [tblLP_PartnerSiteBilling_FK1] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBilling] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBilling] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBilling] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBilling] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBilling] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_PartnerSiteType]
(
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteTypeDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__6BA4D8C6] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteType] ADD CONSTRAINT [tblLP_PartnerSiteType_PK] PRIMARY KEY NONCLUSTERED  ([sSiteType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteType] TO [web_user]
GO

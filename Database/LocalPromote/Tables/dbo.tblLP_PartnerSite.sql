CREATE TABLE [dbo].[tblLP_PartnerSite]
(
[lSiteID] [int] NOT NULL IDENTITY(2, 2),
[lPartnerID] [int] NOT NULL,
[lMemberID_Archive] [int] NULL,
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Par__sSite__37311087] DEFAULT ('PS'),
[szSiteName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteLogoPath] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSitePhone] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSSURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSSURLon] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_PartnerSite_sSSURLon] DEFAULT ('Y'),
[lDistTypeid] [int] NOT NULL,
[sMyKeyword] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_PartnerSite_sMyKeyword] DEFAULT ('N'),
[dtStart] [datetime] NOT NULL CONSTRAINT [DF_tblLP_PartnerSite_dtStart] DEFAULT (getdate()),
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__382534C0] DEFAULT (getdate()),
[SiteLongID] [uniqueidentifier] NULL CONSTRAINT [DF__tblLP_Par__SiteL__391958F9] DEFAULT (newid()),
[PartnerSiteBillingTypeID] [int] NULL,
[PartnerSiteZuoraKeyID] [int] NULL,
[AlternateProfileURLUse] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [tblLP_PartnerSite_PK] PRIMARY KEY NONCLUSTERED  ([lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_PartnerSite_partnerID] ON [dbo].[tblLP_PartnerSite] ([lPartnerID]) INCLUDE ([sActive], [sSiteType]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_Partnersite_SID] ON [dbo].[tblLP_PartnerSite] ([lSiteID]) INCLUDE ([sActive]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_PartnerSite_IdxSidPID] ON [dbo].[tblLP_PartnerSite] ([lSiteID], [lPartnerID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_PartnerSite_sActive] ON [dbo].[tblLP_PartnerSite] ([sActive]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_PartnerSite_ssURL_Active] ON [dbo].[tblLP_PartnerSite] ([szSSURL], [sActive]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [tblLP_PartnerSite_FK3] FOREIGN KEY ([lDistTypeid]) REFERENCES [dbo].[tblLP_AdDistributionType] ([lDistTypeID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [tblLP_PartnerSite_FK4] FOREIGN KEY ([lMemberID_Archive]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [tblLP_PartnerSite_FK1] FOREIGN KEY ([lPartnerID]) REFERENCES [dbo].[tblLP_Partner] ([lPartnerID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [FK_tblLP_PartnerSite_tblLP_PartnerSiteBillingType] FOREIGN KEY ([PartnerSiteBillingTypeID]) REFERENCES [dbo].[tblLP_PartnerSiteBillingType] ([ID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [FK_tblLP_PartnerSite_tblLP_PartnerSiteZuoraKey] FOREIGN KEY ([PartnerSiteZuoraKeyID]) REFERENCES [dbo].[tblLP_PartnerSiteZuoraKey] ([ID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSite] ADD CONSTRAINT [tblLP_PartnerSite_FK2] FOREIGN KEY ([sSiteType]) REFERENCES [dbo].[tblLP_PartnerSiteType] ([sSiteType])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [ELIBERATION\bacebedo]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [ELIBERATION\jtran]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [mlewis]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [mlewis]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [mlewis]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [mlewis]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerSite] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerSite] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSite] TO [web_user]
GO

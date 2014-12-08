CREATE TABLE [dbo].[tblLP_PartnerListing]
(
[lSiteID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sListingType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveY] [datetime] NOT NULL,
[dtActiveN] [datetime] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_PartnerListingDEL] on [dbo].[tblLP_PartnerListing]
for delete
as
insert dbo.tblLP_PartnerListing_DELs(lSiteID,lAdvertiserID,sListingType,sActive,szUpdatedBy,dtActiveY,dtActiveN)
select lSiteID,lAdvertiserID,sListingType,sActive,szUpdatedBy,dtActiveY,dtActiveN from deleted
GO
ALTER TABLE [dbo].[tblLP_PartnerListing] ADD CONSTRAINT [tblLP_PartnerListing_PK] PRIMARY KEY NONCLUSTERED  ([lSiteID], [lAdvertiserID], [sListingType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [tblLP_PartnerListing_idx_AID] ON [dbo].[tblLP_PartnerListing] ([lAdvertiserID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_PartnerListing_idxSidAct] ON [dbo].[tblLP_PartnerListing] ([lSiteID], [sActive], [lAdvertiserID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerListing] ADD CONSTRAINT [tblLP_PartnerListing_FK1] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_PartnerListing] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_PartnerListing] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_PartnerListing] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [ELIBERATION\jtran]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerListing] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_PartnerListing] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_PartnerListing] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_PartnerListing] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerListing] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerListing] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerListing] TO [web_user]
GO

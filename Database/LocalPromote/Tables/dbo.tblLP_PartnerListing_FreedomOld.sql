CREATE TABLE [dbo].[tblLP_PartnerListing_FreedomOld]
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
GRANT SELECT ON  [dbo].[tblLP_PartnerListing_FreedomOld] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerListing_FreedomOld] TO [web_user]
GO

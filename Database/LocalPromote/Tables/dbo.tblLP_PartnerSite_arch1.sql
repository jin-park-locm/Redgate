CREATE TABLE [dbo].[tblLP_PartnerSite_arch1]
(
[lSiteID] [int] NOT NULL IDENTITY(2, 2),
[lPartnerID] [int] NOT NULL,
[lMemberID] [int] NOT NULL,
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteLogoPath] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSitePhone] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSSURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lDistTypeid] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[SiteLongID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSite_arch1] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSite_arch1] TO [web_user]
GO

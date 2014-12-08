CREATE TABLE [dbo].[tblLP_Partnersite_ASR]
(
[lSiteID] [int] NOT NULL IDENTITY(2, 2),
[lPartnerID] [int] NOT NULL,
[lMemberID_Archive] [int] NULL,
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteLogoPath] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSitePhone] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSiteEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSSURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSSURLon] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lDistTypeid] [int] NOT NULL,
[sMyKeyword] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStart] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[SiteLongID] [uniqueidentifier] NULL,
[PartnerSiteBillingTypeID] [int] NULL,
[PartnerSiteZuoraKeyID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_Partnersite_ASR] ADD CONSTRAINT [PK_tblLP_Partnersite_ASR] PRIMARY KEY NONCLUSTERED  ([lSiteID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_PartnerSite_ASR_IdxSidPID] ON [dbo].[tblLP_Partnersite_ASR] ([lSiteID], [lPartnerID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO

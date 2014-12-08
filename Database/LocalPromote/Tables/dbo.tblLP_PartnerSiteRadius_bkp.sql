CREATE TABLE [dbo].[tblLP_PartnerSiteRadius_bkp]
(
[lSiteID] [int] NULL,
[lSearchMile] [int] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtUpdate] [datetime] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius_bkp] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius_bkp] TO [web_user]
GO

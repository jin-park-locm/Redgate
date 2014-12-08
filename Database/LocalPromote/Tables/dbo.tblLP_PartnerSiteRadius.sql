CREATE TABLE [dbo].[tblLP_PartnerSiteRadius]
(
[lSiteID] [int] NOT NULL,
[lSearchMile] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__03BC5979] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteRadius] ADD CONSTRAINT [tblLP_PartnerSiteRadius_PK] PRIMARY KEY NONCLUSTERED  ([lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteRadius] ADD CONSTRAINT [tblLP_PartnerSiteRadius_FK1] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteRadius] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteRadius] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteRadius] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius] TO [ELIBERATION\bacebedo]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteRadius] TO [ELIBERATION\bacebedo]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteRadius] TO [ELIBERATION\bacebedo]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteRadius] TO [ELIBERATION\bacebedo]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius] TO [mlewis]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteRadius] TO [mlewis]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteRadius] TO [mlewis]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteRadius] TO [mlewis]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteRadius] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_PartnerSiteZuoraKey]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[PartnerSiteID] [int] NOT NULL,
[ZuoraKey] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Created] [datetime] NOT NULL CONSTRAINT [DF_tblLP_PartnerSiteZuoraKey_Created] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteZuoraKey] ADD CONSTRAINT [PK_tblLP_PartnerSiteZuoraKey] PRIMARY KEY CLUSTERED  ([ID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteZuoraKey] ADD CONSTRAINT [FK_tblLP_PartnerSiteZuoraKey_tblLP_PartnerSite] FOREIGN KEY ([PartnerSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [LocalConnect]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [LocalConnect]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [LocalConnect]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [LocalConnect]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteZuoraKey] TO [web_user]
GO

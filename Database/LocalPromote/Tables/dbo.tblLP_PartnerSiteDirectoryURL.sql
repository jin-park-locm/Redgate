CREATE TABLE [dbo].[tblLP_PartnerSiteDirectoryURL]
(
[lSiteID] [int] NOT NULL,
[szSiteDirectoryURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__67EA21D2] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteDirectoryURL] ADD CONSTRAINT [tblLP_PartnerSiteDirectoryURL_PK] PRIMARY KEY CLUSTERED  ([lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteDirectoryURL] ADD CONSTRAINT [tblLP_PartnerSiteDirectoryURL_FK1] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteDirectoryURL] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteDirectoryURL] TO [web_user]
GO

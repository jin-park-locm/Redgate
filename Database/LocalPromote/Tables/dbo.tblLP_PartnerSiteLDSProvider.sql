CREATE TABLE [dbo].[tblLP_PartnerSiteLDSProvider]
(
[PID] [int] NOT NULL,
[lSiteID] [int] NOT NULL,
[ProviderID] [uniqueidentifier] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedby] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NULL CONSTRAINT [DF__tblLP_Par__dtAdd__1FF970CB] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteLDSProvider] ADD CONSTRAINT [tblLP_PartnerSiteLDSProvider_PK] PRIMARY KEY CLUSTERED  ([PID], [lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteLDSProvider] ADD CONSTRAINT [tblLP_PartnerSiteLDSProvider_FK2] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteLDSProvider] ADD CONSTRAINT [tblLP_PartnerSiteLDSProvider_FK1] FOREIGN KEY ([PID]) REFERENCES [dbo].[Provider] ([PID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteLDSProvider] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteLDSProvider] TO [web_user]
GO

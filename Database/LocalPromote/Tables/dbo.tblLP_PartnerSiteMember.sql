CREATE TABLE [dbo].[tblLP_PartnerSiteMember]
(
[lSiteID] [int] NOT NULL,
[lMemberID] [int] NOT NULL,
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sContact] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__6231487C] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteMember] ADD CONSTRAINT [tblLP_PartnerSiteMember_PK] PRIMARY KEY CLUSTERED  ([lSiteID], [lMemberID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_PartnerSiteMember_memberID] ON [dbo].[tblLP_PartnerSiteMember] ([lMemberID]) INCLUDE ([lSiteID], [sContact]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteMember] ADD CONSTRAINT [tblLP_PartnerSiteMember_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteMember] ADD CONSTRAINT [tblLP_PartnerSiteMember_FK1] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteMember] ADD CONSTRAINT [tblLP_PartnerSiteMember_FK3] FOREIGN KEY ([sSiteType]) REFERENCES [dbo].[tblLP_PartnerSiteType] ([sSiteType])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteMember] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteMember] TO [web_user]
GO

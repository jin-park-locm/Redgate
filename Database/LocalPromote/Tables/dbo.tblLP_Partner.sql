CREATE TABLE [dbo].[tblLP_Partner]
(
[lPartnerID] [int] NOT NULL IDENTITY(1, 2),
[lMemberID_Archive] [int] NULL,
[szPartnerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPartnerLogoPath] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sContactPhone] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPartnerEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSSURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szWebSite] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtStart] [datetime] NOT NULL CONSTRAINT [DF_tblLP_Partner_dtStart] DEFAULT (getdate()),
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__dtUpd__3454A3DC] DEFAULT (getdate()),
[PartnerBillingTypeID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_Partner] ADD CONSTRAINT [tblLP_Partner_PK] PRIMARY KEY NONCLUSTERED  ([lPartnerID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_Partner] ADD CONSTRAINT [tblLP_Partner_FK1] FOREIGN KEY ([lMemberID_Archive]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_Partner] ADD CONSTRAINT [FK_tblLP_Partner_tblLP_PartnerSiteBillingType] FOREIGN KEY ([PartnerBillingTypeID]) REFERENCES [dbo].[tblLP_PartnerSiteBillingType] ([ID])
GO
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_Partner] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_Partner] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [ELIBERATION\bacebedo]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_Partner] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_Partner] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_Partner] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_Partner] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_Partner] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_Partner] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_Partner] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_Partner] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_Partner] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_Partner] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_Partner] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_Partner] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_Partner] TO [web_user]
GO

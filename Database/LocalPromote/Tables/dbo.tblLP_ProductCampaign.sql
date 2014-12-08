CREATE TABLE [dbo].[tblLP_ProductCampaign]
(
[szCID] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lCIDNo] [int] NOT NULL IDENTITY(240, 1),
[lSiteID] [int] NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_lSiteID] DEFAULT ((2)),
[lProductID] [int] NOT NULL,
[szSpecialName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSpecialDesc] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[mSpecialPrice] [money] NULL,
[sDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_sDefault] DEFAULT ('N'),
[sDependency] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_sDependency] DEFAULT ('N'),
[sAutoDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_sAutoDefault] DEFAULT ('N'),
[sTimeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Pro__sTime__4376EBDB] DEFAULT ('A'),
[dtBeginning] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAdCenter] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_sAdCenter] DEFAULT ('Y'),
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__446B1014] DEFAULT (getdate()),
[lBillingCycle] [int] NOT NULL CONSTRAINT [DF_tblLP_ProductCampaign_lBillingCycle] DEFAULT ((2))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductCampaign] ADD CONSTRAINT [tblLP_ProductCampaign_PK] PRIMARY KEY NONCLUSTERED  ([lCIDNo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_ProductCampaign_idxCiDPID] ON [dbo].[tblLP_ProductCampaign] ([lProductID], [lCIDNo]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [tblLP_ProductCampaign_uidx_szCID] ON [dbo].[tblLP_ProductCampaign] ([szCID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [tblLP_ProductCampaign_Idx1] ON [dbo].[tblLP_ProductCampaign] ([szCID], [lCIDNo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductCampaign] ADD CONSTRAINT [tblLP_ProductCampaign_FK1] FOREIGN KEY ([lProductID]) REFERENCES [dbo].[tblLP_ProductList] ([lProductID])
GO
ALTER TABLE [dbo].[tblLP_ProductCampaign] ADD CONSTRAINT [tblLP_ProductCampaign_FK3] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblLP_PartnerSite] ([lSiteID])
GO
ALTER TABLE [dbo].[tblLP_ProductCampaign] ADD CONSTRAINT [tblLP_ProductCampaign_FK2] FOREIGN KEY ([sTimeCode]) REFERENCES [dbo].[tblAL_TimeTerm] ([sTimeCode])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [ELIBERATION\imarquais]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [ELIBERATION\imarquais]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [ELIBERATION\imarquais]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [ELIBERATION\imarquais]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [MktgAccess]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [MktgAccess]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [MktgAccess]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [MktgAccess]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaign] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaign] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaign] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaign] TO [web_user]
GO

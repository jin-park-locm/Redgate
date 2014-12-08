CREATE TABLE [dbo].[tblLP_BusListingCID]
(
[lBusCID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lCIDNo] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStatus] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtSta__30641767] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingCID] ADD CONSTRAINT [tblLP_BusListingCID_PK] PRIMARY KEY NONCLUSTERED  ([lBusCID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingCID] ADD CONSTRAINT [tblLP_BusListingCID_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
ALTER TABLE [dbo].[tblLP_BusListingCID] ADD CONSTRAINT [tblLP_BusListingCID_FK2] FOREIGN KEY ([lCIDNo]) REFERENCES [dbo].[tblLP_ProductCampaign] ([lCIDNo])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCID] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCID] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCID] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCID] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCID] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCID] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingCID] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingCID] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingCID] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCID] TO [web_user]
GO

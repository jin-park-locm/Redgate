CREATE TABLE [dbo].[tblLP_ProductCampaignPhoto]
(
[lCampaignPhotoID] [int] NOT NULL IDENTITY(1, 1),
[lCIDNo] [int] NULL,
[szLocation] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__4A23E96A] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductCampaignPhoto] ADD CONSTRAINT [tblLP_ProductCampaignPhoto_PK] PRIMARY KEY NONCLUSTERED  ([lCampaignPhotoID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductCampaignPhoto] ADD CONSTRAINT [tblLP_ProductCampaignPhoto_FK1] FOREIGN KEY ([lCIDNo]) REFERENCES [dbo].[tblLP_ProductCampaign] ([lCIDNo])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductCampaignPhoto] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductCampaignPhoto] TO [web_user]
GO

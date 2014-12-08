CREATE TABLE [dbo].[tblLP_PartnerSiteBillingType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[PartnerSiteID] [int] NOT NULL,
[BillingTypeID] [int] NOT NULL,
[Created] [datetime] NOT NULL,
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerSiteBillingType] ADD CONSTRAINT [PK_tblLP_PartnerSiteBillingType] PRIMARY KEY CLUSTERED  ([ID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBillingType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBillingType] TO [LocalConnect]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBillingType] TO [LocalConnect]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBillingType] TO [LocalConnect]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBillingType] TO [LocalConnect]
GRANT SELECT ON  [dbo].[tblLP_PartnerSiteBillingType] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerSiteBillingType] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerSiteBillingType] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerSiteBillingType] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_PartnerSiteBillingType_taylor]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[PartnerSiteID] [int] NOT NULL,
[BillingTypeID] [int] NOT NULL,
[Created] [datetime] NOT NULL,
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_PartnerBillingType_taylor]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[PartnerID] [int] NOT NULL,
[AllowMultipleBillingTypes] [bit] NOT NULL,
[DefaultBillingTypeID] [int] NOT NULL,
[Created] [datetime] NOT NULL,
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

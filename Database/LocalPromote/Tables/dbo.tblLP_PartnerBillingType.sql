CREATE TABLE [dbo].[tblLP_PartnerBillingType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[PartnerID] [int] NOT NULL,
[AllowMultipleBillingTypes] [bit] NOT NULL CONSTRAINT [DF_tblLP_PartnerBillingType_AllowMultipleBillingTypes] DEFAULT ((0)),
[DefaultBillingTypeID] [int] NOT NULL,
[Created] [datetime] NOT NULL CONSTRAINT [DF_tblLP_PartnerBillingType_Created] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerBillingType] ADD CONSTRAINT [PK_tblLP_PartnerBillingType] PRIMARY KEY CLUSTERED  ([ID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnerBillingType] ADD CONSTRAINT [FK_tblLP_PartnerBillingType_tblLP_BillingType] FOREIGN KEY ([DefaultBillingTypeID]) REFERENCES [dbo].[tblLP_BillingType] ([ID])
GO
ALTER TABLE [dbo].[tblLP_PartnerBillingType] ADD CONSTRAINT [FK_tblLP_PartnerBillingType_tblLP_Partner] FOREIGN KEY ([PartnerID]) REFERENCES [dbo].[tblLP_Partner] ([lPartnerID])
GO
GRANT SELECT ON  [dbo].[tblLP_PartnerBillingType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PartnerBillingType] TO [LocalConnect]
GRANT INSERT ON  [dbo].[tblLP_PartnerBillingType] TO [LocalConnect]
GRANT DELETE ON  [dbo].[tblLP_PartnerBillingType] TO [LocalConnect]
GRANT UPDATE ON  [dbo].[tblLP_PartnerBillingType] TO [LocalConnect]
GRANT SELECT ON  [dbo].[tblLP_PartnerBillingType] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_PartnerBillingType] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_PartnerBillingType] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_PartnerBillingType] TO [web_user]
GO

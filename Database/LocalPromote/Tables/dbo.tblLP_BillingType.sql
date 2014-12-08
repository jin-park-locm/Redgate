CREATE TABLE [dbo].[tblLP_BillingType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Created] [datetime] NOT NULL CONSTRAINT [DF_tblLP_BillingType_Created] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BillingType] ADD CONSTRAINT [PK_tblLP_BillingType] PRIMARY KEY CLUSTERED  ([ID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BillingType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BillingType] TO [LocalConnect]
GRANT INSERT ON  [dbo].[tblLP_BillingType] TO [LocalConnect]
GRANT DELETE ON  [dbo].[tblLP_BillingType] TO [LocalConnect]
GRANT UPDATE ON  [dbo].[tblLP_BillingType] TO [LocalConnect]
GRANT SELECT ON  [dbo].[tblLP_BillingType] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BillingType] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BillingType] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BillingType] TO [web_user]
GO

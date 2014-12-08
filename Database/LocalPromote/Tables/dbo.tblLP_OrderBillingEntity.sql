CREATE TABLE [dbo].[tblLP_OrderBillingEntity]
(
[lOBEID] [int] NOT NULL IDENTITY(1, 1),
[lOrderNo] [int] NOT NULL,
[lBillingEntityID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Ord__dtUpd__44A0E595] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_OrderBillingEntity] ADD CONSTRAINT [tblLP_OrderBillingEntity_PK] PRIMARY KEY CLUSTERED  ([lOBEID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_OrderBillingEntity] ADD CONSTRAINT [tblLP_OrderBillingEntity_FK2] FOREIGN KEY ([lBillingEntityID]) REFERENCES [dbo].[tblML_BillingEntity] ([lBillingEntityID])
GO
ALTER TABLE [dbo].[tblLP_OrderBillingEntity] ADD CONSTRAINT [tblLP_OrderBillingEntity_FK1] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
GRANT SELECT ON  [dbo].[tblLP_OrderBillingEntity] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_OrderBillingEntity] TO [web_user]
GO

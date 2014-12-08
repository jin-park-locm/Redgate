CREATE TABLE [dbo].[tblLP_ProductOrderPymt]
(
[lOrderPymtID] [int] NOT NULL IDENTITY(1, 1),
[lOrderNo] [int] NOT NULL,
[lCreditCardID] [int] NOT NULL,
[lTransactionID] [int] NOT NULL,
[mPymtAmount] [money] NOT NULL,
[sPymtType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__51C50B32] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrderPymt] ADD CONSTRAINT [tblLP_ProductOrderPymt_PK] PRIMARY KEY NONCLUSTERED  ([lOrderPymtID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrderPymt] ADD CONSTRAINT [tblLP_ProductOrderPymt_FK2] FOREIGN KEY ([lCreditCardID]) REFERENCES [dbo].[tblLP_MemberCCInfo] ([lCreditCardID])
GO
ALTER TABLE [dbo].[tblLP_ProductOrderPymt] ADD CONSTRAINT [tblLP_ProductOrderPymt_FK1] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
ALTER TABLE [dbo].[tblLP_ProductOrderPymt] ADD CONSTRAINT [tblLP_ProductOrderPymt_FK3] FOREIGN KEY ([lTransactionID]) REFERENCES [dbo].[tblLP_MemberCCTransaction] ([lTransactionID])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrderPymt] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrderPymt] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderPymt] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderPymt] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductOrderPymt] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductOrderPymt] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrderPymt] TO [web_user]
GO

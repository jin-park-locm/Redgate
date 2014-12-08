CREATE TABLE [dbo].[tblLP_BusPaymentMethod]
(
[lPymtTypeID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__361CF0BD] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusPaymentMethod] ADD CONSTRAINT [tblLP_BusPaymentMethod_PK] PRIMARY KEY NONCLUSTERED  ([lPymtTypeID], [lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_activePaymentType] ON [dbo].[tblLP_BusPaymentMethod] ([lAdvertiserID], [lPymtTypeID], [sActive]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusPaymentMethod] ADD CONSTRAINT [tblLP_BusPaymentMethod_FK1] FOREIGN KEY ([lPymtTypeID]) REFERENCES [dbo].[tblAL_PaymentType] ([lPymtTypeID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusPaymentMethod] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusPaymentMethod] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusPaymentMethod] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusPaymentMethod] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusPaymentMethod] TO [web_user]
GO

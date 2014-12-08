CREATE TABLE [dbo].[tblLP_CreditCardResponseReason]
(
[lResponseReasonID] [int] NOT NULL,
[szResponseReasonDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNotes] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Cre__dtUpd__46535886] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CreditCardResponseReason] ADD CONSTRAINT [tblLP_CreditCardResponseReason_PK] PRIMARY KEY NONCLUSTERED  ([lResponseReasonID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponseReason] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponseReason] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponseReason] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponseReason] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponseReason] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponseReason] TO [web_user]
GO

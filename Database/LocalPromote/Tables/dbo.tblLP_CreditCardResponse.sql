CREATE TABLE [dbo].[tblLP_CreditCardResponse]
(
[lResponseID] [int] NOT NULL,
[szResponseDesc] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Cre__dtUpd__483BA0F8] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CreditCardResponse] ADD CONSTRAINT [tblLP_CreditCardResponse_PK] PRIMARY KEY NONCLUSTERED  ([lResponseID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponse] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponse] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponse] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponse] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponse] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponse] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_CreditCardResponse] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_CreditCardResponse] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_CreditCardResponse] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_CreditCardResponse] TO [web_user]
GO

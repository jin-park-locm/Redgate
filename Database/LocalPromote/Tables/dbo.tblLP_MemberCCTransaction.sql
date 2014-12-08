CREATE TABLE [dbo].[tblLP_MemberCCTransaction]
(
[lTransactionID] [int] NOT NULL IDENTITY(1, 1),
[lCreditCardID] [int] NOT NULL,
[lMemberID] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[mPymtAmount] [money] NOT NULL CONSTRAINT [DF__tblLP_Mem__mAmou__597B3B93] DEFAULT ((0.00)),
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sApprovalCode] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lResponseID] [int] NOT NULL,
[lResponseReasonID] [int] NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__5A6F5FCC] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberCCTransaction] ADD CONSTRAINT [tblLP_MemberCCTransaction_PK] PRIMARY KEY NONCLUSTERED  ([lTransactionID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberCCTransaction] ADD CONSTRAINT [tblLP_MemberCCTransaction_FK1] FOREIGN KEY ([lCreditCardID]) REFERENCES [dbo].[tblLP_MemberCCInfo] ([lCreditCardID])
GO
ALTER TABLE [dbo].[tblLP_MemberCCTransaction] ADD CONSTRAINT [tblLP_MemberCCTransaction_FK4] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
ALTER TABLE [dbo].[tblLP_MemberCCTransaction] ADD CONSTRAINT [tblLP_MemberCCTransaction_FK2] FOREIGN KEY ([lResponseID]) REFERENCES [dbo].[tblLP_CreditCardResponse] ([lResponseID])
GO
ALTER TABLE [dbo].[tblLP_MemberCCTransaction] ADD CONSTRAINT [tblLP_MemberCCTransaction_FK3] FOREIGN KEY ([lResponseReasonID]) REFERENCES [dbo].[tblLP_CreditCardResponseReason] ([lResponseReasonID])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCTransaction] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCTransaction] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCTransaction] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberCCTransaction] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberCCTransaction] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberCCTransaction] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCTransaction] TO [web_user]
GO

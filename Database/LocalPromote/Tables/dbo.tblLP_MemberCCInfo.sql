CREATE TABLE [dbo].[tblLP_MemberCCInfo]
(
[lCreditCardID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NOT NULL,
[lPCardID] [int] NOT NULL,
[szCardFirst12] [varbinary] (128) NULL,
[sCardLast4] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sCardCVV] [varbinary] (128) NULL,
[dtExpireDate] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtExpireMon] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtExpireYear] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNameOnCard] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBillingFirst] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBillingLast] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBillingAddress] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sZip4] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__6A1BB7B0] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberCCInfo] ADD CONSTRAINT [tblLP_MemberCCInfo_PK] PRIMARY KEY NONCLUSTERED  ([lCreditCardID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberCCInfo] ADD CONSTRAINT [tblLP_MemberCCInfo_FK1] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_MemberCCInfo] ADD CONSTRAINT [tblLP_MemberCCInfo_FK2] FOREIGN KEY ([lPCardID]) REFERENCES [dbo].[tblAL_CreditCardType] ([lPCardID])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCInfo] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCInfo] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberCCInfo] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberCCInfo] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCInfo] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberCCInfo] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberCCInfo] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberCCInfo] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberCCInfo] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberCCInfo] TO [web_user]
GO

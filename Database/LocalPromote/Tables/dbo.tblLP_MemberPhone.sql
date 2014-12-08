CREATE TABLE [dbo].[tblLP_MemberPhone]
(
[lMemberPhoneID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NOT NULL,
[sCountryCode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Mem__sCoun__73A521EA] DEFAULT ((1)),
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szExt] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sPhoneType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__74994623] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberPhone] ADD CONSTRAINT [tblLP_MemberPhone_PK] PRIMARY KEY NONCLUSTERED  ([lMemberPhoneID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberPhone] ADD CONSTRAINT [tblLP_MemberPhone_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_MemberPhone] ADD CONSTRAINT [tblLP_MemberPhone_FK1] FOREIGN KEY ([sPhoneType]) REFERENCES [dbo].[tblAL_PhoneType] ([sPhoneType])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_MemberPhone] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_MemberPhone] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_MemberPhone] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberPhone] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberPhone] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberPhone] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberPhone] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberPhone] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberPhone] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberPhone] TO [web_user]
GO

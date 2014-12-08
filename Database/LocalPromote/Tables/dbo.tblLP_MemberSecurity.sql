CREATE TABLE [dbo].[tblLP_MemberSecurity]
(
[lMemberID] [int] NOT NULL,
[lSecurityLevelID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__76818E95] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberSecurity] ADD CONSTRAINT [tblLP_MemberSecurity_PK] PRIMARY KEY NONCLUSTERED  ([lMemberID], [lSecurityLevelID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberSecurity] ADD CONSTRAINT [tblLP_MemberSecurity_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_MemberSecurity] ADD CONSTRAINT [tblLP_MemberSecurity_FK1] FOREIGN KEY ([lSecurityLevelID]) REFERENCES [dbo].[tblAL_SecurityLevel] ([lSecurityLevelID])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberSecurity] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberSecurity] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberSecurity] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberSecurity] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberSecurity] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberSecurity] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberSecurity] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberSecurity] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberSecurity] TO [web_user]
GO

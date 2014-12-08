CREATE TABLE [dbo].[tblRW_UserInfo]
(
[lMemberID] [int] NOT NULL,
[sZip] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDisplayName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lAgeRangeID] [int] NOT NULL CONSTRAINT [DF_tblRW_UserInfo_lAgeRangeID] DEFAULT ((6)),
[sGender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sOptIn] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblRW_Use__sActi__32A16594] DEFAULT ('N'),
[dtActive] [datetime] NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblRW_Use__dtUpd__339589CD] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_UserInfo] ADD CONSTRAINT [tblRW_UserInfo_PK] PRIMARY KEY NONCLUSTERED  ([lMemberID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_UserInfo] ADD CONSTRAINT [tblRW_UserInfo_FK1] FOREIGN KEY ([lAgeRangeID]) REFERENCES [dbo].[tblAL_AgeRange] ([lAgeRangeID])
GO
ALTER TABLE [dbo].[tblRW_UserInfo] ADD CONSTRAINT [tblRW_UserInfo_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
GRANT SELECT ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblRW_UserInfo] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblRW_UserInfo] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblRW_UserInfo] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblRW_UserInfo] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblRW_UserInfo] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblRW_UserInfo] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_UserInfo] TO [web_user]
GRANT INSERT ON  [dbo].[tblRW_UserInfo] TO [web_user]
GRANT DELETE ON  [dbo].[tblRW_UserInfo] TO [web_user]
GRANT UPDATE ON  [dbo].[tblRW_UserInfo] TO [web_user]
GO

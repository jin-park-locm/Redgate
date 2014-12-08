CREATE TABLE [dbo].[tblRW_UserStatus]
(
[lStatusID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NOT NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdated] [datetime] NOT NULL CONSTRAINT [DF__tblRW_Use__dtUpd__357DD23F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_UserStatus] ADD CONSTRAINT [tblRW_UserStatus_PK] PRIMARY KEY NONCLUSTERED  ([lStatusID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_UserStatus] ADD CONSTRAINT [tblRW_UserStatus_FK1] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblRW_UserInfo] ([lMemberID])
GO
GRANT SELECT ON  [dbo].[tblRW_UserStatus] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblRW_UserStatus] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblRW_UserStatus] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblRW_UserStatus] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_UserStatus] TO [web_user]
GO

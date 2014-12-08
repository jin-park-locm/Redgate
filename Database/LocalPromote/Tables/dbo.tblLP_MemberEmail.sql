CREATE TABLE [dbo].[tblLP_MemberEmail]
(
[lMemberEmailID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NOT NULL,
[szEmail] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sEmailType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__6FD49106] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[undo_Lead_Email]
   ON  [dbo].[tblLP_MemberEmail]
   FOR DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	if exists (select 1 from deleted where lMemberID=432251)
	 	ROLLBACK
    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[tblLP_MemberEmail] ADD CONSTRAINT [tblLP_MemberEmail_PK] PRIMARY KEY NONCLUSTERED  ([lMemberEmailID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberEmail] ADD CONSTRAINT [tblLP_MemberEmail_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_MemberEmail] ADD CONSTRAINT [tblLP_MemberEmail_FK1] FOREIGN KEY ([sEmailType]) REFERENCES [dbo].[tblAL_EmailType] ([sEmailType])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberEmail] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberEmail] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberEmail] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberEmail] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberEmail] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberEmail] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberEmail] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberEmail] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberEmail] TO [web_user]
GO

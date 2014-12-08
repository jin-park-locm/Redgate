CREATE TABLE [dbo].[tblLP_MemberInfo]
(
[lMemberID] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[szLoginEmail] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPassword] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLoginName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sUserType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_MemberInfo_sUserType] DEFAULT ('BB'),
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szMidName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sTermsAccepted] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_MemberInfo_sTermsAccepted] DEFAULT ('Y'),
[dtStart] [datetime] NOT NULL CONSTRAINT [DF_tblLP_MemberInfo_dtStart] DEFAULT (getdate()),
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__71BCD978] DEFAULT (getdate()),
[szClearTextPassword] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trgDEL_tblLP_MemberInfohist]
ON [dbo].[tblLP_MemberInfo]
FOR  DELETE
AS
insert into tblLP_MemberInfoHist
( lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, sAction, 
  dtUpdate, dtHistAction)

Select lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, 'DEL',dtUpdate, getdate()
from DELETED
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trgINS_tblLP_MemberInfohist]
ON [dbo].[tblLP_MemberInfo]
FOR  INSERT
AS
insert into tblLP_MemberInfoHist
( lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, sAction, 
  dtUpdate, dtHistAction)

Select lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, 'INS',dtUpdate, getdate()
from INSERTED
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trgUPD_tblLP_MemberInfohist]
ON [dbo].[tblLP_MemberInfo]
FOR  UPDATE
AS
insert into tblLP_MemberInfoHist
( lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, sAction, 
  dtUpdate, dtHistAction)

Select lMemberID, szLoginEmail, szPassword, szLoginName, 
  sUserType, szLastName, szMidName, szFirstName, 
  sTermsAccepted, dtStart, dtEnd, sActive, 'UPD',dtUpdate, getdate()
from INSERTED
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[undo_Lead_Account]
   ON  [dbo].[tblLP_MemberInfo]
   FOR DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	if exists (select 1 from deleted where lMemberID=432251)
	 	ROLLBACK
    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[tblLP_MemberInfo] ADD CONSTRAINT [tblLP_MemberInfo_PK] PRIMARY KEY NONCLUSTERED  ([lMemberID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [tblLP_MemberInfo_Idx1] ON [dbo].[tblLP_MemberInfo] ([lMemberID], [szLoginEmail]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_Memberinfo_idxMIDEmail] ON [dbo].[tblLP_MemberInfo] ([lMemberID], [szLoginEmail]) INCLUDE ([szFirstName], [szLastName]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_MemberInfo_idx2] ON [dbo].[tblLP_MemberInfo] ([szLoginEmail]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberInfo] ADD CONSTRAINT [tblLP_MemberInfo_FK1] FOREIGN KEY ([sUserType]) REFERENCES [dbo].[tblAL_UserType] ([sUserType])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_MemberInfo] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_MemberInfo] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_MemberInfo] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [ELIBERATION\jtran]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberInfo] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberInfo] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberInfo] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberInfo] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberInfo] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberInfo] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberInfo] TO [web_user]
GO

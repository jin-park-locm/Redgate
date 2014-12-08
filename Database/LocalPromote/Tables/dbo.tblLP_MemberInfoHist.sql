CREATE TABLE [dbo].[tblLP_MemberInfoHist]
(
[lMemHistID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NOT NULL,
[szLoginEmail] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPassword] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLoginName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sUserType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szMidName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sTermsAccepted] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStart] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[dtHistAction] [datetime] NOT NULL CONSTRAINT [DF_tblLP_MemberInfoHist_dtHistAction] DEFAULT (getdate()),
[szUpdatedUserMachine] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblLP_Mem__szUpd__536EF330] DEFAULT (CONVERT([varchar](250),(suser_sname()+'@')+host_name(),0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberInfoHist] ADD CONSTRAINT [PK_tblLP_MemberInfoHist] PRIMARY KEY CLUSTERED  ([lMemHistID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_MemberInfoHist] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberInfoHist] TO [web_user]
GO

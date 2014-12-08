CREATE TABLE [dbo].[possible_spam_users2]
(
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
[dtUpdate] [datetime] NOT NULL,
[szClearTextPassword] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[possible_spam_users2] ADD CONSTRAINT [PK_lmemberID2] PRIMARY KEY CLUSTERED  ([lMemberID]) ON [PRIMARY]
GO

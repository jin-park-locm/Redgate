CREATE TABLE [dbo].[tblRW_UserInfo_arch]
(
[lMemberID] [int] NOT NULL,
[sZip] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDisplayName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lAgeRangeID] [int] NOT NULL,
[sGender] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sOptIn] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActive] [datetime] NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[MIDGuid] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblRW_UserInfo_arch] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_UserInfo_arch] TO [web_user]
GO

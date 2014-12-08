CREATE TABLE [dbo].[tblRW_UserInfoOrig]
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
[MIDGUID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_MID] ON [dbo].[tblRW_UserInfoOrig] ([lMemberID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_PartnersiteMember_ASR]
(
[lSiteID] [int] NOT NULL,
[lMemberID] [int] NOT NULL,
[sSiteType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sContact] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PartnersiteMember_ASR] ADD CONSTRAINT [PK_tblLP_PartnersiteMember_ASR] PRIMARY KEY CLUSTERED  ([lSiteID], [lMemberID]) ON [PRIMARY]
GO

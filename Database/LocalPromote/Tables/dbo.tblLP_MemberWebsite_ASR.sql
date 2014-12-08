CREATE TABLE [dbo].[tblLP_MemberWebsite_ASR]
(
[lMemberid] [int] NOT NULL,
[szWebURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[weburlshort] AS (CONVERT([varchar](150),replace(replace(replace(replace([szWebURL],'http://',''),'/',''),'.com',''),'www.',''),0)) PERSISTED
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberWebsite_ASR] ADD CONSTRAINT [PK_tblLP_MemberWebsite_ASR] PRIMARY KEY NONCLUSTERED  ([lMemberid]) ON [PRIMARY]
GO

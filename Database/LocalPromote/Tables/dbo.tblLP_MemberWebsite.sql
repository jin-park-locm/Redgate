CREATE TABLE [dbo].[tblLP_MemberWebsite]
(
[lMemberid] [int] NOT NULL,
[szWebURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__69BC9054] DEFAULT (getdate()),
[weburlshort] AS (CONVERT([varchar](150),replace(replace(replace(replace([szWebURL],'http://',''),'/',''),'.com',''),'www.',''),0)) PERSISTED
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberWebsite] ADD CONSTRAINT [tblLP_MemberWebsite_PK] PRIMARY KEY NONCLUSTERED  ([lMemberid]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_MemberWebsite_WebURL] ON [dbo].[tblLP_MemberWebsite] ([szWebURL]) INCLUDE ([lMemberid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_weburlshort] ON [dbo].[tblLP_MemberWebsite] ([weburlshort]) INCLUDE ([lMemberid]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberWebsite] ADD CONSTRAINT [tblLP_MemberWebsite_FK1] FOREIGN KEY ([lMemberid]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberWebsite] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberWebsite] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberWebsite] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberWebsite] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberWebsite] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberWebsite] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberWebsite] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberWebsite] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberWebsite] TO [web_user]
GO

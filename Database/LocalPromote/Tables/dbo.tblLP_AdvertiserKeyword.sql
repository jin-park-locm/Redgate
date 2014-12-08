CREATE TABLE [dbo].[tblLP_AdvertiserKeyword]
(
[lKeywordiD] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserid] [int] NOT NULL,
[szKeyword] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Adv__dtUpd__6F7569AA] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_AdvertiserKeywordDEL] on [dbo].[tblLP_AdvertiserKeyword]
for delete
as
insert dbo.tblLP_AdvertiserKeyword_DELs(lKeywordiD,lAdvertiserID,szKeyword,sActive,szUpdatedBy,dtUpdate)
select lKeywordiD,lAdvertiserID,szKeyword,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_AdvertiserKeyword] ADD CONSTRAINT [tblLP_AdvertiserKeyword_PK] PRIMARY KEY NONCLUSTERED  ([lAdvertiserid], [szKeyword]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [tblLP_Advertiserkeyword_idxAIDKwd] ON [dbo].[tblLP_AdvertiserKeyword] ([lAdvertiserid], [szKeyword]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AdvertiserKeyword] ADD CONSTRAINT [tblLP_AdvertiserKeyword_FK1] FOREIGN KEY ([lAdvertiserid]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_AdvertiserKeyword] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_AdvertiserKeyword] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_AdvertiserKeyword] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AdvertiserKeyword] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_AdvertiserKeyword] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_AdvertiserKeyword] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_AdvertiserKeyword] TO [web_user]
GO

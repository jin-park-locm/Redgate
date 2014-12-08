CREATE TABLE [dbo].[tblLP_BusListingContent]
(
[lAdvertiserID] [int] NOT NULL,
[szTagLine] [varchar] (175) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szReturnPolicy] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lLocationTotal] [int] NULL,
[lEmployeeTotal] [int] NULL,
[szYearEstablished] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sFemale] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sMinority] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sEmergency] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szAward] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCertification] [varchar] (180) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__324C5FD9] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingContentDEL] on [dbo].[tblLP_BusListingContent]
for delete
as
insert dbo.tblLP_BusListingContent_DELs(lAdvertiserID,szTagLine,szReturnPolicy,lLocationTotal,lEmployeeTotal,szYearEstablished,sFemale,sMinority,sEmergency,szAward,szCertification,szUpdatedBy,dtUpdate)
select lAdvertiserID,szTagLine,szReturnPolicy,lLocationTotal,lEmployeeTotal,szYearEstablished,sFemale,sMinority,sEmergency,szAward,szCertification,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusListingContent] ADD CONSTRAINT [tblLP_BusListingContent_PK] PRIMARY KEY CLUSTERED  ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingContent] ADD CONSTRAINT [tblLP_BusListingContent_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [mlewis]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [mlewis]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [mlewis]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [mlewis]
GRANT SELECT ON  [dbo].[tblLP_BusListingContent] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingContent] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingContent] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContent] TO [web_user]
GO

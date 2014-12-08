CREATE TABLE [dbo].[tblLP_BusListingContact]
(
[lListingContactID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAreaCode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szExt] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__5BCD9859] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingContactDEL] on [dbo].[tblLP_BusListingContact]
for delete
as
insert dbo.tblLP_BusListingContact_DELs(lListingContactID,lAdvertiserID,szLastName,szFirstName,sAreaCode,szPhone,szExt,szEmail,sActive,dtUpdate)
select lListingContactID,lAdvertiserID,szLastName,szFirstName,sAreaCode,szPhone,szExt,szEmail,sActive,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusListingContact] ADD CONSTRAINT [tblLP_BusListingContact_PK] PRIMARY KEY NONCLUSTERED  ([lListingContactID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingContact] ADD CONSTRAINT [tblLP_BusListingContact_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContact] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContact] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingContact] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingContact] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContact] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingContact] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingContact] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingContact] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingContact] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingContact] TO [web_user]
GO

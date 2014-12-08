CREATE TABLE [dbo].[tblLP_BusSpecialOfferURL]
(
[lOfferURLID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szDisplayURL] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tbLP_BusSpecialOfferURL_sActive] DEFAULT ('Y'),
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__3FA65AF7] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusSpecialOfferURLDEL] on [dbo].[tblLP_BusSpecialOfferURL]
for delete
as
insert dbo.tblLP_BusSpecialOfferURL_DELs(lOfferURLID,lAdvertiserID,szDisplayURL,szURL,sActive,szUpdatedBy,dtUpdate)
select lOfferURLID,lAdvertiserID,szDisplayURL,szURL,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusSpecialOfferURL] ADD CONSTRAINT [tblLP_BusSpecialOfferURL_PK] PRIMARY KEY NONCLUSTERED  ([lOfferURLID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_AdvertiserID] ON [dbo].[tblLP_BusSpecialOfferURL] ([lAdvertiserID], [sActive]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_Active_szURL] ON [dbo].[tblLP_BusSpecialOfferURL] ([sActive], [szURL]) INCLUDE ([lAdvertiserID], [lOfferURLID], [szDisplayURL]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusSpecialOfferURL] ADD CONSTRAINT [tblLP_BusSpecialOfferURL_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialOfferURL] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialOfferURL] TO [web_user]
GO

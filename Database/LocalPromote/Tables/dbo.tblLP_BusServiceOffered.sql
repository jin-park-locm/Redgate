CREATE TABLE [dbo].[tblLP_BusServiceOffered]
(
[lServiceOfferID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szServiceOfferDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__3BD5CA13] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusServiceOfferedDEL] on [dbo].[tblLP_BusServiceOffered]
for delete
as
insert dbo.tblLP_BusServiceOffered_DELs(lServiceOfferID,lAdvertiserID,szServiceOfferDesc,sActive,szUpdatedBy,dtUpdate)
select lServiceOfferID,lAdvertiserID,szServiceOfferDesc,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusServiceOffered] ADD CONSTRAINT [tblLP_BusServiceOffered_PK] PRIMARY KEY NONCLUSTERED  ([lServiceOfferID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_AdvertiserID] ON [dbo].[tblLP_BusServiceOffered] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusServiceOffered] ADD CONSTRAINT [tblLP_BusServiceOffered_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceOffered] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceOffered] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceOffered] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceOffered] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceOffered] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusServiceOffered] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusServiceOffered] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusServiceOffered] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceOffered] TO [web_user]
GO

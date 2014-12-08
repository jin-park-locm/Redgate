CREATE TABLE [dbo].[tblLP_BusProductOffered]
(
[lProductOfferID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szProductOfferDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__39ED81A1] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusProductOfferedDEL] on [dbo].[tblLP_BusProductOffered]
for delete
as
insert dbo.tblLP_BusProductOffered_DELs(lProductOfferID,lAdvertiserID,szProductOfferDesc,sActive,szUpdatedBy,dtUpdate)
select lProductOfferID,lAdvertiserID,szProductOfferDesc,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusProductOffered] ADD CONSTRAINT [tblLP_BusProductOffered_PK] PRIMARY KEY NONCLUSTERED  ([lProductOfferID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_advertierid] ON [dbo].[tblLP_BusProductOffered] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusProductOffered] ADD CONSTRAINT [tblLP_BusProductOffered_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusProductOffered] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusProductOffered] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusProductOffered] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusProductOffered] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusProductOffered] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusProductOffered] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusProductOffered] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusProductOffered] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusProductOffered] TO [web_user]
GO

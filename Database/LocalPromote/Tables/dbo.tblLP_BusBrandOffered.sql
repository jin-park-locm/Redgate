CREATE TABLE [dbo].[tblLP_BusBrandOffered]
(
[lBrandOfferID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szBrandOfferDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__24F264BB] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_BusBrandOfferedDEL] on [dbo].[tblLP_BusBrandOffered]
for delete
as
insert dbo.tblLP_BusBrandOffered_DELs(lBrandOfferID,lAdvertiserID,szBrandOfferDesc,sActive,szUpdatedBy,dtUpdate)
select lBrandOfferID,lAdvertiserID,szBrandOfferDesc,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusBrandOffered] ADD CONSTRAINT [tblLP_BusBrandOffered_PK] PRIMARY KEY NONCLUSTERED  ([lBrandOfferID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusBrandOffered] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusBrandOffered] ADD CONSTRAINT [tblLP_BusBrandOffered_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusBrandOffered] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusBrandOffered] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusBrandOffered] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusBrandOffered] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusBrandOffered] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusBrandOffered] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusBrandOffered] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusBrandOffered] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusBrandOffered] TO [web_user]
GO

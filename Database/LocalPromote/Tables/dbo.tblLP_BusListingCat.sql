CREATE TABLE [dbo].[tblLP_BusListingCat]
(
[lAdvertiserID] [int] NOT NULL,
[BDC] [int] NOT NULL,
[sPrimary] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__59E54FE7] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingCatDEL] on [dbo].[tblLP_BusListingCat]
for delete
as
insert dbo.tblLP_BusListingCat_DELs(lAdvertiserID,BDC,sPrimary,sAction,szUpdatedBy,dtUpdate)
select lAdvertiserID,BDC,sPrimary,sAction,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusListingCat] ADD CONSTRAINT [tblLP_BusListingCat_PK] PRIMARY KEY NONCLUSTERED  ([lAdvertiserID], [BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_sAction] ON [dbo].[tblLP_BusListingCat] ([sAction]) INCLUDE ([BDC], [dtUpdate], [lAdvertiserID], [sPrimary]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingCat] ADD CONSTRAINT [tblLP_BusListingCat_FK2] FOREIGN KEY ([BDC]) REFERENCES [dbo].[glb_tbl_BDC_old] ([BDC])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingCat] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingCat] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCat] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingCat] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingCat] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingCat] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingCat] TO [web_user]
GO

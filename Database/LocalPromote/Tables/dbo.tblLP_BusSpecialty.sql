CREATE TABLE [dbo].[tblLP_BusSpecialty]
(
[lSpecialtyID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szSpecialtyDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__3DBE1285] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusSpecialtyDEL] on [dbo].[tblLP_BusSpecialty]
for delete
as
insert dbo.tblLP_BusSpecialty_DELs(lSpecialtyID,lAdvertiserID,szSpecialtyDesc,sActive,szUpdatedBy,dtUpdate)
select lSpecialtyID,lAdvertiserID,szSpecialtyDesc,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusSpecialty] ADD CONSTRAINT [tblLP_BusSpecialty_PK] PRIMARY KEY NONCLUSTERED  ([lSpecialtyID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_advertiserid] ON [dbo].[tblLP_BusSpecialty] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialty] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialty] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialty] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialty] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialty] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusSpecialty] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusSpecialty] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusSpecialty] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusSpecialty] TO [web_user]
GO

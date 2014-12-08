CREATE TABLE [dbo].[tblLP_BusServiceLocation]
(
[lBusLocationID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lStateCountyID] [int] NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__636EBA21] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusServiceLocationDEL] on [dbo].[tblLP_BusServiceLocation]
for delete
as
insert dbo.tblLP_BusServiceLocation_DELs(lBusLocationID,lAdvertiserID,lStateCountyID,szUpdatedBy,dtUpdate)
select lBusLocationID,lAdvertiserID,lStateCountyID,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusServiceLocation] ADD CONSTRAINT [tblLP_BusServiceLocation_PK] PRIMARY KEY CLUSTERED  ([lBusLocationID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceLocation] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceLocation] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusServiceLocation] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusServiceLocation] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceLocation] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusServiceLocation] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusServiceLocation] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusServiceLocation] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusServiceLocation] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusServiceLocation] TO [web_user]
GO

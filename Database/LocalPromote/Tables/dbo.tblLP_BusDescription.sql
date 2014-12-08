CREATE TABLE [dbo].[tblLP_BusDescription]
(
[lBusDescID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__515009E6] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_BusDescriptionDEL] on [dbo].[tblLP_BusDescription]
for delete
as
insert dbo.tblLP_BusDescription_DELs(lBusDescID,lAdvertiserID,szBusDesc,szUpdatedBy,dtUpdate)
select lBusDescID,lAdvertiserID,szBusDesc,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusDescription] ADD CONSTRAINT [PK_tblLP_BusDescription] PRIMARY KEY NONCLUSTERED  ([lBusDescID]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusDescription] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusDescription] ADD CONSTRAINT [tblLP_BusDescription_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_BusDescription] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_BusDescription] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_BusDescription] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDescription] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusDescription] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusDescription] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDescription] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusDescription] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusDescription] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusDescription] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusDescription] TO [web_user]
GO

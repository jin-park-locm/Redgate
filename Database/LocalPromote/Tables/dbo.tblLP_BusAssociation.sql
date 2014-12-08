CREATE TABLE [dbo].[tblLP_BusAssociation]
(
[lBusAssociationID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lAssociationType] [int] NOT NULL,
[szAssociationOther] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__2121D3D7] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_BusAssociationDEL] on [dbo].[tblLP_BusAssociation]
for delete
as
insert dbo.tblLP_BusAssociation_DELs(lBusAssociationID,lAdvertiserID,lAssociationType,szAssociationOther,sActive,szUpdatedBy,dtUpdate)
select lBusAssociationID,lAdvertiserID,lAssociationType,szAssociationOther,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusAssociation] ADD CONSTRAINT [tblLP_BusAssociation_PK] PRIMARY KEY NONCLUSTERED  ([lBusAssociationID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusAssociation] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusAssociation] ADD CONSTRAINT [tblLP_BusAssociation_FK2] FOREIGN KEY ([lAssociationType]) REFERENCES [dbo].[tblLP_BusAssociationType] ([lAssociationType])
GO
GRANT SELECT ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociation] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusAssociation] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusAssociation] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusAssociation] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociation] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusAssociation] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusAssociation] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusAssociation] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusAssociation] TO [web_user]
GO

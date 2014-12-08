CREATE TABLE [dbo].[tblLP_BusCustomerServed]
(
[lServiceTypeID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__26DAAD2D] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_BusCustomerServedDEL] on [dbo].[tblLP_BusCustomerServed]
for delete
as
insert dbo.tblLP_BusCustomerServed_DELs(lServiceTypeID,lAdvertiserID,sActive,szUpdatedBy,dtUpdate)
select lServiceTypeID,lAdvertiserID,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusCustomerServed] ADD CONSTRAINT [tblLP_BusCustomerServed_PK] PRIMARY KEY NONCLUSTERED  ([lServiceTypeID], [lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusCustomerServed] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusCustomerServed] ADD CONSTRAINT [tblLP_BusCustomerServed_FK1] FOREIGN KEY ([lServiceTypeID]) REFERENCES [dbo].[tblAL_BusServiceType] ([lServiceTypeID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusCustomerServed] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusCustomerServed] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusCustomerServed] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusCustomerServed] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusCustomerServed] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusCustomerServed] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusCustomerServed] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusCustomerServed] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusCustomerServed] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusCustomerServed] TO [web_user]
GO

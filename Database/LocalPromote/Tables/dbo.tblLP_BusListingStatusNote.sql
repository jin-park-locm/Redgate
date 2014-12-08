CREATE TABLE [dbo].[tblLP_BusListingStatusNote]
(
[lBusStatusID] [int] NOT NULL,
[szStatusNote] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__3434A84B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingStatusNote] ADD CONSTRAINT [tblLP_BusListingStatusNote_PK] PRIMARY KEY NONCLUSTERED  ([lBusStatusID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingStatusNote] ADD CONSTRAINT [tblLP_BusListingStatusNote_FK1] FOREIGN KEY ([lBusStatusID]) REFERENCES [dbo].[tblLP_BusListingStatus] ([lBusStatusID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusNote] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusNote] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusNote] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusNote] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusNote] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusNote] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusNote] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_BusVideoLocation]
(
[lBusVideoLocationId] [int] NOT NULL IDENTITY(1, 1),
[szLocation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLocationDesc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__082C08DB] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__09202D14] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoLocation] ADD CONSTRAINT [PK_tblLP_BusVideoLocation] PRIMARY KEY CLUSTERED  ([lBusVideoLocationId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoLocation] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoLocation] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoLocation] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoLocation] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoLocation] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoLocation] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoLocation] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoLocation] TO [web_user]
GO

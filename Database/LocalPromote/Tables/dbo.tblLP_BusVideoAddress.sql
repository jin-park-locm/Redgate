CREATE TABLE [dbo].[tblLP_BusVideoAddress]
(
[lBusVideoAddressId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoInfoId] [int] NOT NULL,
[lBusVideoAddressTypeId] [int] NOT NULL,
[lDataScrubbedStatusId] [int] NOT NULL,
[szBusVideoAddress] [varchar] (6000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__176E4C6B] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__186270A4] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoAddress] ADD CONSTRAINT [PK_tblLP_BusVideoAddress] PRIMARY KEY CLUSTERED  ([lBusVideoAddressId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_lBusVideoInfoId] ON [dbo].[tblLP_BusVideoAddress] ([lBusVideoInfoId], [dtActiveEnd]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddress] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoAddress] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoAddress] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddress] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddress] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoAddress] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoAddress] TO [web_user]
GO

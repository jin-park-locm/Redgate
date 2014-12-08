CREATE TABLE [dbo].[tblLP_BusVideoFile]
(
[lBusVideoFileId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoInfoId] [int] NOT NULL,
[lDataScrubbedStatusId] [int] NOT NULL,
[bvBusVideoFile] [varbinary] (max) NOT NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__139DBB87] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__1491DFC0] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoFile] ADD CONSTRAINT [PK_tblLP_BusVideoFile] PRIMARY KEY CLUSTERED  ([lBusVideoFileId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoFile] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoFile] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoFile] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoFile] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoFile] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoFile] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoFile] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoFile] TO [web_user]
GO

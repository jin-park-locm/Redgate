CREATE TABLE [dbo].[tblLP_BusVideoXmlTag]
(
[lBusVideoXmlTagId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoAddressId] [int] NOT NULL,
[lDataScrubbedStatusId] [int] NOT NULL,
[szXmlTag] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szXmlTagValue] [varchar] (6000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__1B3EDD4F] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__1C330188] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoXmlTag] ADD CONSTRAINT [PK_tblLP_BusVideoXmlTag] PRIMARY KEY CLUSTERED  ([lBusVideoXmlTagId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTag] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTag] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTag] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTag] TO [web_user]
GO

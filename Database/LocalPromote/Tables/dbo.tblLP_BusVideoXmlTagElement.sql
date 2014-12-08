CREATE TABLE [dbo].[tblLP_BusVideoXmlTagElement]
(
[lBusVideoXmlTagElementId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoXmlTagId] [int] NOT NULL,
[lDataScrubbedStatusId] [int] NOT NULL,
[szXmlTagElement] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szXmlTagElementValue] [varchar] (6000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__1F0F6E33] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__2003926C] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoXmlTagElement] ADD CONSTRAINT [PK_tblLP_BusVideoXmlTagElement] PRIMARY KEY CLUSTERED  ([lBusVideoXmlTagElementId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusVideoXmlTagElement] TO [web_user]
GO

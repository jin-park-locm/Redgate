CREATE TABLE [dbo].[tblLP_BusVideoUrlQueryStrAction]
(
[lBusVideoUrlQueryStrActionId] [int] NOT NULL IDENTITY(1, 1),
[szVideoUrlQueryStrAction] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__7D845D36] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__7E78816F] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoUrlQueryStrAction] ADD CONSTRAINT [PK_tblLP_BusVideoUrlQueryStrAction] PRIMARY KEY CLUSTERED  ([lBusVideoUrlQueryStrActionId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryStrAction] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryStrAction] TO [web_user]
GO

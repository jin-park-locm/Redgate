CREATE TABLE [dbo].[tblLP_BusVideoType]
(
[lBusVideoTypeId] [int] NOT NULL IDENTITY(1, 1),
[szVideoType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szVideoTypeDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__045B77F7] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__054F9C30] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoType] ADD CONSTRAINT [PK_tblLP_BusVideoType] PRIMARY KEY CLUSTERED  ([lBusVideoTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoType] TO [web_user]
GO

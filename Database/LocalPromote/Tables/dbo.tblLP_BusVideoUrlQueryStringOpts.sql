CREATE TABLE [dbo].[tblLP_BusVideoUrlQueryStringOpts]
(
[lBusVideoUrlQueryStringOptsId] [int] NOT NULL IDENTITY(1, 1),
[szVideoUrlQsParameter] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szVideoUrlQsValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__75E33B6E] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__76D75FA7] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoUrlQueryStringOpts] ADD CONSTRAINT [PK_tblLP_BusVideoUrlQueryStringOpts] PRIMARY KEY CLUSTERED  ([lBusVideoUrlQueryStringOptsId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryStringOpts] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryStringOpts] TO [web_user]
GO

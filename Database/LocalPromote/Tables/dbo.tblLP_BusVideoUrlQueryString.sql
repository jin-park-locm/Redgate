CREATE TABLE [dbo].[tblLP_BusVideoUrlQueryString]
(
[lBusVideoUrlQueryStringId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoUrlSansQueryStringId] [int] NOT NULL,
[szVideoUrlQsParameter] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szVideoUrlQsValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__7212AA8A] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__7306CEC3] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoUrlQueryString] ADD CONSTRAINT [PK_tblLP_BusVideoUrlQueryString] PRIMARY KEY CLUSTERED  ([lBusVideoUrlQueryStringId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryString] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlQueryString] TO [web_user]
GO

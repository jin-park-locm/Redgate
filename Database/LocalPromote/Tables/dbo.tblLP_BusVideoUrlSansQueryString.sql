CREATE TABLE [dbo].[tblLP_BusVideoUrlSansQueryString]
(
[lBusVideoUrlSansQueryStringId] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoXmlTagElementId] [int] NOT NULL,
[szVideoUrlSansQueryString] [varchar] (6000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSearchPathBeginsWith] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szSearchPathDelimiter] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szSearchPathEndsWith] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__6E4219A6] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__6F363DDF] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoUrlSansQueryString] ADD CONSTRAINT [PK_tblLP_BusVideoUrlSansQueryString] PRIMARY KEY CLUSTERED  ([lBusVideoUrlSansQueryStringId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlSansQueryString] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlSansQueryString] TO [web_user]
GO

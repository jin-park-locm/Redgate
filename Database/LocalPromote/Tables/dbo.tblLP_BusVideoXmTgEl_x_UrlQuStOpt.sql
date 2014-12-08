CREATE TABLE [dbo].[tblLP_BusVideoXmTgEl_x_UrlQuStOpt]
(
[lBusVideoXmTgEl_x_UrlQuStOpt] [int] NOT NULL IDENTITY(1, 1),
[lBusVideoXmlTagElementId] [int] NOT NULL,
[lBusVideoUrlQueryStringOptsId] [int] NOT NULL,
[szXmlTagEl_x_UrlQu] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__05257EFE] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__0619A337] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoXmTgEl_x_UrlQuStOpt] ADD CONSTRAINT [PK_tblLP_BusVideoXmTgEl_x_UrlQuStOpt] PRIMARY KEY CLUSTERED  ([lBusVideoXmTgEl_x_UrlQuStOpt]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmTgEl_x_UrlQuStOpt] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoXmTgEl_x_UrlQuStOpt] TO [web_user]
GO

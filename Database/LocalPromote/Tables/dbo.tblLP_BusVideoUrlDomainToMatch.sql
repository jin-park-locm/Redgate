CREATE TABLE [dbo].[tblLP_BusVideoUrlDomainToMatch]
(
[lBusVideoUrlDomainToMatchId] [int] NOT NULL IDENTITY(1, 1),
[szVideoUrlDomainToMatch] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNote] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__79B3CC52] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__7AA7F08B] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoUrlDomainToMatch] ADD CONSTRAINT [PK_tblLP_BusVideoUrlDomainToMatch] PRIMARY KEY CLUSTERED  ([lBusVideoUrlDomainToMatchId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlDomainToMatch] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoUrlDomainToMatch] TO [web_user]
GO

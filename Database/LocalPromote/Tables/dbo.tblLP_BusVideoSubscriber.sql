CREATE TABLE [dbo].[tblLP_BusVideoSubscriber]
(
[lBusVideoSubscriberId] [int] NOT NULL IDENTITY(1, 1),
[szVideoSubscriber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__0154EE1A] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__02491253] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoSubscriber] ADD CONSTRAINT [PK_tblLP_BusVideoSubscriber] PRIMARY KEY CLUSTERED  ([lBusVideoSubscriberId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoSubscriber] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoSubscriber] TO [web_user]
GO

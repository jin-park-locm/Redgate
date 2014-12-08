CREATE TABLE [dbo].[tblLP_BusVideoAddressType]
(
[lBusVideoAddressTypeId] [int] NOT NULL IDENTITY(1, 1),
[szAddressType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szAddressTypeDesc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtIns__0BFC99BF] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__szIns__0CF0BDF8] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusVideoAddressType] ADD CONSTRAINT [PK_tblLP_BusVideoAddressType] PRIMARY KEY CLUSTERED  ([lBusVideoAddressTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddressType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusVideoAddressType] TO [web_user]
GO

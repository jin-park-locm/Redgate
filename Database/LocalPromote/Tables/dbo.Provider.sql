CREATE TABLE [dbo].[Provider]
(
[PID] [int] NOT NULL IDENTITY(1, 1),
[ProviderId] [uniqueidentifier] NOT NULL,
[SourceId] [uniqueidentifier] NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VendorId] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShareType] [int] NULL,
[ShareRate] [int] NULL,
[ShareFloor] [tinyint] NULL,
[MinBid] [int] NULL,
[MaxBid] [int] NULL,
[ResultSetType] [int] NULL,
[ActiveFlag] [tinyint] NULL,
[DtAdd] [datetime] NULL,
[AddById] [uniqueidentifier] NULL,
[DtMod] [datetime] NULL,
[ModById] [uniqueidentifier] NULL,
[removeForeignIpAddresses] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Provider] ADD CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED  ([PID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[Provider] TO [lcssui]
GRANT SELECT ON  [dbo].[Provider] TO [web_user]
GO

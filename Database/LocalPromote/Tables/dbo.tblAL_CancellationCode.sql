CREATE TABLE [dbo].[tblAL_CancellationCode]
(
[sCancelCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCancelCodeName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Can__dtUpd__5D6C935F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_CancellationCode] ADD CONSTRAINT [tblAL_CancellationCode_PK] PRIMARY KEY CLUSTERED  ([sCancelCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_CancellationCode] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_CancellationCode] TO [web_user]
GO

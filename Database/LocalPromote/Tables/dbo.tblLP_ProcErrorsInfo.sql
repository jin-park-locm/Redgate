CREATE TABLE [dbo].[tblLP_ProcErrorsInfo]
(
[ErrorLogID] [int] NOT NULL IDENTITY(1, 1),
[ErrorDate] [datetime] NULL CONSTRAINT [DF__tblLP_Pro__Error__0C7C8803] DEFAULT (getdate()),
[ErrorNumber] [int] NULL,
[ErrorSeverity] [int] NULL,
[ErrorState] [int] NULL,
[ErrorProcedure] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorLine] [int] NULL,
[ErrorMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatabaseName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherInfo] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProcErrorsInfo] ADD CONSTRAINT [PK__tblLP_ProcErrors__0B8863CA] PRIMARY KEY CLUSTERED  ([ErrorLogID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProcErrorsInfo] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProcErrorsInfo] TO [web_user]
GO

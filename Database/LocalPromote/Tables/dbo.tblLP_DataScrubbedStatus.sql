CREATE TABLE [dbo].[tblLP_DataScrubbedStatus]
(
[lDataScrubbedStatusId] [int] NOT NULL IDENTITY(1, 1),
[szDataScrubbedStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDataScrubbedStatusDesc] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveStart] [datetime] NULL,
[dtActiveEnd] [datetime] NULL,
[dtInsert] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Dat__dtIns__0FCD2AA3] DEFAULT (getdate()),
[szInsertedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Dat__szIns__10C14EDC] DEFAULT (user_name()),
[dtUpdate] [datetime] NULL,
[szUpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_DataScrubbedStatus] ADD CONSTRAINT [PK_tblLP_DataScrubbedStatus] PRIMARY KEY CLUSTERED  ([lDataScrubbedStatusId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_DataScrubbedStatus] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_DataScrubbedStatus] TO [web_user]
GO

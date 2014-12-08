CREATE TABLE [dbo].[tblLP_AllNote]
(
[lNoteID] [int] NOT NULL IDENTITY(1, 1),
[lAllID] [int] NOT NULL,
[sNoteCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNote] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtNote] [datetime] NOT NULL CONSTRAINT [DF__tblLP_All__dtNot__4F1E7408] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AllNote] ADD CONSTRAINT [tblLP_AllNote_PK] PRIMARY KEY CLUSTERED  ([lNoteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AllNote] ADD CONSTRAINT [tblLP_AllNote_FK1] FOREIGN KEY ([sNoteCode]) REFERENCES [dbo].[tblLP_NoteType] ([sNoteCode])
GO
GRANT SELECT ON  [dbo].[tblLP_AllNote] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AllNote] TO [web_user]
GO

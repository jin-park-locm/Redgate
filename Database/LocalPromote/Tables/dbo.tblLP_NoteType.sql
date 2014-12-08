CREATE TABLE [dbo].[tblLP_NoteType]
(
[sNoteCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNoteDesc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Not__dtAdd__51FAE0B3] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_NoteType] ADD CONSTRAINT [tblLP_NoteType_PK] PRIMARY KEY CLUSTERED  ([sNoteCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_NoteType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_NoteType] TO [web_user]
GO

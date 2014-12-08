CREATE TABLE [dbo].[tblLP_ImageLibrary]
(
[lImageID] [int] NOT NULL,
[szImageName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szServerName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szDirectory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sSize] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdate] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ImageLibrary] ADD CONSTRAINT [tblLP_ImageLibrary_PK] PRIMARY KEY NONCLUSTERED  ([lImageID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ImageLibrary] ADD CONSTRAINT [tblLP_ImageLibrary_FK1] FOREIGN KEY ([sSize]) REFERENCES [dbo].[tblAL_ImageSize] ([sSize])
GO
GRANT SELECT ON  [dbo].[tblLP_ImageLibrary] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ImageLibrary] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ImageLibrary] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ImageLibrary] TO [web_user]
GO

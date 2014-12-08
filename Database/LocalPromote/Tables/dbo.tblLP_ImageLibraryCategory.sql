CREATE TABLE [dbo].[tblLP_ImageLibraryCategory]
(
[lImageID] [int] NOT NULL,
[BDC] [int] NOT NULL,
[sActive] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ImageLibraryCategory] ADD CONSTRAINT [tblLP_ImageLibraryCategory_PK] PRIMARY KEY NONCLUSTERED  ([lImageID], [BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ImageLibraryCategory] ADD CONSTRAINT [tblLP_ImageLibraryCategory_FK2] FOREIGN KEY ([BDC]) REFERENCES [dbo].[tblLP_ImageCategory] ([BDC])
GO
ALTER TABLE [dbo].[tblLP_ImageLibraryCategory] ADD CONSTRAINT [tblLP_ImageLibraryCategory_FK1] FOREIGN KEY ([lImageID]) REFERENCES [dbo].[tblLP_ImageLibrary] ([lImageID])
GO

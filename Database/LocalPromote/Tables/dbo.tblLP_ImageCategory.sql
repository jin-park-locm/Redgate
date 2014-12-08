CREATE TABLE [dbo].[tblLP_ImageCategory]
(
[BDC] [int] NOT NULL,
[Title] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ImageCategory] ADD CONSTRAINT [tblLP_ImageCategory_PK] PRIMARY KEY NONCLUSTERED  ([BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

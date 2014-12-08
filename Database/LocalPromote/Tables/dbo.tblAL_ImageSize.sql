CREATE TABLE [dbo].[tblAL_ImageSize]
(
[sSize] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSizeName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_ImageSize] ADD CONSTRAINT [tblAL_ImageSize_PK] PRIMARY KEY CLUSTERED  ([sSize]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_ImageSize] TO [web_user]
GO

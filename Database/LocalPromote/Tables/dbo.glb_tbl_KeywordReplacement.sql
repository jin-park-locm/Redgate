CREATE TABLE [dbo].[glb_tbl_KeywordReplacement]
(
[SearchToken] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReplaceWith] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [PK_glb_tbl_KeywordReplacement] ON [dbo].[glb_tbl_KeywordReplacement] ([SearchToken]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_KeywordReplacement] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_KeywordReplacement] TO [web_user]
GO

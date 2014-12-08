CREATE TABLE [dbo].[tblAL_CapWord]
(
[Capword] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_CapWord] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_CapWord] TO [web_user]
GO

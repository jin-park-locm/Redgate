CREATE TABLE [dbo].[glb_tbl_WordNetNoun]
(
[Noun] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_glb_tbl_WordNetNoun_Noun] ON [dbo].[glb_tbl_WordNetNoun] ([Noun]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_WordNetNoun] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_WordNetNoun] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_WordNetNoun] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_WordNetNoun] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_WordNetNoun] TO [web_user]
GO

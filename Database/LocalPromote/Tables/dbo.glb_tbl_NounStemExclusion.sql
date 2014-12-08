CREATE TABLE [dbo].[glb_tbl_NounStemExclusion]
(
[Noun] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StemmedNoun] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_NounStemExclusion] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_NounStemExclusion] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_NounStemExclusion] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_NounStemExclusion] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_NounStemExclusion] TO [web_user]
GO

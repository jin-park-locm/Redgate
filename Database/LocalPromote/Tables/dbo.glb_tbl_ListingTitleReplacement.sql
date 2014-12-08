CREATE TABLE [dbo].[glb_tbl_ListingTitleReplacement]
(
[SearchToken] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReplaceWith] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_ListingTitleReplacement] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_ListingTitleReplacement] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_ListingTitleReplacement] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_ListingTitleReplacement] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_ListingTitleReplacement] TO [web_user]
GO

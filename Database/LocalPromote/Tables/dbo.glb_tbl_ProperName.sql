CREATE TABLE [dbo].[glb_tbl_ProperName]
(
[Name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_ProperName] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_ProperName] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_ProperName] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_ProperName] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_ProperName] TO [web_user]
GO

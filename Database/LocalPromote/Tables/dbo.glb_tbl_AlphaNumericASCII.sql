CREATE TABLE [dbo].[glb_tbl_AlphaNumericASCII]
(
[asCode] [smallint] NOT NULL,
[szCodeDesc] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_AlphaNumericASCII] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_AlphaNumericASCII] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_AlphaNumericASCII] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_AlphaNumericASCII] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_AlphaNumericASCII] TO [web_user]
GO

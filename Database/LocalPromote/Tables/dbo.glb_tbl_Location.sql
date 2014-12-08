CREATE TABLE [dbo].[glb_tbl_Location]
(
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[City] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZipCode] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Latitude] [float] NOT NULL,
[Longitude] [float] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [PK_glb_tbl_Location] ON [dbo].[glb_tbl_Location] ([City], [ZipCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_Location] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_Location] TO [web_user]
GO

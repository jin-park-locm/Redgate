CREATE TABLE [dbo].[glb_tbl_AgencyId_Priority]
(
[AgencyId] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Priority] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [idxuc_glb_tbl_AgencyId_Priority] ON [dbo].[glb_tbl_AgencyId_Priority] ([AgencyId]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[glb_tbl_AgencyId_Priority] TO [web_user]
GO

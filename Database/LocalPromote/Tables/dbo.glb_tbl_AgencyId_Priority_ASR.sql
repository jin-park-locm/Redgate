CREATE TABLE [dbo].[glb_tbl_AgencyId_Priority_ASR]
(
[AgencyId] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Priority] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [idx_glb_tbl_AgencyId_Priority_ASR] ON [dbo].[glb_tbl_AgencyId_Priority_ASR] ([AgencyId]) ON [PRIMARY]
GO

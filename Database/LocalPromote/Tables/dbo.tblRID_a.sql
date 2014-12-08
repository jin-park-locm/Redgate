CREATE TABLE [dbo].[tblRID_a]
(
[rid] [int] NULL,
[oldrid] [int] NULL,
[status] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[advertiserid] [int] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblRID_a] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRID_a] TO [web_user]
GO

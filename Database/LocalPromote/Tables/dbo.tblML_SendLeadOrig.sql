CREATE TABLE [dbo].[tblML_SendLeadOrig]
(
[OrigKey] [int] NOT NULL,
[CID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblML_SendLeadOrig] TO [lcssui]
GRANT SELECT ON  [dbo].[tblML_SendLeadOrig] TO [web_user]
GO

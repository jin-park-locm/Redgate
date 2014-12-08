CREATE TABLE [dbo].[tblLP_HtmlWhiteListTag]
(
[lHtmlWhiteListTagID] [int] NOT NULL IDENTITY(1, 1),
[bSelfClosing] [bit] NOT NULL,
[szTagName] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_HtmlWhiteListTag] ADD CONSTRAINT [PK_tblLP_HtmlWhiteListTag] PRIMARY KEY CLUSTERED  ([lHtmlWhiteListTagID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_HtmlWhiteListTag] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_HtmlWhiteListTag] TO [web_user]
GO

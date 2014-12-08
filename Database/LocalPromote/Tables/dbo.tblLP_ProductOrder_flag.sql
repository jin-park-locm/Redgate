CREATE TABLE [dbo].[tblLP_ProductOrder_flag]
(
[ladvertiserid] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[sactive] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrder_flag] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder_flag] TO [web_user]
GO

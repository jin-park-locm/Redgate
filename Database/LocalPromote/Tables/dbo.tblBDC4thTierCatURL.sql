CREATE TABLE [dbo].[tblBDC4thTierCatURL]
(
[TierCatKey] [int] NOT NULL,
[BDCNumber] [int] NULL,
[BDCTitle] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDCType] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MappedCategories] [int] NULL,
[InternetSite] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblBDC4thTierCatURL] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDC4thTierCatURL] TO [web_user]
GO

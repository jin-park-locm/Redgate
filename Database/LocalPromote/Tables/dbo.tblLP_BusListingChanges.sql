CREATE TABLE [dbo].[tblLP_BusListingChanges]
(
[lAdvertiserID] [int] NOT NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dtadd] [datetime] NOT NULL,
[ridax] [int] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingChanges] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingChanges] TO [web_user]
GO

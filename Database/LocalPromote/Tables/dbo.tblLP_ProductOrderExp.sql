CREATE TABLE [dbo].[tblLP_ProductOrderExp]
(
[sztitle] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sZStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sPostalCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szEmail] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lAdvertiserID] [int] NOT NULL,
[bdc] [int] NULL,
[BDCDesc] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtadd] [datetime] NOT NULL,
[Cost] [money] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrderExp] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderExp] TO [web_user]
GO

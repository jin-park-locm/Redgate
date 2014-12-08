CREATE TABLE [dbo].[tblLP_DataDump]
(
[sztitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sPostalCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC] [int] NULL,
[lAdvertiserID] [int] NULL,
[RIDAX] [int] NULL,
[dtListing1st] [datetime] NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_DataDump] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_DataDump] TO [web_user]
GO

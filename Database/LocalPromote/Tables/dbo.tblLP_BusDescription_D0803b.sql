CREATE TABLE [dbo].[tblLP_BusDescription_D0803b]
(
[RIDAX] [int] NULL,
[RID] [int] NULL,
[szTitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BusTitle] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusDescription_D0803b] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusDescription_D0803b] TO [web_user]
GO

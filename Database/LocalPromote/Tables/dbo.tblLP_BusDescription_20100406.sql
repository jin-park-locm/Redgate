CREATE TABLE [dbo].[tblLP_BusDescription_20100406]
(
[lBusDescID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szBusDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

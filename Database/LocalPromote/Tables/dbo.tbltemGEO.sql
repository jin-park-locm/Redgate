CREATE TABLE [dbo].[tbltemGEO]
(
[AdvertiserID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zipcode] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entitytype] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Confidence] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[latitude] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[longitude] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

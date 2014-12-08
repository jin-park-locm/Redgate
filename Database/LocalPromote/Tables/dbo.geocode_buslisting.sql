CREATE TABLE [dbo].[geocode_buslisting]
(
[lAdvertiserID] [int] NOT NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Latitude] [decimal] (9, 6) NULL,
[Longitude] [decimal] (9, 6) NULL
) ON [PRIMARY]
GO

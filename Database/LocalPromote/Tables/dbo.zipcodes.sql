CREATE TABLE [dbo].[zipcodes]
(
[ZIPCode] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZIPType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CityName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CityType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyFIPS] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateAbbr] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateFIPS] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MSACode] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AreaCode] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeZone] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UTC] [decimal] (3, 1) NULL,
[DST] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Latitude] [decimal] (9, 6) NULL,
[Longitude] [decimal] (9, 6) NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_zipcodes_cityname] ON [dbo].[zipcodes] ([CityName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_zipcodes_stateabbr] ON [dbo].[zipcodes] ([StateAbbr]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_zipcodes_zipcode] ON [dbo].[zipcodes] ([ZIPCode]) ON [PRIMARY]
GO

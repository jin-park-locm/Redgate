CREATE TABLE [dbo].[tblAL_ZipCode]
(
[ZIPCode] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZIPType] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CityName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CityType] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountyName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyFIPS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateAbbr] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateFIPS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MSACode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AreaCode] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TimeZone] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UTC] [int] NULL,
[DST] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Latitude] [float] NOT NULL,
[Longitude] [float] NOT NULL,
[Locationid] [int] NULL,
[Location_key] [int] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_ZipCode] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_ZipCode] TO [web_user]
GO

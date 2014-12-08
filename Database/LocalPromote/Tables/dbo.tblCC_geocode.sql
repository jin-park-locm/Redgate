CREATE TABLE [dbo].[tblCC_geocode]
(
[LocalID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gConfidence] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gEntity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gLatitude] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gLongitude] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gAddress] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gCity] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gState] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gZipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

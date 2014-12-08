CREATE TABLE [dbo].[zzz]
(
[Title] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Latitude] [decimal] (9, 6) NOT NULL,
[Longitude] [decimal] (9, 6) NOT NULL
) ON [PRIMARY]
GO

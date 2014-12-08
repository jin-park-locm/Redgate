CREATE TABLE [dbo].[tblCC_ListingProcessV3]
(
[lCCListingID] [int] NOT NULL,
[LocalID] [int] NULL,
[AdvertiserID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Address] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[County] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HideAddr] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Action] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Confirm] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Latitude] [decimal] (12, 9) NULL,
[Longitude] [decimal] (12, 9) NULL,
[UpdateBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[dtTurn] [datetime] NULL
) ON [PRIMARY]
GO

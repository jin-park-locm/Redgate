CREATE TABLE [dbo].[tblMK_MarketFirst_stg]
(
[lAdvertiserID] [int] NOT NULL,
[RID] [int] NULL,
[Status] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Action] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdvertiserFirstName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdvertiserLastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZipCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AltPhone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDCCategoryID] [int] NULL,
[ProfileURL] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tagline] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BeginSubscription] [datetime] NULL,
[EndSubscription] [datetime] NULL,
[BDC1] [int] NULL,
[BDC2] [int] NULL,
[BDC3] [int] NULL,
[BDC4] [int] NULL,
[Source] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListingStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StatusDate] [datetime] NOT NULL,
[dtListingStatus] [datetime] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblMK_MarketFirst_stg] TO [lcssui]
GRANT SELECT ON  [dbo].[tblMK_MarketFirst_stg] TO [web_user]
GO

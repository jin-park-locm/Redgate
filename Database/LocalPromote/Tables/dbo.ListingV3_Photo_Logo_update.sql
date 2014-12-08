CREATE TABLE [dbo].[ListingV3_Photo_Logo_update]
(
[LocalID] [int] NULL,
[AdvertiserID] [int] NOT NULL,
[Logo_URL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Photo_URL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

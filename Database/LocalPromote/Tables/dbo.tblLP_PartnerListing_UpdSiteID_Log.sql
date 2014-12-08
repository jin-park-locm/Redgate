CREATE TABLE [dbo].[tblLP_PartnerListing_UpdSiteID_Log]
(
[lSiteID] [int] NULL,
[lAdvertiserID] [int] NULL,
[sListingType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtActiveY] [datetime] NULL,
[dtActiveN] [datetime] NULL,
[NewSiteID] [int] NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

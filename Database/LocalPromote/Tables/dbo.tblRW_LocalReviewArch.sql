CREATE TABLE [dbo].[tblRW_LocalReviewArch]
(
[lReviewID] [int] NOT NULL IDENTITY(1, 1),
[RID] [int] NOT NULL,
[iRating] [decimal] (18, 2) NOT NULL,
[szReviewTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szReviewText] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lSiteID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActive] [datetime] NOT NULL,
[lMemberId] [int] NOT NULL,
[dtReview] [datetime] NOT NULL
) ON [PRIMARY]
GO

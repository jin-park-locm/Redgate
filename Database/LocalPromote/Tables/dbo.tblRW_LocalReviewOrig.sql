CREATE TABLE [dbo].[tblRW_LocalReviewOrig]
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
CREATE CLUSTERED INDEX [idx_RID] ON [dbo].[tblRW_LocalReviewOrig] ([RID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_Active] ON [dbo].[tblRW_LocalReviewOrig] ([sActive]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

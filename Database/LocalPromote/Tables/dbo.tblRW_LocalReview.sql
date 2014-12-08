CREATE TABLE [dbo].[tblRW_LocalReview]
(
[lReviewID] [int] NOT NULL IDENTITY(1, 1),
[RID] [int] NOT NULL,
[iRating] [decimal] (18, 2) NOT NULL,
[szReviewTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szReviewText] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lSiteID] [int] NOT NULL CONSTRAINT [DF_tblRW_LocalReview_lSiteID] DEFAULT ((2)),
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActive] [datetime] NOT NULL,
[lMemberId] [int] NOT NULL,
[dtReview] [datetime] NOT NULL CONSTRAINT [DF__tblRW_Loc__dtRev__2CE88C3E] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReview] ADD CONSTRAINT [tblRW_LocalReview_PK] PRIMARY KEY NONCLUSTERED  ([lReviewID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblRW_localreview_siteid] ON [dbo].[tblRW_LocalReview] ([lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReview] ADD CONSTRAINT [tblRW_LocalReview_FK1] FOREIGN KEY ([lMemberId]) REFERENCES [dbo].[tblRW_UserInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblRW_LocalReview] ADD CONSTRAINT [tblRW_LocalReview_FK2] FOREIGN KEY ([lSiteID]) REFERENCES [dbo].[tblAL_LocalSite] ([lSiteID])
GO
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblRW_LocalReview] TO [ClientService]
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReview] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblRW_LocalReview] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblRW_LocalReview] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblRW_LocalReview] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_LocalReview] TO [web_user]
GRANT INSERT ON  [dbo].[tblRW_LocalReview] TO [web_user]
GRANT DELETE ON  [dbo].[tblRW_LocalReview] TO [web_user]
GRANT UPDATE ON  [dbo].[tblRW_LocalReview] TO [web_user]
GO

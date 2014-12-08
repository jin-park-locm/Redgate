CREATE TABLE [dbo].[tblRW_LocalReviewStatus]
(
[lStatusID] [int] NOT NULL IDENTITY(1, 1),
[lReviewID] [int] NOT NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdated] [datetime] NOT NULL CONSTRAINT [DF__tblRW_Loc__dtUpd__2ED0D4B0] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReviewStatus] ADD CONSTRAINT [tblRW_LocalReviewStatus_PK] PRIMARY KEY NONCLUSTERED  ([lStatusID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRW_LocalReviewStatus] ADD CONSTRAINT [tblRW_LocalReviewStatus_FK2] FOREIGN KEY ([lReviewID]) REFERENCES [dbo].[tblRW_LocalReview] ([lReviewID])
GO
ALTER TABLE [dbo].[tblRW_LocalReviewStatus] ADD CONSTRAINT [tblRW_LocalReviewStatus_FK1] FOREIGN KEY ([sStatus]) REFERENCES [dbo].[tblAL_StatusType] ([sStatus])
GO
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatus] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatus] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatus] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatus] TO [lcssui]
GRANT SELECT ON  [dbo].[tblRW_LocalReviewStatus] TO [web_user]
GO

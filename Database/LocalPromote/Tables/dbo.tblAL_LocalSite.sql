CREATE TABLE [dbo].[tblAL_LocalSite]
(
[lSiteID] [int] NOT NULL,
[szSiteName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_LocalSite] ADD CONSTRAINT [PK_tblAL_LocalSite] PRIMARY KEY CLUSTERED  ([lSiteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_LocalSite] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_LocalSite] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_LocalSite] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_LocalSite] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_LocalSite] TO [web_user]
GO

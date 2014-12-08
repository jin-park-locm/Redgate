CREATE TABLE [dbo].[tblAL_TimeZone]
(
[sTimeZoneCode] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTimeZoneName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Tim__dtUpd__1F398B65] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_TimeZone] ADD CONSTRAINT [tblAL_TimeZone_PK] PRIMARY KEY NONCLUSTERED  ([sTimeZoneCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [tblAL_TimeZone_Idx1] ON [dbo].[tblAL_TimeZone] ([szTimeZoneName]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_TimeZone] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_TimeZone] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_TimeZone] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_TimeZone] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_TimeZone] TO [web_user]
GO

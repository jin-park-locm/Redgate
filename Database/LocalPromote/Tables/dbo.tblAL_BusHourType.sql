CREATE TABLE [dbo].[tblAL_BusHourType]
(
[sHourType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szHourDesc] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Bus__dtUpd__3C54ED00] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_BusHourType] ADD CONSTRAINT [tblAL_BusHourType_PK] PRIMARY KEY NONCLUSTERED  ([sHourType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_BusHourType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_BusHourType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_BusHourType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_BusHourType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_BusHourType] TO [web_user]
GO

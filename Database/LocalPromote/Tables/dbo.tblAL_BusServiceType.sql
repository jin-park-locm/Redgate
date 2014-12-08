CREATE TABLE [dbo].[tblAL_BusServiceType]
(
[lServiceTypeID] [int] NOT NULL IDENTITY(1, 1),
[szServiceType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Bus__dtUpd__420DC656] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_BusServiceType] ADD CONSTRAINT [tblAL_BusServiceType_PK] PRIMARY KEY NONCLUSTERED  ([lServiceTypeID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_BusServiceType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_BusServiceType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_BusServiceType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_BusServiceType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_BusServiceType] TO [web_user]
GO

CREATE TABLE [dbo].[tblAL_StateCounty]
(
[lStateCountyID] [int] NOT NULL,
[szLocationName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sLocationType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[szUpdateID] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_StateCounty] ADD CONSTRAINT [tblAL_StateCounty_PK] PRIMARY KEY CLUSTERED  ([lStateCountyID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_StateCounty] ADD CONSTRAINT [tblAL_StateCounty_FK1] FOREIGN KEY ([sState]) REFERENCES [dbo].[tblAL_State] ([sState])
GO
GRANT SELECT ON  [dbo].[tblAL_StateCounty] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_StateCounty] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_StateCounty] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_StateCounty] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_StateCounty] TO [web_user]
GO

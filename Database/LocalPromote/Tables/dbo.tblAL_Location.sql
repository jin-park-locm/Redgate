CREATE TABLE [dbo].[tblAL_Location]
(
[lLocationID] [int] NOT NULL,
[szLocationName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lStateCountyID] [int] NOT NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sCityCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lParentLocId] [int] NOT NULL,
[sSiteMap] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Location] ADD CONSTRAINT [tblAL_Location_PK] PRIMARY KEY NONCLUSTERED  ([lLocationID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Location] ADD CONSTRAINT [tblAL_Location_FK21] FOREIGN KEY ([lStateCountyID]) REFERENCES [dbo].[tblAL_StateCounty] ([lStateCountyID])
GO
GRANT SELECT ON  [dbo].[tblAL_Location] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_Location] TO [web_user]
GO

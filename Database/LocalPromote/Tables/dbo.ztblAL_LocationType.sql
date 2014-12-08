CREATE TABLE [dbo].[ztblAL_LocationType]
(
[sLocationType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sLocationDesc] [char] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF_tblAL_LocationType_dtAdd] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ztblAL_LocationType] ADD CONSTRAINT [tblAL_LocationType_PK] PRIMARY KEY NONCLUSTERED  ([sLocationType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[ztblAL_LocationType] TO [lcssui]
GRANT SELECT ON  [dbo].[ztblAL_LocationType] TO [web_user]
GO

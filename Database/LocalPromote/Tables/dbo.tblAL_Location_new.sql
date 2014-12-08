CREATE TABLE [dbo].[tblAL_Location_new]
(
[lLocationID] [int] NOT NULL,
[szLocationName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lStateCountyID] [int] NOT NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sCityCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lParentLocId] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[NewCityType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Location_new] ADD CONSTRAINT [tblAL_LocationNew_PK] PRIMARY KEY NONCLUSTERED  ([lLocationID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

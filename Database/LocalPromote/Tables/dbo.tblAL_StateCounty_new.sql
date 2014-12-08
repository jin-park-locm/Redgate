CREATE TABLE [dbo].[tblAL_StateCounty_new]
(
[lStateCountyID] [int] NOT NULL,
[szCountyName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[szUpdateID] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_StateCounty_new] ADD CONSTRAINT [tblAL_StateCountyNew_PK] PRIMARY KEY CLUSTERED  ([lStateCountyID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

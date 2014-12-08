CREATE TABLE [dbo].[tblAL_State]
(
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szStName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sNoStateFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lCountryID] [int] NOT NULL,
[StateID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_State] ADD CONSTRAINT [tblAL_State_PK] PRIMARY KEY NONCLUSTERED  ([sState]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_State] TO [ClientService]
GRANT SELECT ON  [dbo].[tblAL_State] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_State] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_State] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_State] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_State] TO [web_user]
GO

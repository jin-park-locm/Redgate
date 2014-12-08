CREATE TABLE [dbo].[tblAL_Country]
(
[lCountryID] [int] NOT NULL IDENTITY(1, 1),
[szCountryName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdateDate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Cou__dtUpd__04AFB25B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Country] ADD CONSTRAINT [tblAL_Country_PK] PRIMARY KEY NONCLUSTERED  ([lCountryID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_Country] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_Country] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_Country] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_Country] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_Country] TO [web_user]
GO

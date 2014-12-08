CREATE TABLE [dbo].[tblAL_AgeRange]
(
[lAgeRangeID] [int] NOT NULL IDENTITY(1, 1),
[szAgeRange] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Age__dtUpd__2B0043CC] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_AgeRange] ADD CONSTRAINT [tblAL_AgeRange_PK] PRIMARY KEY NONCLUSTERED  ([lAgeRangeID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_AgeRange] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_AgeRange] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_AgeRange] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_AgeRange] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_AgeRange] TO [web_user]
GO

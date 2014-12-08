CREATE TABLE [dbo].[tblAL_DayOfWeek]
(
[sDayOfWeek] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDayOfWeekName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Day__dtUpd__1798699D] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_DayOfWeek] ADD CONSTRAINT [tblAL_DayOfWeek_PK] PRIMARY KEY NONCLUSTERED  ([sDayOfWeek]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_DayOfWeek] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_DayOfWeek] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_DayOfWeek] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_DayOfWeek] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_DayOfWeek] TO [web_user]
GO

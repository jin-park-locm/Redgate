CREATE TABLE [dbo].[tblLP_BusHour]
(
[lBusHourID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[s24Hr] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sHideHr] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sHourType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sTimeZoneCode] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtBegin] [datetime] NULL,
[dtEnd] [datetime] NULL,
[sDayOfWeek] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szOpenHour] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCloseHour] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szComment] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__2C938683] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusHourDEL] on [dbo].[tblLP_BusHour]
for delete
as
insert dbo.tblLP_BusHour_DELs(lBusHourID,lAdvertiserID,s24Hr,sHideHr,sHourType,sTimeZoneCode,dtBegin,dtEnd,sDayOfWeek,szOpenHour,szCloseHour,szComment,sActive,dtUpdate)
select lBusHourID,lAdvertiserID,s24Hr,sHideHr,sHourType,sTimeZoneCode,dtBegin,dtEnd,sDayOfWeek,szOpenHour,szCloseHour,szComment,sActive,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusHour] ADD CONSTRAINT [tblLP_BusHour_PK] PRIMARY KEY NONCLUSTERED  ([lBusHourID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusHour] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusHour] ADD CONSTRAINT [tblLP_BusHour_FK4] FOREIGN KEY ([sDayOfWeek]) REFERENCES [dbo].[tblAL_DayOfWeek] ([sDayOfWeek])
GO
ALTER TABLE [dbo].[tblLP_BusHour] ADD CONSTRAINT [tblLP_BusHour_FK1] FOREIGN KEY ([sHourType]) REFERENCES [dbo].[tblAL_BusHourType] ([sHourType])
GO
ALTER TABLE [dbo].[tblLP_BusHour] ADD CONSTRAINT [tblLP_BusHour_FK3] FOREIGN KEY ([sTimeZoneCode]) REFERENCES [dbo].[tblAL_TimeZone] ([sTimeZoneCode])
GO
GRANT SELECT ON  [dbo].[tblLP_BusHour] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusHour] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusHour] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusHour] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusHour] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusHour] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusHour] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusHour] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusHour] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusHour] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusHour] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusHour] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusHour] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusHour] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusHour] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusHour] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusHour] TO [web_user]
GO

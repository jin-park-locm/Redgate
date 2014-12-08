CREATE TABLE [dbo].[tblLP_BusHour_DELs]
(
[lBusHourID] [int] NOT NULL,
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
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__1710BBBD] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__1804DFF6] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_BusListingLatLong_DELs]
(
[lAdvertiserID] [int] NOT NULL,
[RIDAX] [int] NULL,
[Latitude] [decimal] (9, 6) NULL,
[Longitude] [decimal] (9, 6) NULL,
[Geo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtAdd] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__2CFFFCDC] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__2DF42115] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

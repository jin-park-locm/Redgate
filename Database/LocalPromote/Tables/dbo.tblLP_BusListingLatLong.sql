CREATE TABLE [dbo].[tblLP_BusListingLatLong]
(
[lAdvertiserID] [int] NOT NULL,
[RIDAX] [int] NULL,
[Latitude] [decimal] (9, 6) NULL,
[Longitude] [decimal] (9, 6) NULL,
[Geo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtAdd] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingLatLongDEL] on [dbo].[tblLP_BusListingLatLong]
for delete
as
insert dbo.tblLP_BusListingLatLong_DELs(lAdvertiserID,RIDAX,Latitude,Longitude,Geo,dtAdd)
select lAdvertiserID,RIDAX,Latitude,Longitude,Geo,dtAdd from deleted
GO
CREATE NONCLUSTERED INDEX [IDX_Geo] ON [dbo].[tblLP_BusListingLatLong] ([Geo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_AID] ON [dbo].[tblLP_BusListingLatLong] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_RIDAX] ON [dbo].[tblLP_BusListingLatLong] ([RIDAX]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLP_BusDescriptionShort]
(
[lAdvertiserID] [int] NOT NULL,
[szBusDescShort] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_BusDescriptionShort_szUpdatedBy] DEFAULT ('system'),
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF_tblLP_BusDescriptionShort_dtUpdate] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusDescriptionShortDEL] on [dbo].[tblLP_BusDescriptionShort]
for delete
as
insert dbo.tblLP_BusDescriptionShort_DELs(lAdvertiserID,szBusDescShort,szUpdatedBy,dtUpdate)
select lAdvertiserID,szBusDescShort,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusDescriptionShort] ADD CONSTRAINT [tblLP_BusDescriptionShort_PK] PRIMARY KEY CLUSTERED  ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusDescriptionShort] ADD CONSTRAINT [tblLP_BusDescriptionShort_FK1] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusDescriptionShort] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusDescriptionShort] TO [web_user]
GO

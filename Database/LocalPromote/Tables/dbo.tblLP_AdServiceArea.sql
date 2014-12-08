CREATE TABLE [dbo].[tblLP_AdServiceArea]
(
[lAdServiceAreaID] [int] NOT NULL IDENTITY(1, 1),
[lOrderNo] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lLocationID] [int] NOT NULL,
[lAdServiceType] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdS__dtUpd__45200882] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_AdServiceAreaDEL] on [dbo].[tblLP_AdServiceArea]
for delete
as
insert dbo.tblLP_AdServiceArea_DELs(lAdServiceAreaID,lOrderNo,lAdvertiserID,lLocationID,lAdServiceType,sActive,szUpdatedBy,dtUpdate)
select lAdServiceAreaID,lOrderNo,lAdvertiserID,lLocationID,lAdServiceType,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_AdServiceArea] ADD CONSTRAINT [tblLP_AdServiceArea_PK] PRIMARY KEY NONCLUSTERED  ([lAdServiceAreaID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_Order_AIDLocationIDType] ON [dbo].[tblLP_AdServiceArea] ([lOrderNo], [lAdvertiserID], [lLocationID], [lAdServiceType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AdServiceArea] ADD CONSTRAINT [tblLP_AdServiceArea_FK2] FOREIGN KEY ([lLocationID]) REFERENCES [dbo].[tblAL_Location] ([lLocationID])
GO
ALTER TABLE [dbo].[tblLP_AdServiceArea] ADD CONSTRAINT [tblLP_AdServiceArea_FK1] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
GRANT SELECT ON  [dbo].[tblLP_AdServiceArea] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AdServiceArea] TO [web_user]
GO

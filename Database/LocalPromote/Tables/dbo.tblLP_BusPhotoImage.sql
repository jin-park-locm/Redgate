CREATE TABLE [dbo].[tblLP_BusPhotoImage]
(
[lPhotoImageID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lImageID] [int] NOT NULL,
[szImageTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szImageDesc] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__151CBAFC] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusPhotoImageDEL] on [dbo].[tblLP_BusPhotoImage]
for delete
as
insert dbo.tblLP_BusPhotoImage_DELs(lPhotoImageID,lAdvertiserID,lImageID,szImageTitle,szImageDesc,sActive,szUpdatedBy,dtUpdate)
select lPhotoImageID,lAdvertiserID,lImageID,szImageTitle,szImageDesc,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusPhotoImage] ADD CONSTRAINT [tblLP_BusPhotoImage_PK] PRIMARY KEY NONCLUSTERED  ([lPhotoImageID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_advertiserID] ON [dbo].[tblLP_BusPhotoImage] ([lAdvertiserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusPhotoImage] ADD CONSTRAINT [tblLP_BusPhotoImage_FK1] FOREIGN KEY ([lImageID]) REFERENCES [dbo].[tblLP_ImageLibrary] ([lImageID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusPhotoImage] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusPhotoImage] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusPhotoImage] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusPhotoImage] TO [web_user]
GO

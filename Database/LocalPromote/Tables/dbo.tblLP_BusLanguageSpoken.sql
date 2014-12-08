CREATE TABLE [dbo].[tblLP_BusLanguageSpoken]
(
[lLanguageID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__2E7BCEF5] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[tblLP_BusLanguageSpokenDEL] on [dbo].[tblLP_BusLanguageSpoken]
for delete
as
insert dbo.tblLP_BusLanguageSpoken_DELs(lLanguageID,lAdvertiserID,sActive,szUpdatedBy,dtUpdate)
select lLanguageID,lAdvertiserID,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusLanguageSpoken] ADD CONSTRAINT [tblLP_BusLanguageSpoken_PK] PRIMARY KEY NONCLUSTERED  ([lLanguageID], [lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_Advertiserid] ON [dbo].[tblLP_BusLanguageSpoken] ([lAdvertiserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusLanguageSpoken] ADD CONSTRAINT [tblLP_BusLanguageSpoken_FK2] FOREIGN KEY ([lLanguageID]) REFERENCES [dbo].[tblAL_Language] ([lLanguageID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusLanguageSpoken] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusLanguageSpoken] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusLanguageSpoken] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusLanguageSpoken] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusLanguageSpoken] TO [web_user]
GO

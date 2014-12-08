CREATE TABLE [dbo].[glb_tbl_bdc]
(
[BDC] [int] NOT NULL,
[Title] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayTitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lParentBDC] [int] NULL,
[iTier] [int] NULL,
[DisplayBDC] [int] NULL,
[sCatActCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sCatTypeCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[glb_tbl_bdc] ADD CONSTRAINT [tblBDCTier4_newPK] PRIMARY KEY NONCLUSTERED  ([BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_TypeAhead] ON [dbo].[glb_tbl_bdc] ([BDC], [Title], [DisplayTitle], [DisplayBDC], [sActive]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_sActive] ON [dbo].[glb_tbl_bdc] ([sActive]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_Title] ON [dbo].[glb_tbl_bdc] ([Title]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[glb_tbl_bdc] ADD CONSTRAINT [tblBDCTier4_newFK2] FOREIGN KEY ([sCatActCode]) REFERENCES [dbo].[tblBDCTier4CatAction] ([sCatActCode])
GO
ALTER TABLE [dbo].[glb_tbl_bdc] ADD CONSTRAINT [tblBDCTier4_newFK1] FOREIGN KEY ([sCatTypeCode]) REFERENCES [dbo].[tblBDCTier4CatType] ([sCatTypeCode])
GO
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [ClientService]
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[glb_tbl_bdc] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[glb_tbl_bdc] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[glb_tbl_bdc] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[glb_tbl_bdc] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_bdc] TO [web_user]
GRANT INSERT ON  [dbo].[glb_tbl_bdc] TO [web_user]
GRANT DELETE ON  [dbo].[glb_tbl_bdc] TO [web_user]
GRANT UPDATE ON  [dbo].[glb_tbl_bdc] TO [web_user]
GO

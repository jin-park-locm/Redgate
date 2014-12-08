CREATE TABLE [dbo].[glb_tbl_BDC_old]
(
[BDC] [int] NOT NULL,
[Title] [varchar] (265) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lParentBDC] [int] NOT NULL,
[iTier] [tinyint] NOT NULL,
[DisplayBDC] [int] NULL,
[sCatActCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sCatTypeCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF__tblBDCTie__dtAdd__1DE57479] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[glb_tbl_BDC_old] ADD CONSTRAINT [tblBDCTier4_PK] PRIMARY KEY NONCLUSTERED  ([BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_Title] ON [dbo].[glb_tbl_BDC_old] ([Title]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[glb_tbl_BDC_old] ADD CONSTRAINT [tblBDCTier4_FK2] FOREIGN KEY ([sCatActCode]) REFERENCES [dbo].[tblBDCTier4CatAction] ([sCatActCode])
GO
ALTER TABLE [dbo].[glb_tbl_BDC_old] ADD CONSTRAINT [tblBDCTier4_FK1] FOREIGN KEY ([sCatTypeCode]) REFERENCES [dbo].[tblBDCTier4CatType] ([sCatTypeCode])
GO
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [ClientService]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[glb_tbl_BDC_old] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[glb_tbl_BDC_old] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[glb_tbl_BDC_old] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[glb_tbl_BDC_old] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_tbl_BDC_old] TO [web_user]
GRANT INSERT ON  [dbo].[glb_tbl_BDC_old] TO [web_user]
GRANT DELETE ON  [dbo].[glb_tbl_BDC_old] TO [web_user]
GRANT UPDATE ON  [dbo].[glb_tbl_BDC_old] TO [web_user]
GO

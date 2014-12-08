CREATE TABLE [dbo].[glb_tbl_bdc_bak]
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
ALTER TABLE [dbo].[glb_tbl_bdc_bak] ADD CONSTRAINT [tblBDCTier4_2_PK] PRIMARY KEY NONCLUSTERED  ([BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_TypeAhead] ON [dbo].[glb_tbl_bdc_bak] ([BDC], [Title], [DisplayTitle], [DisplayBDC], [sActive]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_sActive] ON [dbo].[glb_tbl_bdc_bak] ([sActive]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_Title] ON [dbo].[glb_tbl_bdc_bak] ([Title]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[glb_tbl_bdc_bak] ADD CONSTRAINT [tblBDCTier4_new_FK2] FOREIGN KEY ([sCatActCode]) REFERENCES [dbo].[tblBDCTier4CatAction] ([sCatActCode])
GO
ALTER TABLE [dbo].[glb_tbl_bdc_bak] ADD CONSTRAINT [tblBDCTier4_new_FK1] FOREIGN KEY ([sCatTypeCode]) REFERENCES [dbo].[tblBDCTier4CatType] ([sCatTypeCode])
GO

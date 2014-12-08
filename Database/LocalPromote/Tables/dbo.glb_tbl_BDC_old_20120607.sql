CREATE TABLE [dbo].[glb_tbl_BDC_old_20120607]
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
[dtAdd] [datetime] NOT NULL
) ON [PRIMARY]
GO

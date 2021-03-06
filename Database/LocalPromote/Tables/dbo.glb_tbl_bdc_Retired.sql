CREATE TABLE [dbo].[glb_tbl_bdc_Retired]
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
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[NewBDC] [int] NULL
) ON [PRIMARY]
GO

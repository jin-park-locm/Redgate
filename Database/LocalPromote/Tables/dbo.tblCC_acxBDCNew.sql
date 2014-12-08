CREATE TABLE [dbo].[tblCC_acxBDCNew]
(
[lCCBdcID] [int] NOT NULL,
[RID] [int] NULL,
[BDC] [int] NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sConfirm] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sUpdate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtTurn] [datetime] NULL,
[lCCListingID] [int] NULL,
[sDBState] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

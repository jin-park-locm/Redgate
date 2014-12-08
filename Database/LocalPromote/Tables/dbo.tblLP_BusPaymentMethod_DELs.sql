CREATE TABLE [dbo].[tblLP_BusPaymentMethod_DELs]
(
[lPymtTypeID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

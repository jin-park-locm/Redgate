CREATE TABLE [dbo].[tblLP_BusDiscount_DELs]
(
[lBusDiscountID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lBusDiscountType] [int] NOT NULL,
[szOtherDisct] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__14344F12] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__1528734B] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO

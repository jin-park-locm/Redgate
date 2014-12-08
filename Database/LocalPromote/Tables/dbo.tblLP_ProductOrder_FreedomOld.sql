CREATE TABLE [dbo].[tblLP_ProductOrder_FreedomOld]
(
[lOrderNo] [int] NOT NULL IDENTITY(1, 1),
[lCIDNo] [int] NOT NULL,
[lBillingID] [int] NOT NULL,
[lSalesPersonID] [int] NOT NULL,
[mPaidFee] [money] NULL,
[lBillingCycle] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sTimeCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtBeginning] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrder_FreedomOld] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder_FreedomOld] TO [web_user]
GO

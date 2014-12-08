CREATE TABLE [dbo].[tblLP_ProductOrderHist]
(
[lOrderHistID] [int] NOT NULL IDENTITY(1, 1),
[lOrderNo] [int] NOT NULL,
[lCIDNo] [int] NOT NULL,
[lBillingID] [int] NOT NULL,
[lSalesPersonID] [int] NOT NULL,
[mPaidFee] [money] NULL,
[lBillingCycle] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sTimeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtBeginning] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__2977EE0D] DEFAULT (getdate()),
[dtLog] [datetime] NULL CONSTRAINT [DF_tblLP_ProductOrderHist_dtLog] DEFAULT (getdate()),
[szUpdatedUserMachine] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblLP_Pro__szUpd__527ACEF7] DEFAULT (CONVERT([varchar](250),(suser_sname()+'@')+host_name(),0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrderHist] ADD CONSTRAINT [tblLP_ProductOrderHist_PK] PRIMARY KEY CLUSTERED  ([lOrderHistID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrderHist] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderHist] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_ProductOrder]
(
[lOrderNo] [int] NOT NULL IDENTITY(1, 1),
[lCIDNo] [int] NOT NULL,
[lBillingID] [int] NOT NULL CONSTRAINT [DF_tblLP_ProductOrder_lBillingID] DEFAULT ((1)),
[lSalesPersonID] [int] NOT NULL CONSTRAINT [DF_tblLP_ProductOrder_lSalesPersonID] DEFAULT ((1)),
[mPaidFee] [money] NULL,
[lBillingCycle] [int] NOT NULL CONSTRAINT [DF_tblLP_ProductOrder_lBillingCycle] DEFAULT ((2)),
[lAdvertiserID] [int] NOT NULL,
[sTimeCode] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtBeginning] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__4FDCC2C0] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Insert_tblLP_ProductOrderTrack]
ON   [dbo].[tblLP_ProductOrder]
FOR INSERT
AS 

/**********************************************************************************
Description   :  Insert_order info to the table for daily night turn

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Initial Development

EXAMPLES: 

**********************************************************************************/

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	insert into tblLP_ProductOrderTrack (lOrderNo, ladvertiserid) 
	select lOrderNo, ladvertiserid 
	from inserted a,
		LocalPromote..tblLP_ProductCampaign b
	where a.lCIDNo=b.lCIDNo 
		-- and b.lSiteID=2 and a.sActive='Y'
		 and a.lcidno=2870	
/*	
	Update	tblLP_ProductOrder
	set		dtEnd='1900-01-01 00:00:00.000'
	from	tblLP_ProductOrder a, 
			inserted b,
			tblLP_BusListing c
	where	b.ladvertiserid=a.ladvertiserid 
	and		b.ladvertiserid=c.ladvertiserid 
	and		b.lorderno=a.lorderno
	and		c.sSource='WEB'
	and		a.dtEnd<>'1900-01-01 00:00:00.000'
*/
END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trg_tblLP_ProductOrder_INS]
ON   [dbo].[tblLP_ProductOrder]
FOR INSERT
AS 

/**********************************************************************************
Description   :  Insert_order info to the order history table 

Change History

Date       Name     Description
---------- -------- ------------------------------------
2009-05-01 bwu		Initial Development
2009-10-07 RFoote	Commented out the sTimeCode column

EXAMPLES: 

**********************************************************************************/

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	insert into tblLP_ProductOrderHist 
	(lOrderNo, lCIDNo, lBillingID, lSalesPersonID, mPaidFee, lBillingCycle, lAdvertiserID, /*sTimeCode,*/ dtBeginning, dtEnd, sAction, sActive, szUpdatedBy, dtUpdate)
	select lOrderNo, lCIDNo, lBillingID, lSalesPersonID, mPaidFee, lBillingCycle, lAdvertiserID, /*sTimeCode,*/ dtBeginning, dtEnd, 'INS', sActive, szUpdatedBy, dtUpdate
	from inserted	
END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER dbo.[trg_tblLP_ProductOrder_UPD]
ON   dbo.tblLP_ProductOrder
FOR UPDATE
AS 

/**********************************************************************************
Description   :  Insert_order info to the order history table 

Change History

Date       Name     Description
---------- -------- ------------------------------------
2009-05-01 bwu		Initial Development
2009-10-07 RFoote	Commented out the sTimeCode column

EXAMPLES: 

**********************************************************************************/

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	insert into tblLP_ProductOrderHist 
	(lOrderNo, lCIDNo, lBillingID, lSalesPersonID, mPaidFee, lBillingCycle, lAdvertiserID, /*sTimeCode,*/ dtBeginning, dtEnd, sAction, sActive, szUpdatedBy, dtUpdate)
	select lOrderNo, lCIDNo, lBillingID, lSalesPersonID, mPaidFee, lBillingCycle, lAdvertiserID, /*sTimeCode,*/ dtBeginning, dtEnd, 'UPD', sActive, szUpdatedBy, dtUpdate
	from inserted	
END
GO
ALTER TABLE [dbo].[tblLP_ProductOrder] ADD CONSTRAINT [tblLP_ProductOrder_PK] PRIMARY KEY NONCLUSTERED  ([lOrderNo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_ProductOrder_idxAIDCID] ON [dbo].[tblLP_ProductOrder] ([lAdvertiserID], [lCIDNo]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_ProductOrder_idxComb1] ON [dbo].[tblLP_ProductOrder] ([sActive], [lAdvertiserID], [lCIDNo], [lOrderNo]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_ProductOrder_IdxOIDAct] ON [dbo].[tblLP_ProductOrder] ([sActive], [lOrderNo]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrder] ADD CONSTRAINT [tblLP_ProductOrder_FK6] FOREIGN KEY ([lBillingCycle]) REFERENCES [dbo].[tblAL_BillingCycle] ([lBillingCycle])
GO
ALTER TABLE [dbo].[tblLP_ProductOrder] ADD CONSTRAINT [tblLP_ProductOrder_FK1] FOREIGN KEY ([lCIDNo]) REFERENCES [dbo].[tblLP_ProductCampaign] ([lCIDNo])
GO
ALTER TABLE [dbo].[tblLP_ProductOrder] ADD CONSTRAINT [tblLP_ProductOrder_FK4] FOREIGN KEY ([lSalesPersonID]) REFERENCES [dbo].[tblLP_SalesPerson] ([lSalesPersonID])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_ProductOrder] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_ProductOrder] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrder] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductOrder] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductOrder] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrder] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrder] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductOrder] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductOrder] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductOrder] TO [web_user]
GO

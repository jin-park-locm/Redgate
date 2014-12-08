CREATE TABLE [dbo].[tblLP_BusListing]
(
[lAdvertiserID] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[ListingID] [uniqueidentifier] NULL,
[lMemberID] [int] NOT NULL,
[RIDAX] [int] NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sztitle] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBldgName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sZip4] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lCountryID] [int] NOT NULL CONSTRAINT [DF__tblLP_Bus__lCoun__5708E33C] DEFAULT ('1'),
[szLocationName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szFax] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhoneAlt] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szEmail] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sHideAddress] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAction] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtAct__57FD0775] DEFAULT (getdate()),
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_BusListing_sSource] DEFAULT ('WEB'),
[dtListing1st] [datetime] NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZipCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szTitleSearch] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szTitleStrip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE trigger [dbo].[tblLP_BusListingDEL] on [dbo].[tblLP_BusListing]
for delete
as
insert dbo.tblLP_BusListing_DELs(lAdvertiserID,ListingID,lMemberID,RIDAX,sAgencyID,sztitle,szBldgName,szStreetName,szUnit,szCity,sState,sPostalCode,sZip4,lCountryID,szLocationName,szPhone,szFax,szPhoneAlt,szURL,szEmail,sHideAddress,sAction,dtAction,sSource,dtListing1st,szUpdatedBy,ZipCity,szTitleSearch,szTitleStrip)
select lAdvertiserID,ListingID,lMemberID,RIDAX,sAgencyID,sztitle,szBldgName,szStreetName,szUnit,szCity,sState,sPostalCode,sZip4,lCountryID,szLocationName,szPhone,szFax,szPhoneAlt,szURL,szEmail,sHideAddress,sAction,dtAction,sSource,dtListing1st,szUpdatedBy,ZipCity,szTitleSearch,szTitleStrip from deleted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--==================

CREATE TRIGGER [dbo].[trgDEL_tblLP_BusListingHist]
ON [dbo].[tblLP_BusListing]
FOR  DELETE
AS

Insert into tblLP_BusListingHist
(lAdvertiserid, Listingid, lMemberID,  RIDAX,sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction,dtAction,
sHistAction, dtListing1st, szUpdatedBy, sSource)
Select lAdvertiserid, Listingid, lMemberID,  RIDAX,sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction,getdate() as dtAction,
'DEL' as sHistAction, dtListing1st, szUpdatedBy,sSource
From Deleted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---drop trigger tblLP_BusListingHist_UPD
---================================

CREATE TRIGGER [dbo].[trgINS_tblLP_BusListingHist]
ON [dbo].[tblLP_BusListing]
FOR  INSERT
AS

Insert into tblLP_BusListingHist
(lAdvertiserid, Listingid, lMemberID,  RIDAX,sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction,dtAction,
sHistAction, dtListing1st, szUpdatedBy,sSource)
Select lAdvertiserid, Listingid, lMemberID,  RIDAX,sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction, getdate() as dtAction,
'INS' as sHistAction, dtListing1st, szUpdatedBy,sSource
From Inserted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trgUPD_tblLP_BusListing]
ON [dbo].[tblLP_BusListing]
FOR  UPDATE
AS
/**********************************************************************************
Description   :  Insert_order info to the order history table 

Change History

Date       Name     Description
---------- -------- ------------------------------------
		   unkonwn	Initial Development
2009-12-03 dlabrie	add insert into tblLP_MFemail

EXAMPLES: 

**********************************************************************************/


Insert into tblLP_BusListingHist
(lAdvertiserid, Listingid, lMemberID, RIDAX, sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction,dtAction,
sHistAction, dtListing1st, szUpdatedBy,sSource)
Select lAdvertiserid, Listingid, lMemberID,  RIDAX,sAgencyid, szTitle, szBldgName, szStreetName, szUnit, szCity, sState,
sPostalCode, sZip4, lcountryID, szLocationName,szPhone, szFax, szPhoneAlt, szURL, szEmail, sHideAddress, sAction,getdate() as dtAction,
'UPD' as sHistAction, dtListing1st, szUpdatedBy,sSource
From Inserted

/*Insert into tblLP_MFemail
(		lAdvertiserid, sAgencyid, sStatus, dtUpdate)
Select	i.ladvertiserid, sAgencyid, 'NUP', getdate()
From	inserted i,
		tblLP_PartnerListing a,
		tblLP_PartnerSite b
where	i.ladvertiserid=a.ladvertiserid
And		a.lsiteid=b.lsiteid 
and		a.sActive='Y'
and		i.sSource in ('WEB','WEP', 'SSF')
and		b.lpartnerid <>1
and		i.lmemberid<>432251
*/

/*
If @Agency='AP' and @siteid<>2
Exec usp_LC_INS_MFEmailStatus null, @Advertiserid, NULL, NULL, NULL, NULL, 'NUP'*/
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create TRIGGER [dbo].[Update_tblLP_BusListing]
   ON   [dbo].[tblLP_BusListing]
   FOR Update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if update(szURL)
		Begin		
			insert into tblLP_BusListingChanges (lAdvertiserID, ridAX, szURL,Dtadd) 
			select lAdvertiserID, ridax,szURL,getdate() 
			from inserted 
		End
	
END
GO
ALTER TABLE [dbo].[tblLP_BusListing] ADD CONSTRAINT [tblLP_BusListing_PK] PRIMARY KEY NONCLUSTERED  ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListing_idxCombo2] ON [dbo].[tblLP_BusListing] ([lMemberID], [sztitle], [lAdvertiserID]) INCLUDE ([sHideAddress], [sState], [szCity], [szPhone], [szStreetName]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_BusListing_RIDAX] ON [dbo].[tblLP_BusListing] ([RIDAX]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_BusListing_Combo3] ON [dbo].[tblLP_BusListing] ([sAgencyID], [sSource], [ListingID], [RIDAX], [sAction]) INCLUDE ([lAdvertiserID], [sHideAddress], [sPostalCode], [sState], [szCity], [szPhone], [szPhoneAlt], [szStreetName], [sztitle], [szTitleSearch], [szTitleStrip], [szURL]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_busListing_IdxState] ON [dbo].[tblLP_BusListing] ([sState]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListing_idxPhone] ON [dbo].[tblLP_BusListing] ([szPhone]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListing_Title] ON [dbo].[tblLP_BusListing] ([sztitle]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListing_idxCombo1] ON [dbo].[tblLP_BusListing] ([sztitle], [sAction], [lAdvertiserID], [lMemberID]) INCLUDE ([sHideAddress], [sState], [szCity], [szPhone], [szStreetName]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_TitleSearch] ON [dbo].[tblLP_BusListing] ([szTitleSearch]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_TitleStrip] ON [dbo].[tblLP_BusListing] ([szTitleStrip]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListing] ADD CONSTRAINT [tblLP_BusListing_FK1] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_BusListing] ADD CONSTRAINT [tblLP_BusListing_FK4] FOREIGN KEY ([sAction]) REFERENCES [dbo].[tblAL_ActionType] ([sAction])
GO
ALTER TABLE [dbo].[tblLP_BusListing] ADD CONSTRAINT [tblLP_BusListing_FK9] FOREIGN KEY ([sSource]) REFERENCES [dbo].[tblAL_Source] ([sSource])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [mlewis]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [mlewis]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [mlewis]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [mlewis]
GRANT SELECT ON  [dbo].[tblLP_BusListing] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListing] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListing] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListing] TO [web_user]
GO

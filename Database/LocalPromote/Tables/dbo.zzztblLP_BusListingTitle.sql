CREATE TABLE [dbo].[zzztblLP_BusListingTitle]
(
[lAdvertiserID] [int] NOT NULL IDENTITY(1, 1),
[ListingID] [uniqueidentifier] NULL,
[lMemberID] [int] NOT NULL,
[RIDAX] [int] NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sztitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBldgName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sZip4] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lCountryID] [int] NOT NULL,
[szLocationName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szFax] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhoneAlt] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szEmail] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sHideAddress] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAction] [datetime] NOT NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtListing1st] [datetime] NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZipCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szTitleSearch] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szTitleStrip] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingTitleDEL] on [dbo].[zzztblLP_BusListingTitle]
for delete
as
insert dbo.tblLP_BusListingTitle_DELs(lAdvertiserID,ListingID,lMemberID,RIDAX,sAgencyID,sztitle,szBldgName,szStreetName,szUnit,szCity,sState,sPostalCode,sZip4,lCountryID,szLocationName,szPhone,szFax,szPhoneAlt,szURL,szEmail,sHideAddress,sAction,dtAction,sSource,dtListing1st,szUpdatedBy,ZipCity,szTitleSearch,szTitleStrip)
select lAdvertiserID,ListingID,lMemberID,RIDAX,sAgencyID,sztitle,szBldgName,szStreetName,szUnit,szCity,sState,sPostalCode,sZip4,lCountryID,szLocationName,szPhone,szFax,szPhoneAlt,szURL,szEmail,sHideAddress,sAction,dtAction,sSource,dtListing1st,szUpdatedBy,ZipCity,szTitleSearch,szTitleStrip from deleted
GO
GRANT SELECT ON  [dbo].[zzztblLP_BusListingTitle] TO [lcssui]
GRANT SELECT ON  [dbo].[zzztblLP_BusListingTitle] TO [web_user]
GO

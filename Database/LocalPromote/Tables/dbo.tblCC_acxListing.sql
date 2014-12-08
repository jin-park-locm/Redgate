CREATE TABLE [dbo].[tblCC_acxListing]
(
[lCCListingID] [int] NOT NULL IDENTITY(500000, 1),
[RID] [int] NULL,
[lAdvertiserID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szTitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTitleOrig] [varchar] (550) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szAddress] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szAddressOrig] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCityOrig] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sStateOrig] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szZipOrig] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szPhone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPhoneOrig] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szURLOrig] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sHideAddr] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sConfirm] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sUpdate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[dtTurn] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCC_acxListing] ADD CONSTRAINT [tblCC_acxListing_PK] PRIMARY KEY CLUSTERED  ([lCCListingID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [ClientService]
GRANT INSERT ON  [dbo].[tblCC_acxListing] TO [ClientService]
GRANT DELETE ON  [dbo].[tblCC_acxListing] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblCC_acxListing] TO [ClientService]
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblCC_acxListing] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblCC_acxListing] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblCC_acxListing] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [lcssui]
GRANT SELECT ON  [dbo].[tblCC_acxListing] TO [web_user]
GRANT INSERT ON  [dbo].[tblCC_acxListing] TO [web_user]
GO

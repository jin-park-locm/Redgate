CREATE TABLE [dbo].[tblCC_acxListingNew]
(
[lCCListingID] [int] NOT NULL,
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

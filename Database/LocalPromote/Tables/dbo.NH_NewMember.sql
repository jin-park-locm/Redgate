CREATE TABLE [dbo].[NH_NewMember]
(
[lAdvertiserID] [int] NOT NULL IDENTITY(1, 1),
[ListingID] [uniqueidentifier] NULL,
[lMemberID] [int] NOT NULL,
[RIDAX] [int] NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sztitle] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBldgName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[newmid] [int] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[NH_NewMember] TO [lcssui]
GRANT SELECT ON  [dbo].[NH_NewMember] TO [web_user]
GO

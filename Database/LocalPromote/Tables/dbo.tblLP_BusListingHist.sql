CREATE TABLE [dbo].[tblLP_BusListingHist]
(
[BusListingHistID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[ListingID] [uniqueidentifier] NULL,
[lMemberID] [int] NOT NULL,
[RIDAX] [int] NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sztitle] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szBldgName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szStreetName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
[dtAction] [datetime] NOT NULL CONSTRAINT [BusListingHist_dt_Dft] DEFAULT (getdate()),
[sHistAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtListing1st] [datetime] NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedUserMachine] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblLP_Bus__szUpd__54631769] DEFAULT (CONVERT([varchar](250),(suser_sname()+'@')+host_name(),0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingHist] ADD CONSTRAINT [tblLP_BusListingHist_PK] PRIMARY KEY NONCLUSTERED  ([BusListingHistID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_AID] ON [dbo].[tblLP_BusListingHist] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_LID] ON [dbo].[tblLP_BusListingHist] ([ListingID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingHist] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingHist] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingHist] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingHist] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingHist] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingHist] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingHist] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingHist] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingHist] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingHist] TO [web_user]
GO

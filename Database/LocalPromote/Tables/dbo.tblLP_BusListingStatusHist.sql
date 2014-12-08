CREATE TABLE [dbo].[tblLP_BusListingStatusHist]
(
[lBusStatusHistID] [int] NOT NULL IDENTITY(1, 1),
[lBusStatusID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStatus] [datetime] NOT NULL CONSTRAINT [tblLP_BusListingStatusHist_DFT1 ] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingStatusHist] ADD CONSTRAINT [tblLP_BusListingStatusHist_PK] PRIMARY KEY CLUSTERED  ([lBusStatusHistID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusHist] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusHist] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusHist] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatusHist] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatusHist] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatusHist] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatusHist] TO [web_user]
GO

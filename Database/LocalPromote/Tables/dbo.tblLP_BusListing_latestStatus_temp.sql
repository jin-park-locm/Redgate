CREATE TABLE [dbo].[tblLP_BusListing_latestStatus_temp]
(
[lBusStatusID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szStatusDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStatus] [datetime] NOT NULL
) ON [PRIMARY]
GO

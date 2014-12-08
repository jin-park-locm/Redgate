CREATE TABLE [dbo].[ztmp_tblLP_AdDistribution]
(
[ladvertiserid] [int] NOT NULL,
[lSiteID] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[lAdServiceType] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

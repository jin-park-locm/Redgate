CREATE TABLE [dbo].[ztbllp_productcampaign_04022010]
(
[szCID] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lCIDNo] [int] NOT NULL IDENTITY(240, 1),
[lSiteID] [int] NOT NULL,
[lProductID] [int] NOT NULL,
[szSpecialName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSpecialDesc] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[mSpecialPrice] [money] NULL,
[sDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sDependency] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAutoDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sTimeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtBeginning] [datetime] NOT NULL,
[dtEnd] [datetime] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sAdCenter] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

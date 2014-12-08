CREATE TABLE [dbo].[zzztblLP_Subscriptions]
(
[lSubscriptionID] [int] NOT NULL,
[lPartnerID] [int] NOT NULL,
[lSiteID] [int] NOT NULL,
[lUserType] [int] NOT NULL,
[lOrigParterID] [int] NOT NULL,
[lOrigSiteID] [int] NOT NULL,
[dtStart] [datetime] NOT NULL,
[dtEnd] [datetime] NOT NULL,
[lAdvertiser] [int] NOT NULL,
[sLocation] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sBusName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zzztblLP_Subscriptions] ADD CONSTRAINT [PK_lSubscriptionID] PRIMARY KEY CLUSTERED  ([lSubscriptionID]) ON [PRIMARY]
GO

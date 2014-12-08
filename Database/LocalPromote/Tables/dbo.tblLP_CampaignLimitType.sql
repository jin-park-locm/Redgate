CREATE TABLE [dbo].[tblLP_CampaignLimitType]
(
[sLimitType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLimitDesc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Cam__dtAdd__50679DFC] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CampaignLimitType] ADD CONSTRAINT [tblLP_CampaignLimitType_PK] PRIMARY KEY CLUSTERED  ([sLimitType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_CampaignLimitType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_CampaignLimitType] TO [web_user]
GO

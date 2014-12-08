CREATE TABLE [dbo].[tblLP_CampaignLimit]
(
[lLimitID] [int] NOT NULL IDENTITY(1, 1),
[lCIDno] [int] NOT NULL,
[lLimit] [int] NOT NULL,
[sLimitType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Cam__dtUpd__4D8B3151] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CampaignLimit] ADD CONSTRAINT [tblLP_CampaignLimit_PK] PRIMARY KEY CLUSTERED  ([lLimitID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CampaignLimit] ADD CONSTRAINT [tblLP_CampaignLimit_FK1] FOREIGN KEY ([sLimitType]) REFERENCES [dbo].[tblLP_CampaignLimitType] ([sLimitType])
GO
GRANT SELECT ON  [dbo].[tblLP_CampaignLimit] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_CampaignLimit] TO [web_user]
GO

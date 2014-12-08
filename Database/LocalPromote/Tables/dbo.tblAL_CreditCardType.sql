CREATE TABLE [dbo].[tblAL_CreditCardType]
(
[lPCardID] [int] NOT NULL IDENTITY(1, 1),
[szCardName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Cre__dtUpd__15B0212B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_CreditCardType] ADD CONSTRAINT [tblAL_CreditCardType_PK] PRIMARY KEY NONCLUSTERED  ([lPCardID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_CreditCardType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_CreditCardType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_CreditCardType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_CreditCardType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_CreditCardType] TO [web_user]
GO

CREATE TABLE [dbo].[tblLP_MemberAddress]
(
[lMemberAddressID] [int] NOT NULL IDENTITY(1, 1),
[szStreeName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUnit] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sPostalCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lCountryID] [int] NOT NULL CONSTRAINT [DF__tblLP_Mem__lCoun__673F4B05] DEFAULT ('1'),
[lMemberID] [int] NOT NULL,
[sAdrTypeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Mem__dtUpd__68336F3E] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberAddress] ADD CONSTRAINT [tblLP_MemberAddress_PK] PRIMARY KEY NONCLUSTERED  ([lMemberAddressID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MemberAddress] ADD CONSTRAINT [tblLP_MemberAddress_FK4] FOREIGN KEY ([lCountryID]) REFERENCES [dbo].[tblAL_Country] ([lCountryID])
GO
ALTER TABLE [dbo].[tblLP_MemberAddress] ADD CONSTRAINT [tblLP_MemberAddress_FK1] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_MemberAddress] ADD CONSTRAINT [tblLP_MemberAddress_FK3] FOREIGN KEY ([sAdrTypeCode]) REFERENCES [dbo].[tblAL_AddressType] ([sAdrTypeCode])
GO
ALTER TABLE [dbo].[tblLP_MemberAddress] ADD CONSTRAINT [tblLP_MemberAddress_FK2] FOREIGN KEY ([sState]) REFERENCES [dbo].[tblAL_State] ([sState])
GO
GRANT SELECT ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_MemberAddress] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_MemberAddress] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_MemberAddress] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_MemberAddress] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_MemberAddress] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MemberAddress] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_MemberAddress] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_MemberAddress] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_MemberAddress] TO [web_user]
GO

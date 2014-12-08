CREATE TABLE [dbo].[tblLP_ProductList]
(
[lProductID] [int] NOT NULL IDENTITY(1, 1),
[lPartnerID] [int] NULL,
[szProductName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szProductDesc] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[mDefaultPrice] [money] NULL,
[lLevel] [int] NOT NULL,
[sTimeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__4DF47A4E] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductList] ADD CONSTRAINT [tblLP_ProductList_PK] PRIMARY KEY NONCLUSTERED  ([lProductID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductList] ADD CONSTRAINT [tblLP_ProductList_FK2] FOREIGN KEY ([lLevel]) REFERENCES [dbo].[tblLP_ProductLevel] ([lLevel])
GO
ALTER TABLE [dbo].[tblLP_ProductList] ADD CONSTRAINT [tblLP_ProductList_FK1] FOREIGN KEY ([sTimeCode]) REFERENCES [dbo].[tblAL_TimeTerm] ([sTimeCode])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductList] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_ProductList] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_ProductList] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductList] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_ProductList] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_ProductList] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_ProductList] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductList] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_ProductList] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_ProductList] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_ProductList] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_ProductList] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_ProductList] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductList] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_ProductList] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_ProductList] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_ProductList] TO [web_user]
GO

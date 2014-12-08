CREATE TABLE [dbo].[tblLP_SalesPerson]
(
[lSalesPersonID] [int] NOT NULL IDENTITY(1, 1),
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szFullName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sDisplay] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lSiteID] [int] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Sal__dtUpd__5A7A4CC4] DEFAULT (getdate()),
[LongID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblLP_SalesPerson_LongID] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_SalesPerson] ADD CONSTRAINT [tblLP_SalesPerson_PK] PRIMARY KEY NONCLUSTERED  ([lSalesPersonID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_SalesPerson] ADD CONSTRAINT [tblLP_Salesperson_FK1] FOREIGN KEY ([sSource]) REFERENCES [dbo].[tblAL_Source] ([sSource])
GO
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_SalesPerson] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_SalesPerson] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_SalesPerson] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_SalesPerson] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_SalesPerson] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_SalesPerson] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_SalesPerson] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_SalesPerson] TO [web_user]
GO

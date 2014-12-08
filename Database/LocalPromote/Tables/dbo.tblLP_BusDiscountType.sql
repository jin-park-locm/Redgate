CREATE TABLE [dbo].[tblLP_BusDiscountType]
(
[lBusDiscountType] [int] NOT NULL IDENTITY(10, 1),
[szDiscountName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__2AAB3E11] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusDiscountType] ADD CONSTRAINT [tblLP_BusDiscountType_PK] PRIMARY KEY CLUSTERED  ([lBusDiscountType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusDiscountType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscountType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscountType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscountType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusDiscountType] TO [web_user]
GO

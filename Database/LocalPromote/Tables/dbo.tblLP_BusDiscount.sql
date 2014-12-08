CREATE TABLE [dbo].[tblLP_BusDiscount]
(
[lBusDiscountID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lBusDiscountType] [int] NOT NULL,
[szOtherDisct] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__28C2F59F] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusDiscountDEL] on [dbo].[tblLP_BusDiscount]
for delete
as
insert dbo.tblLP_BusDiscount_DELs(lBusDiscountID,lAdvertiserID,lBusDiscountType,szOtherDisct,sActive,szUpdatedBy,dtUpdate)
select lBusDiscountID,lAdvertiserID,lBusDiscountType,szOtherDisct,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusDiscount] ADD CONSTRAINT [tblLP_BusDiscount_PK] PRIMARY KEY NONCLUSTERED  ([lBusDiscountID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_ladvertiserid] ON [dbo].[tblLP_BusDiscount] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusDiscount] ADD CONSTRAINT [tblLP_BusDiscount_FK2] FOREIGN KEY ([lBusDiscountType]) REFERENCES [dbo].[tblLP_BusDiscountType] ([lBusDiscountType])
GO
GRANT SELECT ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscount] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusDiscount] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusDiscount] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusDiscount] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusDiscount] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusDiscount] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusDiscount] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusDiscount] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusDiscount] TO [web_user]
GO

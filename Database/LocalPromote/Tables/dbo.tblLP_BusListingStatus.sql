CREATE TABLE [dbo].[tblLP_BusListingStatus]
(
[lBusStatusID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sLastStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtStatus] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtSta__618671AF] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--==================

CREATE TRIGGER [dbo].[trgDEL_tblLP_BusListingStatus]
ON [dbo].[tblLP_BusListingStatus]
FOR  DELETE
AS

Insert into tblLP_BusListingStatusHist
(lBusStatusID, lAdvertiserid, sStatus, sActive, sAction, szUpdatedBy, dtstatus)
Select lBusStatusID, lAdvertiserid, sStatus, sActive, 'DEL' as sAction, szUpdatedBy,  getdate() as dtstatus
From Deleted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---drop trigger tblLP_BusListingStatus_UPD
---================================

CREATE TRIGGER [dbo].[trgINS_tblLP_BusListingStatus]
ON [dbo].[tblLP_BusListingStatus]
FOR  INSERT
AS

Insert into tblLP_BusListingStatusHist
(lBusStatusID, lAdvertiserid, sStatus, sActive, sAction, szUpdatedBy, dtstatus)
Select lBusStatusID, lAdvertiserid, sStatus, sActive, 'INS' as sAction, szUpdatedBy,  getdate() as dtstatus
From Inserted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trgUPD_tblLP_BusListingStatus]
ON [dbo].[tblLP_BusListingStatus]
FOR  UPDATE
AS

Insert into tblLP_BusListingStatusHist
(lBusStatusID, lAdvertiserid, sStatus, sActive, sAction, szUpdatedBy, dtstatus)
Select lBusStatusID, lAdvertiserid, sStatus, sActive, 'UPD' as sAction, szUpdatedBy, getdate() as dtstatus
From Inserted
GO
ALTER TABLE [dbo].[tblLP_BusListingStatus] ADD CONSTRAINT [tblLP_BusListingStatus_PK] PRIMARY KEY NONCLUSTERED  ([lBusStatusID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_StatusDate] ON [dbo].[tblLP_BusListingStatus] ([dtStatus], [lBusStatusID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_AID] ON [dbo].[tblLP_BusListingStatus] ([lAdvertiserID]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListingStatus_idxAIDDt] ON [dbo].[tblLP_BusListingStatus] ([lAdvertiserID], [dtStatus]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblLP_BusListingStatus_idxAIDCombo] ON [dbo].[tblLP_BusListingStatus] ([lAdvertiserID], [dtStatus], [sStatus]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [tblLP_BusListingStatus_idxAIDStatus] ON [dbo].[tblLP_BusListingStatus] ([lAdvertiserID], [sStatus]) WITH (FILLFACTOR=80, ALLOW_PAGE_LOCKS=OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_tblLP_BusListingStatus_LastStatus] ON [dbo].[tblLP_BusListingStatus] ([sLastStatus]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingStatus] ADD CONSTRAINT [tblLP_BusListingStatus_FK2] FOREIGN KEY ([sStatus]) REFERENCES [dbo].[tblAL_StatusType] ([sStatus])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [ClientService]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [ClientService]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [ELIBERATION\jtran]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [ELIBERATION\jtran]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [ELIBERATION\jtran]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [ELIBERATION\jtran]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [iisReviewEngineFull]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [iisReviewEngineFull]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingStatus] TO [web_user]
GRANT INSERT ON  [dbo].[tblLP_BusListingStatus] TO [web_user]
GRANT DELETE ON  [dbo].[tblLP_BusListingStatus] TO [web_user]
GRANT UPDATE ON  [dbo].[tblLP_BusListingStatus] TO [web_user]
GO

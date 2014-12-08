CREATE TABLE [dbo].[tblLP_OrderCancellationNote]
(
[lNoteID] [int] NOT NULL IDENTITY(1, 1),
[lOrderNo] [int] NOT NULL,
[sCancelCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Ord__dtUpd__58A7DE42] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_OrderCancellationNote] ADD CONSTRAINT [tblLP_OrderCancellationNote_PK] PRIMARY KEY CLUSTERED  ([lNoteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_OrderCancellationNote] ADD CONSTRAINT [tblLP_OrderCancellationNote_FK1] FOREIGN KEY ([lOrderNo]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
ALTER TABLE [dbo].[tblLP_OrderCancellationNote] ADD CONSTRAINT [tblLP_OrderCancellationNote_FK2] FOREIGN KEY ([sCancelCode]) REFERENCES [dbo].[tblAL_CancellationCode] ([sCancelCode])
GO
GRANT SELECT ON  [dbo].[tblLP_OrderCancellationNote] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_OrderCancellationNote] TO [web_user]
GO

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\eorrantia')
CREATE LOGIN [ELIBERATION\eorrantia] FROM WINDOWS
GO
CREATE USER [Eric Orrantia] FOR LOGIN [ELIBERATION\eorrantia]
GO

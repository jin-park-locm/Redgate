IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\mzhang')
CREATE LOGIN [ELIBERATION\mzhang] FROM WINDOWS
GO
CREATE USER [ELIBERATION\mzhang] FOR LOGIN [ELIBERATION\mzhang]
GO

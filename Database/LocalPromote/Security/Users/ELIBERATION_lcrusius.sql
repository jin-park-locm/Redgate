IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\lcrusius')
CREATE LOGIN [ELIBERATION\lcrusius] FROM WINDOWS
GO
CREATE USER [ELIBERATION\lcrusius] FOR LOGIN [ELIBERATION\lcrusius]
GO
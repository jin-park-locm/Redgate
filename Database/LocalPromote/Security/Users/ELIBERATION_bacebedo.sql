IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\bacebedo')
CREATE LOGIN [ELIBERATION\bacebedo] FROM WINDOWS
GO
CREATE USER [ELIBERATION\bacebedo] FOR LOGIN [ELIBERATION\bacebedo]
GO
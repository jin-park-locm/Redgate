IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\hkuan')
CREATE LOGIN [ELIBERATION\hkuan] FROM WINDOWS
GO
CREATE USER [ELIBERATION\hkuan] FOR LOGIN [ELIBERATION\hkuan]
GO

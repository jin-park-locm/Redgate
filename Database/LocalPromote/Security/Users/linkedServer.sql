IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'linkedServer')
CREATE LOGIN [linkedServer] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [linkedServer] FOR LOGIN [linkedServer]
GO

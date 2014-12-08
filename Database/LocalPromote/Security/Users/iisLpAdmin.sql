IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisLpAdmin')
CREATE LOGIN [iisLpAdmin] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisLpAdmin] FOR LOGIN [iisLpAdmin]
GO

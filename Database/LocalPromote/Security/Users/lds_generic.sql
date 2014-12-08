IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'lds_generic')
CREATE LOGIN [lds_generic] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [lds_generic] FOR LOGIN [lds_generic]
GO

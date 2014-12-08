IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'buildmgr')
CREATE LOGIN [buildmgr] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [buildmgr] FOR LOGIN [buildmgr]
GO

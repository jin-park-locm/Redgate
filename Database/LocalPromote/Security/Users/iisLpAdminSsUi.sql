IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisLpAdminSsUi')
CREATE LOGIN [iisLpAdminSsUi] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisLpAdminSsUi] FOR LOGIN [iisLpAdminSsUi]
GO

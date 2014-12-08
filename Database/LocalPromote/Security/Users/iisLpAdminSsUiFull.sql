IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisLpAdminSsUiFull')
CREATE LOGIN [iisLpAdminSsUiFull] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisLpAdminSsUiFull] FOR LOGIN [iisLpAdminSsUiFull]
GO

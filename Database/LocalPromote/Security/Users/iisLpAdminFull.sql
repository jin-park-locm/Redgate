IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisLpAdminFull')
CREATE LOGIN [iisLpAdminFull] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisLpAdminFull] FOR LOGIN [iisLpAdminFull]
GO

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'apolloapp')
CREATE LOGIN [apolloapp] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [apolloapp] FOR LOGIN [apolloapp]
GO

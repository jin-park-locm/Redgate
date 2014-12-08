IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ldsapollo')
CREATE LOGIN [ldsapollo] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [ldsapollo] FOR LOGIN [ldsapollo]
GO

CREATE DATABASE review_kantin;
GO

USE review_kantin;
GO

USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'altair')
BEGIN
    CREATE LOGIN altair
        WITH PASSWORD = N'asdfghjkl',
             DEFAULT_DATABASE = review_kantin;
END
GO

USE review_kantin;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'altair')
BEGIN
    CREATE USER altair FOR LOGIN altair;
END
GO

ALTER ROLE db_datareader ADD MEMBER altair;
ALTER ROLE db_datawriter ADD MEMBER altair;
GO

SELECT name, type_desc, authentication_type_desc
FROM sys.database_principals
WHERE name = 'altair';
GO

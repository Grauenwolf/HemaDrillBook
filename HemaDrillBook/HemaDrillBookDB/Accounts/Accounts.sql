CREATE SCHEMA Accounts;
GO
--dbo holds all of our security tables. 
GRANT INSERT, UPDATE, SELECT ON SCHEMA::Accounts TO HemaWeb;


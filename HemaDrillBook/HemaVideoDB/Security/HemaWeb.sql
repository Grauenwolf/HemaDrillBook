
--WARNING: The password needs to be manually changed in production!
CREATE LOGIN HemaWeb WITH PASSWORD = 'tqgWpP$yxzkq}yxoBSvtsmsFT7_&#$!~<vVtynywf{tyI'; --this won't override a manually created password.
GO
CREATE USER HemaWeb FOR LOGIN HemaWeb;


GO

GRANT CONNECT TO HemaWeb;
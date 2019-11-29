CREATE VIEW Accounts.BookEditorDetail
WITH SCHEMABINDING
AS
SELECT pe.BookKey,
       pe.UserKey,
       anu.DisplayName
FROM Accounts.BookEditor pe
    INNER JOIN Accounts.AspNetUsers anu
        ON pe.UserKey = anu.UserKey;
GO
GRANT SELECT ON Accounts.BookEditorDetail TO HemaWeb;

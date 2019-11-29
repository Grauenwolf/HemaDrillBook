CREATE VIEW Accounts.PartEditorDetail
WITH SCHEMABINDING
AS
SELECT pe.PartKey,
       pe.UserKey,
       anu.DisplayName
FROM Accounts.PartEditor pe
    INNER JOIN Accounts.AspNetUsers anu
        ON pe.UserKey = anu.UserKey
UNION ALL
SELECT p.PartKey,
       be.UserKey,
       anu.DisplayName
FROM Accounts.BookEditor be
    INNER JOIN Sources.Part p
        ON be.BookKey = p.BookKey
    INNER JOIN Accounts.AspNetUsers anu
        ON be.UserKey = anu.UserKey;
GO
GRANT SELECT ON Accounts.PartEditorDetail TO HemaWeb;
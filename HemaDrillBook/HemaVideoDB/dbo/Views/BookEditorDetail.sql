CREATE VIEW dbo.BookEditorDetail
AS
SELECT be.BookKey,
       be.UserKey,
       anu.DisplayName
FROM dbo.BookEditor be
    INNER JOIN dbo.AspNetUsers anu
        ON be.UserKey = anu.UserKey;


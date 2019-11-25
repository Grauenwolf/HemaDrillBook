CREATE VIEW dbo.PlayEditor
AS
SELECT be.UserKey,
       p.PlayKey
FROM dbo.BookEditor be
    INNER JOIN Sources.Section s
        ON s.BookKey = be.BookKey
    INNER JOIN Interpretations.Play p
        ON p.SectionKey = s.SectionKey
UNION ALL
SELECT p.CreatedByUserKey AS UserKey,
       p.PlayKey
FROM Interpretations.Play p;

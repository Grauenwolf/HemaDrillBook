CREATE VIEW dbo.SectionEditor
AS
SELECT be.UserKey,
       s.SectionKey
FROM dbo.BookEditor be
    INNER JOIN Sources.Section s
        ON s.BookKey = be.BookKey;


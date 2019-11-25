CREATE VIEW dbo.VideoEditor
AS
SELECT be.UserKey,
       v.VideoKey
FROM dbo.BookEditor be
    INNER JOIN Sources.Section s
        ON s.BookKey = be.BookKey
    INNER JOIN Interpretations.Video v
        ON v.SectionKey = s.SectionKey
UNION ALL
SELECT v.CreatedByUserKey AS UserKey,
       v.VideoKey
FROM Interpretations.Video v;

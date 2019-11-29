CREATE VIEW Interpretations.VideoDetail
WITH SCHEMABINDING
AS
SELECT v.VideoKey,
       v.SectionKey,
       v.VideoServiceKey,
       v.VideoServiceVideoId,
       v.Url,
       v.StartTime,
       v.CreatedByUserKey,
       v.CreatedDate,
       v.ModifiedByUserKey,
       v.Author,
       v.Description,
       s.PartKey,
       s.SectionName,
       s.SectionSlug,
       p.PartName,
       p.PartSlug,
       b.BookName,
       b.BookSlug
FROM Interpretations.Video v
    INNER JOIN Sources.Section s
        ON v.SectionKey = s.SectionKey
    INNER JOIN Sources.Part p
        ON s.PartKey = p.PartKey
    INNER JOIN Sources.Book b
        ON p.BookKey = b.BookKey;

GO
GRANT SELECT ON Interpretations.VideoDetail TO HemaWeb;
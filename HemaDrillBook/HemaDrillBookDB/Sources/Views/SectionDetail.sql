CREATE VIEW Sources.SectionDetail
WITH SCHEMABINDING
AS
SELECT s.SectionKey,
       s.PartKey,
       s.ParentSectionKey,
       s.SectionName,
       s.PageReference,
       s.DisplayOrder,
       s.SectionSlug,
       b.BookKey,
       b.BookName,
       b.BookSlug,
       p.PartName,
       p.PartSlug,
       (
           SELECT COUNT(*)
           FROM Interpretations.Commentary c
           WHERE c.SectionKey = s.SectionKey
                 AND c.PublicNotes IS NOT NULL
       ) AS CommentaryCount,
       (
           SELECT COUNT(*)
           FROM Interpretations.Play p2
           WHERE p2.SectionKey = s.SectionKey
       ) AS PlayCount,
       (
           SELECT COUNT(*)
           FROM Interpretations.Video v
           WHERE v.SectionKey = s.SectionKey
       ) AS VideoCount
FROM Sources.Section s
    INNER JOIN Sources.Part p
        ON s.PartKey = p.PartKey
    INNER JOIN Sources.Book b
        ON p.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.SectionDetail TO HemaWeb;

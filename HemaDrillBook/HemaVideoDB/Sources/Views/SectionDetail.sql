CREATE VIEW Sources.SectionDetail
AS
SELECT s.SectionKey,
       s.BookKey,
       s.ParentSectionKey,
       s.SectionName,
       s.PageReference,
       s.DisplayOrder,
       b.BookName,
       (
           SELECT COUNT(*)
           FROM Interpretations.Video v
           WHERE v.SectionKey = s.SectionKey
       ) AS VideoCount,
       (
           SELECT COUNT(*)
           FROM Interpretations.Play p
           WHERE p.SectionKey = s.SectionKey
       ) AS PlayCount
FROM Sources.Section s
    INNER JOIN Sources.Book b
        ON b.BookKey = s.BookKey;
GO
GRANT SELECT ON Sources.SectionDetail TO HemaWeb;
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
       p.PartSlug
FROM Sources.Section s
    INNER JOIN Sources.Part p
        ON s.PartKey = p.PartKey
    INNER JOIN Sources.Book b
        ON p.BookKey = b.BookKey;
GO
GRANT SELECT ON Sources.SectionDetail TO HemaWeb;
